package com.soeasy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	
	@GetMapping({"/","/index"})
	public String index() {
		return "index";
	}
	//	/WEB-INF/views/index.jsp
	
	//從SoEasy首頁跳至post首頁
	@GetMapping({"/postIndex"})
	public String postIndex() {
		return "/post/postIndex";
	}
	//	/WEB-INF/views/index.jsp
	
}
