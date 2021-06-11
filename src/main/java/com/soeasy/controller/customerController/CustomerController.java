package com.soeasy.controller.customerController;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.CustomerBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.validator.CustomerBeanValidator;

@Controller
@RequestMapping("/customerController")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	//表單初值
	@GetMapping("/addCustomer")
	public String addCustomerSendForm(Model model) {
		CustomerBean customerBean = new CustomerBean();
		
		customerBean.setCustomerName("許宸瑜");
		customerBean.setCustomerEmail("Flanlove@outlook.com");
		customerBean.setCustomerPassword("ab1234");
		customerBean.setCustomerCheckPassword("ab1234");
		
		model.addAttribute("customerBean", customerBean);
		return "customer/customerSignInUp";
	}
	
	//送出表單
	@PostMapping("/addCustomer")
	public String addCustomerProcess(
				@ModelAttribute("customerBean") CustomerBean customerBean,
				BindingResult result, Model model,
				HttpServletRequest request
			) {
		CustomerBeanValidator validator = new CustomerBeanValidator();
		validator.validate(customerBean, result);
		if (result.hasErrors()) {
			return "customer/customerSignInUp";
		}
		
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		customerBean.setCustomerRegisterTime(registerTime);
		
		// 檢查 memberId是否重複
		if (customerService.emailExists(customerBean.getCustomerEmail())) {
			result.rejectValue("customerEmail", "", "帳號已存在，請重新輸入");
			return "customer/customerSignInUp";
		}
				
		try {
			customerService.addCustomer(customerBean);
		} catch (Exception e) {
			System.out.println(e.getClass().getName() + ", ex.getMessage()=" + e.getMessage());
			result.rejectValue("customerName", "", "發生異常，請通知系統人員..." + e.getMessage());
			return "customer/customerSignInUp";
		}
		
		return "redirect:/";
	}
}
