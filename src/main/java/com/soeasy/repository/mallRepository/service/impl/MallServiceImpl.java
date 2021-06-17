package com.soeasy.repository.mallRepository.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductDao;
import com.soeasy.repository.mallRepository.service.MallService;

@Service
public class MallServiceImpl implements MallService {
	
	@Autowired
	private ProductDao productDao;

	
	/**
     * Description: 重新定義service接口的實現，實現清單功能
     */
	@Override
	public List<ProductBean> getArticleList() {
		return productDao.findAll();
	}

	
	 /**
     * Description: 重新定義service接口的實現，實現根據id查詢物件功能。
     */
	@Override
	public ProductBean findArticleById(int productId) {
		return productDao.findById(productId);
	}

}
