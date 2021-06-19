package com.soeasy.controller.nutritionistController;



import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.soeasy.model.NutritionistBean;
import com.soeasy.model.NutritionistCategoryBean;
import com.soeasy.service.nutritionistService.NutritionistCategoryService;
import com.soeasy.service.nutritionistService.NutritionistService;
import com.soeasy.validator.nutritionistValidator.NutritionistValidator;

@Controller
@RequestMapping("/nutritionistController")
public class NutritionistIdController {

	@Autowired
	NutritionistService nutritionistService;
	
	@Autowired
	NutritionistCategoryService nutritionistCategoryService;
	
	// 查詢全部營養師
	@GetMapping("/getAllNutritionists")
	public String DisplayNutritionist (Model model) {
		model.addAttribute("nutritionists",nutritionistService.findAllByNutritionistId());
		return "nutritionist/getAllNutritionists";
	}
	
	// 查詢單營養師
	@GetMapping(value="nutritionist/{nutritionistId}")
	public String getOneNutritionistById(@PathVariable("nutritionistId") Integer nutritionistId,Model model) {
		NutritionistBean nutritionistBean=nutritionistService.findByNutritionistId(nutritionistId);
		model.addAttribute("nutritionistBean",nutritionistBean);
		
		
		return "nutritionist/nutritionistIndex";
	}
	
	
	
	// 新增營養師，先送一個空白表單，並給予初值
	@GetMapping(value = "/addNutritionist")
	public String emptyNutritionist(Model model) {
		NutritionistBean nutritionistBean = new NutritionistBean();
		// 預設表單資料
		nutritionistBean.setNutritionistName("五公斤肥貓");
		nutritionistBean.setNutritionistGender("F");
		nutritionistBean.setNutritionistDegree("肥貓醫學大學保健營養學系");
		nutritionistBean.setNutritionistEmail("fatcat05@gmail.com");
		model.addAttribute("nutritionistBean", nutritionistBean);

		return "/nutritionist/addNutritionists";
	}
	
	// 新增營養師
	@PostMapping(value = "/addNutritionist")
	public String addNutritionist(@ModelAttribute("nutritionistBean") NutritionistBean nutritionistBean,BindingResult result,Model model,
			HttpServletRequest request) {
		
		NutritionistValidator validator=new NutritionistValidator();
		validator.validate(nutritionistBean, result);
		if(result.hasErrors()) {
			return "redirect:/nutritionist/addNutritionist";
		}
		
		// 營養師創建時間
		long miliseconds = System.currentTimeMillis();
        Date Date = new Date(miliseconds);
		System.out.println(Date);
		nutritionistBean.setNutritionistDate(Date);
		
		return "redirect:/nutritionist/getAllNutritionists";
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
