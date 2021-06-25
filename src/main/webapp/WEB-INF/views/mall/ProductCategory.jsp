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
<title>productList</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-bootstrap.min.css" href="${pageContext.request.contextPath}/css/mall/malladmin/mall-common.css" type="text/css">

 </head>

 <body>

<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
 


 <div class="container">
 <h2 class="page-header">分類列表</h2>
 

 <table class="table table-border">

 	<thead>

 <tr>

 	<th>#ID</th>
 	<th>產品名稱</th>
 	<th>產品分類</th>
 	<th>產品描述</th>
 	<th>熱量標示</th>
 	<th>產品庫存</th>
 	<th>產品價格</th>
 	<th>產品上架日期</th>
 	<th>修改</th>

 </tr>

 </thead>

 <tbody>

 <c:forEach items="${product}" var="product">
 
<%--   <c:forEach>標記如何可用於遍歷MallController books model屬性。 --%>

 <tr>

 <td>${product.productId}</td>
 <td>${product.productName}</td>
<%--  <td>${product.category}</td> --%>
 <td>
<c:choose>
<c:when test="${product.category==1}"><span>海鮮餐盒</span></c:when>
<c:when test="${product.category==2}"><span>雞肉餐盒</span></c:when>
<c:when test="${product.category==3}"><span>豬肉餐盒</span></c:when>
<c:when test="${product.category==4}"><span>牛肉餐盒</span></c:when>
<c:when test="${product.category==5}"><span>素食餐盒</span></c:when>
</c:choose>
 </td>
 
 <td>${product.productDescription}</td>
 <td>${product.productCalories}</td>
 <td>${product.productAmount}</td>
 <td>${product.productPrice}</td>
 <td>${product.productDate}</td>
 
 
 
 <td><a href="<c:url value='/mall/lists/${product.productId}'/>"><button>詳情</button></a>
 <a href="<c:url value='/mall/update/${product.productId}'/>"><button>更新</button></a>
 <a onclick="return del(this)" href="${pageContext.request.contextPath }/mall/delete/${product.productId}"><button >刪除</button></a></td>
 </tr>
 

 </c:forEach>

 </tbody>

 </table>
 
 
 <!-- ---------------------------控制分頁用----------------------------------- -->
 
 <nav style="width:300px;margin:0px auto">
 <ul class=pager>
 
<!--  上頁 -->
<li class=previous> 
	<c:choose>
		<c:when test="${currentPage > 1}">
			<a href="<c:url value='/mall/lists?pageNo=${currentPage-1}'/>">Previous</a>
		</c:when>
		<c:otherwise>
			<a>Previous</a>
		</c:otherwise>
	</c:choose>
</li>
<!-- 上頁結束 -->

<li style="font-style:italic;color:	#00477D"><c:out value="${currentPage}"/></li>

 <!--  下頁 -->
<li class=next> 
	<c:choose>
		<c:when test="${currentPage < totalPages}">
			<a href="<c:url value='/mall/lists?pageNo=${currentPage + 1}'/>">Next</a>
		</c:when>
		<c:otherwise>
			<a>Previous</a>
		</c:otherwise>
	</c:choose>
</li>
<!-- 下頁結束 -->
 
</ul>
 </nav>

<!-- ------------------------------控制分頁結束區塊--------------------------------- -->


 
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
