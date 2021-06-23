package com.soeasy.controller.sportmapController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.constraints.PastOrPresent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	

	//查詢所有運動地點(前台)
	@GetMapping("/displaySportMaps")
	public String DisplaySportMaps(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "pageNo", required = false) Integer pageNo) {

		if (pageNo == null) {
			pageNo = 1;     //網址加?pageNo=測試
			}

	Map<Integer,SportMapBean> sportsMap = sportMapService.getPageSportMaps(pageNo);
	model.addAttribute("pageNo", String.valueOf(pageNo));
	model.addAttribute("totalPages", sportMapService.getTotalPages());
	// 將讀到的一頁資料放入request物件內，成為它的屬性物件
	model.addAttribute("sportMaps_DPP", sportsMap);
		
	return "sportMap/getAllSportMaps";
	}		
	
	//查詢單一地點(前台)
	@GetMapping(value="/sportMap/{sportMapId}")
	public String showOneMap(@PathVariable("sportMapId") Integer sportMapId,Model model) {
	SportMapBean sportMapBean = sportMapService.get(sportMapId);			
	model.addAttribute("sportMapBean",sportMapBean);
		return "sportMap/getOneSportMap"; //查詢單一頁面
		}
		
		
	//修改運動地點，將瀏覽器送來修改過的資料時，由本方法負責檢核，若無誤則寫入資料庫(未用到，寫在後台)
	@PostMapping("/sportMap/{sportMapId}")
	public String modify(
		@ModelAttribute("sportMapBean")SportMapBean sportMapBean,
		BindingResult result,Model model,@PathVariable Integer sportMapId,
		HttpServletRequest request) {
					
		//檢驗欄位內容
		SportMapBeanValidator validator = new SportMapBeanValidator();
		validator.validate(sportMapBean,result);
		if(result.hasErrors()) {
				
		return "sportMap/updateSportMap";	

		}	
			
		//找到對應的Category物件
		SportCategoryBean sportCategoryBean = sportCategoryService.getSportCategory(sportMapBean.getSportCategoryBean().getSportCategoryId());
		sportMapBean.setSportCategoryBean(sportCategoryBean);
						
		sportMapService.update(sportMapBean);
		return "redirect:/sportMapController/displaySportMaps"; 
		}
				
	
	//新增運動地點，先送一個空白表單(未用到，寫在後台)
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
	//新增運動地點(未用到，寫在後台)
	@PostMapping(value = "/add")
	public String add(@ModelAttribute("sportMapBean") 
	SportMapBean sportMapBean,BindingResult result,
	Model model,HttpServletRequest request){
		System.out.println("test123123");
		//檢驗欄位內容
		SportMapBeanValidator validator = new SportMapBeanValidator();
		validator.validate(sportMapBean,result);
		if(result.hasErrors()) {
			
			return "sportMap/addSportMap";	

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
	
	//產生下拉式選單(新增&修改用，寫在後台)
	@ModelAttribute
	public void commonCategory(Model model) {
		List<SportCategoryBean> sportCategoryBeanList = sportCategoryService.getAllSportCategorys();
		model.addAttribute("sportCategoryBeanList", sportCategoryBeanList);
	}		
		
	
	
	//刪除單筆運動地點(未用到，寫在後台)
	@PostMapping("/del/{sportMapId}")
	public String delete(@PathVariable("sportMapId") Integer sportMapId) {
		System.out.println("抓到了抓到了");
		sportMapService.delete(sportMapId);
		
		//跳轉至查詢所有運動地點頁面(送displaySportMaps請求)
		return "redirect:/sportMapController/displaySportMaps";
	}
	

	//查詢所有運動類別Ajax，搭配查詢所有運動地點Ajax(依分類拉出地點，未寫完)
	@GetMapping(value="/allSportCategory.json",produces= {"application/json; charset=UTF-8" })
	public @ResponseBody List<SportCategoryBean>getAllCategorys(){
		List<SportCategoryBean> sportCategorys = sportCategoryService.getAllSportCategorys();
		
		return sportCategorys;
	}
	
	//查詢所有運動地點Ajax，查詢所有運動類別Ajax(未寫完)
//	@GetMapping("/getSportMapsBySportCategory.json")
//	public @ResponseBody List<SportMapBean> getSportMapsBySportCategory(@RequestParam("sportCategoryId") Integer sportCategoryId){
//		List<SportMapBean> sportMapsList = sportMapService.getSportMapsBySportCategoryId(sportCategoryId);
//		
//		return sportMapsList;
//	}
	
	//查詢所有運動地點by分類(前台)
		@GetMapping("/displaySportMapsByCategoryId")
		public String DisplaySportMapsBySportCategoryId(Model model, HttpServletRequest request, HttpServletResponse response,
				@RequestParam(value = "pageNo", required = false) Integer pageNo,SportCategoryBean sportCategoryBean) {

			if (pageNo == null) {
				pageNo = 1;     //網址加?pageNo=測試
				}

		Map<Integer,SportMapBean> sportsMap = sportMapService.getPageSportMapsBySportCategoryId(sportCategoryBean,pageNo);
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("sportCategoryBean",String.valueOf(sportCategoryBean));
		model.addAttribute("totalPages", sportMapService.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		model.addAttribute("sportMaps_category", sportsMap);
			
		return "sportMap/getAllSportMapsByCategoryId";
		}		
	
	
	
	
	
}
