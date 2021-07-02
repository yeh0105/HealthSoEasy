package com.soeasy.repository.mallRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.soeasy.model.Order.OrderBean;



public interface OrderRepository extends JpaRepository<OrderBean, Integer>{

	
	@Query("from OrderBean where customerBean.customerId= :customerId order by orderId desc")
	public List<OrderBean>findAllWithOrder(@Param("customerId")Integer customerId);
	


	
}