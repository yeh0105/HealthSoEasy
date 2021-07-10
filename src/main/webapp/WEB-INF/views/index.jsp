<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOEASY</title>
<link rel='short icon' href="${pageContext.request.contextPath}/favicon.ico"  />
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	
	<div style="display: flex;justify-content:center;width: 80%;height: 800px;background-image: url('${pageContext.request.contextPath}/images/indexImg.jpg');background-repeat: no-repeat;background-position: center;background-size: cover;margin: 0 10% 0 10%">
<%-- 	<img src="${pageContext.request.contextPath}/images/pic8.jpg"> --%>
		
    </div>
	
	
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>