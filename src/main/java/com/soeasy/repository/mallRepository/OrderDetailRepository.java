package com.soeasy.repository.mallRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.OrderBean;
import com.soeasy.model.OrderDetailBean;



public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer>{



	
}