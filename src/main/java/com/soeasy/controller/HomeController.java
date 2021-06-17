package com.soeasy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//從SoEasy首頁跳至sportMap首頁	
	@GetMapping("/showSportMapIndex")
	public String ShowSportMapIndex() {
		
		return "sportMap/sportMapIndex";
	}

	
}
