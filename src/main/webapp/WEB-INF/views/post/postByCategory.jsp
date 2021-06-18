<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>POST</title>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/categoryNav.css">
<style type="text/css">
</style>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var likeBtn = document.getElementById("like");
		likeBtn.addEventListener("click", function() {
			console.log("click");
			likeBtn.classList.toggle('red');
		})
	})
</script>

</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<div class="container-fluid">
		<div class="row-fluid" style="width: 80%; padding-left: 10%;">
			<div class="span12">
				<div class="row-fluid"></div>
				<div class="row-fluid">
					<div class="span12">
						<h3
							style="padding-left: 3%; border-top: 7px solid #325b43; border-radius: 5px;">全部</h3>
					</div>
					<div class="span9" style="margin: 0px; margin-bottom: 1%;">
						<nav class="menu">
							<ol>
								<li class="menu-item"><a class="navbara" href="#0">全部</a></li>
								<li class="menu-item"><a class="navbara" href="#0">減肥</a></li>
								<li class="menu-item"><a class="navbara" href="#0">飲食</a></li>
								<li class="menu-item"><a class="navbara" href="#0">運動</a></li>
								<li class="menu-item"><a class="navbara" href="#0">健康</a></li>
								<li class="menu-item"><a class="navbara" href="#0">健身</a></li>
								<li class="menu-item"><a class="navbara" href="#0">講座</a></li>
								<li class="menu-item"><a class="navbara" href="#0">商品</a></li>
								<li class="menu-item"><a class="navbara" href="#0">問答</a></li>
							</ol>
						</nav>
					</div>
					<div class="span3">
						<div>
							<div class="span10">
								<form class="form-search">
									<input class="input-medium search-query" type="text" />
									<button type="submit" class="btn">Search</button>
								</form>
							</div>
							<div class="span1 text-right">
								<button
									class="btn btn-success btn-large glyphicon glyphicon-plus"
									aria-hidden="true" type="button" alt="新增文章"></button>
							</div>
						</div>
					</div>
					<c:forEach var='post' items="${postList}">
						<div class="row-fluid">
							<div class="span9">
								<div class="media">
									<!-- getPicture所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器 -->
									<a class="pull-left" href="#"><img class="media-object"
										style="width: 100px; height: 100px;"
										src="<c:url value='/PostController/getPicture/${post.postId}' />"
										alt='' /> </a>
									<div class="media-body">
										<h4 class="media-heading">${post.postTitle}</h4>
										${fn:substring(post.postContent,0,50)}...
									</div>
								</div>
							</div>
							<div class="span3 text-right">
								<p>
									<a href="#"> <svg viewBox="0 -28 512.001 512"
											xmlns="http://www.w3.org/2000/svg">
										<path
												d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />
									</svg>
									</a>${post.postLike}
								</p>
								<p style="font-size: 15px; color: grey;">
									<br> <br> <br> <br>
									${post.customerBean.customerNickname}
								</p>
							</div>
						</div>
					</c:forEach>
					<div class="pagination pagination-large pagination-centered">
						<ul>
							<li><a href="#">上一页</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<!-- <li><a href="#">4</a></li> -->
							<!-- <li><a href="#">5</a></li> -->
							<li><a href="#">下一页</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>