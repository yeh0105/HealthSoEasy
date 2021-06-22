package com.soeasy.controller.adminController.adminManage;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.LecturerBean;
import com.soeasy.service.lecturerService.LecturerService;
import com.soeasy.validator.lecturerValidator.LecturerBeanValidator;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminLecturer {
	
	@Autowired
	LecturerService lecturerService;
	
	

	//後台講師首頁
	@GetMapping("/adminLecture/lecturer")
	public String adminLectureIndex() {
		return "/admin/adminLecturer/adminLecturer";
	}
	
//	//顯示所有講師 (好像沒必要XD?)
//	@GetMapping("/allLecturer")
//		public String list(Model model) {
//			model.addAttribute("lecturer",lecturerService.getAllByLecturerId());
//			return "/admin/adminLecturer";
//		}
	
	
//	@GetMapping(value="/getAllByLecturerId.json",produces={ "application/json; charset=UTF-8" })
//	public List<LecturerBean> getAllSportMaps(){		
////			Map<String,Object> map = new HashMap<>();
//			List<LecturerBean> content = lecturerService.getAllByLecturerId();
////			map.put("lecturer", content);
//			
//			return content;
//		
//	}

	// 新增講師，先送一個空白表單，並給予初值
			@GetMapping("/adminLecturer/addLecturer")
			public String showEmptyForm(Model model) {
				LecturerBean lecturerBean = new LecturerBean();
				// 預設表單資料
				lecturerBean.setLecturerName("peeta葛格");
				lecturerBean.setLecturerTalent("健美先生、營養師");
				lecturerBean.setLecturerExp("peeta fitness創辦者");
				
				model.addAttribute("lecturerBean", lecturerBean);

				return "/admin/adminLecturer/adminAddLecturer";
			}

			// 新增講師
			@PostMapping("/adminLecturer/addLecturer")
			public String addLecturer(@ModelAttribute("lecturerBean") LecturerBean lecturerBean, BindingResult result, Model model,	HttpServletRequest request) {

				// 檢驗欄位內容(空白未填)
				LecturerBeanValidator validator = new LecturerBeanValidator();
				validator.validate(lecturerBean, result);
				if (result.hasErrors()) {

					// 新增不成功會停留在新增講師畫面
					return "/admin/adminLecturer/adminAddlecturer";
				}

				// 如果新增成功就跳轉至查詢所有講師
				return "/admin/adminLecturer/adminLecturer";
			}
}
