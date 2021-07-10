<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>MALL</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/responsive.css">

</head>
<body >	


    <div class="page-wrapper">
    
 
	        <!--==================================================================== 
                                Start Header area
        =====================================================================-->
  		 <header class="main-header">
           <div class="container">
            <jsp:include page="/fragment/header.jsp" />
           <!-- 引入共同的頁首 -->  
              </div>
        </header>
        <!--==================================================================== 
                                End Header area
        =====================================================================-->
	
	
        <!--==================================================================== 
            Start Hero Section
        =====================================================================-->
        <section class="hero-section">
            <div class="hero-slider">
                <!-- hero-slide-item -->
                <div class="hero-slide-item" style="background-image:url(${pageContext.request.contextPath}/images/mall/indexbanner3.jpg); margin-top:150px">
                    <div class="container">
                                
                        <div class="hero-inner">
                            <h1 class="mb-20 light"> YOU <span>Are</span> <BR>
                            What <span>You </span>EAT</h1>
                            <p class="mb-40 mr-120 light"> 最健康的飲食都在這裡<br>
                                一場精心給予您的味蕾饗宴</p>
                            <div class="hero-btn">
                                <a href="<c:url value='/mall/lists' />" class="theme-btn">Order Now</a>
                            </div>
                        </div>

                    </div>
                </div>
                <!--  End of hero-slide-item -->



            </div>
        </section>
        
        <!--==================================================================== 
            End Hero Section
        =====================================================================-->
        

        
        <!--==================================================================== 
           Start Delivery Process Section
       =====================================================================-->
        <section class="how-work text-center pt-60 pb-60 rpt-20 rpb-20">
            <div class="container">
                <div class="section-title">
                    <h2>Delivery Process</h2>
                    <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        <div class="work-box down-dashed">
                            <span class="work-number"><i class="flaticon-shopping-cart"></i></span>
                            <h5>Step 1</h5>
                            <span class="line"></span>
                            <p>Choose Your Product</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="work-box up-dashed">
                            <span class="work-number"><i class="flaticon-harvest"></i></span>
                            <h5>Step 2</h5>
                            <span class="line"></span>
                            <p>Local Farm Product It</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="work-box down-dashed">
                            <span class="work-number"><i class="flaticon-address"></i></span>
                            <h5>Step 3</h5>
                            <span class="line"></span>
                            <p>Pick Up From Local Spot</p>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="work-box">
                            <span class="work-number"><i class="flaticon-delivery-truck"></i></span>
                            <h5>Step 4</h5>
                            <span class="line"></span>
                            <p>We Can Delivery it Fast</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--==================================================================== 
           End Delivery Process Section
       =====================================================================-->
        
        
        
        
        
        
        
        
 <!--==================================================================== 
                            Start footer section
        =====================================================================-->
        <footer class="footer bg-black pt-100 text-lg-left text-center">
            <div class="container">
                <div class="row">

                    <!--Footer Column-->
                    <div class="col-lg-3 col-md-12 mb-30">
                        <div class="footer-widget logo-widget mr-15">
                            <div class="footer-logo">
                            <br>
                            <br>
                                <a href="#"><img src="images/ICON.png" alt="footer logo"></a>
                            </div>
                            
                        </div>
                    </div>
                   
<!--                     Footer Column -->
                    <div class="col-lg-4 col-md-5 mb-20">
                        <div class="footer-widget form-widget ml-50 mr-20">
                            <h5 class="footer-title mb-20">Subscribe Our News Letter</h5>
                            <p>建置中</p>
                            <form class="subscribe">
                                <input type="email" placeholder="Your Email For Notify" required>
                                <button type="submit">Send</button>
                            </form>
                        </div>
                    </div>

                    <!--Footer Column-->
                    <div class="col-lg-3 col-md-4 mb-30">
                        <div class="footer-widget pament-widget">
                            <h5 class="footer-title mb-30">Payment</h5>
                            <ul class="list">
                                <li><a href="#"><img src="images/mall/pay-method/visa.png" alt=""></a></li>
                                <li><a href="#"><img src="images/mall/pay-method/mastercard.png" alt=""></a></li>
                                <li><a href="#"><img src="images/mall/pay-method/discover.png" alt=""></a></li>
                                <li><a href="#"><img src="images/mall/pay-method/americanexpress.png" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                     <!--Footer Column-->
                    <div class="col-lg-2 col-md-3 mb-30">
                        <div class="footer-widget links-widget float-lg-right mr-40">
                        <h6 class="footer-title mb-30">Map</h6>
                            <ul class="list">
                                <li> <a href="<c:url value='/'></c:url>" title="Link">Index</a> </li>
                                <li><a href="#" title="Link">園地</a> </li>
                                <li><a href="<c:url value='/postIndex'></c:url>" title="So Share">分享</a> </li>
                           		<li><a href="<c:url value='/showSportMapIndex'></c:url>" title="SportMap">地圖</a> </li>
                         		  <li><a href="<c:url value='/nutritionist'></c:url>" title="Link">營養師</a>
                            </ul>
                        </div>
                    </div>
                    
                    
                </div>
                <div class="row">
                    <div class="col-lg-12">


                        <!-- Copyright Area-->
                        <div class="copyright text-center pl-10 pr-10 pt-30 pb-10 mt-55 rmt-35 mb-65">
                            <p> </p>
                        </div>
                        
                    </div>
                </div>

                        
                    </div>
                
        </footer>
        <!--==================================================================== 
                                End footer section
        =====================================================================-->


<!--End pagewrapper-->
		</div>		
<!-- Scroll Top Button -->
    <button class="scroll-top scroll-to-target" data-target="html"><span class="fa fa-angle-up"></span></button>
    

<!-- jequery plugins -->
<script src="${pageContext.request.contextPath}/js/mall/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/bootstrap-v4.1.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/jquery.simpleLoadMore.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/appear.js"></script>
        <!-- Custom script -->
<script src="${pageContext.request.contextPath}/js/mall/js/script.js"></script>


</body>
</html>

