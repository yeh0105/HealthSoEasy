package com.soeasy.service.shopService.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.ShopBean;
import com.soeasy.repository.shopRepository.ShopRepository;
import com.soeasy.service.shopService.ShopService;

@Transactional
@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	ShopRepository shopRepository;
	
	@Override
	public Boolean emailExists(String shopEmail) {
		List<ShopBean> shopBeans = shopRepository.findByShopEmail(shopEmail);
		if (shopBeans.size() > 0) {
			return true;
		}

		return false;
	}

	@Override
	public CustomerBean checkEmailPassword(String shopEmail, String shopPassword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addShop(ShopBean shop) {
		shopRepository.save(shop);
		
	}

	@Override
	public CustomerBean findByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCustomerBasicInfo(CustomerBean customer) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCustomerStatus(CustomerBean customer, Integer customerStatus) {
		// TODO Auto-generated method stub
		
	}

}
