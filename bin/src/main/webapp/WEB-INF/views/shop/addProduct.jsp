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
<title>Add Product</title>
<link rel='short icon' href="${pageContext.request.contextPath}/favicon.ico"  />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-bootstrap.min.css" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-common.css" type="text/css">

 </head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
  
 <div class="container" style="max-width:500px;">
  <h2 class="page-header">新增產品</h2>
 
 <div class="well" >
<%--  <form:form action="${pageContext.request.contextPath}/mall/addProduct" method="post"> --%>
 
 <form:form  modelAttribute='product' enctype="multipart/form-data" >
 
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->

 <div class="form-group">
 <label>產品名稱 : </label>
 <form:input  path="productName" type="text"/>
 <form:errors path="productName" Class="form-control"/>
 </div>
 
 <div class="form-group">
 <label >產品描述 : </label><form:textarea path='productDescription' type="text"  cols="60" rows="10"/>
  <form:errors path="productDescription" Class="form-control" />
 </div>
 
 <div class="form-group">
 <label>產品價格 : </label>
 <form:input  path="productPrice" type="text"/>
 <form:errors path="productPrice" Class="form-control"/>
 </div>
 
 <div class="form-group">
 <label >產品熱量 : </label><form:input path='productCalories' type="text"/>
  <form:errors path="productCalories" Class="form-control" />
 </div>
 
 <div class="form-group">
 <label>產品庫存 : </label>
 <form:input  path="productAmount" type="text"/>
 <form:errors path="productAmount" Class="form-control"/>
 </div>
 
 <div class="form-group">
 <label >產品分類 : </label>
 <form:select path="category" type="text">
  <option value=1>生鮮食品</option>
 <option value=2>雞肉餐盒</option>
 <option value=3>牛肉餐盒</option>
 <option value=4>豬肉餐盒</option>
 <option value=5>海鮮餐盒</option>
 <option value=6>素食餐盒</option>
 <option value=7>飲品</option>
 
 </form:select>
 
 <form:errors path="category" Class="form-control" />
 </div>
<!-- 				<div class="form-group"> -->
<!-- 					<label>產品分類 : </label> -->
<%-- 					<form:select path="category.productCategoryId" type="text" class="form-control"> --%>
<%-- 						<c:forEach var="category" items="${categories}"> --%>
<%-- 							<optgroup label="${category.productCategoryName} "></optgroup> --%>

<%-- 						</c:forEach> --%>
<%-- 					</form:select> --%>

<!--  				</div> -->



<div class="form-group">
 <label>產品成本 : </label>
 <form:input  path="productCost" type="text"/>
 <form:errors path="productCost" Class="form-control"/>
 </div>
 
 
<!--  ====================PIC=========================== -->
 

 <div class="form-group">
 <label >圖片上傳</label>
 <form:input path='productMultiImg' type="file" />
  <form:errors path="productMultiImg" Class="error" />
 </div>


<!--  <div class="form-group"> -->
<!--  <label >圖片上傳</label> -->
<!--  <input name='mainPicture' id='mainPicture' type="file" accept="image/png,image/jpeg"/> -->
<!--   <img id="thumbnail" alt="Preview" > -->
<!--  </div> -->
 
 
 <!--  ===================(E)PIC=========================== -->
 
 
 
 <p class="text-center">
 <button type=submit class="btn btn-primary">submit</button>
 <button type=reset class="btn btn-primary">reset</button>
 </p>
 

 </form:form>
  </div>
  </div>
  
  
  
  
  
  <script type="text/javascript">
  
  $(document).ready(function(){
	  $('#mainPicture').change(function(){
		  showImageThumbnail(this);
	  });
  })
  
  function showImageThumbnail(fileInput){
	  file=fileInput.files[0];
	  reader = new FileReader();
	  
	  reader.onload=function(e){
		  $('#thumbnail').attr('src',e.target.result);
		  };
		  reader.readAsDataURL(file);
  }
  
  
  
  </script>
 
 
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