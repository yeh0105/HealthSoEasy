<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>

<title>營養師介紹</title>
<style>
#mainWrapper2 {
	width: 80%;
	padding-left: 10%;
	padding-right: 10%;
}

body * {
	font-family: '微軟正黑體';
}

#nutrit01 {
	float: left;
	width: 510px;
	height: 450px;
	background-color: #1d3b2a;
	display: flex;
	align-items: center;
	justify-content: center;
}

#nutritImage01 {
	width: auto;
	width: 80%;
	height: 70%;
	border: black 1px solid;
}

#nutrit02 {
	float: right;
	width: 670px;
	height: 450px;
}

#nutrit03 {
	float: left;
	width: 1000px;
	height: 400px;
}

#content1 {
	text-decoration: none;
	color: #008000;
}

#uk_breadcrumb {
	flex-wrap: wrap;
	list-style: none;
	display: flex;
	font-size: 18px;
}

#uk_breadcrumb li a {
	text-decoration: none;
	size: 20;
}

#dr_title {
	color: #FF9900;
	border-bottom: black 3px solid;
	font-family: '微軟正黑體';
}

#slim {
	color: #800000;
	float: left;
	width: 25%;
	text-align: center;
	font-family: '微軟正黑體';
}
</style>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<section>
		<img
			src="${pageContext.request.contextPath}/images/nutritionist/nutritionistHeader.png"
			width="100%" height="100%">
	</section>
	<div id='mainWrapper2'>

		<section>
			<br>
			<div>
				<ul id="uk_breadcrumb">
					<li><a href='<c:url value='/'></c:url>'>首頁</a></li>
					<li><a
						href='<c:url value='/nutritionistController/getAllNutritionists' />'>&emsp;&frasl;&emsp;營養師列表</a></li>
					<li>&emsp;&frasl;&emsp;營養師介紹</li>
				</ul>
			</div>
			<hr>
			<div id="nutrit01">
				<img id="nutritImage01"
					src="<c:url value='/nutritionistController/getImage/${nutritionistBean.nutritionistId}' />">
			</div>
			<div id="nutrit02">
				<h2 id="dr_title">營養師基本資料</h2>
				<font size="5">1. 姓名 : <a id='content1'>${nutritionistBean.nutritionistName}
				</a></font><br>
				<br> <font size="5">2. 性別 : <a id='content1'>${nutritionistBean.nutritionistGender == 'F' ? "女性" : "男性"}</a></font><br>
				<br> <font size="5">3. 學位 : <a id='content1'>${nutritionistBean.nutritionistDegree}</a></font><br>
				<br> <font size="5">4. E-mail : <a id='content1'>${nutritionistBean.nutritionistEmail}</a></font><br>
				<br> <font size="5">5. 專長 : <a id='content1'>${nutritionistBean.nutritionistCategory}</a></font><br>
				<br>
			</div>

			<div id="nutrit03">
				<h3>推薦菜單</h3>
				<div id="slim">
					<h4>A套餐 (減肥)</h4>
					<button type="button">
						<img
							src="${pageContext.request.contextPath}/images/nutritionist/food_01.png">
					</button>
					<br>
					<button type="button">加入購物車</button>
				</div>
				<div id="slim">
					<h4>B套餐 (健身)</h4>
					<button type="button">
						<img
							src="${pageContext.request.contextPath}/images/nutritionist/food_02.png">
					</button>
					<br>
					<button type="button">加入購物車</button>
				</div>
				<div id="slim">
					<h4>C套餐 (加鈣)</h4>
					<button type="button">
						<img
							src="${pageContext.request.contextPath}/images/nutritionist/food_03.png">
					</button>
					<br>
					<button type="button">加入購物車</button>
				</div>
			</div>
		</section>

	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>