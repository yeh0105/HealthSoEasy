<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>營養師介紹</title>
<style>
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
	width: 698px;
	height: 450px;
	border: blue 1px solid;
}

#nutrit03 {
	float: left;
	width: 300px;
	height: 200px;
}
</style>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />


	<section>
		<img src="images/nutritionistHeader.png" width="100%" height="100%">
	</section>
	<section>

		<div id="nutrit01">
			<img id="nutritImage01" src="images/nutritionist01.png">
		</div>
		<div id="nutrit02"></div>
		<div id="nutrit03"></div>

		<hr>

	</section>


	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>