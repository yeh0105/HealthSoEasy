package com.soeasy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	//首頁
	@GetMapping({"/","/index"})
	public String index() {
		return "index";
	}

	
	//從SoEasy首頁跳至post首頁
	@GetMapping({"/postIndex"})
	public String postIndex() {
		return "/post/postIndex";
	}

  //從SoEasy首頁跳至nutritionist首頁
	@GetMapping({"/nutritionist"})
	public String nutritionist() {
		return "/nutritionist/nutritionistIndex";
	}

	
}
