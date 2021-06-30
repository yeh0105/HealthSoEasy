<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>講座介紹</title>

<!-------------------- codepen連結 -------------------->
<!-- 標題字型 -->
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;500&display=swap" rel="stylesheet">
<!-- 輪播 -->



<style>
@import
	url("https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap")
	;

@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

#pageWrapper {
	width: 80%;
	padding-left: 10%;
	padding-right: 10%;
}

#uk_breadcrumb {
	flex-wrap: wrap;
	list-style: none;
	display: flex;
	font-size: 18px;
}

#headerBlank {
	padding: 10px;
}

/* 表頭按鈕 */
.custom-btn {
	width: 130px;
	height: 40px;
	padding: 10px 25px;
	border: none;
	font-family: 'Lato', sans-serif;
	font-weight: 500;
	background: #fff;
	cursor: pointer;
	transition: all 0.3s ease;
	position: relative;
	display: inline-block;
}

/* 5 */
.btn-5 {
	box-shadow: 4px 4px 8px gray;
	background: #fff;
	color: #000;
	line-height: 42px;
	padding: 0;
	border: none;
}

.btn-5:hover {
	background: #fff;
	color: #000;
	box-shadow: -7px -7px 20px 0px #fff9, -4px -4px 5px 0px #fff9, 7px 7px
		20px 0px #0002, 4px 4px 5px 0px #0001;
}

.btn-5:before, .btn-5:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #000;
	transition: 400ms ease all;
}

.btn-5:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

.btn-5:hover:before, .btn-5:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

/* 搜尋bar */
.search-bar {
	position: relative;
}

/* 講座列表 */
.header-title {
	/*   margin-right: auto; */
	position: relative;
	text-align: left;
	color: #353535;
	font-family: 'Oswald', sans-serif;
	font-size: 26px;
	margin: 0;
}

/*  ==============================CodePen貼過來的============================== */

/* ==============================CodePen貼過來的結尾============================ */
</style>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
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
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<!-- 	綠底標頭 -->
	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Lecture</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						吃對食物才會越吃越瘦、正確運動才不會造成運動傷害！</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						讓各領域專業講師帶您一起變瘦變健康！</p>
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
				href='<c:url value='/lecturerController/getAllLecturers' />'><button
					class="custom-btn btn-5">講師介紹</button></a> <input type="text"
				class="search-bar" placeholder="搜尋講座">

		</div>
		<hr>
	</div>

	<!-- 進行中講座區 -->
	<div id='pageWrapper'>
		<div class="header-title">On-Going Lecture</div>

		<hr>


		<!-------------------------------- CodePen貼過來的 -------------------------------->
		
		<!--  ------ -->
	</div>
	<!-- ------------------------------------------------------------------------------>

	<!-- 即將舉辦講座區 -->
	<div id='pageWrapper'>
		<div class="header-title">Upcoming Lecture</div>

		<hr>
	</div>

	<!-- 精采回顧區 -->
	<div id='pageWrapper'>
		<div class="header-title">Archived Lecture</div>

		<hr>
	</div>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>