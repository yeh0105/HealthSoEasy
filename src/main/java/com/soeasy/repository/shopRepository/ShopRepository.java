package com.soeasy.repository.shopRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.ShopBean;

public interface ShopRepository extends JpaRepository<ShopBean, Integer>{

	List<ShopBean> findByShopEmail(String shopEmail);
	
	List<ShopBean> findByShopEmailAndShopPassword(String shopEmail, String shopPassword);
	
}
