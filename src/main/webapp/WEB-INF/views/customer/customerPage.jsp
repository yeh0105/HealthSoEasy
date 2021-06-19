<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">

<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/customerPage.css" rel="stylesheet">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	
	
	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">About You</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Taking Our Health in Our Hands!</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Let's Know About You.</p>
				</div>

			</div>
		</section>
	</div>
	<div class="customer-main">
		<div>
			<div class="customer-img">
				<div>
					<img alt="" src="${pageContext.request.contextPath}/images/goodcat.jpg">
				</div>
			</div>
			<div class="customer-information" >
				<div class="customer-information-inside">
<!-- 					<form action=""> -->
<!-- 						<label for="customerName"> -->
<!-- 							姓名： -->
<!-- 							<input id="customerName" type="text" placeholder="請輸入姓名"> -->
<!-- 						</label> -->
<!-- 						<label for="customerNicnkname"> -->
<!-- 							暱稱： -->
<!-- 							<input id="customerNicnkname" type="text" placeholder="請輸入暱稱"> -->
<!-- 						</label> -->
<!-- 						<label for="customerPhone"> -->
<!-- 							電話： -->
<!-- 							<input id="customerPhone" type="text" placeholder="請輸入電話"> -->
<!-- 						</label> -->
<!-- 						<label for="customerBirthDay"> -->
<!-- 							生日： -->
<!-- 							<input id="customerBirthDay" type="date" placeholder="請輸入姓名"> -->
<!-- 						</label> -->
<!-- 					</form> -->
						<div class="customer-information-items">
							<div>姓名：</div>
							<div>暱稱：</div>
							<div>電話：</div>
							<div>生日：</div>
						</div>
				</div>
			</div>
		</div>
		<div>
			<div class="customer-health-information"></div>
			<div class="customer-favorite"></div>
		</div>
	</div>



	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>