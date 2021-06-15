package com.soeasy.repository.customerRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.CustomerBean;

public interface CustomerRepository extends JpaRepository<CustomerBean, Integer> {
	
	List<CustomerBean> findByCustomerEmail(String customerEmail);
	
	List<CustomerBean> findByCustomerEmailAndCustomerPassword(String customerEmail, String customerPassword);
}
