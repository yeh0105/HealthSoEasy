<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MALL</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mall/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mall/responsive.css">

</head>
<body>

	<div class="page-wrapper">

		<!--==================================================================== 
                                Start Header area
        =====================================================================-->
		<header class="main-header">
			<div class="container">
				<!-- 引入共同的頁首 -->
				<jsp:include page="/fragment/header.jsp" />
			</div>
		</header>
		<!--==================================================================== 
                                End Header area
        =====================================================================-->

		<!--==================================================================== 
            Start Banner Section
        =====================================================================-->
		<section class="banner-section"
			style="background-image:url(${pageContext.request.contextPath}/images/mall/banner.jpg); margin-top:120px;">
			<div class="container">
				<div class="banner-inner text-center">
					<h2 class="page-title">Shop</h2>
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a
								href="<c:url value='/mall'></c:url>" title="Mall">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Shop</li>
						</ol>
					</nav>
				</div>
			</div>
		</section>
		<!--==================================================================== 
            End Banner Section
        =====================================================================-->


		<!--==================================================================== 
  
  						查詢用按鈕段落
        =====================================================================-->


		<div>
			
			<div>
			<form action="<c:url value='/mall/lists/1'/>" class="d-lg-block" style="margin-left: 150px;margin-top:50px">
				<input type="hidden" name="sortField" value="${sortField}" /> <input
					type="hidden" name="sortDir" value="${sortDir}" /> &nbsp;
					<input
					type="text" name="keyword" value="${keyword}" placeholder="Enter Searching"  /> &nbsp;
					 <input
					type="submit" value="Search" class="theme-btn no-shadow bg-blue"/> &nbsp; 
					<input type="button"
					value="clear" onclick="clearFilter()" class="theme-btn no-shadow bg-blue">
			</form>
			</div>
			
			<div>
			<div class="row text-center text-lg-left">
									<div class="col-lg-5">
										<div class="continue-shopping">
											<a class="theme-btn no-shadow  br-5" href="/soeasy/mall/lists">
	商城測試用頁面</a>
										</div>
									</div>
			
			</div>
			
			
			
			</div>


			<!--==================================================================== 
								查詢用按鈕結束
    =====================================================================-->

			<!--==================================================================== 
           Start Shop Page
       =====================================================================-->
			<section class="shop-page mt-40 rmt-80 mb-90 rmb-50">
				<div class="container">
					<div class="row">

						<div class="col-xl-3 col-lg-4">
							<div class="shop-sidebar">
								<div class="shop-widget b1">
									<div class="shop-widget-title">
										<h5>
											<i class="flaticon-list"></i>Categories
										</h5>
									</div>
									<ul>
										<li><a href="shop.html"><i class="flaticon-apple"></i>
												Fruits and Vegetables</a></li>
										<li><a href="shop.html"><i
												class="flaticon-chicken-hand-drawn-outline"></i> Meat and
												Fish</a></li>
										<li><a href="shop.html"><i
												class="flaticon-pressure-washer"></i> Home and Cleaning</a></li>
										<li><a href="shop.html"><i class="flaticon-pest"></i>
												Pest Control</a></li>
										<li><a href="shop.html"><i
												class="flaticon-stationery"></i> Office Products</a></li>
										<li><a href="shop.html"><i class="flaticon-make-up"></i>
												Beauty Products</a></li>
										<li><a href="shop.html"><i
												class="flaticon-first-aid-kit"></i> Health Products</a></li>
										<li><a href="shop.html"><i class="flaticon-track"></i>
												Pet Care</a></li>
										<li><a href="shop.html"><i class="flaticon-sketch"></i>
												Home Appliances</a></li>
										<li><a href="shop.html"><i class="flaticon-baby-boy"></i>
												Baby Care</a></li>
									</ul>
								</div>
								<div class="shop-widget b1">
									<div class="shop-widget-title">
										<h5>Best Sale Today</h5>
									</div>
									<div
										class="product list-product d-flex align-items-center bg-white br-5 mb-30">
										<div class="product-img-wrap">
											<img src="assets/img/shop/cart-1.png" alt="img">
										</div>
										<div class="product-content-wrap">
											<div class="product-content">
												<p>
													<a href="shop-details.html">Cauliflower <br>(1kg)
													</a>
												</p>
											</div>
											<div class="product-action">
												<a href="#" class="add-to-btn small-btn"> <i
													class="flaticon-shopping-cart"></i> <span>Add to
														Cart</span>
													<h5 class="product-price">$120.00</h5>
												</a>
											</div>
										</div>
									</div>
									<div
										class="product list-product d-flex align-items-center bg-white br-5 mb-30">
										<div class="product-img-wrap">
											<img src="assets/img/shop/cart-2.png" alt="img">
										</div>
										<div class="product-content-wrap">
											<div class="product-content">
												<p>
													<a href="shop-details.html">Organic Yellow Papaya (1ps)</a>
												</p>
											</div>
											<div class="product-action">
												<a href="#" class="add-to-btn small-btn"> <i
													class="flaticon-shopping-cart"></i> <span>Add to
														Cart</span>
													<h5 class="product-price">$120.00</h5>
												</a>
											</div>
										</div>
									</div>
									<div
										class="product list-product d-flex align-items-center bg-white br-5 mb-30">
										<div class="product-img-wrap">
											<img src="assets/img/shop/cart-3.png" alt="img">
										</div>
										<div class="product-content-wrap">
											<div class="product-content">
												<p>
													<a href="shop-details.html">Granny Smith Apple (4ps)</a>
												</p>
											</div>
											<div class="product-action">
												<a href="#" class="add-to-btn small-btn"> <i
													class="flaticon-shopping-cart"></i> <span>Add to
														Cart</span>
													<h5 class="product-price">$120.00</h5>
												</a>
											</div>
										</div>
									</div>

								</div>
							</div>
						</div>
						
<!-- 						=====================product ===================--------------------------------->

						<div class="col-xl-9 col-lg-8">
							<div class="shop-items">

								<div class="search-result-header">
									<h5>Showing Result 12 of 89 Product</h5>
									<div class="sort-by">
										<h5>Sort:</h5>
										<select name="#">
											<option value="value-1">ALL</option>
											<option value="value-2">By Name</option>
										</select>
									</div>
								</div>

								<div class="row">
							 <c:forEach items="${product}" var="product">
				

									<!--single Product -->
									<div class="col-xl-4 col-lg-6 col-sm-6">
										<div class="product">
											<div class="product-img-wrap">
												<img class="media-object"
													src="<c:url value='/mall/getImage/${product.productId}' />"
													alt="Product Image">
												<!-- Button trigger modal -->
												<button class="quick-view" type="button" data-toggle="modal"
													data-target="#quick-view">Quick View</button>
											</div>

											<div class="product-content-wrap">
												<div class="product-content">
													<p>
														<a href="shop-details.html">${product.productName} <br>
														</a>
													</p>
												</div>
												<div class="product-action">
													<a href="<c:url value='/mall/cart/buy/${product.productId}'/>" class="add-to-btn small-btn"> <i
														class="flaticon-shopping-cart"></i> <span>Add to
															Cart</span>
														<h5 class="product-price">${product.productPrice}</h5>
													</a>
<!-- 													====收藏商品=== -->
<!-- 													<div class="add-wishlist"> -->
<!-- 														<i class="fa fa-heart-o"></i> -->
<!-- 													</div> -->
												</div>
											</div>

										</div>
									</div>

								</c:forEach>


									

								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--==================================================================== 
           End Shop Page
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
									<br> <br> <a href="#"><img
										src="${pageContext.request.contextPath}/images/ICON.png"
										alt="footer logo"></a>
								</div>

							</div>
						</div>

						<!--                     Footer Column -->
						<div class="col-lg-4 col-md-5 mb-20">
							<div class="footer-widget form-widget ml-50 mr-20">
								<h5 class="footer-title mb-20">Subscribe Our News Letter</h5>
								<p>建置中</p>
								<form class="subscribe">
									<input type="email" placeholder="Your Email For Notify"
										required>
									<button type="submit">Send</button>
								</form>
							</div>
						</div>

						<!--Footer Column-->
						<div class="col-lg-3 col-md-4 mb-30">
							<div class="footer-widget pament-widget">
								<h5 class="footer-title mb-30">Payment</h5>
								<ul class="list">
									<li><a href="#"><img
											src="${pageContext.request.contextPath}/images/mall/pay-method/visa.png"
											alt=""></a></li>
									<li><a href="#"><img
											src="${pageContext.request.contextPath}/images/mall/pay-method/mastercard.png"
											alt=""></a></li>
									<li><a href="#"><img
											src="${pageContext.request.contextPath}/images/mall/pay-method/discover.png"
											alt=""></a></li>
									<li><a href="#"><img
											src="${pageContext.request.contextPath}/images/mall/pay-method/americanexpress.png"
											alt=""></a></li>
								</ul>
							</div>
						</div>
						<!--Footer Column-->
						<div class="col-lg-2 col-md-3 mb-30">
							<div class="footer-widget links-widget float-lg-right mr-40">
								<h6 class="footer-title mb-30">Map</h6>
								<ul class="list">
									<li><a href="<c:url value='/'></c:url>" title="Link">Index</a>
									</li>
									<li><a href="#" title="Link">園地</a></li>
									<li><a href="<c:url value='/postIndex'></c:url>"
										title="So Share">分享</a></li>
									<li><a href="<c:url value='/showSportMapIndex'></c:url>"
										title="SportMap">地圖</a></li>
									<li><a href="<c:url value='/nutritionist'></c:url>"
										title="Link">營養師</a>
								</ul>
							</div>
						</div>


					</div>
					<div class="row">
						<div class="col-lg-12">


							<!-- Copyright Area-->
							<div
								class="copyright text-center pl-10 pr-10 pt-30 pb-10 mt-55 rmt-35 mb-65">
								<p></p>
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
		<button class="scroll-top scroll-to-target" data-target="jsp">
			<span class="fa fa-angle-up"></span>
		</button>

		<!-- ======================    綁定清除查詢 ================================-->

		<script type="text/javascript">
			function clearFilter() {
				window.location = '/soeasy/mall/lists';
			}
		</script>

		<!-- ==========================   (End) 綁定清除查詢========================-->

		<!-- jequery plugins -->
		<script src="${pageContext.request.contextPath}/js/mall/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/js/mall/bootstrap-v4.1.3.min.js"></script>
		<script
			src="${pageContext.request.contextPath}js/mall/jquery.nice-select.min.js"></script>
		<script
			src="${pageContext.request.contextPath}js/mall/jquery.simpleLoadMore.min.js"></script>
		<script src="${pageContext.request.contextPath}js/mall/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}js/mall/appear.js"></script>
		<!-- Custom script -->
		<script src="${pageContext.request.contextPath}js/mall/js/script.js"></script>
</body>
</html>

