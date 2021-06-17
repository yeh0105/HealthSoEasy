package com.soeasy.controller.customerController;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.soeasy.model.CustomerBean;

@Controller
@RequestMapping("/customerController")
@SessionAttributes({"customerSignInSuccess"}) 
public class SignOutController {
	
	@GetMapping("/signOut")
	public String signOut(HttpSession session,  Model model, SessionStatus status,
			RedirectAttributes redirectAtt
			) {
		CustomerBean customerBean = (CustomerBean)model.getAttribute("customerSignInSuccess");
		String name = null;
		String email = null;
		if(customerBean != null) {
			name = customerBean.getCustomerName();
			email = customerBean.getCustomerEmail();
			String farewellMessage = name + "您已登出，期待您再次蒞臨網站";
			
			
			redirectAtt.addFlashAttribute("customerSignOutEmailBean", email);
			redirectAtt.addFlashAttribute("farewellMessage", farewellMessage);
			// 登出時執行下列兩敘述
			status.setComplete();
			session.invalidate();
			//重新導回登入頁面
			return "redirect:/customerController/customerSignIn";		
		}
		return "redirect:/";
	}
}
