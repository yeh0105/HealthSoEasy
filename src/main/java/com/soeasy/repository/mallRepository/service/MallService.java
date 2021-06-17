package com.soeasy.repository.mallRepository.service;

import java.util.List;

import com.soeasy.model.ProductBean;

public interface MallService {
	 public List<ProductBean> getArticleList();
	 public ProductBean findArticleById(int productId);

}
