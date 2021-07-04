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
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-bootstrap.min.css" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-common.css" type="text/css">

 </head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
  
 <div class="container" style="max-width:500px;">
  <h2 class="page-header">Paypal</h2>
 
 <div class="well" >
<%--  <form:form action="${pageContext.request.contextPath}/mall/addProduct" method="post"> --%>
 
<%--  <form  method='post' action="${pageContext.request.contextPath}/mall/paypal/pay"> --%>



<!--  <label for="price">Total</label> -->
<!--  <input  id="price" name="price" type="text" value="10"/> -->
 
<!--  <label for="currency">Currency</label> -->
<!--  <input  id="currency" name="currency" type="text" placeholder="currency"/> -->
 
<!--  <label for="method">payment Method</label> -->
<!--  <input  id="method" name="method" type="text" placeholder="method"/> -->
 
<!--  <label for="intent">Intent</label> -->
<!--  <input  id="intent" name="intent" type="text" value="sale"/> -->
 
<!--  <label for="description">Description</label> -->
<!--  <input  id="description" name="description" type="text" placeholder="dpaymentescription"/> -->
 
<!--  <label for="amount">Amount</label> -->
<!--  <input  id="amount" name="amount" type="text" placeholder="Amount"/> -->



<!-- <input type="submit" value="Continue to checkout" class="btn">  -->
<%--  </form> --%>
<!--  </div> -->
<!--  </div> -->
 
 
 <form method="post" action="${pageContext.request.contextPath}/mall/pay">
  <input  id="amount" name="amount" type="hidden" value=""/>
 
    <button type="submit"><img src="${pageContext.request.contextPath}/images/mall/paypal.png" width="100px;" height="70px;"/></button>
    </form>
    
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