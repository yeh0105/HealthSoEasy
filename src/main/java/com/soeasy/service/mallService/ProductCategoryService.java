package com.soeasy.service.mallService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.soeasy.model.ProductCategoryBean;

import javassist.NotFoundException;

public interface ProductCategoryService {
	
	ProductCategoryBean saveCategory(ProductCategoryBean productCategory);
	ProductCategoryBean getCategory(Integer productCategoryId);
		
	void deleteCategory(Integer productCategory);
	
	Page<ProductCategoryBean> listCategory(Pageable pageable);
	
	ProductCategoryBean updateCategory(Integer productCategoryId, ProductCategoryBean productCategory) throws NotFoundException;
	
	
	
}
