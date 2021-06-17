package com.soeasy.controller.adminController.adminLogin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.member.AdminBean;
import com.soeasy.validator.adminValidator.AdminBeanValidator;

@Controller
@RequestMapping("/admin")
public class AdminLogin {

	//管理員登入
	//會員
	@PostMapping({"/adminLogin"})
	public String admin(
			@ModelAttribute("adminBean")
			AdminBean adminBean,
			BindingResult result, 
			Model model,
			HttpServletRequest request, 
			HttpServletResponse response) {
		//檢測不正當欄位並回傳提示訊息
		AdminBeanValidator validator = new AdminBeanValidator();
		validator.validate(adminBean, result);
		if (result.hasErrors()) {
			return "/adminIndex";
		}

		// 比對帳密
		String adminName = adminBean.getAdminName();
		String adminPassword = adminBean.getAdminPassword();
		AdminBean adminBeanSuccess = null;
		
		return "/admin";
	}
}
