<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	width: 500px;
	height: 450px;
	background-color: #1d3b2a;
	display: flex;
	align-items: center;
	justify-content: center;
}

#nutritImage01 {
	width: auto;
	height: 300px;
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

#uk_breadcrumb {
	flex-wrap: wrap;
	list-style: none;
	display: flex;
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

			<div>
				<ul id="uk_breadcrumb">
					<li href="<c:url value='/'/>">首頁</li>
					<li href="<c:url value='/getAllNutritionists' />">&emsp;&frasl;&emsp;營養師列表</li>
					<li href="#">&emsp;&frasl;&emsp;營養師介紹</li>
				</ul>

			</div>
			<div id="nutrit01">
				<img id="nutritImage01"
					src="${pageContext.request.contextPath}/images/nutritionist/nutritionist01.png">
			</div>
			<div id="nutrit02">
				<h3 id="dr_title">營養師基本資料</h3>
				<a>1. 姓名:</a><br> <br> <a>2. 性別:</a><br> <br> <a>3.
					學位:</a><br> <br> <a>4. E-mail:</a><br> <br> <a>5.
					專長:</a><br> <br>
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
			<div>
				<a href="<c:url value='/nutritionistController/addNutritionist'/>">
					<button type="button">新增營養師</button>
				</a>
			</div>
			<div>
				<a href="<c:url value='/nutritionistController/getAllNutritionists'/>">
					<button type="button">查詢全部營養師</button>
				</a>
			</div>
		</section>

	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>