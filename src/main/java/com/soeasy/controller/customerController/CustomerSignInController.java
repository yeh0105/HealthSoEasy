package com.soeasy.controller.customerController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.member.CustomerSignInBean;
import com.soeasy.validator.customerValidator.CustomerSignInValidator;

@Controller
@RequestMapping("/customerController")
@SessionAttributes({"SignInSuccess"}) 
public class CustomerSignInController {
	
	//送出表單--登入顧客會員
	@PostMapping("/customerSignIn")
	public String customerSignIn(
				@ModelAttribute("customerSignInBean")
				CustomerSignInBean customerSignInBean,
				BindingResult result, 
				Model model,
				HttpServletRequest request, 
				HttpServletResponse response
			) {
		
		//檢測不正當欄位並回傳提示訊息
		CustomerSignInValidator validator = new CustomerSignInValidator();
		validator.validate(customerSignInBean, result);
		if (result.hasErrors()) {
			//重新設定隔壁表單的初值
			CustomerBean customerBean = new CustomerBean();
			//鎖定頁面為登入模式
			String signMode = "sign_in";
			model.addAttribute("customerBean", customerBean);
			model.addAttribute("signMode", signMode);
			return "customer/customerSignInUp";
		}
		
		return "redirect:/";
		
	}
}
