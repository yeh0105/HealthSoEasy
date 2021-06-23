package com.soeasy.service.mallService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductRepository;
import com.soeasy.util.GlobalService;

@Service
public class ProductService {
	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);
	private int recordsPerPage = GlobalService.PRODUCT_PER_PAGE;  
	private int totalPages = -1;

	
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

	@Transactional
	public Map<Integer, ProductBean> getPageProduct(int pageNo) {

		Map<Integer, ProductBean> product = new LinkedHashMap<>();
		// PageRequest.of(pageNo, recordsPerPage): 第一個參數為 0-based
		Pageable pageable = PageRequest.of(pageNo - 1, recordsPerPage);
		Page<ProductBean> beans = productRepository.findAll(pageable);

		List<ProductBean> list = beans.getContent();
		for (ProductBean bean : list) {
			product.put(bean.getProductId(), bean);
		}
		return product;
	}

	
	public Long getRecordCounts() {
		return productRepository.count();
	}

	@Transactional
	
	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		logger.info("totalPages=" + totalPages);
		return totalPages;
		

	}
	

//	public Page<ProductBean> findAllByPage(Integer pageNo) {
//	    Integer pageSize = 5;
//	     Pageable pageable = PageRequest.of(pageNo - 1, pageSize);
//	     return productRepository.findAll(pageable);
//	}

	
	
	
	

}
