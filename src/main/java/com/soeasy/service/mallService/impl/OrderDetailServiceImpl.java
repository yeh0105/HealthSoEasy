package com.soeasy.service.mallService.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.OrderBean;
import com.soeasy.model.OrderDetailBean;
import com.soeasy.repository.mallRepository.OrderDetailRepository;
import com.soeasy.repository.mallRepository.OrderRepository;
import com.soeasy.service.mallService.OrderService;

@Transactional
@Service("OrdereDetailsrvice")
public class OrderDetailServiceImpl{

	@Autowired
		private OrderDetailRepository orderDetailRepository;
	
	public OrderDetailBean save(OrderDetailBean orderDetail) {
		return orderDetailRepository.save(orderDetail);
	}
	
	

	

	
}
