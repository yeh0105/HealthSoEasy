package com.soeasy.controller.mallController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.CartItem;
import com.soeasy.service.mallService.ProductService;


@Controller
@RequestMapping("/mall/cart")
public class cartController {
	
	
	@Autowired
	ProductService productService;
	
	//建立跳轉
	@GetMapping("/index")
	public String index(HttpSession session,ModelMap modelmap) {
		
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
		//顯示購物車內有幾項商品
		modelmap.put("countItems",countItems);
		//顯示總價
		modelmap.put("total",total);
		return "mall/cartInfo";
	}
	
	
//	=====================================================================
	
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
					cart.add(new CartItem(productService.findProductById(productId),1));
				}else {
					int newQuantity=cart.get(index).getCartQuantity()+1;
					cart.get(index).setCartQuantity(newQuantity);
					
				}
		}
		return"redirect:/mall/cart/index";
	}
	
	private int exists(Integer productId,List<CartItem>cart) {
		for(int i=0;i<cart.size();i++) {
			if(cart.get(i).getProduct().getProductId()==productId) {
				return i ;
			}
		}
		return -1;
	}


}
