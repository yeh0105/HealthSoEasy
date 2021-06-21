package com.soeasy.controller.adminController.adminManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.service.lecturerService.LecturerService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminLecture {
	
	@Autowired
	LecturerService lecturerService;
	
	

	//後台講座首頁
	@GetMapping("/adminLecture")
	public String adminLectureIndex() {
		return "/admin/adminLecture";
	}
	
	//顯示所有講座
	@GetMapping("/allLecture")
		public String list(Model model) {
//			model.addAttribute("lecture",lectureService.getAllByLectureId());
			return "/admin/adminLecture";
		
		}
	
	
//	@GetMapping(value="/getAllByLectureId.json",produces={ "application/json; charset=UTF-8" })
//	public@ResponseBody Map<String,Object> getAllSportMaps(){		
//			Map<String,Object> map = new HashMap<>();
//			List<LectureBean> list = lectureService.getAllByLectureId();
//			map.put("list", list);
//			
//			return map;
//		
//	}

}
