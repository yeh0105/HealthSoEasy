package com.soeasy.controller.postController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.PostBean;
import com.soeasy.model.PostCategoryBean;
import com.soeasy.model.PostUpdateBean;
import com.soeasy.service.postService.PostCategoryService;
import com.soeasy.service.postService.PostService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.postValidator.PostBeanValidator;
import com.soeasy.validator.postValidator.PostUpdateBeanValidator;

@Controller
@RequestMapping("/PostNeedLoginController")
@SessionAttributes({ "customerSignInSuccess" })
public class PostNeedLoginController {

	@Autowired
	PostService postService;

	@Autowired
	PostCategoryService postCategoryService;

	@Autowired
	ServletContext context;

	// 修改文章
	@GetMapping(value = "/updatePost/{postId}")
	public String showOnePost(@PathVariable("postId") Integer postId, Model model) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		PostBean postBean = postService.findByPostId(postId);

		PostUpdateBean postUpdateBean = new PostUpdateBean();

		postUpdateBean.setPostTitle(postBean.getPostTitle());
		postUpdateBean.setPostCategory(postBean.getPostCategory());
		postUpdateBean.setPostContent(postBean.getPostContent());
		postUpdateBean.setPostImg(postBean.getPostImg());
		postUpdateBean.setPostStatus(postBean.getPostStatus());
		postUpdateBean.setPostCategoryBean(postBean.getPostCategoryBean());

		model.addAttribute("postBean", postUpdateBean);

		return "post/updatePost";
	}

	// 修改文章，將瀏覽器送來修改過的資料時，由本方法負責檢核，若無誤則寫入資料庫
	@PostMapping("/updatePost/{postId}")
	public String updatePost(@ModelAttribute("postBean") PostUpdateBean postUpdateBean, BindingResult result,
			Model model, @PathVariable Integer postId, HttpServletRequest request) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		// 取得原始的PostBean物件
		PostBean postOrginalBean = postService.findByPostId(postId);

		// 取得PostUpdateBean的PostCategoryBean物件
		PostCategoryBean updatePostCategoryBean = postCategoryService
				.getPostCategory(postUpdateBean.getPostCategoryBean().getPostCategoryId());

		// 取得adminPostUpdate.jsp所送來的圖片資訊
		MultipartFile postImg = postUpdateBean.getPostMultiImg();

		// 檢驗欄位內容
		PostUpdateBeanValidator validator = new PostUpdateBeanValidator();
		validator.validate(postUpdateBean, result);

		if (result.hasErrors()) {
			return "post/updatePost";
		}

		// 將postUpdateBean的資料修改進postOrginalBean

		// 圖片傳入資料庫
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postOrginalBean.setPostImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		} else {
			postOrginalBean.setPostImg(postOrginalBean.getPostImg());
		}

		postOrginalBean.setPostTitle(postUpdateBean.getPostTitle());

		postOrginalBean.setPostCategory(updatePostCategoryBean.getPostCategoryName());

		postOrginalBean.setPostContent(postUpdateBean.getPostContent());

		postOrginalBean.setPostStatus(postUpdateBean.getPostStatus());

		postOrginalBean.setPostCategoryBean(updatePostCategoryBean);

		try {
			postService.updatePost(postOrginalBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
			return "post/updatePost";
		}

		// 跳轉至查詢所有文章頁面(送getAllPosts請求)
		return "redirect:/PostController/getAllPost.json";
	}

	// 將單筆文章的狀態更改為2(禁止)
	@PostMapping("/deletePost/{postId}")
	public String changeStatus(@ModelAttribute("postBean") PostBean postChangeBean, BindingResult result, Model model,
			@PathVariable Integer postId, HttpServletRequest request) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		System.err.println("進入刪除");

		// 取得原始的PostBean物件
		postChangeBean = postService.findByPostId(postId);

		postChangeBean.setPostStatus(2);

		// 修改Post
		postService.updatePost(postChangeBean);

		System.err.println("刪除了!!!");

		// 跳轉至post首頁(送postIndex請求)
		return "redirect:/postIndex";
	}

	// 查詢單一文章By ID
	@GetMapping(value = "/getPost/{postId}")
	public String getOnePostById(@PathVariable("postId") Integer postId, Model model) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		// 取得文章物件
		PostBean postBean = postService.findByPostId(postId);

		// 假如文章狀態是2(禁止)就導到deletePost.jsp
		// 取得文章狀態
		if (postBean.getPostStatus() == 2) {
			return "post/deletePost";
		}

		// 取得文章內容
		String postContent = postBean.getPostContent();
//		System.err.println("postContent="+postContent+"----------------------------------------------------------------");

		// 將換行(\n)換成<br>
		String newtContent = postContent.replaceAll("\n", "<br>");
//		System.err.println("newtContent="+newtContent+"----------------------------------------------------------------");

		// 將更改過的內容塞入postBean
		postBean.setPostContent(newtContent);

		model.addAttribute("getOnePostBean", postBean);

//		System.err.println("postBean="+postBean);

		return "post/getOnePost";
	}

	// 新增文章，先送一個空白表單，並給予初值
	@GetMapping(value = "/addPost")
	public String showEmptyForm(Model model) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		PostBean postBean = new PostBean();
		// 預設表單資料
		postBean.setPostTitle("減肥餐也可以很豪華");
		postBean.setPostContent("我是個從國中開始減肥到大學的小女子 \r\n" + "減肥的坎坷路大概也鏟了21公斤的肉 \r\n" + "今天想跟大家分享的是我自己煮的減肥餐 \r\n" + "\r\n"
				+ "這大概是其中的一小部分 \r\n" + "如果大家很興趣的話我也很樂意分享我的食譜 \r\n" + "也希望減肥的大家都能成功 \r\n" + "減肥之路有你 有我（淚～ \r\n" + "\r\n"
				+ "歪個樓 \r\n" + "最近想在家專研高蛋白甜點");
		model.addAttribute("postBean", postBean);

		return "post/addPost";

	}

	// 新增文章
	@PostMapping(value = "/addPost")
	public String addPost(@ModelAttribute("postBean") PostBean postBean, BindingResult result, Model model,
			HttpServletRequest request) {

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		// 檢測不正當欄位並回傳提示訊息
		PostBeanValidator validator = new PostBeanValidator();
		validator.validate(postBean, result);

		if (result.hasErrors()) {
			return "post/addPost";
		}

		// 取得addPost.jsp所送來的圖片資訊
		MultipartFile postImg = postBean.getPostMultiImg();

		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postBean.setPostImg(blob);
//				System.out.println("postBean=" + postBean);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		// 會員ID
		postBean.setCustomerBean(customerBean);

		// 文章創建時間
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		postBean.setPostUploadTime(registerTime);

		// 文章狀態:正常
		postBean.setPostStatus(GlobalService.POST_STATUS_NORMAL);

		// 初始文章收藏數為0
		postBean.setPostLike(0);

		// 找出對應的PostCategory物件
		PostCategoryBean postCategoryBean = postCategoryService
				.getPostCategory(postBean.getPostCategoryBean().getPostCategoryId());
		postBean.setPostCategoryBean(postCategoryBean);

		postBean.setPostCategory(postCategoryBean.getPostCategoryName());

		try {
			postService.addPost(postBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
//			result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
			return "post/addPost";

		}
		// 跳轉至查詢所有文章頁面(送getAllPost請求)
		return "redirect:/PostController/getAllPost.json";

	}

	// 讀圖轉成位元組陣列
	@RequestMapping(value = "/getPicture/{postId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture( // ResponseEntity代表整個回應(本體,狀態列,狀態標頭)
			HttpServletResponse resp, @PathVariable Integer postId) {
		String filePath = "/image/NoImage.jpg";

		byte[] media = null;
		String filename = "";
		int len = 0;
		PostBean postBean = postService.findByPostId(postId);
//			System.out.println("postBean="+postBean);
		if (postBean != null) {
			Blob blob = postBean.getPostImg();
//				System.out.println("blob="+blob);
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
//						System.out.println("len="+len);
//						System.out.println("media="+media);
				} catch (SQLException e) {
					throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
//					System.out.println("blob=null ,media="+media);
//					System.out.println("blob=null ,filename="+filename);
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
//				System.out.println("postBean=null ,media="+media);
//				System.out.println("postBean=null ,filename="+filename);
		}
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
//			System.out.println("responseEntity="+responseEntity);
		return responseEntity;
	}

	// 方法toByteArray
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
//			System.out.println("realPath="+realPath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
//				System.out.println("file="+file);
//				System.out.println("size="+size);
//				System.out.println("byte[] b ="+b);
//				System.out.println("fis="+fis);
			fis.read(b);
//				System.out.println("fis.read(b)="+fis.read(b));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	// 產生下拉式選單
	@ModelAttribute
	public void commonCategory(Model model) {
		List<PostCategoryBean> postCategoryBeanList = postCategoryService.getAllPostCategorys();
		model.addAttribute("postCategoryBeanList", postCategoryBeanList);
	}
}
