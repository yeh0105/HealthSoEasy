package com.soeasy.controller.adminController.adminManage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.SportMapBean;
import com.soeasy.service.sportmapService.SportMapService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminSportMap {
	
	@Autowired
	SportMapService sportMapService;
	
	

	//後台地圖首頁
	@GetMapping("/adminSportMap")
	public String adminSportMapIndex() {
		return "/admin/adminSportMap/adminSportMap";
	}
	
	//顯示所有運動地點
	@GetMapping("/showAllSportMaps")
		public String list(Model model) {
			model.addAttribute("sportMaps",sportMapService.getAllSportMaps());
			return "/admin/adminSportMap/adminSportMap";
		
		}
	
	
	@GetMapping(value="/getAllSportMaps.json",produces={ "application/json; charset=UTF-8" })
	public@ResponseBody Map<String,Object> getAllSportMaps(){		
			Map<String,Object> map = new HashMap<>();
			List<SportMapBean> list = sportMapService.getAllSportMaps();
			map.put("list", list);
			
			return map;
		
	}

}
