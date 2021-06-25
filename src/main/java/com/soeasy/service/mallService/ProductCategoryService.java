package com.soeasy.service.mallService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.soeasy.model.ProductCategoryBean;

import javassist.NotFoundException;

public interface ProductCategoryService {
	
	ProductCategoryBean saveCategory(ProductCategoryBean productCategory);
	ProductCategoryBean getCategory(Integer productCategoryId);
	
	
	//ProductCategoryBean updateCategory(Long productCategoryId);
	
	void deleteCategory(Integer pproductCategory);
	Page<ProductCategoryBean> ListCategory(Pageable pageable);
	
	ProductCategoryBean updateCategory(Integer productCategoryId, ProductCategoryBean productCategory) throws NotFoundException;
	
	
	
}
