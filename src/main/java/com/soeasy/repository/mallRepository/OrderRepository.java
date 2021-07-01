package com.soeasy.repository.mallRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.OrderBean;



public interface OrderRepository extends JpaRepository<OrderBean, Integer>{



	
}