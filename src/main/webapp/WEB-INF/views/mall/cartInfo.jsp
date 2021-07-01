<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"  %>
    
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
 
 <!-------------- start of container------------- -->
   
    <div class="container">
   
 <!-- -------------(End) start of container ------------------>
 
 
 
 <h2 class="page-header">Shoppingcart  [目前有${countItems}項商品]</h2>
 
 <p class="text-right"><a href="<c:url value='/mall/lists'/>" class="btn btn-primary">繼續購物</a><p>

<form method="post" action="${pageContext.request.contextPath}/mall/cart/update">
<!-- =================   表格開始    ======================================== -->

 <table class="table table-border">
 	<thead>

 <tr>
	
	<th>Action</th>
	<th>product</th>
 	<th>Name</th>
 	<th>Quantity</th>
<!--  <button class="btn" type="button" value="submit">confirm</button> -->
<!--  <button class="btn" type="button">+</button> -->
 	<th>price</th>
 	<th>SubTotal</th>
 	
 </tr>

 </thead>

 <tbody>
 <c:forEach var="item" items="${sessionScope.cart}" varStatus="i">
 <tr>
 
<!--  移除按鈕 -->
 <td><a class="btn btn-danger" href="${pageContext.request.contextPath}/mall/cart/remove/${i.index}">x<i class="icon-remove icon-white"></i></a></td>
 <td>#圖片</td>
 <td>${item.product.productName}</td>
 
 <!--  數量 -->
 <td>
 <div class="number-input">
 <input class="quantity" style="max-width:50px;text-align:center" placeholder="1" min="1" max="50"
 id="appendedInputButtons" size="15" type="number" name="quantities" value="${item.cartQuantity}">
 <c:if test="${sessionScope.cart!=null}">
 <button  class="btn btn-primary" type="submit">Update</button>
 </c:if>
 </div>
 </td>
 <!--  (end)數量 -->
 
 <td>$${item.product.productPrice}</td>
 <td>$${item.product.productPrice*item.cartQuantity}</td>
 </tr>

 </c:forEach>
 <tr>
 
 
<td style="text-align:right"><strong>ToTal</strong></td>
<td align="center" style="display:block">$${total}</td>
 </tr>
 
 </tbody>
 
  
 </table>


<!-- ========================================================= -->
 
 </form>
 
  <p class="text-right"><a href="<c:url value='/mall/lists'/>" class="btn btn-primary">繼續購物</a><p>
  <p class="text-right"><a href="<c:url value='/mall/cart/checkout'/>" class="btn btn-primary">結帳</a><p>
 
 

 
  <!-------------- end of container------------- -->
   </div>
  <!-- -------------end of container ------------------>
 
    <!-- 用於將 POST 請求轉換為 DELETE請求 -->
<!--     暫時放棄 先直接用Post請求 -->
<form action="#" method="POST">
    <input type="hidden" value="DELETE" name="_method" />
 </form>
 
  <script type="text/javascript">
  //將 get 請求轉換為 post 請求提交
  function del(tag) {
    //獲取當前請求路徑
    var href = tag.href;
    //提交
    $("form").attr("action", href).submit();
    return false;
  }
  
  </script>
 

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap.min.js" ></script>
 
 <script src="https//ajax.google"></script><!-- 載入 jQuery 套件 -->
 <script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap3.js"></script>


 <!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />
 </body>

 </html>
