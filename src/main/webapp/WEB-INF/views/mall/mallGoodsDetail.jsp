<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MALL-Goods Detail</title>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded",function(){
		let showFavorite = document.getElementById("showFavorite");
		let favoriteHeart = document.getElementById("favoriteHeart");
		
		//初始化XMLHttpRequest物件
		let xhr = new XMLHttpRequest();
		
		//收藏按鈕
		showFavorite.addEventListener("click",updateFavorite);
		//按下收藏按鈕，送出JSON字串資料
		function updateFavorite(){
			//建一支Object，裝收藏controller要的內容
			let favoriteInfo = {
				'favoriteCategory' : 'productFavorite'	,
				'favoriteItemId' : ${product.productId}
				
			}
			//將物件轉為json			
			let json = JSON.stringify(favoriteInfo);
			
			console.log(json);
			
			xhr.open('POST',"<c:url value='/favoriteController/addFavorite'/>");
			xhr.setRequestHeader("Content-Type","application/json;charset=UTF-8");
			xhr.send(json);
			
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status ==200){
					
					if(xhr.responseURL == "http://localhost:8080/soeasy/customerController/customerSignIn"){
						location.href="/soeasy/customerController/customerSignIn";
					}
					
					let favoriteJson = JSON.parse(xhr.responseText);
// 					console.log(favoriteJson);
					//更改圖片
					if (favoriteJson.favoriteExist){
						favoriteHeart.src="${pageContext.request.contextPath}/images/mall/Like2.png";
					}else {
						favoriteHeart.src="${pageContext.request.contextPath}/images/mall/Like1.png";

					}
					
				}
				
				
			}
			
			
		}		
		
		
		
	} )
</script>
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
					<h2 class="page-title">Product Detail</h2>
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
           Start Shop Details Page
       =====================================================================-->
		<section class="shop-details-page"
			class="shop-details-page mt-120 rmt-70 mb-60 rmb-20">
			<div class="container" style="margin-top: 100px">
				<div class="row col-gap-60">

					<div class="col-xl-3 col-lg-4">
						<div class="shop-sidebar">
							<div class="shop-widget b1">
								<div class="shop-widget-title">
									<h5>
										<i><img
											src="${pageContext.request.contextPath}/images/mall/icon/list.png"
											style="weight: 30px; height: 30px"></i>Categories
									</h5>
								</div>
								<ul>
									<li><a href="shop.html"><i class="flaticon-apple"></i>
											Fruits and Vegetables</a></li>
									<li><a href="shop.html"><i
											class="flaticon-chicken-hand-drawn-outline"></i> Chickenen
											MealBox</a></li>
									<li><a href="shop.html"><i
											class="flaticon-pressure-washer"></i> Beef Meal Box</a></li>
									<li><a href="shop.html"><i class="flaticon-pest"></i>
											Pork Meal Boxl</a></li>
									<li><a href="shop.html"><i class="flaticon-stationery"></i>
											Fish Meal Box</a></li>
									<li><a href=""><i class="flaticon-make-up"></i> Meal
											Box for vagetarien</a></li>

								</ul>
							</div>

							<!-- 								=======best=========== -->
							<div class="shop-widget b1">
								<div class="shop-widget-title">
									<h5>Newest Sale Today</h5>
								</div>
								<c:forEach items="${productTop3}" var="productTop">
									<div
										class="product list-product d-flex align-items-center bg-white br-5 mb-30">
										<div class="product-img-wrap">
											<img
												src="<c:url value='/mall/getImage/${productTop.productId}' />"
												alt="img">
										</div>
										<div class="product-content-wrap">
											<div class="product-content">
												<p>
													<a href="shop-details.html">${productTop.productName} </a>
												</p>
											</div>
											<div class="product-action">
												<a
													href="<c:url value='/mall/cart/buy/${productTop.productId}'/>"
													class="add-to-btn small-btn"> <i
													class="flaticon-shopping-cart"></i> <span>Add to
														Cart</span>
													<h5 class="product-price">$${productTop.productPrice}</h5>
												</a>
											</div>
										</div>
									</div>

								</c:forEach>
							</div>



						</div>
					</div>


					<!--                     =========商品詳情============== -->

					<div class="col-xl-9 col-lg-8">
						<div class="product-details-wrap">

							<div class="row col-gap-60">
								<div class="col-xl-5">
									<div class="product-preview-wrap">
										<div class="tab-content bg-white p-50 b1 br-5">
											<div class="tab-pane" id="preview1">
												<img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Preview Image"
													data-magnify-src="<c:url value='/mall/getImage/${product.productId}'/>" />
											</div>
											<div class="tab-pane active" id="preview2">
												<img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Preview Image"
													data-magnify-src="<c:url value='/mall/getImage/${product.productId}'/>" />
											</div>
											<div class="tab-pane" id="preview3">
												<img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Preview Image"
													data-magnify-src="<c:url value='/mall/getImage/${product.productId}'/>" />
											</div>
											<div class="tab-pane" id="preview4">
												<img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Preview Image"
													data-magnify-src="<c:url value='/mall/getImage/${product.productId}'/>" />
											</div>
										</div>

										<ul class="nav nav-tabs mt-30">
											<li><a data-toggle="tab" href="#preview1"> <img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Thumbnail Image" />
											</a></li>
											<li><a class="active" data-toggle="tab" href="#preview2">
													<img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Thumbnail Image" />
											</a></li>
											<li><a data-toggle="tab" href="#preview3"> <img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Thumbnail Image" />
											</a></li>
											<li><a data-toggle="tab" href="#preview4"> <img
													src="<c:url value='/mall/getImage/${product.productId}'/>"
													alt="Product Thumbnail Image" />
											</a></li>
										</ul>
									</div>
								</div>
								<div class="col-xl-7">
									<div
										class="product-details text-left bg-white px-50 py-45 b1 br-5">
										<h3 class="mb-25 rmt-25">${product.productName}</h3>
										<div class="rating mb-25">
											<div class="star mr-15">
												<img
													src="${pageContext.request.contextPath}/images/mall/line2.png"
													style="weight: 70px; height: 50px" />

											</div>
										</div>
										<div>

											<p>● 商品熱量:${product.productCalories} &nbsp;</p>
											<p>${product.productDescription}</p>
											<p style="text-align: right">--&nbsp; product provider:
												${product.shopBean.shopName}</p>
											<br />
										</div>

										<h6>
											Availability: <span>InStock &nbsp;( Amount:
												${product.productAmount})</span>
										</h6>
										<h4 class="price">$${product.productPrice}</h4>

										<div class="product-spinner mt-20">
											<div class="number-input b1">
												<input min="1" name="quantity" value="1" type="number">
											</div>
											<a
												href="<c:url value='/mall/cart/buy/${product.productId}'/>"
												class="theme-btn br-30 ml-20">Add to Cart</a>
											<div class="add-wishlist">
												<c:choose>
													<c:when test="${productBean.favoriteStatus == true}">
														<div class="floatR">
															<button id="showFavorite">
																<img id="favoriteHeart"
																	src="${pageContext.request.contextPath}/images/mall/Like1.png">
															</button>
														</div>
													</c:when>
													<c:otherwise>
														<div class="floatR">
															<button id="showFavorite">
																<img id="favoriteHeart"
																	src="${pageContext.request.contextPath}/images/mall/Like2.png">
															</button>
														</div>

													</c:otherwise>
												</c:choose>

											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- product-details-tab/review -->
							<div
								class="product-details-review bg-white mt-60 px-50 pt-20 pb-30 b1 br-5">
								<ul class="nav nav-tabs mb-20 mt-10">
									<li><a href="#details" class="active" data-toggle="tab">Shop
											Description</a></li>
									<li><a href="#review" data-toggle="tab" class="">Reviews</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="details">
										<!--  廠商詳情 -->

										<h5>${product.shopBean.shopName}</h5>
										<img style="weight: 500px; height: 400px"
											src="<c:url value='/shopController/getShopImgById/${product.shopBean.shopId}'/>"
											alt="shop Thumbnail Image" />

										<h4>Cotact Info:</h4>
										<p>
											Email&nbsp;:&nbsp;<span>${product.shopBean.shopEmail}</span>
										</p>
										<p>
											Phone&nbsp;:&nbsp;<span>${product.shopBean.shopPhone}</span>
										</p>

									</div>

									<div class="tab-pane" id="review">

										<!-- product-review-comments -->
										<div class="product-review-comments">

											<!-- singlepost-comments -->
											<div class="latest-comments">
												<div class="comments-box">
													<div class="comments-avatar">
														<img src="assets/img/shop/reviewer-1.png" alt="">
													</div>
													<div class="comments-text">
														<div class="avatar-name">
															<h5>Daniel R. Stockton</h5>
															<span>3 Days Ago</span>
															<div class="ratings">
																<i class="flaticon-star"></i> <i class="flaticon-star"></i>
																<i class="flaticon-star"></i> <i class="flaticon-star"></i>
																<i class="flaticon-star"></i>
															</div>
														</div>
														<p>Sed egestas, ante et vulputate volutpat, eros pede
															semper est, vitaus metus eu augue. Morbi purus libero,
															faucibus adipiscing, commodo quis, grav, est. Sed lectus.</p>
													</div>
												</div>
											</div>

											<!-- singlepost-comments -->
											<div class="latest-comments">
												<div class="comments-box">
													<div class="comments-avatar">
														<img src="assets/img/shop/reviewer-1.png" alt="">
													</div>
													<div class="comments-text">
														<div class="avatar-name">
															<h5>Daniel R. Stockton</h5>
															<span>3 Days Ago</span>
															<div class="ratings">
																<i class="flaticon-star"></i> <i class="flaticon-star"></i>
																<i class="flaticon-star"></i> <i class="flaticon-star"></i>
																<i class="flaticon-star"></i>
															</div>
														</div>
														<p>Sed egestas, ante et vulputate volutpat, eros pede
															semper est, vitaus metus eu augue. Morbi purus libero,
															faucibus adipiscing, commodo quis, grav, est. Sed lectus.</p>
													</div>
												</div>
											</div>

										</div>

									</div>
								</div>
							</div>

						</div>

					</div>
					<!-- ============================================= -->
				</div>

			</div>
		</section>
		<!--==================================================================== 
           End Shop Details Page
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
	<!-- ------------------------------用來接POST-------------------------------- -->
	<form method='POST'>
		<input type='hidden' name='_method' value='score'>
	</form>

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

