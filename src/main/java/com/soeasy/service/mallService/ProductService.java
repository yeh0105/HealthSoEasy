package com.soeasy.service.mallService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	// 查詢所有的產品列表
	public List<ProductBean> findAll() {

		return productRepository.findAll();
	}
	
	//查詢分頁
	public Page<ProductBean> findAllByPage(int pageNo) {
	     int pageSize = 10;
	     Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
	     return productRepository.findAll(pageable);
	}
	
	// 新增.更新產品

	public ProductBean save(ProductBean product) {
		return productRepository.save(product);
	}

	// 使用ID查詢一個產品

	public ProductBean findProductById(Integer productId) {
		return productRepository.findById(productId).get();
	}

	// 刪除產品
	public void deleteById(Integer productId) {
		productRepository.deleteById(productId);
	}

	//使用Name查詢產品
	public List<ProductBean> findByProductName(String productName) {
		return productRepository.findByProductName(productName);
	}
	
	//使用description的任一關鍵字 查詢產品

	public List<ProductBean> findByProductDescriptionContains(String productDescription) {
		return productRepository.findByProductDescriptionContains(productDescription);
	}

	public Integer find(Integer productId) {
		// TODO Auto-generated method stub
		return null;
	}



	
	

}
