package com.soeasy.config;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;

import com.soeasy.controller.adminController.AdminLoginInterceptor;

@Configuration
public class WebAppConfig implements WebMvcConfigurer {

	@Autowired
	private RequestMappingHandlerAdapter requestMappingHandlerAdapter;
	
	@Autowired
	private AdminLoginInterceptor adminLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(adminLoginInterceptor);
		
	}

	// 取消"redirect+冒號..."時會掛上QueryString
	@PostConstruct
	public void init() {
		requestMappingHandlerAdapter.setIgnoreDefaultModelOnRedirect(true);
	}	
}
