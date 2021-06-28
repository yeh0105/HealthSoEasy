package com.soeasy.controller.recordController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.NutritionistBean;
import com.soeasy.model.RecordBean;
import com.soeasy.service.recordService.RecordService;

@Controller
@RequestMapping("/recordController")
public class RecordController {

	@Autowired
	RecordService recordService;

	// 查詢全部營養師
	@GetMapping("/getAllRecords")
	public String DisplayRecord(Model model) {
		model.addAttribute("records", recordService.findAllByRecordId());
		return "/record/getAllRecords";
	}

	// 查詢單營養師
	@GetMapping(value = "/record/{recordId}")
	public String getOneRecordById(@PathVariable("recordId") Integer recordId, Model model) {
		RecordBean recordBean = recordService.findByRecordId(recordId);
		model.addAttribute("recordBean", recordBean);
		return "/record/recordIndex";
	}

	// 新增營養師，先送一個空白表單，並給予初值
	@GetMapping(value = "/addRecord")
	public String emptyRecord(Model model) {
		RecordBean recordBean = new RecordBean();
		// 預設表單資料
		recordBean.setRecordWeight(67.0);
		recordBean.setRecordHeight(192.0);
		model.addAttribute("recordBean", recordBean);

		return "/record/addRecord";
	}
}
