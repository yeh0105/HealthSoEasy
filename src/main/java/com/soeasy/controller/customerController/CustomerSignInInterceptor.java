package com.soeasy.controller.customerController;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.soeasy.model.CustomerBean;

@Component
public class CustomerSignInInterceptor implements HandlerInterceptor {
	List<String> urls = Arrays.asList(
			"/customerController/customerPage",
			"/customerController/updateCustomerInfo",
			"/customerController/updateCustomerHealthInfo",
			"/customerController/uploadCustomerImg",
			"/customerController/getCustomerImg"
	);
	
	String servletPath;
	String contextPath;
	String requestURI;
	
	public CustomerSignInInterceptor() {
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Boolean byPass = true;
		Boolean isRequestedSessionIdValid = false;
		
		servletPath = request.getServletPath();  
		contextPath = request.getContextPath();
		requestURI  = request.getRequestURI();
		
		isRequestedSessionIdValid = request.isRequestedSessionIdValid();
		
		if(mustSignInCustomer()) {
			if(checkCustomerSignIn(request)) {	//已登入
				HttpSession session = request.getSession();
				session.setAttribute("servletPath", servletPath);
				byPass = true;
			} else {	//需登入但未登入，導向登入顧客會員登入頁面
				HttpSession session = request.getSession();
				if ( ! isRequestedSessionIdValid ) {
					session.setAttribute("timeOut", "使用逾時，請重新登入");
				} else {
					// 記住原本的"requestURI"，稍後如果登入成功，系統可以自動轉入
					// 原本要執行的程式。
//					System.out.println("CheckLoginInterceptor#preHandle, servletPath=" + servletPath );
//					System.out.println("CheckLoginInterceptor#preHandle, session=" + session );
					session.setAttribute("servletPath", servletPath);	
				}
				response.sendRedirect(contextPath + "/customerController/customerSignIn");
				byPass = false;
			}
		} else {	//不需登入
			byPass = true;
		}
		
		return byPass;
	}
	
	// 判斷Session物件內是否含有識別字串為LoginOK的屬性物件，如果有，表示已經登入，否則尚未登入
	private boolean checkCustomerSignIn(HttpServletRequest req) {
		HttpSession session = req.getSession();
		CustomerBean loginToken = (CustomerBean) session.getAttribute("CustomerSignInSuccess");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}
	
	// 如果請求的ServletPath的前導字是以某個必須登入才能使用之資源的路徑，那就必須登入。
	private Boolean mustSignInCustomer() {
		Boolean mustSignInCustomer = false;
			for (String url : urls) {
			url = url.substring(0, url.length() - 1); // 除去掉最後一個字元的剩餘字串
			if (servletPath.startsWith(url)) {
				mustSignInCustomer = true;
				break;
			} else {
				if (servletPath.equals(url)) {
					mustSignInCustomer = true;
					break;
				}
			}
		} 
		return mustSignInCustomer;
	}
}
