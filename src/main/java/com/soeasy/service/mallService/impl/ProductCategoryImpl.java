package com.soeasy.service.mallService.impl;

import javax.transaction.Transactional;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.soeasy.model.ProductCategoryBean;
import com.soeasy.repository.mallRepository.ProductCategoryRepository;
import com.soeasy.service.mallService.ProductCategoryService;

import javassist.NotFoundException;

@Service
public class ProductCategoryImpl implements ProductCategoryService {
	
	@Autowired
	private ProductCategoryRepository productCategoryRepository;
	
	
	@Override
	public ProductCategoryBean saveCategory(ProductCategoryBean productCategory) {
		// TODO Auto-generated method stub
		return productCategoryRepository.save(productCategory) ;
	}

	@Override
	public ProductCategoryBean getCategory(Integer productCategoryId) {
		// TODO Auto-generated method stub
		return productCategoryRepository.findById(productCategoryId).get();
	}
	
	
	@Override
	public Page<ProductCategoryBean>listCategory(Pageable pageable){
		return productCategoryRepository.findAll(pageable);

	}

	
	// 刪除產品

	@Override
	public void deleteCategory(Integer productCategoryId) {
	 productCategoryRepository.deleteById(productCategoryId);
	}
	
	@Override
	public ProductCategoryBean updateCategory(Integer productCategoryId,ProductCategoryBean productCategory) throws NotFoundException {
		
		ProductCategoryBean category=productCategoryRepository.findById(productCategoryId).get();
		if(category==null) {
			throw new NotFoundException("不存在該類型");
		}
		BeanUtils.copyProperties(productCategory, category);
		return productCategoryRepository.save(category);
			}
	
	
	
	
	

	

	
}
