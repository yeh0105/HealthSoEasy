<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MALL</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/responsive.css">

</head>
<body >	
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
        <section class="banner-section" style="background-image:url(${pageContext.request.contextPath}/images/mall/banner.jpg); margin-top:120px;">
            <div class="container">
                <div class="banner-inner text-center">
                    <h2 class="page-title">Shop</h2>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<c:url value='/mall'></c:url>" title="Mall">Home</a></li>
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
        <section class="shop-details-page mt-120 rmt-70 mb-60 rmb-20">
            <div class="container">
                <div class="row col-gap-60">

                    <div class="col-xl-3 col-lg-4">
                        <div class="shop-sidebar">
                            <div class="shop-widget b1">
                                <div class="shop-widget-title">
                                    <h5><i class="flaticon-list"></i>Categories</h5>
                                </div>
                                <ul>
                                    <li><a href="shop.html"><i class="flaticon-apple"></i> Fruits and Vegetables</a></li>
                                    <li><a href="shop.html"><i class="flaticon-chicken-hand-drawn-outline"></i> Meat and Fish</a></li>
                                    <li><a href="shop.html"><i class="flaticon-pressure-washer"></i> Home and Cleaning</a></li>
                                    <li><a href="shop.html"><i class="flaticon-pest"></i> Pest Control</a></li>
                                    <li><a href="shop.html"><i class="flaticon-stationery"></i> Office Products</a></li>
                                    <li><a href="shop.html"><i class="flaticon-make-up"></i> Beauty Products</a></li>
                                    <li><a href="shop.html"><i class="flaticon-first-aid-kit"></i> Health Products</a></li>
                                    <li><a href="shop.html"><i class="flaticon-track"></i> Pet Care</a></li>
                                    <li><a href="shop.html"><i class="flaticon-sketch"></i> Home Appliances</a></li>
                                    <li><a href="shop.html"><i class="flaticon-baby-boy"></i> Baby Care</a></li>
                                </ul>
                            </div>
                            <div class="shop-widget b1">
                                <div class="shop-widget-title">
                                    <h5>Best Sale Today</h5>
                                </div>
                                <div class="product list-product d-flex align-items-center bg-white br-5 mb-30">
                                    <div class="product-img-wrap">
                                        <img src="assets/img/shop/cart-1.png" alt="img">
                                    </div>
                                    <div class="product-content-wrap">
                                        <div class="product-content">
                                            <p><a href="shop-details.html">Cauliflower <br>(1kg)</a>
                                            </p>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="add-to-btn small-btn">
                                                <i class="flaticon-shopping-cart"></i>
                                                <span>Add to Cart</span>
                                                <h5 class="product-price">$120.00</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product list-product d-flex align-items-center bg-white br-5 mb-30">
                                    <div class="product-img-wrap">
                                        <img src="assets/img/shop/cart-2.png" alt="img">
                                    </div>
                                    <div class="product-content-wrap">
                                        <div class="product-content">
                                            <p><a href="shop-details.html">Organic Yellow Papaya (1ps)</a></p>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="add-to-btn small-btn">
                                                <i class="flaticon-shopping-cart"></i>
                                                <span>Add to Cart</span>
                                                <h5 class="product-price">$120.00</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="product list-product d-flex align-items-center bg-white br-5 mb-30">
                                    <div class="product-img-wrap">
                                        <img src="assets/img/shop/cart-3.png" alt="img">
                                    </div>
                                    <div class="product-content-wrap">
                                        <div class="product-content">
                                            <p><a href="shop-details.html">Granny Smith Apple (4ps)</a></p>
                                        </div>
                                        <div class="product-action">
                                            <a href="#" class="add-to-btn small-btn">
                                                <i class="flaticon-shopping-cart"></i>
                                                <span>Add to Cart</span>
                                                <h5 class="product-price">$120.00</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="shop-widget widget-product b1">
                                <!--widget-product -->
                                <div class="special-offer-product bg-white p-25 br-5">
                                    <div class="off">10%<span>off</span></div>
                                    <div class="product-img-wrap">
                                        <img src="assets/img/product/product3.png" alt="img">
                                    </div>
                                    <div class="product-content">
                                        <div class="offer-product-price">
                                            <span class="discounted-price">$120.00</span>
                                            <span class="actual-price has-discount">$120.00</span>
                                        </div>
                                        <p><a href="shop-details.html">Organic Granny Smith <br>Apple (4ps)</a></p>
                                    </div>
                                    <div class="product-action">
                                        <a href="#" class="add-to-btn">Add to Cart</a>
                                        <div class="add-wishlist text-center">
                                            <i class="fa fa-heart-o"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xl-9 col-lg-8">
                        <div class="product-details-wrap">
                            
                            <div class="row col-gap-60">
                                <div class="col-xl-5">
                                    <div class="product-preview-wrap">
                                        <div class="tab-content bg-white p-50 b1 br-5">
                                            <div class="tab-pane" id="preview1">
                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                            </div>
                                            <div class="tab-pane active" id="preview2">
                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                            </div>
                                            <div class="tab-pane" id="preview3">
                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                            </div>
                                            <div class="tab-pane" id="preview4">
                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                            </div>
                                        </div>

                                        <ul class="nav nav-tabs mt-30">
                                            <li>
                                                <a data-toggle="tab" href="#preview1">
                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                </a>
                                            </li>
                                            <li>
                                                <a class="active" data-toggle="tab" href="#preview2">
                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                </a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#preview3">
                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                </a>
                                            </li>
                                            <li>
                                                <a data-toggle="tab" href="#preview4">
                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-xl-7">
                                    <div class="product-details text-left bg-white px-50 py-45 b1 br-5">
                                        <h3 class="mb-25 rmt-25">Fresh Onion 1kg</h3>
                                        <div class="rating mb-25">
                                            <div class="star mr-15">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="text">(13 Review)</div>
                                        </div>
                                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper evitluctus metus libero eu augue. Morbi s libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praest elemhendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat.</p>
                                        <p>lacus a ultrices sagittis, mi neque euismod dui, eu pulvinar nunc sapien ornare nisl. Phasellus pede arcu, dapibus eu.</p>

                                        <h6 class="stock">Availability: <span>In Stock</span></h6>
                                        <h4 class="price">$120.00</h4>
                                        
                                        <div class="product-spinner mt-20">
                                            <div class="number-input b1">
                                              <button class="minus"></button>
                                              <input min="1" name="quantity" value="2" type="number">
                                              <button class="plus"></button>
                                            </div>
                                            <a href="#" class="theme-btn br-30 ml-25">Add to Cart</a>
                                            <div class="add-wishlist">
                                                <i class="fa fa-heart-o"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- product-details-tab/review -->
                            <div class="product-details-review bg-white mt-60 px-50 pt-20 pb-30 b1 br-5">
                                <ul class="nav nav-tabs mb-20 mt-10">
                                    <li><a href="#details" class="active" data-toggle="tab">Description</a></li>
                                    <li><a href="#addi-info" data-toggle="tab" class="">Additional information</a></li>
                                    <li><a href="#review" data-toggle="tab" class="">Reviews</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="details">
                                        <p>Morbi non accumsan libero, volutpat ullamcorper odio. Donec non libero id augue suscipit commodo. Curabitur porta ac ligula vel sollicitudin. Praesent vestibulum tellus urna, in imperdiet neque lobortis eleifend. Nunc eros nulla, porta quis urna nec, luctus viverra diam. In ut ante est. Duis venenatis erat ac nisl malesuada gravida. Pellentesque pellentesque tempor urna, quis vehicula mi mollis hendrerit. Etiam iaculis convallis arcu, id lacinia massa imperdiet vitae.</p>
                                        <p>Nam accumsan a augue ut lobortis. Ut ac libero vel libero consectetur dictum ac in ante. Pellentesque efficitur nibh id condimentum blandit. Phasellus vulputate, tellus in vestibulum feugiat, felis nisl pulvinar mi, mollis eleifend orci risus sit amet orci. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas vitae viverra risus. Vivamus eget accumsan elit, tincidunt pharetra orci. Maecenas neque mi, porttitor eu ullamcorper nec, aliquet eu nulla. Mauris maximus turpis tellus, vel aliquam neque aliquet accumsan. Maecenas ultrices facilisis libero, eu laoreet mauris. Integer non aliquam sapien, ut auctor sem. Vivamus urna urna, eleifend eget augue sed, pulvinar rutrum enim. Nullam lacinia mauris vel mattis lacinia.</p>
                                    </div>
                                    <div class="tab-pane" id="addi-info">
                                        <p>Morbi non accumsan libero, volutpat ullamcorper odio. Donec non libero id augue suscipit commodo. Curabitur porta ac ligula vel sollicitudin. Praesent vestibulum tellus urna, in imperdiet neque lobortis eleifend. Nunc eros nulla, porta quis urna nec, luctus viverra diam. In ut ante est. Duis venenatis erat ac nisl malesuada gravida. Pellentesque pellentesque tempor urna, quis vehicula mi mollis hendrerit. Etiam iaculis convallis arcu, id lacinia massa imperdiet vitae.</p>
                                    </div>
                                    <div class="tab-pane" id="review">

                                        <!-- product-review-comments -->
                                        <div class="product-review-comments">

                                            <!-- dubble-comments -->
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
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitaus metus lib eu augue. Morbi purus libero, faucibadipisci commodo quis, grav, est. Sed lectus.</p>
                                                    </div>
                                                </div>

                                                <div class="child comments-box">
                                                    <div class="comments-avatar">
                                                        <img src="assets/img/shop/reviewer-1.png" alt="">
                                                    </div>
                                                    <div class="comments-text">
                                                        <div class="avatar-name">
                                                            <h5>Daniel R. Stockton</h5>
                                                            <span>3 Days Ago</span>
                                                        </div>
                                                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper est.</p>
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
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitaus metus eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, grav, est. Sed lectus.</p>
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
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                                <i class="flaticon-star"></i>
                                                            </div>
                                                        </div>
                                                        <p>Sed egestas, ante et vulputate volutpat, eros pede semper est, vitaus metus eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, grav, est. Sed lectus.</p>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                            <!-- Related Product -->
                            <div class="related-product mt-110 rmt-75">
                                <h3 class="mb-35">Related Product</h3>
                                <div class="row">

                                    <!--single Product -->
                                    <div class="col-xl-4 col-md-6 col-md-4 mb-30">
                                        <div class="product">
                                            <div class="product-img-wrap">
                                                <img src="assets/img/product/product26.png" alt="img">
                                                <!-- Button trigger modal -->
                                                <button class="quick-view" type="button" data-toggle="modal" data-target="#quick-view">Quick View</button>
                                            </div>
                                            <div class="product-content-wrap">
                                                <div class="product-content">
                                                    <p><a href="shop-details.html">Chashi Aromatic Chinigura Rice (1 Bag 5 kg)</a></p>
                                                </div>
                                                <div class="product-action">
                                                    <a href="#" class="add-to-btn small-btn">
                                                        <i class="flaticon-shopping-cart"></i>
                                                        <span>Add to Cart</span>
                                                        <h5 class="product-price">$120.00</h5>
                                                    </a>
                                                    <div class="add-wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--single Product -->
                                    <div class="col-xl-4 col-md-6 col-md-4 mb-30">
                                        <div class="product">
                                            <div class="product-img-wrap">
                                                <img src="assets/img/product/product27.png" alt="img">
                                                <!-- Button trigger modal -->
                                                <button class="quick-view" type="button" data-toggle="modal" data-target="#quick-view">Quick View</button>
                                            </div>
                                            <div class="product-content-wrap">
                                                <div class="product-content">
                                                    <p><a href="shop-details.html">Chashi Aromatic Chinigura Rice (1 Bag 5 kg)</a></p>
                                                </div>
                                                <div class="product-action">
                                                    <a href="#" class="add-to-btn small-btn">
                                                        <i class="flaticon-shopping-cart"></i>
                                                        <span>Add to Cart</span>
                                                        <h5 class="product-price">$120.00</h5>
                                                    </a>
                                                    <div class="add-wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--single Product -->
                                    <div class="col-xl-4 col-md-6 col-md-4 mb-30">
                                        <div class="product">
                                            <div class="product-img-wrap">
                                                <img src="assets/img/product/product28.png" alt="img">
                                                <!-- Button trigger modal -->
                                                <button class="quick-view" type="button" data-toggle="modal" data-target="#quick-view">Quick View</button>
                                            </div>
                                            <div class="product-content-wrap">
                                                <div class="product-content">
                                                    <p><a href="shop-details.html">Chashi Aromatic Chinigura Rice (1 Bag 5 kg)</a></p>
                                                </div>
                                                <div class="product-action">
                                                    <a href="#" class="add-to-btn small-btn">
                                                        <i class="flaticon-shopping-cart"></i>
                                                        <span>Add to Cart</span>
                                                        <h5 class="product-price">$120.00</h5>
                                                    </a>
                                                    <div class="add-wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!--single Product -->
                                    <div class="col-xl-4 col-md-6 col-md-4 mb-30">
                                        <div class="product">
                                            <div class="product-img-wrap">
                                                <img src="assets/img/product/product29.png" alt="img">
                                                <!-- Button trigger modal -->
                                                <button class="quick-view" type="button" data-toggle="modal" data-target="#quick-view">Quick View</button>
                                            </div>
                                            <div class="product-content-wrap">
                                                <div class="product-content">
                                                    <p><a href="shop-details.html">Chashi Aromatic Chinigura Rice (1 Bag 5 kg)</a></p>
                                                </div>
                                                <div class="product-action">
                                                    <a href="#" class="add-to-btn small-btn">
                                                        <i class="flaticon-shopping-cart"></i>
                                                        <span>Add to Cart</span>
                                                        <h5 class="product-price">$120.00</h5>
                                                    </a>
                                                    <div class="add-wishlist">
                                                        <i class="fa fa-heart-o"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                   
                                    <!--==================================== Start product-quick-view //product-modal  ================-->
                                    <div class="modal product-modal fade" id="quick-view" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body p-35 pt-0">


                                                    <div class="product-quick-view">
                                                        <div class="container">
                                                            <div class="row">
                                                                <div class="col-lg-6">
                                                                    <div class="product-preview-wrap">
                                                                        <div class="tab-content bg-white p-50 b1 br-5">
                                                                            <div class="tab-pane" id="preview_1">
                                                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                                                            </div>
                                                                            <div class="tab-pane active" id="preview_2">
                                                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                                                            </div>
                                                                            <div class="tab-pane" id="preview_3">
                                                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                                                            </div>
                                                                            <div class="tab-pane" id="preview_4">
                                                                                <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" />
                                                                            </div>
                                                                        </div>

                                                                        <ul class="nav nav-tabs flex-nowrap align-content-between mt-30">
                                                                            <li>
                                                                                <a data-toggle="tab" href="#preview_1">
                                                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a class="active" data-toggle="tab" href="#preview_2">
                                                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a data-toggle="tab" href="#preview_3">
                                                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                                                </a>
                                                                            </li>
                                                                            <li>
                                                                                <a data-toggle="tab" href="#preview_4">
                                                                                    <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" />
                                                                                </a>
                                                                            </li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="product-details text-left bg-white ml-25 px-50 py-45 b1 br-5">
                                                                        <h3 class="mb-25 rmt-25">Fresh Onion 1kg</h3>
                                                                        <div class="rating mb-25">
                                                                            <div class="star mr-15">
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                                <i class="fa fa-star"></i>
                                                                            </div>
                                                                            <div class="text">(13 Review)</div>
                                                                        </div>
                                                                        <p>Sed egestas, ante et vulputate volutpat, eropede semper est, vitluctus metus libero eu augue. Morbi purus libero, faucibus adipiscing.</p>
                                                                        <p>commodo quis, gravida id, est. Sed lectus. Praest elemhendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat.lacus a ultrices.</p>

                                                                        <h6>Availability: <span>In Stock</span></h6>
                                                                        <h4 class="price">$120.00</h4>

                                                                        <div class="product-spinner mt-20">
                                                                            <div class="number-input b1">
                                                                              <button class="minus"></button>
                                                                              <input min="1" name="quantity" value="2" type="number">
                                                                              <button class="plus"></button>
                                                                            </div>
                                                                            <a href="#" class="theme-btn br-30 ml-20">Add to Cart</a>
                                                                            <div class="add-wishlist">
                                                                                <i class="fa fa-heart-o"></i>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--==================================== end product-quick-view //product-modal  ================-->
                               
                               
                                </div>
                            </div>

                        </div>
                        
                    </div>
                </div>

                
            </div>
        </section>
       


        <!--==================================================================== 
                            Start footer section
        ================================================
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
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
    <button class="scroll-top scroll-to-target" data-target="jsp"><span class="fa fa-angle-up"></span></button>
<!-- jequery plugins -->
<script src="${pageContext.request.contextPath}/js/mall/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/bootstrap-v4.1.3.min.js"></script>
<script src="js/mall/jquery.nice-select.min.js"></script>
<script src="js/mall/jquery.simpleLoadMore.min.js"></script>
<script src="js/mall/slick.min.js"></script>
<script src="js/mall/appear.js"></script>
<!-- Custom script -->
<script src="js/mall/js/script.js"></script>
 


</body>
</html>

