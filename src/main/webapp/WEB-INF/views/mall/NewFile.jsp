<!--                ==================================================================== 
<!--             Start Made For You Section -->
<!--         ===================================================================== --> -->
        <section class="made-for-product text-center pt-45 pb-20">
            <div class="container">
                <div class="section-title mb-45">
                    <h2>Made For You</h2>
                    <p>為您精心挑選每一道料理</p>
                </div>
                <div class="row">

                    single Product
                    <div class="custom-5-item col-xl-3 col-lg-4 col-md-6">
                    <c:forEach  items="${newest}" var="new">
<!--                         <div -->
										class="product list-product d-flex align-items-center bg-white br-5 mb-30">
										<div class="product-img-wrap">
											<img
												src="<c:url value='/mall/getImage/${new.productId}'/>"
												alt="img">
										</div>
										<div class="product-content-wrap">
											<div class="product-content">
												<p>
													<a href="<c:url value='/mall/lists/product/${new.productId}'/>">${new.productName} </a>
												</p>
											</div>
											<div class="product-action">
												<a
													href="<c:url value='/mall/cart/buy/${new.productId}'/>"
													class="add-to-btn small-btn"> <i
													class="flaticon-shopping-cart"></i> <span>Add to
														Cart</span>
													<h5 class="product-price">$${new.productPrice}</h5>
												</a>
											</div>
										</div>
									</div>
                    </c:forEach>
									</div>

                   
<!--                     ==================================== Start product-quick-view //product-modal  ================ -->
<!--                     <div class="modal product-modal fade" id="quick-view" tabindex="-1" role="dialog"  aria-hidden="true"> -->
<!--                         <div class="modal-dialog" role="document"> -->
<!--                             <div class="modal-content"> -->
<!--                                 <div class="modal-header"> -->
<!--                                     <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!--                                         <span aria-hidden="true">&times;</span> -->
<!--                                     </button> -->
<!--                                 </div> -->
<!--                                 <div class="modal-body p-35 pt-0"> -->


<!--                                     <div class="product-quick-view"> -->
<!--                                         <div class="container"> -->
<!--                                             <div class="row"> -->
<!--                                                 <div class="col-lg-6"> -->
<!--                                                     <div class="product-preview-wrap"> -->
<!--                                                         <div class="tab-content bg-white p-50 b1 br-5"> -->
<!--                                                             <div class="tab-pane" id="preview1"> -->
<!--                                                                 <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" /> -->
<!--                                                             </div> -->
<!--                                                             <div class="tab-pane active" id="preview2"> -->
<!--                                                                 <img src="assets/img/product/onion3.png" alt="Product Preview Image" data-magnify-src="assets/img/product/onion3.png" /> -->
<!--                                                             </div> -->
<!--                                                             <div class="tab-pane" id="preview3"> -->
<!--                                                                 <img src="assets/img/product/product23.png" alt="Product Preview Image" data-magnify-src="assets/img/product/product23.png" /> -->
<!--                                                             </div> -->
<!--                                                             <div class="tab-pane" id="preview4"> -->
<!--                                                                 <img src="assets/img/product/onion2.png" alt="Product Preview Image" data-magnify-src="assets/img/product/onion2.png" /> -->
<!--                                                             </div> -->
<!--                                                         </div> -->

<!--                                                         <ul class="nav nav-tabs flex-nowrap align-content-between mt-30"> -->
<!--                                                             <li> -->
<!--                                                                 <a data-toggle="tab" href="#preview1"> -->
<!--                                                                     <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" /> -->
<!--                                                                 </a> -->
<!--                                                             </li> -->
<!--                                                             <li> -->
<!--                                                                 <a class="active" data-toggle="tab" href="#preview2"> -->
<!--                                                                     <img src="assets/img/product/onion3.png" alt="Product Thumbnail Image" /> -->
<!--                                                                 </a> -->
<!--                                                             </li> -->
<!--                                                             <li> -->
<!--                                                                 <a data-toggle="tab" href="#preview3"> -->
<!--                                                                     <img src="assets/img/product/product23.png" alt="Product Thumbnail Image" /> -->
<!--                                                                 </a> -->
<!--                                                             </li> -->
<!--                                                             <li> -->
<!--                                                                 <a data-toggle="tab" href="#preview4"> -->
<!--                                                                     <img src="assets/img/product/onion2.png" alt="Product Thumbnail Image" /> -->
<!--                                                                 </a> -->
<!--                                                             </li> -->
<!--                                                         </ul> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                                 <div class="col-lg-6"> -->
<!--                                                     <div class="product-details text-left bg-white ml-25 px-50 py-45 b1 br-5"> -->
<!--                                                         <h3 class="mb-25 rmt-25">Fresh Onion 1kg</h3> -->
<!--                                                         <div class="rating mb-25"> -->
<!--                                                             <div class="star mr-15"> -->
<!--                                                                 <i class="fa fa-star"></i> -->
<!--                                                                 <i class="fa fa-star"></i> -->
<!--                                                                 <i class="fa fa-star"></i> -->
<!--                                                                 <i class="fa fa-star"></i> -->
<!--                                                                 <i class="fa fa-star"></i> -->
<!--                                                             </div> -->
<!--                                                             <div class="text">(13 Review)</div> -->
<!--                                                         </div> -->
<!--                                                         <p>Sed egestas, ante et vulputate volutpat, eropede semper est, vitluctus metus libero eu augue. Morbi purus libero, faucibus adipiscing.</p> -->
<!--                                                         <p>commodo quis, gravida id, est. Sed lectus. Praest elemhendrerit tortor. Sed semper lorem at felis. Vestibulum volutpat.lacus a ultrices.</p> -->

<!--                                                         <h6>Availability: <span>In Stock</span></h6> -->
<!--                                                         <h4 class="price">$120.00</h4> -->
                                                        
<!--                                                         <div class="product-spinner mt-20"> -->
<!--                                                             <div class="number-input b1"> -->
<!--                                                               <button class="minus"></button> -->
<!--                                                               <input min="1" name="quantity" value="2" type="number"> -->
<!--                                                               <button class="plus"></button> -->
<!--                                                             </div> -->
<!--                                                             <a href="#" class="theme-btn br-30 ml-20">Add to Cart</a> -->
<!--                                                             <div class="add-wishlist"> -->
<!--                                                                 <i class="fa fa-heart-o"></i> -->
<!--                                                             </div> -->
<!--                                                         </div> -->
<!--                                                     </div> -->
<!--                                                 </div> -->
<!--                                             </div> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->

<!--                     ==================================== end product-quick-view //product-modal  ================ -->


<!--                 </div> -->

<!--             </div> -->
<!--         </section> -->

<!--         ==================================================================== 
<!--             End Made For You Section -->
<!--         =====================================================================--> 
        
        
        
        
        
        
        
       
        
        
        
        