package com.soeasy.controller.adminController.adminManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.ProductBean;
import com.soeasy.service.mallService.ProductService;


@Controller
@RequestMapping("/admin/adminManage")
public class AdminProduct {
			
		@Autowired
		private ProductService productService;
		
		// 查詢全部

		@GetMapping("/adminProduct")
		 public String getAll(Model model) {
		    		model.addAttribute("product", productService.findAll());
		        	System.out.println("印出來all products");
		            return "admin/adminMall/adminProduct";
		       
		    }
		
		//使用ID查詢單一產品
		@GetMapping("/adminProduct/{productId}")
		 public String getOne(@PathVariable Integer productId,Model model) {
		      ProductBean product = productService.findProductById(productId);
	      		model.addAttribute("product", product);
		        	System.out.println("印出來單一產品了");
		            return "admin/adminMall/adminOneProduct";
		       
		    }

}
