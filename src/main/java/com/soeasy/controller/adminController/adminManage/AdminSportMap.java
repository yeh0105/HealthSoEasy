package com.soeasy.controller.adminController.adminManage;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.soeasy.model.SportCategoryBean;
import com.soeasy.model.SportMapBean;
import com.soeasy.service.sportmapService.SportCategoryService;
import com.soeasy.service.sportmapService.SportMapService;
import com.soeasy.validator.sportMapValidator.SportMapBeanValidator;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminSportMap {
	
	@Autowired
	SportMapService sportMapService;
	
	@Autowired
	SportCategoryService sportCategoryService;
	
	//後台地圖首頁(換成顯示所有地圖)
//	@GetMapping("/adminSportMap")
//	public String adminSportMapIndex() {
//		return "/admin/adminSportMap/adminSportMap";
//	}
	
	//顯示所有地圖(後台首頁)
	@GetMapping("/adminSportMap")
		public String list(Model model) {
			model.addAttribute("sportMaps",sportMapService.getAllSportMaps());
			return "admin/adminSportMap/adminSportMap";
		
		}
	
	//Ajax顯示所有地圖(未用到)
	@GetMapping(value="/getAllSportMaps.json",produces={ "application/json; charset=UTF-8" })
	public@ResponseBody Map<String,Object> getAllSportMaps(){		
			Map<String,Object> map = new HashMap<>();
			List<SportMapBean> list = sportMapService.getAllSportMaps();
			map.put("list", list);
			
			return map;
		
	}
	
	//帶出地圖修改前單一表單
	@GetMapping(value="/adminSportMap/up/{sportMapId}")
	public String showOneMap(@PathVariable("sportMapId") Integer sportMapId,Model model) {
	SportMapBean sportMapBean = sportMapService.get(sportMapId);			
	model.addAttribute("sportMapBean",sportMapBean);
	return "admin/adminSportMap/adminUpdateSportMap"; //帶出修改資料
		    
	}
	
	
	//修改運動地點，將瀏覽器送來修改過的資料時，由本方法負責檢核，若無誤則寫入資料庫
	@PostMapping("/adminSportMap/up/{sportMapId}")
	public String modify(
	@ModelAttribute("sportMapBean")SportMapBean sportMapBean,
	BindingResult result,Model model,@PathVariable Integer sportMapId,
	HttpServletRequest request) {
						
	//檢驗欄位內容
	SportMapBeanValidator validator = new SportMapBeanValidator();
	validator.validate(sportMapBean,result);
	if(result.hasErrors()) {
					
	return "admin/adminSportMap/adminUpdateSportMap";	

	}	
				
	//找到對應的Category物件
	SportCategoryBean sportCategoryBean = sportCategoryService.getSportCategory(sportMapBean.getSportCategoryBean().getSportCategoryId());
	sportMapBean.setSportCategoryBean(sportCategoryBean);
				
	sportMapService.update(sportMapBean);

	//跳轉至後台所有運動地點頁面
	return "redirect:/admin/adminManage/adminSportMap"; 
	}
	
	
	
	//新增運動地點，先送一個空白表單(後台)
	@GetMapping(value = "/adminSportMap/add")
	public String showEmptyForm(Model model) {
	SportMapBean sportMapBean = new SportMapBean();
	//預設表單資料
	sportMapBean.setSportMapName("松山運動中心");
	sportMapBean.setSportMapAddress("105台北市松山區敦化北路1號");
	sportMapBean.setSportMapInfo("為臺北市第9座啟用的運動中心，自98年11月1日開幕。前身為聽障奧運的比賽場地。中心規劃有體適能健身中心、舞蹈教室，還有兩座游泳池，一座可供民眾休閒使用，另一座是台北市唯一可以作跳水、水中芭蕾訓練使用的游泳池，也可以從事室內水 上課程，如：獨木舟等。");
	sportMapBean.setSportMapScore(5);
	sportMapBean.setSportMapCategory(1);
	sportMapBean.setSportMapMap("<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.571645929474!2d121.54804231500653!3d25.04860698396554!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abc2e4069759%3A0x1ddb2333e456f746!2zMTA15Y-w5YyX5biC5p2-5bGx5Y2A5pWm5YyW5YyX6LevMeiZnw!5e0!3m2!1szh-TW!2stw!4v1624341149696!5m2!1szh-TW!2stw\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>");
	model.addAttribute("sportMapBean", sportMapBean);
			
	return "admin/adminSportMap/adminAddSportMap";	
	}
		
		
	//新增運動地點
	@PostMapping(value = "/adminSportMap/add")
	public String add(@ModelAttribute("sportMapBean") 
	SportMapBean sportMapBean,BindingResult result,
	Model model,HttpServletRequest request){
	System.out.println("test123123");
	//檢驗欄位內容
	SportMapBeanValidator validator = new SportMapBeanValidator();
	validator.validate(sportMapBean,result);
	if(result.hasErrors()) {
				
		return "admin/adminSportMap/adminAddSportMap";	

		}		
	// 找出對應的SportCategory物件
	SportCategoryBean sportCategoryBean =sportCategoryService.getSportCategory(sportMapBean.getSportCategoryBean().getSportCategoryId());
	sportMapBean.setSportCategoryBean(sportCategoryBean);
			
		try {
			sportMapService.save(sportMapBean);
				
			}catch (org.hibernate.exception.ConstraintViolationException e) {
			result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
			return "admin/adminSportMap/adminAddSportMap";	
				
			}
			//跳轉至後台所有運動地點頁面
			return "redirect:/admin/adminManage/adminSportMap"; 
			
		}
		
	//產生下拉式選單(新增&修改用)
	@ModelAttribute
	public void commonCategory(Model model) {
	List<SportCategoryBean> sportCategoryBeanList = sportCategoryService.getAllSportCategorys();
	model.addAttribute("sportCategoryBeanList", sportCategoryBeanList);
		}
	
		
	//刪除單筆運動地點
	@PostMapping("/adminSportMap/del/{sportMapId}")
	public String delete(@PathVariable("sportMapId") Integer sportMapId) {
	sportMapService.delete(sportMapId);
			
	//跳轉至後台所有運動地點頁面
	return "redirect:/admin/adminManage/adminSportMap"; 
		}
		
		
		

	

}
