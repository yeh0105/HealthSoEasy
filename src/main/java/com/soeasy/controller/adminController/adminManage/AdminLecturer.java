package com.soeasy.controller.adminController.adminManage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.service.lecturerService.LecturerService;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminLecturer {
	
	@Autowired
	LecturerService lecturerService;
	
	

	//後台講師首頁
	@GetMapping("/adminLecture/lecturer")
	public String adminLectureIndex() {
		return "/admin/adminLecturer";
	}
	
	//顯示所有講師
	@GetMapping("/allLecturer")
		public String list(Model model) {
			model.addAttribute("lecturer",lecturerService.getAllByLecturerId());
			return "/admin/adminLecturer";
		
		}
	
	
//	@GetMapping(value="/getAllByLecturerId.json",produces={ "application/json; charset=UTF-8" })
//	public@ResponseBody Map<String,Object> getAllSportMaps(){		
//			Map<String,Object> map = new HashMap<>();
//			List<LecturerBean> list = lecturerService.getAllByLecturerId();
//			map.put("list", list);
//			
//			return map;
//		
//	}

}
