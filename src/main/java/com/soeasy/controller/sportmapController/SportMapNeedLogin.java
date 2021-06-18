package com.soeasy.controller.sportmapController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.service.sportmapService.SportMapService;

@Controller
@RequestMapping("/sportMapNeedLogin")
@SessionAttributes("customerSignInSuccess")
public class SportMapNeedLogin {

	@Autowired
	SportMapService sportMapService;	
	
	
	//加入收藏
		@PostMapping("/getLike/{sportMapId}")
		public String getLike(Model model,
				@PathVariable("sportMapId") Integer sportMapId) {
			
			// 判斷是否為會員
	        CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
	        if (customerBean == null) {
	            return "redirect:/customerController/customerSignIn";
	        }
	        
	         //1.是會員就將此地點(存sportMapId)到會員收藏表 2.收藏按鈕要判斷顯示是否收藏過
	        
		
			
//			return "redirect:/sportMapController/sportMap/{sportMapId}";
			return "redirect:/sportMapController/displaySportMaps";
		}
	
	
}
