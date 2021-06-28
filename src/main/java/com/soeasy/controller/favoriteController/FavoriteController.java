package com.soeasy.controller.favoriteController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.FavoriteBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.favoriteService.FavoriteService;

@Controller
@RequestMapping("/favoriteController")
@SessionAttributes("customerSignInSuccess")
public class FavoriteController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	FavoriteService favoriteService;
	
	@PostMapping(value = "/addFavorite", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Map<String, Boolean> addFavorite(@RequestBody FavoriteBean favoriteBean, Model model){
		CustomerBean customerSignInSuccess = (CustomerBean)model.getAttribute("customerSignInSuccess");
		CustomerBean originalCustomer = customerService.findByCustomerId(customerSignInSuccess.getCustomerId());
		Map<String, Boolean> favoriteMessage = new HashMap<String, Boolean>();
		//查詢有無該收藏
		FavoriteBean checkFavoriteBean = favoriteService.checkFavoriteBean(favoriteBean.getFavoriteItemId(), favoriteBean.getFavoriteCategory(), originalCustomer);
		if (checkFavoriteBean == null) {
			//若查無收藏則新增收藏
			favoriteBean.setCustomerBean(originalCustomer);
			favoriteService.addFavorite(favoriteBean);
			favoriteMessage.put("favoriteExist", true);
		} else if (checkFavoriteBean != null) {
			//若已有收藏則取消收藏
			favoriteService.removeFavorite(checkFavoriteBean.getFavoriteId());
			favoriteMessage.put("favoriteExist", false);
		}
		
		
		return favoriteMessage;
		
	}
	
}
