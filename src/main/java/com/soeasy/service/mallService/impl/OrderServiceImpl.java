package com.soeasy.service.mallService.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.Order.OrderBean;
import com.soeasy.repository.mallRepository.OrderRepository;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.mallService.OrderService;

@Transactional
@Service("OrderService")
public class OrderServiceImpl implements OrderService {

		@Autowired
		private OrderRepository orderRepository;
	
		@Autowired
		private CustomerService customerService;

	@Override
	public OrderBean save(OrderBean order) {
		return orderRepository.save(order);
	}

	@Override
	public List<OrderBean> findAllwithOrder(Integer customerId){
		return orderRepository.findAllWithOrder(customerId);
	}

	@Override
	public OrderBean findByOrderId(Integer orderId) {
		return orderRepository.findById(orderId).get();
	}

}
