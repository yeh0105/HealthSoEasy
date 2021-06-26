<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1;charset=utf-8">
<title>productList</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-bootstrap.min.css" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-common.css" type="text/css">

 </head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
 

<div class="container" style="max-width:500px;">
  <h2 class="page-header">新增產品</h2>
 
 <div class="well" >
<%--  <form:form action="${pageContext.request.contextPath}/mall/addProduct" method="post"> --%>
 
 <form:form  modelAttribute='category' >
 
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->




 <div class="form-group">
 <label>分類名稱 : </label>
 <form:input  path="productCategoryName" type="text"/>
 <form:errors path="productCategoryName" Class="form-control"/>
 </div>
 

 <p class="text-center">
 <button type=submit class="btn btn-primary">submit</button>
 <button type=reset class="btn btn-primary">reset</button>
 </p>
 

 </form:form>
  </div>
  </div>
 
 
<!--  ====================================== -->


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap.min.js" ></script>
 
 <script src="https//ajax.google"></script><!-- 載入 jQuery 套件 -->
 <script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap3.js"></script>


 <!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />
 </body>

 </html>
