<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SOEASY</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/responsive.css">

</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	
	<section class="hero-section" style="margin-bottom:50px">
            	<div style="display: flex;justify-content:center;width: 100%;height: 750px;background-image: url('${pageContext.request.contextPath}/images/indexImg.jpg');background-repeat: no-repeat;background-position: center;">
            
                    <div class="container" style="margin-top:100px">
                          
                        <div class="hero-inner">
                            <h1 class=" light" style="padding-left:480px;">  <BR>
                             <span>Health</span> <br>SO <br>EASY</h1>
                            <p style="padding-left:485px;padding-top:70px;font-weight: bold;">為您的健康量身打造的綜合平台<br>
                               </p>
                            
                        </div>
                    </div>
                </div>
	 </section>
	 
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp"/>
	    

<!-- jequery plugins -->
<script src="${pageContext.request.contextPath}/js/mall/bootstrap-v4.1.3.min.js"></script>
        <!-- Custom script -->
<script src="${pageContext.request.contextPath}/js/mall/js/script.js"></script>
	
</body>
</html>