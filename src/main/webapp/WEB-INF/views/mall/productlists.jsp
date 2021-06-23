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
 <h2 class="page-header">商品列表</h2>
 
<!--  夜面更新 -->
 
<%--  <c:set var="message" value="${message}" ></c:set> --%>
<!--  <div  class="alert alert-success alert-dismissable fade in"> -->
<!--  <a href="#" class="close" data-dismiss="alert">&times;</a> -->
<%--  <strong>恭喜 </strong> --%>
<%--  <span><c:out value="${message.productName}"/>更新成功</span> --%>
 

<!--  </div> -->
 

 
 <p class="text-right"><a href="<c:url value='/mall/add'/>" class="btn btn-primary">New Product</a><p>

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
 <td>${product.category}</td>
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
 
 <nav>
 <ul class=pager>
 
<li class=previous>
<a href="<c:url value='/mall/lists/${currentPage-1}'/>">Previous</a>
</li>
 
<!--  <li class=previous><a href="#">上一頁</a></li> -->
 
 <li class=next>
<a href="<c:url value='/mall/lists/${currentPage+1}'/>">Next</a>
</li>
 
</ul>
 
</nav>
 
 
 
 
<!-- 	<div class='container'> -->
<!-- 		<table border="1" id="tb2"> -->
<!-- 			<tr align="center"> -->
<%-- 				<td w><c:if test="${pageNo > 1}#tb2"> --%>
<!-- 						<div id=""> -->
<%-- 							<a href="<c:url value='lists?pageNo=1' />"> <img --%>
<!-- 								border='0' alt='第一頁' height='30' width='30' /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if></td> --%>
<%-- 				<td ><c:if test="${pageNo > 1}"> --%>
<!-- 						<div id=""> -->
<!-- 							<a -->
<%-- 								href="<c:url value='lists?pageNo=${pageNo-1}#tb2' />"> --%>
<!-- 								<img border='0' alt='前一頁' height='30' width='30' /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if></td> --%>
<%-- 				<td width='76'>${pageNo}/ ${totalPages}</td> --%>
<%-- 				<td width='80'><c:if test="${pageNo != totalPages}"> --%>
<!-- 						<div id=""> -->
<!-- 							<a -->
<%-- 								href="<c:url value='lists?pageNo=${pageNo+1}#tb2' />"> --%>
<!-- 								<img border='0' alt='下一頁' height='30' width='30' /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if></td> --%>
<%-- 				<td width='80'><c:if test="${pageNo != totalPages}"> --%>
<!-- 						<div id=""> -->
<!-- 							<a -->
<%-- 								href="<c:url value='lists?pageNo=${totalPages}#tb2' />"> --%>
<!-- 								<img border='0' alt='最末頁' height='30' width='30' /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if></td> --%>
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</div> -->

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
