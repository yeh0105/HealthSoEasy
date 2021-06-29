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
 

<div>
 
<span class="text-right"><a href="<c:url value='/mall/add'/>" class="btn btn-primary">New Product</a></span>
<span class="text-right"><a href="<c:url value='/mall/category'/>" class="btn btn-primary">分類</a></span>
<span class="text-right"><a href="<c:url value='/mall/cart/index'/>" class="btn btn-primary">購物車</a></span>
</div>
&nbsp;

<div >
<form action="<c:url value='/mall/lists/1'/>">
<input type="hidden" name="sortField"  value="${sortField}"/>
<input type="hidden" name="sortDir"  value="${sortDir}"/>
查詢:
<input type="text" name="keyword"  value="${keyword}" required/>
&nbsp;
<input type="submit" value="Search"/>
&nbsp;
<input type="button" value="clear" onclick="clearFilter()">
</form>



</div>


 <table class="table table-border">

 	<thead>

 <tr>

 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productId&sortDir=${reverSortDir}'/>"><button>#ID</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productName&sortDir=${reverSortDir}'/>"><button>產品名稱</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=category&sortDir=${reverSortDir}'/>"><button>產品分類</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productCategory&sortDir=${reverSortDir}'/>"><button>分類(測試用)</button></a></th>
 	<th>產品描述</th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productCalories&sortDir=${reverSortDir}'/>"><button>熱量</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productAmount&sortDir=${reverSortDir}'/>"><button>產品庫存</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productPrice&sortDir=${reverSortDir}'/>"><button>產品價格</button></a></th>
 	<th> <a href="<c:url value='/mall/lists/${currentPage}?sortField=productDate&sortDir=${reverSortDir}'/>"><button>產品上架日期</button></a></th>
 	<th>修改</th>
 	<th>購買</th>
 	

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
 
 <td></td>
 <td>${product.productDescription}</td>
 <td>${product.productCalories}</td>
 <td>${product.productAmount}</td>
 <td>${product.productPrice}</td>
 <td>${product.productDate}</td>
 <td><a href="<c:url value='/mall/lists/product/${product.productId}'/>"><button>詳情</button></a>
 <a href="<c:url value='/mall/update/${product.productId}'/>"><button>更新</button></a>
 <a onclick="return del(this)" href="${pageContext.request.contextPath }/mall/delete/${product.productId}"><button >刪除</button></a></td>
 <td><a href="<c:url value='/mall/cart/buy/${product.productId}'/>"><button>加入購物車</button></a></td>
 </tr>
 

 </c:forEach>

 </tbody>

 </table>
 
 
 <!-- ---------------------------控制分頁用----------------------------------- -->
 <span>產品總數:<c:out value="${totalItems}"/></span>
 <nav style="width:300px;margin:0px auto">
 
 
 
<ul class=pager>

<!--  上頁 -->
<li class=previous> 
	<c:choose>
		<c:when test="${currentPage > 1}">
			<a href="<c:url value='/mall/lists/${currentPage - 1}?sortField=${sortField}&sortDir=${reverSortDir}'/>">Previous</a>
		</c:when>
		<c:otherwise>
			<a>Previous</a>
		</c:otherwise>
	</c:choose>
</li>
<!-- 上頁結束 -->

<li style="font-style:italic;color:	#00477D">Page &nbsp;<c:out value="${currentPage}"/>&nbsp; of &nbsp;&nbsp;<c:out value="${totalPages}"/></li>


 <!--  下頁 -->
<li class=next> 
	<c:choose>
		<c:when test="${currentPage < totalPages}">
			<a href="<c:url value='/mall/lists/${currentPage + 1}?sortField=${sortField}&sortDir=${reverSortDir}'/>">Next</a>
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
       return delmag();
       
       function delmag() {
    	   var msg = "您確定要刪除這樣產品嗎？";
    	   if (confirm(msg)==true){
    	   return true;
    	   }else{
    	   return false;
    	   }
    	   }
     }
  </script>
  
  <!-- ======================    綁定清除查詢 ================================-->
  
  
  <script type="text/javascript">
    function clearFilter(){
		window.location='/soeasy/mall/lists';     
    }
  </script>
  
  <!-- ==========================   (End) 綁定清除查詢========================-->
  

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap.min.js" ></script>
 
 <script src="https//ajax.google"></script><!-- 載入 jQuery 套件 -->
 <script src="${pageContext.request.contextPath}/js/mall/malladmin/mall-bootstrap3.js"></script>


 <!-- 引入共同的頁尾  copy這行-->
<jsp:include page="/fragment/footer.jsp" />
 </body>

 </html>
