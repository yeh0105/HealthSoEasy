<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link href="css/header&footer.css" rel="stylesheet">
<link href="css/sportMap_index.css" rel="stylesheet">

<meta charset="UTF-8">
<style>
.btn1 {
	border-radius: 20px 20px;
	border-color: #D7FFEE;
	background-color: #D7FFEE;
}
</style>

<title>Sport Map</title>

</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Map</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						揮灑你的汗水，展現你的風采</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						運動使我們充滿活力，活力讓生命變得美麗！</p>
				</div>

			</div>

		</section>
	</div>
	<!-- ------------------------------內容開始區塊--------------------------------- -->

	<div class="mainWrapper">

		<section id="">
			<div >
				
				<img src="${pageContext.request.contextPath}/images/sportMap/MapSport2.png"
					width="45%" height="45%">
					<span class="font1">運動地點說明文字運動地點說明文字運動地點說明文字運動地點說明文字</span>
					
		   </div> 
			
			<div>
			<a href="<c:url value='/sportMapController/displaySportMaps' />"><img
					src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png"
					width="25%" height="25%"></a>			
			</div>
			<div><a href="<c:url value='/sportMapController/displaySportMaps' />"><button
						class="btn1">所有運動地點</button></a>
						
						<a href="#"><button	class="btn1">運動中心</button></a>
						<a href="#"><button	class="btn1">市區場館</button></a>
						<a href="#"><button	class="btn1">游泳池</button></a>
						<a href="#"><button	class="btn1">其他戶外場地</button></a>
			</div>
			<%-- 				<a href="<c:url value='/sportMapController/add' />"><button class="btn1">新增運動地圖</button></a> --%>
		</section>
	
	</div>
	<div class="mainWrapper">	
		<section>
		
			<div>
				<a href="#">熱門運動地點Top 3</a>
			</div>
			<div>				
				<span style="border:1px solid green;height:400px;width:300px"><a href="#">Top 1</a></span>
				<span style="border:1px solid green;height:400px;width:300px"><a href="#">Top 2</a></span>
				<span style="border:1px solid green;height:400px;width:300px"><a href="#">Top 3</a></span>

			</div>
		</section>
	</div>

	



	<!-- ------------------------------內容結束區塊--------------------------------- -->
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />





</body>
</html>