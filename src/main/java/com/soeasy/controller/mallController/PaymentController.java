package com.soeasy.controller.mallController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.soeasy.model.Order.OrderBean;
import com.soeasy.model.Order.PaymentModel;
import com.soeasy.service.customerService.CustomerService;
import com.soeasy.service.mallService.OrderService;
import com.soeasy.service.mallService.PaymentService;
import com.soeasy.util.URLUtils;



@Controller
@SessionAttributes("customerSignInSuccess")

public class PaymentController {

    /**
     * 成功頁
     */
    public static final String PAYPAL_SUCCESS_URL = "mall/pay/success";

    /**
     * 取消頁
     */
    public static final String PAYPAL_CANCEL_URL = "mall/pay/cancel";

    @Autowired
    private PaymentService paymentService;
    
    @Autowired
    private OrderService orderService;
    
    @Autowired
    private CustomerService customerService;
    

    
    @GetMapping("/mall/paypal")
    public String index(){
        return "/mall/paypal/index";
    }

    @PostMapping("/mall/pay")
   public String payment(HttpServletRequest request){
        //     * 取消頁
        String cancelUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_CANCEL_URL;
        //獲取成功頁
        String successUrl = URLUtils.getBaseURl(request) + "/" + PAYPAL_SUCCESS_URL;
        Payment payment = null;
        
        PaymentModel paymentModel = new PaymentModel();
      // List <OrderBean> order =;
        
        //如何獲取訂單金額
        	//paymentModel.setAmount(order.getOrderTotalPrice().toString());
       paymentModel.setAmount("100");
        //貨幣
        paymentModel.setCurrency("TWD");
        //付款描述
        paymentModel.setDescription("payment description");
        try {
            payment = paymentService.createPayment(paymentModel, cancelUrl, successUrl);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        for(Links links : payment.getLinks()){
            if(links.getRel().equals("approval_url")){
                //付款的登入頁面
                return "redirect:" + links.getHref();
            }
        }
        return "redirect:/";
    }

    //取消頁面
    @GetMapping(value = PAYPAL_CANCEL_URL)
    public String cancelPay(){
        return "/mall/paypal/cancel";
    }

  //執行付款
    @GetMapping(value = PAYPAL_SUCCESS_URL)
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId){
        Payment payment = null;
        try {
            payment = paymentService.executePayment(paymentId, payerId);
        } catch (PayPalRESTException e) {
            e.printStackTrace();
        }
        if(payment.getState().equals("approved")){
        	System.out.println("支付成功"+"paymentId:"+paymentId+"====payerId:"+payerId);
        	
            OrderBean order = new OrderBean();
			order.setPayStatus("paid");
            return "/mall/paypal/success";
        }
        
        return "redirect:/";
    }
    
    
    @GetMapping("/mall/status/{orderId}")
	public String orderpay(@PathVariable("orderId") Integer orderId,Model model) {
		OrderBean order = orderService.findByOrderId(orderId);
		order.setPayStatus("Completed");
		orderService.save(order);
		
		return "/mall/paypal/success";
		
		
	}
}