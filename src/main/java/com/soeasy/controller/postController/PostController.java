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
import com.soeasy.service.postService.PostCategoryService;
import com.soeasy.service.postService.PostService;
import com.soeasy.util.GlobalService;
import com.soeasy.validator.postValidator.PostBeanValidator;

@Controller
@RequestMapping("/PostController")
@SessionAttributes({"customerSignInSuccess"}) 
public class PostController {

	@Autowired
	PostService postService;

	@Autowired
	PostCategoryService postCategoryService;

	@Autowired
	ServletContext context;

	// 查詢單一文章By ID
	@GetMapping(value = "/post/{postId}")
	public String getOnePostById(@PathVariable("postId") Integer postId, Model model) {
		PostBean postBean = postService.findByPostId(postId);

		model.addAttribute("postBean", postBean);

		System.out.println("postBean=" + postBean);

		return "post/post";
	}

	// 查詢全部文章
	@GetMapping("/getAllPost")
	public String getAllPostById(Model model) {
		List<PostBean> postBean = postService.findAllByPostId();
		model.addAttribute("postList", postBean);
		return "post/postByCategory";
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
		System.out.println("postBean="+postBean);
		if (postBean != null) {
			Blob blob = postBean.getPostImg();
			System.out.println("blob="+blob);
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
					System.out.println("len="+len);
					System.out.println("media="+media);
				} catch (SQLException e) {
					throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
				System.out.println("blob=null ,media="+media);
				System.out.println("blob=null ,filename="+filename);
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
			System.out.println("postBean=null ,media="+media);
			System.out.println("postBean=null ,filename="+filename);
		}
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
		System.out.println("responseEntity="+responseEntity);
		return responseEntity;
	}

	// 方法toByteArray
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		System.out.println("realPath="+realPath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			System.out.println("file="+file);
			System.out.println("size="+size);
			System.out.println("byte[] b ="+b);
			System.out.println("fis="+fis);
			fis.read(b);
			System.out.println("fis.read(b)="+fis.read(b));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	// 新增文章，先送一個空白表單，並給予初值
	@GetMapping(value = "/addPost")
	public String showEmptyForm(Model model) {
		PostBean postBean = new PostBean();
		// 預設表單資料
//		postBean.setPostCategoryId(1);
		postBean.setPostTitle("減肥餐也可以很豪華");
		postBean.setPostContent("我是個從國中開始減肥到大學的小女子 \r\n" + "減肥的坎坷路大概也鏟了21公斤的肉 \r\n" + "今天想跟大家分享的是我自己煮的減肥餐 \r\n" + "\r\n"
				+ "這大概是其中的一小部分 \r\n" + "如果大家很興趣的話我也很樂意分享我的食譜 \r\n" + "也希望減肥的大家都能成功 \r\n" + "減肥之路有你 有我（淚～ \r\n" + "\r\n"
				+ "歪個樓 \r\n" + "最近想在家專研高蛋白甜點");
		model.addAttribute("postBean", postBean);

//		System.out.println(postBean);
//		System.out.println("PostController");

		return "post/addPost";

	}

	// 新增文章
	@PostMapping(value = "/addPost")
	public String addPost(@ModelAttribute("postBean") PostBean postBean, BindingResult result, Model model,
			HttpServletRequest request) {

		// 檢測不正當欄位並回傳提示訊息
		PostBeanValidator validator = new PostBeanValidator();
		validator.validate(postBean, result);

		System.out.println("result=" + result);
		System.out.println("postBean=" + postBean);

		if (result.hasErrors()) {
			return "post/addPost";
		}

		// 取得addPost.jsp所送來的圖片資訊
		MultipartFile postImg = postBean.getPostMultiImg();
//		System.out.println("postBean=" + postBean);

		System.out.println("postImg=" + postBean.getPostMultiImg());

		// 取得圖片檔案名稱
		String originalFilename = postImg.getOriginalFilename();
		System.out.println(postImg.getOriginalFilename());

		// 假如圖片是空字串或空值originalFilename等於預設圖片
		if (originalFilename == "") {
			originalFilename = "NoPictUploaded.jpg";
			System.out.println(originalFilename);
		}

		// 取得副檔名
		String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
		System.out.println(ext);

		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postBean.setPostImg(blob);
				System.out.println("postBean=" + postBean);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		// 會員ID
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}
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

		try {
			postService.addPost(postBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
//			result.rejectValue("sportMapName", "", "地點已存在，請重新輸入");
			return "post/addPost";

		}
		// 跳轉至查詢所有文章頁面(送getAllPost請求)
//		return "post/postByCategory";
		return "redirect:/PostController/getAllPost";
		// 跳轉至文章首頁
//		return "redirect:/postIndex";
//
	}

	// 產生下拉式選單
	@ModelAttribute
	public void commonCategory(Model model) {
		List<PostCategoryBean> postCategoryBeanList = postCategoryService.getAllPostCategorys();
		model.addAttribute("postCategoryBeanList", postCategoryBeanList);
	}
}
