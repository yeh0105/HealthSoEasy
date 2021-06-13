package com.soeasy.service.customerService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.CustomerBean;
import com.soeasy.repository.customerRepository.CustomerRepository;
import com.soeasy.service.customerService.CustomerService;

@Transactional
@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerRepository customerRepository;

	public CustomerServiceImpl() {
	}

	@Override
	public Boolean emailExists(String customerEmail) {
		List<CustomerBean> customerBeans = customerRepository.findByCustomerEmail(customerEmail);
		if (customerBeans.size() > 0) {
			return true;
		}

		return false;
	}

	@Override
	public CustomerBean checkEmailPassword(String customerEmail, String customerPassword) {
		return null;
	}

	@Override
	public void addCustomer(CustomerBean customer) {
		customerRepository.save(customer);
	}

	@Override
	public CustomerBean findByCustomerId(Integer customerId) {
		return null;
	}

//	@Override
//	public CustomerBean findCustomerByEmail(String customerEmail) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public void updateCustomerBasicInfo(CustomerBean customer) {

	}

	@Override
	public void updateCustomerStatus(CustomerBean customer, Integer customerStatus) {

	}

	@Override
	public void updateCustomerScore(CustomerBean customer, Integer score) {

	}

}
