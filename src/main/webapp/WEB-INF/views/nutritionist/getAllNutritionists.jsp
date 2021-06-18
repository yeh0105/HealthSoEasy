<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢全部營養師列表</title>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<section>
		<img
			src="${pageContext.request.contextPath}/images/nutritionist/nutritionistHeader.png"
			width="100%" height="100%">
	</section>
	<section>
		<div>
			<ul id="uk_breadcrumb">
				<li href="<c:url value='/'/>">首頁</li>
				<li href="#">&emsp;&frasl;&emsp;營養師列表</li>
			</ul>
		</div>
		<div>
		<a href="<c:url value='/getAllNutritionists' />"><button>所有營養師</button></a>
		<a href="<c:url value='/addNutritionist' />"><button>新增營養師</button></a>
		</div>
		

	</section>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>