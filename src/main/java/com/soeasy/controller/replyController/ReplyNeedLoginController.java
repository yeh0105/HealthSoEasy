package com.soeasy.controller.replyController;

import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.PostBean;
import com.soeasy.model.ReplyBean;
import com.soeasy.service.replyService.ReplyService;
import com.soeasy.util.GlobalService;

@Controller
@RequestMapping("/ReplyNeedLoginController")
@SessionAttributes({ "customerSignInSuccess", "getOnePostBean" })
public class ReplyNeedLoginController {

	@Autowired
	ReplyService replyService;

	@Autowired
	ServletContext context;

	// 查詢的留言ByPostId
	@GetMapping(value = "/getAllReply.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ReplyBean> findByPostBean(
			@RequestParam(value = "postBean", required = false) PostBean postBean) {

		List<ReplyBean> list = replyService.findByPostBean(postBean);

		return list;
	}

	// 查詢Top3的留言ByPostId
	@GetMapping(value = "/getTop3Reply.json", produces = { "application/json; charset=UTF-8" })
	public @ResponseBody List<ReplyBean> findTop3ByPostBeanOrderByReplyLike(
			@RequestParam(value = "postBean", required = false) PostBean postBean) {

		List<ReplyBean> list = replyService.findTop3ByPostBeanOrderByReplyLikeDesc(postBean);

		return list;
	}

	// 新增留言，先送一個空白表單，並給予初值
//	@GetMapping(value = "/addReply",produces = { "application/json" })
//	public String showEmptyForm(Model model) {
//
//		// 登入攔截
//		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
//		if (customerBean == null) {
//			return "redirect:/customerController/customerSignIn";
//		}
//
//		ReplyBean replyBean = new ReplyBean();
//
//		// 預設表單資料
//		replyBean.setReplyContent("讚!!!!");
//
//		model.addAttribute("replyBean", replyBean);
//
//		return "post/getOnePost";
//
//	}
//
	// 新增留言
	@PostMapping(value = "/addReply")
	public String addReply(@ModelAttribute("replyBean") ReplyBean replyBean, Model model, BindingResult result,
			HttpServletRequest request) {

		System.err.println("進入addReply");

		// 登入攔截
		CustomerBean customerBean = (CustomerBean) model.getAttribute("customerSignInSuccess");
		if (customerBean == null) {
			return "redirect:/customerController/customerSignIn";
		}

		// 會員ID
		replyBean.setCustomerBean(customerBean);

		// 留言創建時間
		Timestamp registerTime = new Timestamp(System.currentTimeMillis());
		replyBean.setReplyTime(registerTime);

		// 留言狀態:正常
		replyBean.setReplyStatus(GlobalService.POST_STATUS_NORMAL);

		// 初始留言收藏數為0
		replyBean.setReplyLike(0);

		// 留言的文章 id
		PostBean postBean = (PostBean) model.getAttribute("getOnePostBean");

		replyBean.setPostId(postBean.getPostId());

		// 留言創建樓層
		List<ReplyBean> list = replyService.findByPostBean(postBean);
		Integer floor = 0;

		Iterator it = list.iterator();

		while (it.hasNext()) {
			System.out.println(it.next());
			floor++;
		}

		replyBean.setReplyFloor(floor);

		try {
			replyService.addReply(replyBean);
		} catch (Exception e) {
			result.rejectValue("replyContent", "", "發生異常，請通知系統人員..." + e.getMessage());
			return "post/getOnePost";

		}
		System.err.println("addReply");

		// 跳轉至查詢單一文章頁面
		return "post/getOnePost";

	}

	// 修改留言

	// 刪除留言

}
