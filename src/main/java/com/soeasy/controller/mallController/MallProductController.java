package com.soeasy.controller.mallController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
	            return "mall/productlists";
	       
	    }
	
	@GetMapping("/lists/{productId}")
	 public String getOne(@PathVariable Integer productId,Model model) {
	      ProductBean product = productService.findProductById(productId);
      		model.addAttribute("product", product);
	        	System.out.println("印出來單一產品了");
	            return "mall/getOneProduct";
	       
	    }
	

}
