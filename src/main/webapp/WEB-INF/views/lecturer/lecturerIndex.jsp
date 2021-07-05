<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講師介紹</title>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/categoryNav.css">
<link href="css/header&footer.css" rel="stylesheet">

<!-- 標題字型 -->
<link
	href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;500&display=swap"
	rel="stylesheet">
<!-- 輪播 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/lecture/lectureIndex.css">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<!-- 	綠底標頭 -->
	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Lecturer</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">現在開始你/妳的健康革命！</p>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">聽聽講師怎麼說，讓你越吃越瘦、越動越健康！</p>
				</div>
			</div>
		</section>
	</div>

	<!---------------------- 內容開始區 ---------------------->

	<!------- 小表頭區 ------->
	<div id='pageWrapper'>
		<div id='headerBlank'>
			<a href='<c:url value='/'></c:url>'><button
					class="custom-btn btn-5">首頁</button></a> <a
				href='<c:url value='lectureIndex' />'><button
					class="custom-btn btn-5">講座介紹</button></a> <input type="text"
				class="search-bar" placeholder="搜尋講座">
		</div>
		<hr>
	</div>

	<!-- 講師介紹 -->


	<!-- JS引入 -->
	<script
		src="${pageContext.request.contextPath}/js/lecture/lectureIndex.js"></script>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>