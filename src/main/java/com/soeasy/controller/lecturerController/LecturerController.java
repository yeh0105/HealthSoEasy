package com.soeasy.controller.lecturerController;

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

	// 從SoEasy首頁跳至講師首頁
	@GetMapping("/LecturerIndex")
	public String ShowLecturerIndex(Model model) {
		return "lecturer/lecturerIndex";
	}

	// 查詢單一講師
	@GetMapping(value = "/lecturer/{lecturerId}")
	public String showOneLecturer(@PathVariable("lecturerId") Integer lecturerId, Model model) {
		LecturerBean lecturerBean = lecturerService.findByLecturerId(lecturerId);
		model.addAttribute("lecturerBean", lecturerBean);
		return "lecturer/updateLecturer";
	}

	// 查詢所有講師
	@GetMapping("/allLecturers")
	public String processMvcRequest(Model model) {
		model.addAttribute("lecturer", lecturerService.findAllByLecturerId());

		return "lecturer/getAllLecturers";
	}

	// 新增講師，先送一個空白表單
	@GetMapping(value = "/add")
	public String showEmptyForm(Model model) {
		LecturerBean lecturerBean = new LecturerBean();
		// 預設表單資料
		lecturerBean.setLecturerName("peeta葛格");
		lecturerBean.setLecturerTalent("健美先生、營養師");
		lecturerBean.setLecturerExp("peeta葛格負責人");
		model.addAttribute("lecturerBean", lecturerBean);

		return "lecturer/addLecturer";
	}

	// 新增講師
	@PostMapping(value = "/add")
	public String add(@ModelAttribute("lecturerBean") LecturerBean lecturerBean, BindingResult result, Model model,
			HttpServletRequest request) {

		// 檢驗欄位內容
		LecturerBeanValidator validator = new LecturerBeanValidator();
		validator.validate(lecturerBean, result);
		if (result.hasErrors()) {

			return "redirect:/lecturerController/add";
		}

		// 跳轉至查詢所有講師
		return "redirect:/lecturerController/allLecturers";
	}
}
