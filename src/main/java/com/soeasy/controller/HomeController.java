package com.soeasy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	// 首頁
	@GetMapping({ "/", "/index" })
	public String index(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("customerServletPath", null);
		return "index";
	}

	// 從SoEasy首頁跳至post首頁
	@GetMapping({ "/postIndex" })
	public String postIndex() {
		return "/post/postIndex";
	}

	// 從SoEasy首頁跳至post首頁
	@GetMapping({ "/postByCategory" })
	public String postByCategory() {
		return "/post/postByCategory";
	}

//	// 從SoEasy首頁跳至nutritionist首頁
//	@GetMapping({ "/nutritionist" })
//	public String nutritionist() {
//		return "/nutritionist/nutritionistIndex";
//	}

	// 從SoEasy首頁跳至sportMap首頁
	@GetMapping("/showSportMapIndex")
	public String ShowSportMapIndex() {

		return "sportMap/sportMapIndex";
	}

	// 從SoEasy首頁跳至Mall首頁
	@GetMapping("/mall")
	public String MallIndex() {

		return "mall/mallIndex";
	}

	// 從SoEasy首頁跳至講座首頁
	@GetMapping("/lectureIndex")
	public String lectureIndex() {
		return "/lecture/lectureIndex";
	}

	// 從SoEasy首頁跳至講師首頁
	@GetMapping("/lecturerIndex")
	public String lecturerIndex() {
		return "/lecturer/lecturerIndex";
	}
}
