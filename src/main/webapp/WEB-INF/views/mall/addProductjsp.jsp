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
<title>Insert title here</title>

<link rel="stylesheet" href="<c:url value="/css/mall-bootstrap.min.css"/>" href="<c:url value="/css/mall-common.css"/>" type="text/css"">

 </head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
 

 <h2>建置中</h2>
 <div class="container">
 <h2 class="page-header">商品列表</h2>
 <table class="table table-border">

 <thead>

 <tr>

 <th>產品ID</th>

 <th>產品名稱</th>
 <th>產品分類</th>
 <th>產品描述</th>
 <th>熱量標示</th>
 <th>產品庫存</th>
 <th>產品價格</th>
 <th>產品上架日期</th>
<!--  <th>產品圖片</th> -->
 <th>修改</th>

 </tr>

 </thead>

 <tbody>

 <c:forEach items="${product}" var="product">
 
<%--   <c:forEach>標記如何可用於遍歷MallController books model屬性。 --%>

 <tr>

 <td>${product.productId}</td>
 <td>${product.productName}</td>
 <td>${product.category}</td>
 <td>${product.productDescription}</td>
 <td>${product.productCalories}</td>
 <td>${product.productAmount}</td>
 <td>${product.productPrice}</td>
 <td>${product.productDate}</td>
<%--  <td>${product.productImg}</td> --%>
 <td><a href="<c:url value='/mall/lists/${product.productId}'/>"><button>詳情</button></a></td>

 </tr>

 </c:forEach>

 </tbody>

 </table>
 </div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/mall-bootstrap.min.js" ></script>
 
 <script src="https//ajax.google"></script><!-- 載入 jQuery 套件 -->
 <script src="js/mall-bootstrap3.js"></script>


 <!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />
 </body>

 </html>
