package com.soeasy.controller.mallController;

import java.sql.Blob;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.soeasy.model.ProductBean;
import com.soeasy.service.mallService.ProductService;

@Controller
@RequestMapping("/mall")
public class MallProductController {
	
	@Autowired
	private ProductService productService;
	

	@GetMapping("/lists")
	 public String getAll(Model model) {
	    		model.addAttribute("product", productService.findAll());
	        	System.out.println("印出來all products");
	            return "mall/productlists";
	       
	    }
	
	
	//使用ID查詢單一產品
	@GetMapping("/lists/{productId}")
	 public String getOne(@PathVariable Integer productId,Model model) {
	      ProductBean product = productService.findProductById(productId);
      		model.addAttribute("product", product);
	        	System.out.println("印出來單一產品了");
	            return "mall/getOneProduct";
	       
	    }
	
	//新增產品 使用Post請求
	//跳轉add提交頁  於新增時，送出空白的表單讓使用者輸入資料

	@GetMapping("/add")
	public String add(Model model) {
		ProductBean product = new ProductBean();
		product.setProductName("麥當勞歡樂全家餐");
		product.setProductDescription("快樂肥宅餐");
		product.setCategory("速食");
		product.setProductAmount(100);
		product.setProductCalories(500);
		product.setProductPrice(210);
		product.setProductCost(300);
		product.setProductDate(java.sql.Date.valueOf("2021-07-20"));
		model.addAttribute("productbean", product);

		return "mall/addProduct";
	}
	

	
//	=========================

	// 當使用者填妥資料按下Submit按鈕後，本方法接收將瀏覽器送來的會員資料，新進行資料的檢查，
	// 若資料有誤，轉向寫入錯誤訊息的網頁，若資料無誤，則呼叫Service元件寫入資料庫
	// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
	@PostMapping("/add")
	public String addProduct(
			@ModelAttribute("product") /* @Valid */ ProductBean product, 
			BindingResult result, Model model,
			HttpServletRequest request) {
			productService.save(product);
			
//		ProductBeanValidator validator = new ProductBeanValidator();
//		// 呼叫Validate進行資料檢查
//		validator.validate(product, result);
//		if (result.hasErrors()) {
////          下列敘述可以理解Spring MVC如何處理錯誤			
////			List<ObjectError> list = result.getAllErrors();
////			for (ObjectError error : list) {
////				System.out.println("有錯誤：" + error);
////			}
//			return "mall/addProduct";
//		}
		
		MultipartFile picture = product.getProductMultiImg();
		
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				product.setProductImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
	
		return "redirect:/mall/lists";
	}
	
	// 刪除一筆紀錄
	//送不出DELETE 先用POST
		@PostMapping("/delete/{productId}")
		public String delete(@PathVariable("productId") Integer productId) {
	        productService.deleteById(productId);
        	System.out.println("刪除products");
			return "redirect:/mall/lists"; 
		}
		
	// 修改時，送回含有會員資料的表單，讓使用者進行修改
	// 由這個方法送回修改記錄的表單...
		@GetMapping("/update/{productId}")
		public String showDataForm(@PathVariable("productId") Integer productId, Model model) {
			ProductBean product = productService.findProductById(productId);
      		model.addAttribute("product", product);
			return "mall/updateProduct";
		}
		
		
		@PostMapping("/update/{productId}")
		// BindingResult 參數必須與@ModelAttribute修飾的參數連續編寫，中間不能夾其他參數
		public String modify(
				@ModelAttribute("product") ProductBean product, 
				BindingResult result, 
				Model model,
				@PathVariable Integer productId, 
				HttpServletRequest request) {
			productService.save(product);
			return "redirect:/mall/lists";
		}
		
	

	

}
