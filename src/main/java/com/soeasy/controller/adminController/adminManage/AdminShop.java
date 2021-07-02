package com.soeasy.controller.adminController.adminManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.ShopBean;
import com.soeasy.service.shopService.ShopService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminShop {
	
	@Autowired
	ShopService shopService;

	//廠商
	@GetMapping({"/adminShop"})
	public String admin() {
		return "/admin/adminShop/adminShop";
	}
	
	//取得所有會員(ajax)
	@GetMapping(value = "/adminShop/getAllShop.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ShopBean> getAllCustomer(){
		List<ShopBean> shopBeans = shopService.getAllShop();
		return shopBeans;
	}
	
//	透過ID修改廠商基本資料
	@PostMapping(value = "/adminUpdateShopInfo", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody Map<String, String> adminUpdateShopInfo(@RequestBody ShopBean updateShopBean) {
		// 以傳入的ID搜尋原始的會員物件
		ShopBean originalShop = shopService.findByShopId(updateShopBean.getShopId());

		// 更新檢查訊息
		Map<String, String> updateMessage = new HashMap<String, String>();

		if (updateShopBean.getShopName() == null) {
			updateMessage.put("updateErrorNameMessage", "名字不得為空");
		}
		if (updateShopBean.getShopEmail() == null) {
			updateMessage.put("updateErrorEmailMessage", "信箱不得為空");
		}
		if (updateShopBean.getShopPhone() == null) {
			updateMessage.put("updateErrorEmailMessage", "電話不得為空");
		}
		// 為原始物件設定傳入的欄位值
		originalShop.setShopName(updateShopBean.getShopName());
		originalShop.setShopStatus(updateShopBean.getShopStatus());
		originalShop.setShopEmail(updateShopBean.getShopEmail());
		originalShop.setShopPhone(updateShopBean.getShopPhone());

		// save原始物件
		shopService.updateShopBasicInfo(originalShop);

		// 更新成功訊息
		updateMessage.put("updateSuccessMessage", "更新成功");
		return updateMessage;
	}
}
