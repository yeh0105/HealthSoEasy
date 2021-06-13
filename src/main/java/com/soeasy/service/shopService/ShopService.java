package com.soeasy.service.shopService;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.ShopBean;

public interface ShopService {

	// 檢查email是否存在
	Boolean emailExists(String shopEmail);

	// 檢查帳密是否正確
	CustomerBean checkEmailPassword(String shopEmail, String shopPassword);

	// 新增會員
	void addShop(ShopBean shop);

	// ID查詢會員
	CustomerBean findByShopId(Integer shopId);
	
	// 修改基本資料
	void updateCustomerBasicInfo(CustomerBean customer);

	// 變更會員狀態
	void updateCustomerStatus(CustomerBean customer, Integer customerStatus);
}
