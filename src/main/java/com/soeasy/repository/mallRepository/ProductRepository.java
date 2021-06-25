package com.soeasy.repository.mallRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.soeasy.model.ProductBean;

public interface ProductRepository extends JpaRepository<ProductBean, Integer>,PagingAndSortingRepository<ProductBean,Integer>{

	
	List<ProductBean> findByProductName(String productName);
	List<ProductBean> findByProductDescriptionContains(String productDescription);
	
//	//自定義查詢，有問題還要調整
//	@Query("select b form product b where b")
//	List<ProductBean> findByJPQL(int len);
	
	
}