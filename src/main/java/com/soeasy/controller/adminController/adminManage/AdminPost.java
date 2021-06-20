package com.soeasy.controller.adminController.adminManage;

import java.sql.Blob;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.PostBean;
import com.soeasy.model.PostCategoryBean;
import com.soeasy.service.postService.PostCategoryService;
import com.soeasy.service.postService.PostService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.postValidator.PostBeanValidator;

@Controller
@RequestMapping("/admin/adminManage")
public class AdminPost {

	@Autowired
	PostService postService;

	@Autowired
	PostCategoryService postCategoryService;

	@Autowired
	ServletContext context;

//	// 文章
//	@GetMapping({ "/adminPost" })
//	public String admin() {
//		return "/admin/adminPost";
//	}

	// 查詢全部文章
	@GetMapping({ "/adminPost" })
	public String getAllPostById(Model model) {
		List<PostBean> postBean = postService.findAllByPostId();
		model.addAttribute("postList", postBean);
		return "admin/adminPost";
	}

	// 修改文章
	// 帶出修改前單一表單
	@GetMapping(value = "/adminPost/adminPostUpdate")
	public String showOneMap(@PathVariable("postId") Integer postId, Model model) {
		PostBean postBean = postService.findByPostId(postId);
		model.addAttribute("postBean", postBean);
//				return "sportMap/updateSportMap"; //帶出修改資料
		return "admin/adminPostUpdate"; // 查詢單一頁面
	}

	// 修改文章，將瀏覽器送來修改過的資料時，由本方法負責檢核，若無誤則寫入資料庫
	@PostMapping("/adminPost/adminPostUpdate/{postId}")
	public String updatePost(@ModelAttribute("postBean") PostBean postBean, BindingResult result, Model model,
			@PathVariable Integer postId, HttpServletRequest request) {
//						
		// 檢驗欄位內容
		PostBeanValidator validator = new PostBeanValidator();
		validator.validate(postBean, result);
		if (result.hasErrors()) {
			return "admin/adminPostUpdate";
		}

		// 取得addPost.jsp所送來的圖片資訊
		MultipartFile postImg = postBean.getPostMultiImg();

		// 取得圖片檔案名稱
		String originalFilename = postImg.getOriginalFilename();

		// 假如圖片是空字串或空值originalFilename等於預設圖片
		if (originalFilename == "") {
			originalFilename = "NoPictUploaded.jpg";
		}

		// 取得副檔名
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));

		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postBean.setPostImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		try {
			postService.updatePost(postBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
//					result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
			return "admin/adminPostUpdate";

		}

		// 跳轉至查詢所有文章頁面(送getAllPost請求)
		return "redirect:/admin/adminManage/adminPost";
	}

	// 刪除文章

}
