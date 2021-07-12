package com.soeasy.controller.mallController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CartItem;
import com.soeasy.model.CustomerBean;
import com.soeasy.model.ProductBean;
import com.soeasy.model.Order.OrderBean;
import com.soeasy.model.Order.OrderDetailBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.mallService.OrderDetailService;
import com.soeasy.service.mallService.OrderService;
import com.soeasy.service.mallService.PaymentService;
import com.soeasy.service.mallService.ProductService;


@Controller
@RequestMapping("/mall/cart")
@SessionAttributes("customerSignInSuccess")
public class CartController {
	
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderDetailService orderDetailService;
	
	@Autowired
	ServletContext context;
	
	@Autowired
	PaymentService paypalService;
	

	
	//建立跳轉
	@GetMapping("/index")
	public String index(HttpSession session,Model model) {
		
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}
		
		
		//顯示購物車內有幾項商品
		int countItems=0;
		
		//顯示總價
		double total=0;
		
		
		if(session.getAttribute("cart")!=null){
			List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
			countItems = cart.size();
			for(CartItem item:cart) {
				total +=item.getProduct().getProductPrice()*item.getCartQuantity();
			}
		}
		model.addAttribute("countItems",countItems);
		model.addAttribute("total",total);
		return "mall/shoppingcart";
//		}
	}
	
	
//	===========================新增購物車內的項目==========================================
	
	@GetMapping("/buy/{productId}")
	public String buy(@PathVariable("productId") Integer productId, 
			HttpSession session,Model model) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}
		
		
	
		//  如果購物車是空的
		if (session.getAttribute("cart")==null) {
			List<CartItem> cart = new ArrayList<CartItem>();
			cart.add(new CartItem(productService.findProductById(productId),1));
			session.setAttribute("cart", cart);
			}else {	
				List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
				int index = exists(productId,cart);
				if(index==-1) {
					//購物車可以可以再+1
					cart.add(new CartItem(productService.findProductById(productId),1));
				}else {
					int newQuantity=cart.get(index).getCartQuantity()+1;
					cart.get(index).setCartQuantity(newQuantity);
					
				}
		}
		return"redirect:/mall/lists";
		
	}
	
	
//	===========================(End)新增購物車內的項目==========================================

	
//	===========================移除購物車內的項目==========================================
	
	@GetMapping("/remove/{index}")
	public String remove(@PathVariable("index") int index, HttpSession session) {
		List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
		cart.remove(index);
		session.setAttribute("cart", cart);
		return "redirect:/mall/cart/index";

	}
	
//	===========================(End)移除購物車內的項目==========================================

	
//	=====================    更新購物車商品的數量    ==========================================
	
	@PostMapping("/update")
	public String update(@RequestParam("quantities") int[] quantities,HttpSession session) {

		if(session.getAttribute("cart")!=null){
			List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
			for(int i=0;i<cart.size();i++) {
			cart.get(i).setCartQuantity(quantities[i]);
			}

		session.setAttribute("cart", cart);
		}
		return "redirect:/mall/cart/index";

	}
	
	
//	===================== (End)   更新購物車商品的數量    ==========================================
	
	private int exists(Integer productId,List<CartItem>cart) {
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getProduct().getProductId()==productId) {
				return i ;
			}
		}
		return -1;
	}
	
	
	
	
	//跳轉到結帳詳情
	@GetMapping("checkoutinformation")
	public String checkoutPage(Model model,HttpSession session) {

		//顯示總價
		double total=0;
		
		if(session.getAttribute("cart")!=null){
			List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
			for(CartItem item:cart) {
				total +=item.getProduct().getProductPrice()*item.getCartQuantity();
			}
		}
		model.addAttribute("total",total);
		
		return "/mall/checkout";
	}
	
	
//	=============================  結帳 (保存訂單並跳轉到paypal)    ==========================================

	@GetMapping("checkout")
	public String checkout(Model model,HttpSession session){
	
		// 登入攔截
			CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
			if (customerBean == null) {
				return "redirect:/customerController/customerSignIn";
			
			}
			
			if(session.getAttribute("cart")!=null) {
				
				
			//保存新訂單
			OrderBean orderBean = new OrderBean();
			OrderDetailBean orderDetail = new OrderDetailBean();
			CustomerBean originalBean = customerService.findByCustomerId(customerBean.getCustomerId());
			
			// 會員積分為+10
			originalBean.setCustomerScore(originalBean.getCustomerScore() + 10);

			// 會員ID
			orderBean.setCustomerBean(originalBean);
			orderBean.setOrderCustomerName(originalBean.getCustomerName());
			
			
			// 自動帶入創建時間
			Date registerTime = new Date(System.currentTimeMillis());
			orderBean.setOrderRegisterTime(registerTime);
			
			//訂單狀態
			orderBean.setOrderStatus("訂單處理中");
			orderBean.setPayStatus("待付款");

			// 保存訂單總金額		(預設運費60)
			
			int countItems=0; //顯示購物車內有幾項商品
			double total=0;			//顯示總價

			List<CartItem>cartTotalPrice=(List<CartItem>)session.getAttribute("cart");
			countItems = cartTotalPrice.size();
			for(CartItem item:cartTotalPrice) {
				orderBean.setOrderTotalPrice(item.getProduct().getProductPrice()*item.getCartQuantity()+60);
			}
			
			
			orderBean=orderService.save(orderBean);
			

		
			
		//保存訂單細節=======
				List<CartItem>cart=(List<CartItem>)session.getAttribute("cart");
				
				for(CartItem item:cart) {
					OrderDetailBean orderDetailBean = new OrderDetailBean();
					orderDetailBean.setOrderBean(orderService.findByOrderId(orderBean.getOrderId()));
					orderDetailBean.setProductId(item.getProduct().getProductId());
					orderDetailBean.setProductPrice(item.getProduct().getProductPrice());
					orderDetailBean.setOrderItemQuantity(item.getCartQuantity());
					orderDetailBean.setProductName(item.getProduct().getProductName());
					
					orderDetailService.save(orderDetailBean);
				}
					
				//Remove cart
					//session.removeAttribute("cart");
				//return "/mall/checkoutThanks";
					
					//跳轉到paypal
					return"redirect:/mall/cart/checkoutinformation";
					//return"/mall/paypal/success";
			}
			
			//如果購物車是空的則返回
			else {
				return "redirect:/mall/cart/index";
				
			}
			
		
	}
	
	
	
//	============================= (END 結帳    ==========================================

	// 讀圖轉成位元組陣列
		@RequestMapping(value = "/getImage/{productId}", method = RequestMethod.GET)
		public ResponseEntity<byte[]> getImage(HttpServletRequest resp,@PathVariable Integer productId ){
			String filePath="/image/NoImage.jpg";
			byte[] media = null;
			String filename = "";
			int len = 0;
			ProductBean product = productService.findProductById(productId);
			if(product !=null) {
				Blob blob=product.getProductImg();
				if(blob!=null) {
					try {
						len=(int)blob.length();
						media = blob.getBytes(1, len);
					}catch(SQLException e) {
						throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
					}
				}else {
					media = toByteArray(filePath);
					filename = filePath;
				}
			}else {
				media = toByteArray(filePath);
				filename = filePath;
			}
			ResponseEntity<byte[]> re= new ResponseEntity<>(media, HttpStatus.OK);
			
			return re;
		}
		
		// 方法toByteArray
		private byte[] toByteArray(String filePath) {
			byte[] b = null;
			String realPath = context.getRealPath(filePath);
			try {
				File file = new File(realPath);
				long size = file.length();
				b = new byte[(int) size];
				InputStream fis = context.getResourceAsStream(filePath);
				fis.read(b);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return b;
		}	
		
	
	
}
