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
 
 謝謝!
 
 
 

<!-- ========================================================= -->
 
 
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
