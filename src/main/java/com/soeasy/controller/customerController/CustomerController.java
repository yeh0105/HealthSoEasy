package com.soeasy.controller.customerController;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.CustomerHealthBean;
import com.soeasy.model.ShoppingcartBean;
import com.soeasy.model.member.CustomerSignInBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.customerValidator.CustomerBeanValidator;

@Controller
@RequestMapping("/customerController")
@SessionAttributes("customerSignInSuccess")
public class CustomerController {
	
	@Autowired
	CustomerService customerService;
	
	//表單初值--新增會員_會員登入--註冊
	@GetMapping("/addCustomer")
	public String addCustomerSendForm(Model model) {
		CustomerBean customerBean = new CustomerBean();
		CustomerSignInBean customerSignInBean = new CustomerSignInBean();
		String signMode = "sign_up";
		
		customerBean.setCustomerName("許宸瑜");
		customerBean.setCustomerEmail("Flanlove@outlook.com");
		customerBean.setCustomerPassword("ab1234");
		customerBean.setCustomerCheckPassword("ab1234");
		
		customerSignInBean.setCustomerSignInEmail("Flanlove@outlook.com");
		customerSignInBean.setCustomerSignInPassword("ab1234");
		
		model.addAttribute("customerBean", customerBean);
		model.addAttribute("customerSignInBean", customerSignInBean);
		model.addAttribute("signMode", signMode);
		return "customer/customerSignInUp";
	}
	
	//送出表單--新增顧客會員
	@PostMapping("/addCustomer")
	public String addCustomerProcess(
				@ModelAttribute("customerBean")
				CustomerBean customerBean,
				BindingResult result, Model model,
				HttpServletRequest request
			) {
		//檢測不正當欄位並回傳提示訊息
		CustomerBeanValidator validator = new CustomerBeanValidator();
		validator.validate(customerBean, result);
		if (result.hasErrors()) {
			//重新設定表單
			model = resetSendForm(model);
			return "customer/customerSignInUp";
		}
		
		//設定初始值
		//關聯新的健康資訊
		customerBean.setCustomerHealthBean(new CustomerHealthBean());
		//關聯新的購物車
		customerBean.setShoppingcartBean(new ShoppingcartBean());
		//初始積分為0
		customerBean.setCustomerScore(0);
		//帳號狀態:正常
		customerBean.setCustomerStatus(GlobalService.CUSTOMER_STATUS_NORMAL);
		//帳號創建時間
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		customerBean.setCustomerRegisterTime(registerTime);
		
		// 檢查 customerEmail是否重複
		if (customerService.emailExists(customerBean.getCustomerEmail())) {
			//重新設定表單
			model = resetSendForm(model);
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
	
	public Model resetSendForm(Model model) {
		//重新設定隔壁表單的初值
		CustomerSignInBean customerSignInBean = new CustomerSignInBean();
		//鎖定頁面為註冊模式
		String signMode = "sign_up";
		model.addAttribute("customerSignInBean", customerSignInBean);
		model.addAttribute("signMode", signMode);
		
		return model;
	}
	
	//個人頁面
	@GetMapping("/customerPage")
	public String customerPage() {
		return "/customer/customerPage";
	}
	
	//修改個人基本資料
	@PostMapping(value = "/updateCustomerInfo", produces = { "application/json; charset=UTF-8" })
	
	public @ResponseBody Map<String, String> updateCustomerInfo(@RequestBody CustomerBean customerBean, Model model){
		//以傳入的ID搜尋原始的會員物件
		CustomerBean originalBean = customerService.findByCustomerId(customerBean.getCustomerId());
		
		//更新檢查訊息
		Map<String, String> updateMessage = new HashMap<String, String>();
		
		if(customerBean.getCustomerName() == null) {
			updateMessage.put("updateMessage", "名字不得為空");
		}
		
		
		//為原始物件設定傳入的欄位值
		originalBean.setCustomerName(customerBean.getCustomerName());
		originalBean.setCustomerNickname(customerBean.getCustomerNickname());
		originalBean.setCustomerBirthDay(customerBean.getCustomerBirthDay());
		
		originalBean.setCustomerHealthBean(null);
		
		
		//save原始物件
		customerService.updateCustomerBasicInfo(originalBean);
		
		//將更新資料設定給session
		model.addAttribute("customerSignInSuccess", originalBean);
		
		//更新成功訊息
		updateMessage.put("updateMessage", "更新成功");
		
		return updateMessage;
	}
	
	//修改個人基本資料
		@PostMapping(value = "/updateCustomerHealthInfo", produces = { "application/json; charset=UTF-8" })
		
		public @ResponseBody Map<String, String> updateCustomerHealthInfo(@RequestBody CustomerBean customerBean, Model model){
			//以傳入的ID搜尋原始的會員物件
			CustomerBean originalBean = customerService.findByCustomerId(customerBean.getCustomerId());
			
			//更新檢查訊息
			Map<String, String> updateHealthMessage = new HashMap<String, String>();
			
			if(customerBean.getCustomerName() == null) {
				updateHealthMessage.put("updateHealthMessage", "名字不得為空");
			}
			
			
			//為原始物件設定傳入的欄位值
			originalBean.setCustomerNickname(customerBean.getCustomerNickname());
			originalBean.setCustomerBirthDay(customerBean.getCustomerBirthDay());
			
			originalBean.setCustomerHealthBean(null);
			
			
			//save原始物件
			customerService.updateCustomerBasicInfo(originalBean);
			
			//將更新資料設定給session
			model.addAttribute("customerSignInSuccess", originalBean);
			
			//更新成功訊息
			updateHealthMessage.put("updateMessage", "更新成功");
			
			return updateHealthMessage;
		}
}
