package com.soeasy.repository.mallRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.soeasy.model.ProductBean;

//	@Repository
//	public interface ProductDao extends JpaRepository<ProductBean, Integer>{
//
//	}
	
	public interface ProductDao extends JpaRepository<ProductBean,Integer> , JpaSpecificationExecutor<ProductBean> {
	    ProductBean findById(int productId);
	}
	

