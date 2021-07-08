package com.soeasy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.soeasy.model.LectureBean;
import com.soeasy.service.lectureService.LectureService;

@Controller
public class HomeController {

	@Autowired
	LectureService lectureService;

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

	// 從SoEasy首頁跳至post類別
	@GetMapping({ "/postByCategory" })
	public String postByCategory() {
		return "/post/postByCategory";
	}

	// 從SoEasy首頁跳至nutritionist首頁
	@GetMapping({ "/nutritionist" })
	public String nutritionist() {
		return "/nutritionist/getAllPageNutritionist";
	}

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
	public String lectureIndex(Model model) {
		List<LectureBean> lectures = lectureService.updateLectureStatus();
		model.addAttribute("lectures", lectures);
		return "/lecture/lectureIndex";
	}

	// 從SoEasy首頁跳至講師首頁
	@GetMapping("/lecturerIndex")
	public String lecturerIndex() {
		return "/lecturer/lecturerIndex";
	}
}
