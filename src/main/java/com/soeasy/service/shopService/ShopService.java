package com.soeasy.service.shopService;

import com.soeasy.model.ShopBean;

public interface ShopService {

	// 檢查email是否存在
	Boolean emailExists(String shopEmail);

	// 檢查帳密是否正確
	ShopBean checkEmailPassword(String shopEmail, String shopPassword);

	// 新增會員
	void addShop(ShopBean shop);

	// ID查詢會員
	ShopBean findByShopId(Integer shopId);
	
	// 修改基本資料
	void updateShopBasicInfo(ShopBean shop);

	// 變更會員狀態
	void updateShopStatus(ShopBean shop, Integer shopStatus);
}
