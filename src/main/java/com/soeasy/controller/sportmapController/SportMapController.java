package com.soeasy.controller.sportmapController;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soeasy.model.SportMapBean;
import com.soeasy.service.sportmapService.SportMapService;

@Controller
@RequestMapping("sportMap")
public class SportMapController {

	@Autowired
	SportMapService sportMapService;

	@GetMapping("DisplaySportMaps")
	public String displaySportMaps(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {

		
		model.addAttribute("baBean", sportMapService);
		Map<Integer,SportMapBean> sportsMap = sportMapService.getPageSportMaps(pageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("totalPages", sportMapService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("sportMaps_DPP", sportsMap);

		
		
		System.out.println("getAll");
		return "sportMap/getAllSportMaps";
	}
}
