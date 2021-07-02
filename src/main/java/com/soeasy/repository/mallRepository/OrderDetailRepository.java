package com.soeasy.repository.mallRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.Order.OrderBean;
import com.soeasy.model.Order.OrderDetailBean;



public interface OrderDetailRepository extends JpaRepository<OrderDetailBean, Integer>{



	
}