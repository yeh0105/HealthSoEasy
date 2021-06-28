package com.soeasy.service.mallService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	
	
	// 新增.更新產品

	public ProductBean save(ProductBean product) {
		return productRepository.save(product);
	}
	
	

	//查詢分頁&排序 
	public Page<ProductBean> findAllByPage(int pageNumber,String sortField, String sortDir,String keyword) {
		
		//設定分類排序
		Sort sort = Sort.by(sortField);
		sort = sortDir.equals("asc")?sort.ascending():sort.descending();

	     int pageSize = 10;//每頁會顯示10個產品
	     Pageable pageable = PageRequest.of(pageNumber - 1, pageSize,sort);// 顯示的方式
	     
	     //查詢關鍵字並連動分頁
	     if(keyword != null) {
				return productRepository.findAll(keyword,pageable);
			}
	     
	     return productRepository.findAll(pageable);
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
	

	public Integer find(Integer productId) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object findAllProduct() {
		// TODO Auto-generated method stub
		return productRepository.findAll();
	}
	
}
