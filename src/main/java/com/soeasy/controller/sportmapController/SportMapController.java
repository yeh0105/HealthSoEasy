package com.soeasy.controller.sportmapController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.soeasy.model.SportCategoryBean;
import com.soeasy.model.SportMapBean;
import com.soeasy.service.sportmapService.SportCategoryService;
import com.soeasy.service.sportmapService.SportMapService;
import com.soeasy.validator.sportMapValidator.SportMapBeanValidator;

@Controller
@RequestMapping("/sportMapController")
public class SportMapController {

	@Autowired
	SportMapService sportMapService;	
	
	@Autowired
	SportCategoryService sportCategoryService;
	

	//從SoEasy首頁跳至地圖首頁
	@GetMapping("/showSportMapIndex")
	public String ShowSportMapIndex(Model model) {
		
		return "sportMap/sportMapIndex";
	}
	
	//查詢單一運動地點,
	@GetMapping(value="/sportMap/{sportMapId}")
	public String showOneMap(@PathVariable("sportMapId") Integer sportMapId,Model model) {
//		System.out.println("test get oneeeeeee");
//		System.out.println("sportMapId="+sportMapId);
		SportMapBean sportMapBean = sportMapService.get(sportMapId);
//		System.out.println("test get endddd");
		
		model.addAttribute("sportMapBean",sportMapBean);
		
		System.out.println("sportMapBean="+sportMapBean);
		
		return "sportMap/updateSportMap";
	}
	
	
	
	//查詢所有運動地點
	@GetMapping("/displaySportMaps")
	public String DisplaySportMaps(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {

		if (pageNo == null) {
			pageNo = 1;
			}
		System.out.println("getAll");

		Map<Integer,SportMapBean> sportsMap = sportMapService.getPageSportMaps(pageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("totalPages", sportMapService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("sportMaps_DPP", sportsMap);

		
		return "sportMap/getAllSportMaps";
	}
	
	//新增運動地點，先送一個空白表單
	@GetMapping(value = "/add")
	public String showEmptyForm(Model model) {
		SportMapBean sportMapBean = new SportMapBean();
		//預設表單資料
		sportMapBean.setSportMapName("中正運動中心");
		sportMapBean.setSportMapAddress("100台北市中正區信義路一段1號");
		sportMapBean.setSportMapInfo("位於中正區的運動中心");
		sportMapBean.setSportMapMap("<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.8743211776746!2d121.51719641500641!3d25.038338833970293!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442a975c3b64793%3A0xb32fd7574524c01!2z5Lit5q2j6YGL5YuV5Lit5b-D!5e0!3m2!1szh-TW!2stw!4v1623571445899!5m2!1szh-TW!2stw\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>");
		model.addAttribute("sportMapBean", sportMapBean);
		
		return "sportMap/addSportMap";	
		
	}
	//新增運動地點
	@PostMapping(value = "/add")
	public String add(@ModelAttribute("sportMapBean") 
	SportMapBean sportMapBean,BindingResult result,
	Model model,HttpServletRequest request){
		System.out.println("test123123");
		//檢驗欄位內容
		SportMapBeanValidator validator = new SportMapBeanValidator();
		validator.validate(sportMapBean,result);
		if(result.hasErrors()) {
			
//			return "sportMap/addSportMap";	 
			
			return "redirect:/sportMapController/add"; 
		}
		
		// 找出對應的SportCategory物件
		SportCategoryBean sportCategoryBean =sportCategoryService.getSportCategory(sportMapBean.getSportCategoryBean().getSportCategoryId());
		sportMapBean.setSportCategoryBean(sportCategoryBean);
		
		try {
			sportMapService.save(sportMapBean);
			
		}catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
			return "sportMap/addSportMap";	 

			
		}
		//跳轉至查詢所有運動地點頁面(送displaySportMaps請求)
		return "redirect:/sportMapController/displaySportMaps"; 
		
	}
	
	//產生下拉式選單
	@ModelAttribute
	public void commonCategory(Model model) {
		List<SportCategoryBean> sportCategoryBeanList = sportCategoryService.getAllSportCategorys();
		model.addAttribute("sportCategoryBeanList", sportCategoryBeanList);
	}
		
		
		
	
	
	
	
	
}
