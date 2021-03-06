package com.soeasy.controller.postController;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
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
import com.soeasy.model.FavoriteBean;
import com.soeasy.model.PostBean;
import com.soeasy.model.PostCategoryBean;
import com.soeasy.model.PostUpdateBean;
import com.soeasy.model.ReplyBean;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.favoriteService.FavoriteService;
import com.soeasy.service.postService.PostCategoryService;
import com.soeasy.service.postService.PostService;
import com.soeasy.service.replyService.ReplyService;
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
	CustomerService customerService;

	@Autowired
	ReplyService replyService;

	@Autowired
	FavoriteService favoriteService;

	@Autowired
	ServletContext context;

	// ????????????
	@GetMapping(value = "/updatePost/{postId}")
	public String showOnePost(@PathVariable("postId") Integer postId, Model model) {

		// ????????????
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

	// ???????????????????????????????????????????????????????????????????????????????????????????????????????????????
	@PostMapping("/updatePost/{postId}")
	public String updatePost(@ModelAttribute("postBean") PostUpdateBean postUpdateBean, BindingResult result,
			Model model, @PathVariable Integer postId, HttpServletRequest request) {

//		System.err.println("????????????");
		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
//			System.err.println("????????????1");
			return "redirect:/customerController/customerSignIn";
		}

		// ???????????????PostBean??????
		PostBean postOrginalBean = postService.findByPostId(postId);

		// ??????PostUpdateBean???PostCategoryBean??????
		PostCategoryBean updatePostCategoryBean = postCategoryService
				.getPostCategory(postUpdateBean.getPostCategoryBean().getPostCategoryId());

		// ??????adminPostUpdate.jsp????????????????????????
		MultipartFile postImg = postUpdateBean.getPostMultiImg();

		// ??????????????????
		PostUpdateBeanValidator validator = new PostUpdateBeanValidator();
		validator.validate(postUpdateBean, result);

		if (result.hasErrors()) {
//			System.err.println("????????????2");
			return "post/updatePost";
		}

		// ???postUpdateBean??????????????????postOrginalBean

		// ?????????????????????
		// ??????Blob??????????????? Hibernate ???????????????
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postOrginalBean.setPostImg(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
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
//			System.err.println("????????????3");
		} catch (org.hibernate.exception.ConstraintViolationException e) {
//			System.err.println("????????????4");
			return "post/updatePost";
		}

//		System.err.println("????????????5");

		// ?????????????????????????????????
//		return "/post/getOnePost";
		return "redirect:/PostNeedLoginController/getPost/{postId}";
	}

	// ?????????????????????????????????2(??????)
	@PostMapping("/deletePost/{postId}")
	public String changeStatus(@ModelAttribute("postBean") PostBean postChangeBean, BindingResult result, Model model,
			@PathVariable Integer postId, HttpServletRequest request) {

		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

//		System.err.println("????????????");

		// ???????????????PostBean??????
		postChangeBean = postService.findByPostId(postId);

		postChangeBean.setPostStatus(GlobalService.POST_STATUS_BANNED);

		// ??????Post
		postService.updatePost(postChangeBean);

//		System.err.println("?????????!!!");

		// ?????????post??????(???postIndex??????)
		return "redirect:/postIndex";
	}

	// ??????????????????By ID
	@GetMapping(value = "/getPost/{postId}")
	public String getOnePostById(@PathVariable("postId") Integer postId, Model model) {

		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		// ??????????????????
		PostBean postBean = postService.findByPostId(postId);
		PostBean postChangeBean = new PostBean();

		// ?????????????????????2(??????)?????????deletePost.jsp
		// ??????????????????
		if (postBean.getPostStatus() == GlobalService.POST_STATUS_BANNED) {
			return "post/deletePost";
		}

		String post = "post";

		// 1.?????????????????????????????????step2????????????FavoriteStatus=false
		if (customerBean != null) {
			CustomerBean originalCustomer = customerService.findByCustomerId(customerBean.getCustomerId());
			FavoriteBean checkFavoriteBean = favoriteService.checkFavoriteBean(postId, post, originalCustomer);

			System.out.println("originalCustomer=" + originalCustomer);
			System.out.println("postId=" + postId);
			System.out.println("post=" + post);

			// 2.??????????????????(???CustomerId???FavoriteCategory???FavoriteItem????????????)
			if (checkFavoriteBean != null) {
				// 3.??????FavoriteStatus=True;?????????FavoriteStatus=False
				// 4.???FavoriteStatus????????????model.addAttribute
				postBean.setFavoriteStatus(true);
			}
//	    			postBean.setFavoriteStatus(false);

		}

		// ??????????????????
		String postContent = postBean.getPostContent();

		// ?????????(\n)??????<br>
		String newContent = postContent.replaceAll("\n", "<br>");

		// ???????????????????????????postBean
		
		postChangeBean=postBean;
		postChangeBean.setPostContent(newContent);

		model.addAttribute("getOnePostBean", postChangeBean);

		// -------------------------------------------------------------------------------------

		// ????????????
		// ??????????????????
		ReplyBean replyBean = new ReplyBean();

		replyBean.setReplyContent("????????????!?????????!");

		model.addAttribute("replyBean", replyBean);

		return "post/getOnePost";
	}

	// ????????????
	@PostMapping(value = "/getPost/{postId}")
	public String addReply(@ModelAttribute("replyBean") @PathVariable Integer postId, ReplyBean replyBean, Model model,
			BindingResult result, HttpServletRequest request) {

		System.err.println("??????addReply");

		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}
//			System.err.println("customerBean=" + customerBean);

		// ??????ID
		replyBean.setCustomerBean(customerBean);

		// ??????????????????
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		replyBean.setReplyTime(registerTime);

		// ????????????:??????
		replyBean.setReplyStatus(GlobalService.REPLY_STATUS_NORMAL);

		// ????????????????????????0
		replyBean.setReplyLike(0);

		// ??????????????? id

		System.err.println("postId=" + postId);

		// ??????????????????
		PostBean postBean = postService.findByPostId(postId);
		replyBean.setPostBean(postBean);

		// ??????????????????
		List<ReplyBean> list = replyService.findByPostBean(postBean);
		Integer floor = 1;

		Iterator it = list.iterator();

		while (it.hasNext()) {
			System.err.println(it.next());
			floor++;
		}

		System.err.println("floor=" + floor);

		replyBean.setReplyFloor(floor);

		try {
			replyService.addReply(replyBean);
		} catch (Exception e) {
			result.rejectValue("replyContent", "", "????????????????????????????????????..." + e.getMessage());
			return "post/getOnePost";

		}
		System.err.println("addReply");

		// ?????????????????????????????????
		return "redirect:/PostNeedLoginController/getPost/{postId}";

	}

	// ?????????????????????????????????????????????????????????
	@GetMapping(value = "/addPost")
	public String showEmptyForm(Model model) {

		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		PostBean postBean = new PostBean();
		// ??????????????????
		postBean.setPostTitle("???????????????????????????");
		postBean.setPostContent("??????????????????????????????????????????????????? \r\n" + "?????????????????????????????????21???????????? \r\n" + "?????????????????????????????????????????????????????? \r\n" + "\r\n"
				+ "????????????????????????????????? \r\n" + "???????????????????????????????????????????????????????????? \r\n" + "???????????????????????????????????? \r\n" + "?????????????????? ??????????????? \r\n" + "\r\n"
				+ "????????? \r\n" + "????????????????????????????????????");
		model.addAttribute("postBean", postBean);

		return "post/addPost";

	}

	// ????????????
	@PostMapping(value = "/addPost")
	public String addPost(@ModelAttribute("postBean") PostBean postBean, BindingResult result, Model model,
			HttpServletRequest request) {

		// ????????????
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		CustomerBean originalBean = customerService.findByCustomerId(customerBean.getCustomerId());

		// ??????????????????????????????????????????
		PostBeanValidator validator = new PostBeanValidator();
		validator.validate(postBean, result);

		if (result.hasErrors()) {
			return "post/addPost";
		}

		// ??????addPost.jsp????????????????????????
		MultipartFile postImg = postBean.getPostMultiImg();

		// ??????Blob??????????????? Hibernate ???????????????
		if (postImg != null && !postImg.isEmpty()) {
			try {
				byte[] b = postImg.getBytes();
				Blob blob = new SerialBlob(b);
				postBean.setPostImg(blob);
//				System.out.println("postBean=" + postBean);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("????????????????????????: " + e.getMessage());
			}
		}

		// ??????ID
		postBean.setCustomerBean(customerBean);

		// ??????????????????
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		postBean.setPostUploadTime(registerTime);

		// ??????????????????
		Date registerDate = new Date(System.currentTimeMillis());
		postBean.setPostUploadDate(registerDate);

		// ????????????:??????
		postBean.setPostStatus(GlobalService.POST_STATUS_NORMAL);

		// ????????????????????????0
		postBean.setPostLike(0);

		// ???????????????+10
		originalBean.setCustomerScore(originalBean.getCustomerScore() + 10);
		model.addAttribute("customerSignInSuccess", originalBean);

		// ???????????????PostCategory??????
		PostCategoryBean postCategoryBean = postCategoryService
				.getPostCategory(postBean.getPostCategoryBean().getPostCategoryId());
		postBean.setPostCategoryBean(postCategoryBean);

		postBean.setPostCategory(postCategoryBean.getPostCategoryName());

		try {
			postService.addPost(postBean);
			customerService.addCustomer(originalBean);
		} catch (org.hibernate.exception.ConstraintViolationException e) {
//			result.rejectValue("sportMapName", "", "?????????????????????????????????");
			return "post/addPost";

		}
		// ?????????????????????????????????(???getAllPost??????)
		return "redirect:/postByCategory";

	}

	// ???????????????????????????
	@RequestMapping(value = "/getPicture/{postId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture( // ResponseEntity??????????????????(??????,?????????,????????????)
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
					throw new RuntimeException("StudentController???getPicture()??????SQLException: " + e.getMessage());
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

	// ??????toByteArray
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

	// ?????????????????????
	@ModelAttribute
	public void commonCategory(Model model) {
		List<PostCategoryBean> postCategoryBeanList = postCategoryService.getAllPostCategorys();
		model.addAttribute("postCategoryBeanList", postCategoryBeanList);
//		System.err.println("postCategoryBeanList="+postCategoryBeanList);
	}
}
