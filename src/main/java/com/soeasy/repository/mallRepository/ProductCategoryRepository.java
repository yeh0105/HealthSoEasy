package com.soeasy.repository.mallRepository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.soeasy.model.ProductCategoryBean;

@Repository
public interface ProductCategoryRepository extends JpaRepository<ProductCategoryBean,Integer>{



}
