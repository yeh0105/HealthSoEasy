package com.soeasy.repository.mallRepository.impl;

import javax.persistence.EntityManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soeasy.model.ProductBean;
import com.soeasy.model.ShopBean;

@Repository("ProductUpdateImpl")
public class ProductUpdateImpl {
	

		@Autowired
		EntityManager  entityManager;
		public void updateBook(ProductBean product, ShopBean shop) {
			entityManager.detach(product);
			//CompanyBean bean = entityManager.find(CompanyBean.class, 3);
			product.setShopBean(shop);
			entityManager.merge(product);
		}
	}
	
	

