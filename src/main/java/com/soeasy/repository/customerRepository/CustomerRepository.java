package com.soeasy.repository.customerRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.soeasy.model.CustomerBean;

public interface CustomerRepository extends JpaRepository<CustomerBean, Integer> {
	
	List<CustomerBean> findByCustomerEmail(String customerEmail);
	
}
