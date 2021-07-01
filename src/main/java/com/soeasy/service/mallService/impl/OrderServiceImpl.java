package com.soeasy.service.mallService.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.OrderBean;
import com.soeasy.repository.mallRepository.OrderRepository;
import com.soeasy.service.mallService.OrderService;

@Transactional
@Service("OrderService")
public class OrderServiceImpl {

	@Autowired
		private OrderRepository orderRepository;
	
	public OrderBean save(OrderBean order) {
		return orderRepository.save(order);
	}
	
	

	

	
}
