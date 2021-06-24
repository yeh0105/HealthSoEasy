package com.soeasy.controller.adminController.adminManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.CustomerBean;
import com.soeasy.service.customerService.CustomerService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminCustomer {
	
	@Autowired
	CustomerService customerService;
	
	//會員
	@GetMapping({"/adminCustomer"})
	public String admin() {
		return "/admin/adminCustomer/adminCustomer";
	}
	
	//取得所有會員(ajax)
	@GetMapping(value = "/adminCustomer/getAllCustomer.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<CustomerBean> getAllCustomer(){
		List<CustomerBean> customerBeans = customerService.getAllCustomer();
		for (CustomerBean customerBean : customerBeans) {
			System.out.println(customerBean.getCustomerId());
		}
		
		
		
		return customerBeans;
	}
}
