package com.soeasy.controller.mallController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soeasy.model.CartItem;
import com.soeasy.service.mallService.ProductService;


@Controller
@RequestMapping("/mall/cart")
public class CartController {
	
	
	@Autowired
	ProductService productService;
	
	//建立跳轉
	@GetMapping("/index")
	public String index(HttpSession session,Model model) {
		
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
		return "mall/cartInfo";
	}
	
	
//	===========================新增購物車內的項目==========================================
	
	@GetMapping("/buy/{productId}")
	public String buy(@PathVariable("productId") Integer productId, 
			HttpSession session) {
		
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
		return"redirect:/mall/cart/index";
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


}
