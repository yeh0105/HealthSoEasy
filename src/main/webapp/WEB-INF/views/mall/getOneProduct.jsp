<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="false"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8"> -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1;charset=utf-8">
<title>餐盒詳情</title>
<!-- 載入CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-bootstrap.min.css" href="${pageContext.request.contextPath}/css//mall/malladmin/mall-common.css" type="text/css">
</head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
 
 
 <div class="container" style="max-width:900px;">
<c:set var="product" value="${product}" ></c:set>
 <h2 class="page-header" style="margin-top:50px;">商品資訊 (
 <c:out value="${product.productName}"/> )</h2>
 
 <div class="" style="display:inline-block;margin-left: 60px">
 <img src="<c:url value='/mall/getImage/${product.productId}' /> " style="height:300px;width:200px;"/>
 </div>
 <div class="well" style="display:inline-block; height:300px;width:500px;margin-left: 20px;margin-top: 50px">

<p><strong>產品ID:</strong><c:out value=" ${product.productId}"/></p>
<p><strong>產品名稱:</strong><c:out value="${product.productName}"/></p>
<p><strong>產品分類:</strong><c:out value="${product.category}"/></p>
<p><strong>產品描述:</strong><c:out value="${product.productDescription}"/></p>
<p><strong>產品標示:</strong><c:out value="${product.productCalories}"/></p>
<p><strong>產品庫存:</strong><c:out value="${product.productAmount}"/></p>
<p><strong>產品價格:</strong><c:out value="${product.productPrice}"/></p>
<p><strong>產品上架日期:</strong><c:out value="${product.productDate}"/></p>
<p><strong>產品成本:</strong><c:out value="${product.productCost}"/></p>
<p><strong></strong></p>
 </div>
 </div>
 
 <br>
 <div class="" style="margin-bottom:70px auto;margin-left: 100px">
  <a href="<c:url value='/mall/lists/'/>"><button>previous page</button></a>
 </div>
 <br>
 
 
<!-- ================================================================ -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap.min.js" ></script>
 
 <script src="https//ajax.google"></script><!-- 載入 jQuery 套件 -->
 <script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap3.js"></script>


 <!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />
 </body>

 </html>