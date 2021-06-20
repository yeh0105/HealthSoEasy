package com.soeasy.controller.mallController;

import java.sql.Date;
import java.util.List;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.soeasy.model.ProductBean;
import com.soeasy.service.mallService.ProductService;

//@RestController
@RequestMapping("/mall") //獲取所有產品

//@Controller他會認為你回傳的是畫面 (jsp,thymleaf等等)
//@RestController認為你回傳的是資料 (預設是json格式)

public class MallController {
	
	@Autowired
	private ProductService productService;
	
	
	@GetMapping("/productlists")
	public List<ProductBean> getAll(){
		
		return productService.findAll();
	}
	
//	//新增產品 使用Post請求
//		@PostMapping("/productlists")
//		public ProductBean post(ProductBean product) {
//			return productService.save(product);
//		}
	
	//新增產品 使用Post請求
	@PostMapping("/productlists")
	public ProductBean post(
		@RequestParam String productName,
		@RequestParam String productDescription,
		@RequestParam Integer productPrice,
		@RequestParam Integer productAmount,
		@RequestParam Integer productCalories,
		@RequestParam String category,
		@RequestParam Date productDate,
		@RequestParam Integer productCost) {
		
		ProductBean product = new ProductBean();
		product.setProductName(productName);
		product.setProductDescription(productDescription);
		product.setProductPrice(productPrice);
		product.setProductAmount(productAmount);
		product.setProductCalories(productCalories);
		product.setCategory(category);
		product.setProductDate(productDate);
		product.setProductCost(productCost);
		
		return productService.save(product);
		
	}
	
	//使用ID查詢單一產品
	@GetMapping("/productlists/{productId}")
	 public ResponseEntity<ProductBean> get(@PathVariable(required = false) Integer productId) {
	        try {
	        	ProductBean product = productService.findProductById(productId);
	            return new ResponseEntity<ProductBean>(product, HttpStatus.OK);
	        } catch (NoSuchElementException e) {
	            return new ResponseEntity<ProductBean>(HttpStatus.NOT_FOUND);
	        }
	    }
	

	
	//更新產品 使用Put請求
	@PutMapping("/productlists")
	public ProductBean update(
		@RequestParam Integer productId,
		@RequestParam String productName,
		@RequestParam String productDescription,
		@RequestParam Integer productPrice,
		@RequestParam Integer productAmount,
		@RequestParam Integer productCalories,
		@RequestParam String category,
		@RequestParam Date productDate,
		@RequestParam Integer productCost) {
		
		ProductBean product = new ProductBean();
		product.setProductId(productId);
		product.setProductName(productName);
		product.setProductDescription(productDescription);
		product.setProductPrice(productPrice);
		product.setProductAmount(productAmount);
		product.setProductCalories(productCalories);
		product.setCategory(category);
		product.setProductDate(productDate);
		product.setProductCost(productCost);
		
		return productService.save(product);
		
	}
	
	//刪除產品 使用Delete請求

	 @DeleteMapping("/productlists/{productId}")
	    public void delete(@PathVariable Integer productId) {
	        productService.deleteById(productId);
	    }
	
	 
	//使用name查詢產品 .中文容易出現亂碼所以先用POST 請求
	//根據RestFul風格應該使用Get
	 @PostMapping("/productlists/by")
	 	public List<ProductBean> findByProductName(@RequestParam String productName){
		 return productService.findByProductName(productName);
	 }
	 
		//使用description的任一關鍵字 查詢產品 .中文容易出現亂碼所以先用POST 請求 
	 @PostMapping("/productlists/bydes")
	 	public List<ProductBean> findByProductDescriptionEndsWith(@RequestParam String productDescription){
		 return productService.findByProductDescriptionContains(productDescription);
	 }
	 

	 


}
