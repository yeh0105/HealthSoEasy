package com.soeasy.controller.nutritionistController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.NutritionistBean;
import com.soeasy.model.NutritionistCategoryBean;
import com.soeasy.model.PostBean;
import com.soeasy.service.nutritionistService.NutritionistCategoryService;
import com.soeasy.service.nutritionistService.NutritionistService;

@Controller
@RequestMapping("/nutritionistController")
public class NutritionistIdController {

	@Autowired
	NutritionistService nutritionistService;
	
	@Autowired
	NutritionistCategoryService nutritionistCategoryService;

	// 新增文章，先送一個空白表單，並給予初值
	@GetMapping(value = "/addNutritionist")
	public String showEmptyForm(Model model) {
		NutritionistBean nutritionistBean = new NutritionistBean();
		// 預設表單資料
		nutritionistBean.setNutritionistName("五公斤肥貓");
		nutritionistBean.setNutritionistGender("F");
		nutritionistBean.setNutritionistDegree("肥貓醫學大學保健營養學系");
		nutritionistBean.setNutritionistEmail("fatcat05@gmail.com");

		model.addAttribute("nutritionistBean", nutritionistBean);

		return "nutritionist/addNutritionist";
	}
	
	//產生下拉式選單
	@ModelAttribute
	public void commonData (Model model) {
		Map<String, String> genderMap = new HashMap<>();
		genderMap.put("M", "男性");
		genderMap.put("F", "女性");
		model.addAttribute("genderMap", genderMap);
		
		List<NutritionistCategoryBean> nutritionistCategoryList =nutritionistCategoryService.getAllNutritionistCategorys();
		model.addAttribute("nutritionistCategoryList",nutritionistCategoryList);		
	}
}
