<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header的css -->
<link href="css/header&footer.css" rel="stylesheet">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<%-- 	<jsp:include page="/fragment/header.jsp" /> --%>
	<div id="mainWrapper">
		<header>
			<div id="logo">
				<img src="images/ICON.png">
			</div>
			<div id="headerLinks">
				<a href="#" title="Login/Register">登入/註冊</a> <a href="#"
					title="Cart">購物車</a>
			</div>
			<nav>
				<a href="index.jsp" title="Link">首頁</a> 
				<a href="#" title="Link">園地</a> 
				<a href="#" title="Link">講座</a> 
				<a href="#" title="Link">商城</a> 
				<a href="postIndex.jsp" title="So Share">分享</a> 
				<a href="#" title="Link">地圖</a> 
				<a href="#" title="Link">客服</a>
			</nav>
		</header>

</body>
</html>