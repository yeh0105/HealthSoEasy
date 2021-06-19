package com.soeasy.controller.mallController;

import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.ProductBean;
import com.soeasy.service.mallService.MallPorductService;

@Controller
@RequestMapping("mall")
@SessionAttributes({ "LoginOK", "pageNo", "products_DPP" })
public class mallProductsController {
	static int x = 0;
	@Autowired
	ServletContext context;
	@Autowired
	MallPorductService service;

	@GetMapping("/DisplayPageProducts")
	public String getPageProduct(Model model, 
			HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo
						
			) {
		
//		//沒登入就倒回葉面
		
		//hllllllllllllllll
		CustomerBean customerbean = (CustomerBean) model.getAttribute("LoginOK");
////		x++;
////		System.out.println("x=" + x);
////		if (x == 3) {
////			memberBean = null;
////		}
//		if (customerbean == null) {
//			return "redirect:/_02_login/login";
//		}
		
		
		Integer customerId = customerbean.getCustomerId();
		if (pageNo == null) {
			pageNo = 1;
			
			// 讀取瀏覽器送來的所有 Cookies
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				// 逐筆檢視Cookie內的資料
				for (Cookie c : cookies) {
					if (c.getName().equals(customerId + "pageNo")) {
						try {
							pageNo = Integer.parseInt(c.getValue().trim());
						} catch (NumberFormatException e) {
							;
						}
						break;
					}
				}
			}
		}
		model.addAttribute("baBean", service);
		
		//另外會用到Model物件來傳送java物件給jsp，通常呼叫addAttribute(arg1, arg2)
		//第一個變數是要傳到jsp的變數名稱，第二個變數是對應的java物件
		
		Map<Integer, ProductBean> productMap = service.getPageProducts(pageNo);
		
		model.addAttribute("pageNo", String.valueOf(pageNo));
		model.addAttribute("totalPages", service.getTotalPages());
		// 將讀到的一頁資料放入request物件內，成為它的屬性物件
		
		
		model.addAttribute("products_DPP", productMap);
		// 使用Cookie來儲存目前讀取的網頁編號，Cookie的名稱為memberId + "pageNo"
		// -----------------------
		Cookie pnCookie = new Cookie(customerId + "pageNo", String.valueOf(pageNo));
		// 設定Cookie的存活期為30天
		pnCookie.setMaxAge(30 * 24 * 60 * 60);
		// 設定Cookie的路徑為 Context Path
		pnCookie.setPath(request.getContextPath());
		// 將Cookie加入回應物件內
		response.addCookie(pnCookie);

		return "mall/productlists"; //jsp
	}
}
