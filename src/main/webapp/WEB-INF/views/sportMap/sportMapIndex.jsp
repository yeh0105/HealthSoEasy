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
<link href="${pageContext.request.contextPath}/css/sportMap_index.css"
	rel="stylesheet">

<meta charset="UTF-8">
<style>
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

	<div class="centerDiv">
		<div class="btnBy1">
			依分類：
			<div>
				<a href="<c:url value='/sportMapController/displaySportMaps' />"><button class="font1">所有運動地點</button></a>
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=1' />"><button class="font1">運動中心</button></a>
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=2' />"><button class="font1">市區場館</button></a>

			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=3' />"><button class="font1">游泳池</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他室內場地</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他戶外場地</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他1</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他2</button></a>
			</div>
			

		</div>
		<div>
			<a href="<c:url value='/sportMapController/displaySportMaps' />"><img
				src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png"
				width="100%" height="100%"></a>
		</div>
		<div class="btnBy1">
			依區域：
			<div>
				<a href="#"><button class="font1">地區A</button></a>
<!-- 				<a href="#"><button class="font1">地區B</button></a> -->
			</div>
			<div>
				<a href="#"><button class="font1">地區C</button></a>
				<a href="#"><button class="font1">地區D</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區E</button></a>
				<a href="#"><button class="font1">地區F</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區G</button></a>
				<a href="#"><button class="font1">地區H</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區 I</button></a>
				<a href="#"><button class="font1">地區J</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區K</button></a>
				<a href="#"><button class="font1">地區L</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區M</button></a>
				<a href="#"><button class="font1">地區N</button></a>
			</div>
			<div>
<!-- 				<a href="#"><button class="font1">地區O</button></a> -->
				<a href="#"><button class="font1">地區P</button></a>
			</div>
			
		</div>
	</div>

	<div class="centerDiv">

		<div>

			<img
				src="${pageContext.request.contextPath}/images/sportMap/MapSport2.png"
				width="90%" height="90%">
		</div>
		<div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
					

		</div>
	</div>


	<div class="centerDiv">
		<div>

			<div>熱門運動地點Top 3</div>
			<div id="showTop3">
				<span style="border: 1px solid green; height: 400px; width: 300px"><a
					href="#">Top 1</a></span> <span
					style="border: 1px solid green; height: 400px; width: 300px"><a
					href="#">Top 2</a></span> <span
					style="border: 1px solid green; height: 400px; width: 300px"><a
					href="#">Top 3</a></span>
			</div>
		</div>

	</div>



	<!-- ------------------------------內容結束區塊--------------------------------- -->
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />





</body>
</html>