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
//		System.out.println("postBean="+postBean);
		if (postBean != null) {
			Blob blob = postBean.getPostImg();
//			System.out.println("blob="+blob);
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
//					System.out.println("len="+len);
//					System.out.println("media="+media);
				} catch (SQLException e) {
					throw new RuntimeException("StudentController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
//				System.out.println("blob=null ,media="+media);
//				System.out.println("blob=null ,filename="+filename);
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
//			System.out.println("postBean=null ,media="+media);
//			System.out.println("postBean=null ,filename="+filename);
		}
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
//		System.out.println("responseEntity="+responseEntity);
		return responseEntity;
	}

	// 方法toByteArray
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
//		System.out.println("realPath="+realPath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
//			System.out.println("file="+file);
//			System.out.println("size="+size);
//			System.out.println("byte[] b ="+b);
//			System.out.println("fis="+fis);
			fis.read(b);
//			System.out.println("fis.read(b)="+fis.read(b));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

}
