package com.soeasy.controller.lectureController;

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

import com.soeasy.model.LectureBean;
import com.soeasy.model.LecturerBean;
import com.soeasy.service.lectureService.LectureService;
import com.soeasy.service.lecturerService.LecturerService;
import com.soeasy.validator.lectureValidator.LectureBeanValidator;
import com.soeasy.validator.lecturerValidator.LecturerBeanValidator;

@Controller
@RequestMapping("/lectureController")
public class LectureController {

	@Autowired
	LectureService lectureService;

	// 查詢所有講座
	@GetMapping("/getAllLectures")
	public String getAllLectures(Model model) {
		List <LectureBean> lecture=lectureService.getAllByLectureId();
		model.addAttribute("lecture", lecture);

		return "lecture/getAllLectures";
	}

	// 新增講座，先送一個空白表單，並給予初值
	@GetMapping("/addLecture")
	public String showEmptyForm(Model model) {
		LectureBean lectureBean = new LectureBean();
		// 預設表單資料
		lectureBean.setLectureTitle("");
		lectureBean.setLectureContent("");
		
		model.addAttribute("lectureBean", lectureBean);

		return "lecture/addLecture";
	}

	// 新增講座
	@PostMapping(value = "/addLecture")
	public String addLecture(@ModelAttribute("lectureBean") LectureBean lectureBean, BindingResult result, Model model,	HttpServletRequest request) {

		// 檢驗欄位內容(空白未填)
		LectureBeanValidator validator = new LectureBeanValidator();
		validator.validate(lectureBean, result);
		if (result.hasErrors()) {

			return "redirect:/lectureController/addLecture";
		}

		// 如果新增成功就跳轉至查詢所有講師
		return "redirect:/lectureController/getAllLectures";
	}
	
	// 刪除講座
		@PostMapping("/deleteLecture/{lectureId}")
		public String delete(@PathVariable("lectureId") Integer lectureId) {
			lectureService.deleteLecture(lectureId);
			
			// 跳轉至查詢所有講師
			return "redirect:/lectureController/getAllLectures";
		}
}
