package com.soeasy.controller.passwordResetController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.PasswordResetValidate;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.passwordResetService.PasswordResetService;
import com.soeasy.service.shopService.ShopService;

@Controller
@RequestMapping("/passwordResetValidate")
public class PasswordResetController {
	
	@Autowired
	PasswordResetService passwordResetService;
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	ShopService shopService;
	
//	發信者
	@Value("${spring.mail.username}")
	private String fromEmail;
	
//	送出會員變更密碼信箱驗證
	@PostMapping(value = "/sendCustomerValidationEmail", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> sendCustomerValidationEmail(@RequestParam("email") String email, HttpServletRequest request){
		Map<String, String> responseMessage = new HashMap<String, String>();
		List<CustomerBean> customerBeans = customerService.findByCustomerEmail(email);
		
		if (customerBeans == null) {
			responseMessage.put("responseMessage", "該信箱用戶不存在");
		} else {
			//尚未檢驗允許重製---未完成
//			if(passwordResetService.sendValidateLimitation(email, 5L, 1L)) {
//				//允許重製密碼
//				
//			}else {
//				//一天申請超過五次，或一分鐘內連續送出
//			}
			
			
			//產生重製密碼申請記錄
			PasswordResetValidate passwordResetValidate = new PasswordResetValidate();
			passwordResetService.insertCustomerResetRecord(passwordResetValidate, customerBeans.get(0), UUID.randomUUID().toString());

			//設置郵件內容
			String appUrl = request.getScheme() + "://" + request.getServerName();
			SimpleMailMessage passwordResetEmail = new SimpleMailMessage();
			passwordResetEmail.setFrom(fromEmail);
			passwordResetEmail.setTo(email);
			passwordResetEmail.setSubject("[Soeasy健康資訊網]忘記密碼");
			passwordResetEmail.setText("您正在申請重新設置密碼，請點擊此連結重製密碼:\n" 
										+ appUrl 
										+ "/validate/reset?token=" 
										+ passwordResetValidate.getResetToken());
			passwordResetService.sendPasswordResetEmail(passwordResetEmail);
			
			System.out.println(email);
			System.out.println(appUrl);
			responseMessage.put("responseMessage", "以送出密碼重置郵件，請至您的註冊信箱確認");
		}
		
		
		return responseMessage;
	}
}