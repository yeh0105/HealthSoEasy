package com.soeasy.controller.adminController.adminManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.CustomerBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.util.GlobalService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminCustomer {
	
	@Autowired
	CustomerService customerService;
	
	//會員
	@GetMapping({"/adminCustomer"})
	public String admin() {
		return "/admin/adminCustomer/adminCustomer";
	}
	
	//取得所有會員(ajax)
	@GetMapping(value = "/adminCustomer/getAllCustomer.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<CustomerBean> getAllCustomer(){
		List<CustomerBean> customerBeans = customerService.getAllCustomer();
		for (CustomerBean customerBean : customerBeans) {
			System.out.println(customerBean.getCustomerId());
		}
		return customerBeans;
	}
	
	
	
	//以過濾取得會員(ajax)
	@GetMapping(value = "/adminCustomer/getCustomerByStatus.json/{customerCategory}/conf/{customerStatus}", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<CustomerBean> getCustomerByFilterStatus(@PathVariable("customerCategory") String customerCategory, @PathVariable("customerStatus") String customerStatus){
		List<CustomerBean> customerBeans = null;
		if(customerCategory.equals("all") && customerStatus.equals("all")) {
			customerBeans = customerService.getAllCustomer();
		}else if(customerCategory.equals("all") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStastus(GlobalService.CUSTOMER_STATUS_NORMAL);				
		}else if (customerCategory.equals("all") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStastus(GlobalService.CUSTOMER_STATUS_BANNED);
		}else if(customerCategory.equals("male") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByGender(GlobalService.CUSTOMER_GENDER_MALE);
		}else if(customerCategory.equals("male") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndGender(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_GENDER_MALE);
		}else if(customerCategory.equals("male") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndGender(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_GENDER_MALE);
		}else if(customerCategory.equals("female") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByGender(GlobalService.CUSTOMER_GENDER_FEMALE);	
		}else if(customerCategory.equals("female") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndGender(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_GENDER_FEMALE);
		}else if(customerCategory.equals("female") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndGender(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_GENDER_FEMALE);
		}else if(customerCategory.equals("meat") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByDiet(GlobalService.CUSTOMER_DIET_MEAT);
		}else if(customerCategory.equals("meat") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndDiet(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_DIET_MEAT);
		}else if(customerCategory.equals("meat") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndDiet(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_DIET_MEAT);
		}else if(customerCategory.equals("vegetable") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByDiet(GlobalService.CUSTOMER_DIET_VAGETABLE);
		}else if(customerCategory.equals("vegetable") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndDiet(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_DIET_VAGETABLE);
		}else if(customerCategory.equals("vegetable") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndDiet(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_DIET_VAGETABLE);
		}else if(customerCategory.equals("strong") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByExercise(GlobalService.CUSTOMER_EXERCISE_STRONG);
		}else if(customerCategory.equals("strong") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_EXERCISE_STRONG);
		}else if(customerCategory.equals("strong") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_EXERCISE_STRONG);
		}else if(customerCategory.equals("normal") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByExercise(GlobalService.CUSTOMER_EXERCISE_NORMAL);
		}else if(customerCategory.equals("normal") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_EXERCISE_NORMAL);
		}else if(customerCategory.equals("normal") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_EXERCISE_NORMAL);
		}else if(customerCategory.equals("weak") && customerStatus.equals("all")) {
			customerBeans = customerService.getCustomerByExercise(GlobalService.CUSTOMER_EXERCISE_WEAK);
		}else if(customerCategory.equals("weak") && customerStatus.equals("active")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_NORMAL, GlobalService.CUSTOMER_EXERCISE_WEAK);
		}else if(customerCategory.equals("weak") && customerStatus.equals("disabled")) {
			customerBeans = customerService.getCustomerByStatusAndExercise(GlobalService.CUSTOMER_STATUS_BANNED, GlobalService.CUSTOMER_EXERCISE_WEAK);
		}
		
		System.out.println("customerBeans");
		
			
		
		return customerBeans;
	}
}
