package com.soeasy.controller.postController;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.soeasy.model.PostBean;
import com.soeasy.service.postService.PostService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.postValidator.PostBeanValidator;

@Controller
@RequestMapping("/PostController")
public class PostController {

	@Autowired
	PostService postService;

	// 新增文章，先送一個空白表單，並給予初值
	@GetMapping(value = "/addPost")
	public String showEmptyForm(Model model) {
		PostBean postBean = new PostBean();
		// 預設表單資料
		postBean.setPostTitle("減肥餐也可以很豪華");
		postBean.setPostCategory("減肥");
		postBean.setPostContent("我是個從國中開始減肥到大學的小女子");
		model.addAttribute("postBean", postBean);
		
		System.out.println(postBean);
		
		System.out.println("PostController");

		return "post/addPost";

	}

	// 新增文章
	@PostMapping(value = "/addPost")
	public String addPost(@ModelAttribute("postBean") PostBean postBean, BindingResult result, Model model,
			HttpServletRequest request) {
//
		// 檢測不正當欄位並回傳提示訊息
		PostBeanValidator validator = new PostBeanValidator();
		validator.validate(postBean, result);
		if (result.hasErrors()) {
			return "redirect:/PostController/addPost";
		}
//
		// 文章創建時間
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		postBean.setPostUploadTime(registerTime);

		// 文章狀態:正常
		postBean.setPostStatus(GlobalService.POST_STATUS_NORMAL);

		// 初始文章收藏數為0
		postBean.setPostLike(0);
//
////			// 找出對應的SportCategory物件
////			SportCategoryBean sportCategoryBean =sportCategoryService.getSportCategory(sportMapBean.getSportCategoryBean().getSportCategoryId());
////			sportMapBean.setSportCategoryBean(sportCategoryBean);
////			
////			try {
////				sportMapService.save(sportMapBean);
////				
////			}catch (org.hibernate.exception.ConstraintViolationException e) {
////				result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
////				return "sportMap/addSportMap";	 
////
////				
////			}
		// 跳轉至查詢所有文章頁面(送displaySportMaps請求)
		return "redirect:/post/postByCategory";
//
	}
}
