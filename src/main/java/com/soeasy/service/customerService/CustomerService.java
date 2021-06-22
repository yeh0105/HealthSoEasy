package com.soeasy.service.customerService;

import com.soeasy.model.CustomerBean;

public interface CustomerService {
	//檢查email是否存在
	Boolean emailExists(String customerEmail);
	//檢查帳密是否正確
	CustomerBean checkEmailPassword(String customerEmail, String customerPassword);
	//新增會員
	void addCustomer(CustomerBean customer);
	//ID查詢會員
	CustomerBean findByCustomerId(Integer customerId);
//	//Email查詢會員
//	CustomerBean findCustomerByEmail(String customerEmail);
	//修改基本資料
	void updateCustomer(CustomerBean customer);
	//變更會員狀態
	void updateCustomerStatus(CustomerBean customer, Integer customerStatus);
	//會員積分花費&增加
	void updateCustomerScore(CustomerBean customer, Integer score);
	
	
	
}
