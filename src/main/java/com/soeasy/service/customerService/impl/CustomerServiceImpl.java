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
		CustomerBean customerBean = null;
		List<CustomerBean> customerBeans = customerRepository.findByCustomerEmailAndCustomerPassword(customerEmail, customerPassword);
		if(customerBeans.size() > 0) {
			customerBean = customerBeans.get(0);
		}
		return customerBean;
	}

	@Override
	public void addCustomer(CustomerBean customer) {
		customerRepository.save(customer);
	}

	@Override
	public CustomerBean findByCustomerId(Integer customerId) {
		return customerRepository.getById(customerId);
	}

//	@Override
//	public CustomerBean findCustomerByEmail(String customerEmail) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public void updateCustomer(CustomerBean customer) {
		customerRepository.save(customer);
	}

	@Override
	public void updateCustomerStatus(CustomerBean customer, Integer customerStatus) {

	}

	@Override
	public void updateCustomerScore(CustomerBean customer, Integer score) {

	}

	@Override
	public List<CustomerBean> getAllCustomer() {
		return customerRepository.findAll();
	}

	
}
