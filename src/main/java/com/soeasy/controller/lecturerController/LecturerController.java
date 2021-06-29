package com.soeasy.controller.lecturerController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.LecturerBean;
import com.soeasy.service.lecturerService.LecturerService;
import com.soeasy.validator.lecturerValidator.LecturerBeanValidator;

@Controller
@RequestMapping("/lecturerController")
public class LecturerController {

	@Autowired
	LecturerService lecturerService;

	// 查詢所有講師
	@GetMapping("/getAllLecturers")
	public String getAllLecturers(Model model) {
		List <LecturerBean> lecturer=lecturerService.getAllByLecturerId();
		model.addAttribute("lecturer", lecturer);

		return "lecturer/getAllLecturers";
	}

	// 新增講師，先送一個空白表單，並給予初值
	@GetMapping("/addLecturer")
	public String showEmptyForm(Model model) {
		LecturerBean lecturerBean = new LecturerBean();
		// 預設表單資料
		lecturerBean.setLecturerName("peeta葛格");
		lecturerBean.setLecturerTalent("健美先生、營養師");
		lecturerBean.setLecturerExp("peeta fitness創辦者");
		
		model.addAttribute("lecturerBean", lecturerBean);

		return "lecturer/addLecturer";
	}

	// 新增講師
	@PostMapping(value = "/addLecturer")
	public String addLecturer(@ModelAttribute("lecturerBean") LecturerBean lecturerBean, BindingResult result, Model model,	HttpServletRequest request) {

		// 檢驗欄位內容(空白未填)
		LecturerBeanValidator validator = new LecturerBeanValidator();
		validator.validate(lecturerBean, result);
		if (result.hasErrors()) {

			return "redirect:/lecturerController/addLecturer";
		}

		// 如果新增成功就跳轉至查詢所有講師
		return "redirect:/lecturerController/getAllLecturers";
	}
	
	// 刪除講師
		@PostMapping("/deleteLecturer/{lecturerId}")
		public String delete(@PathVariable("lecturerId") Integer lecturerId) {
			lecturerService.deleteLecturer(lecturerId);
			
			// 跳轉至查詢所有講師
			return "redirect:/lecturerController/getAllLecturers";
		}
}
