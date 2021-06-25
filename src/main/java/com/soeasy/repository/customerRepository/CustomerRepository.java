package com.soeasy.repository.customerRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.soeasy.model.CustomerBean;

public interface CustomerRepository extends JpaRepository<CustomerBean, Integer> {
	
	List<CustomerBean> findByCustomerEmail(String customerEmail);
	
	List<CustomerBean> findByCustomerEmailAndCustomerPassword(String customerEmail, String customerPassword);
	
	List<CustomerBean> findByCustomerStatus(Integer customerStatus);
	
//	@Query("select c from Customer c where c.customerStatus = ?1 and where c.fk_customerHealthId = (select ch.customerHealthId from CustomerHealth ch where ch.customerGender = ?2)")
//	List<CustomerBean> findByCustomerStatusAndCustomerGender(Integer customerStatus, Integer customerGender);
}
