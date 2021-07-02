package com.soeasy.service.shopService;

import java.util.List;

import com.soeasy.model.ShopBean;

public interface ShopService {

	// 檢查email是否存在
	Boolean emailExists(String shopEmail);

	// 檢查帳密是否正確
	ShopBean checkEmailPassword(String shopEmail, String shopPassword);

	// 新增廠商會員
	void addShop(ShopBean shop);

	// ID查詢廠商會員
	ShopBean findByShopId(Integer shopId);
	
	// 修改基本資料
	void updateShopBasicInfo(ShopBean shop);

	// 變更會員狀態
	void updateShopStatus(ShopBean shop, Integer shopStatus);
	
	//查詢所有廠商會員
	List<ShopBean> getAllShop();
}
