package com.soeasy.service.mallService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	

}
