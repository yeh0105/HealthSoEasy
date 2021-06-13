package com.soeasy.controller.shopController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.ShopBean;
import com.soeasy.service.shopService.ShopService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.shopValidator.ShopBeanValidator;

@Controller
@RequestMapping("/shopController")
public class ShopController {
	
	@Autowired
	ShopService shopService;
	
	//表單初值--新增廠商
	@GetMapping("/addShop")
	public String addShopSendForm(Model model) {
		ShopBean shopBean = new ShopBean();
		
		shopBean.setShopName("農夫彼得");
		shopBean.setShopEmail("farmerpeter101@gmail.com");
		shopBean.setShopPassword("peter123");
		shopBean.setShopCheckPassword("peter123");
		shopBean.setShopPhone("0960 725 368");
		
		model.addAttribute("shopBean", shopBean);
		return "shop/shopSignInUp";
	}
		
	//送出表單--新增會員
	@PostMapping("/addShop")
	public String addShopProcess(
				@ModelAttribute("shopBean") ShopBean shopBean,
				BindingResult result, Model model,
				HttpServletRequest request
			) {
		//檢測不正當欄位並回傳提示訊息
		ShopBeanValidator validator = new ShopBeanValidator();
		validator.validate(shopBean, result);
		if (result.hasErrors()) {
			return "shop/shopSignInUp";
		}
		
		//設定初始值
		//帳號狀態:正常
		shopBean.setShopStatus(GlobalService.SHOP_STATUS_NORMAL);
	
		// 檢查 shopEmail是否重複
		if (shopService.emailExists(shopBean.getShopEmail())) {
			result.rejectValue("shopEmail", "", "帳號已存在，請重新輸入");
			return "shop/shopSignInUp";
		}
			
		try {
			shopService.addShop(shopBean);
		} catch (Exception e) {
			System.out.println(e.getClass().getName() + ", ex.getMessage()=" + e.getMessage());
			result.rejectValue("shopName", "", "發生異常，請通知系統人員..." + e.getMessage());
			return "shop/shopSignInUp";
		}
	
		return "redirect:/";
	}
}
