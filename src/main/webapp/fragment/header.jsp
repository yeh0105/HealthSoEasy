<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header的css -->
	<link href="${pageContext.request.contextPath}/css/header&footer.css" rel="stylesheet">
</head>

<body>
	<!-- 引入共同的頁首  copy這行-->
	<%-- 	<jsp:include page="/fragment/header.jsp" /> --%>
	<div class="mainWrapper">
		<header>
			<div id="logo">
				<img src="${pageContext.request.contextPath}/images/ICON.png">
			</div>
			<div id="headerLinks">
				<c:if test="${empty customerSignInSuccess}">
					<a href="<c:url value='/customerController/addCustomer'></c:url>" title="Login/Register">登入/註冊</a> 			
				</c:if>
				<c:if test="${!empty customerSignInSuccess}">
					<jsp:include page="/fragment/customerMenu.jsp" />
				</c:if>
				<a href="#" title="Cart">購物車</a>
			</div>
			<nav>
				<a href="<c:url value='/'></c:url>" title="Link">首頁</a> 
				<a href="#" title="Link">園地</a> 
				<a href="#" title="Link">講座</a> 
				<a href="#" title="Link">商城</a> 
				<a href="<c:url value='/postIndex'></c:url>" title="So Share">分享</a> 
				<a href="<c:url value='/showSportMapIndex'></c:url>" title="SportMap">地圖</a> 
				<a href="<c:url value='/nutritionist'></c:url>" title="Link">客服</a>
			</nav>
		</header>
	</div>
</body>
</html>