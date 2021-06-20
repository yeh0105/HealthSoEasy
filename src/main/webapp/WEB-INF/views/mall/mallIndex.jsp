
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/assets/style.css">
<link rel="stylesheet" href="css/assets/responsive.css">
</head>
<body >
<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;"> </h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 25px;">
						</p>
				</div>

			</div>
		</section>
			</div>
			
<section class="hero-section" style="margin-top: 5px;">
            <div class="hero-slider slick-initialized slick-slider slick-dotted">
				<div style="background:url(${pageContext.request.contextPath}/images/mall/indexbanner.jpg) no-repeat; height='800px' ">
                
                    <div class="container">
     
                        <div class="hero-inner">
                        <div style="height:90px"></div>
                            <h1 class="mb-20 light" style="white">Health is<br>
                            <span>what you eat </span></h1>
                            <p class="mb-40 mr-120 light">
                            最健康的飲食都在這裡<br>
                             一場精心給予您的味蕾饗宴
                            </p>
                            <div class="hero-btn">
                            <br>
                            	<a href="<c:url value='/mall/lists' />"><button>Order Now</button></a>
                            <div style="height:320px"></div>
                            
                        </div>
                        </div>
                    </div>
                    </div>
                    </div>       
        </section>
        
                     

<!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />

        
<!-- jequery plugins -->
<script src="js/assets/jquery.min.js"></script>
<script src="js/assets/bootstrap-v4.1.3.min.js"></script>
<script src="js/assets/jquery.nice-select.min.js"></script>
<script src="js/assets/jquery.simpleLoadMore.min.js"></script>
<script src="js/assets/slick.min.js"></script>
<script src="js/assets/appear.js"></script>
<!-- Custom script -->
<script src="assets/js/script.js"></script>



</body>
</html>

