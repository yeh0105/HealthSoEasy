<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So Share</title>
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
<link rel="stylesheet" href="css/categoryNav.css">
<link rel="stylesheet" href="css/header&footer.css">
<script>
document.addEventListener("DOMContentLoaded",function() {
	
	//變數宣告------------------------------------------------------------

	var top3Posts;

	//變數宣告------------------------------------------------------------
	
	//載入時 取得所有文章的Top3-----------------------------------------------------
	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open("GET","<c:url value='/PostController/getTop3Post'/>",true);
	//對伺服器發送請求
	xhr.send();
	//當readyState屬性值改變時呼叫此方法
	xhr.onreadystatechange = function() {
	if (xhr.readyState == 4 && xhr.status == 200) {

		var top3Posts = JSON.parse(xhr.responseText);
		console.log(xhr.responseText);

		displaytop3Post(); // 顯示讀取到的非文字性資料
		}
	}
	
	// 顯示送回來的所有文章
	function displaytop3Post() {
		
		let content = "";
		
		(top3Posts).forEach(post =>{
			
			<li class="span4">
			<div class="thumbnail">
				<img alt="300x200" src="images/post/product_01.jpg" />
				<div class="caption">
					<h3>缩略图标题</h3>
					<p>123456</p>
					<a
						href="<c:url value='/PostNeedLoginController/getPost/${post.postId}' />">
						>>>觀看更多 </a>
					<div style="display: flex;">
						<p>
							<a href="#"> <img alt=""
								src="images/post/heart-empty.png" width="7%" height="7%">
							</a>123
						<p style="font-size: 15px; color: grey;">By NickName</p>
						</p>
					</div>
				</div>
			</div>
		</li>
	}
})
</script>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Share</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Taking Our Health in Our Hands!</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Let's Share Your Story.</p>
				</div>

			</div>

		</section>
	</div>

	<div class="container-fluid" style="width: 80%; padding-left: 10%;">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span12">
						<h3>熱門文章</h3>
						<ul class="thumbnails" id=insertTop3>
<!-- 							<li class="span4"> -->
<!-- 								<div class="thumbnail"> -->
<!-- 									<img alt="300x200" src="images/post/product_01.jpg" /> -->
<!-- 									<div class="caption"> -->
<!-- 										<h3>缩略图标题</h3> -->
<!-- 										<p>123456</p> -->
<!-- 										<a -->
<%-- 											href="<c:url value='/PostNeedLoginController/getPost/${post.postId}' />"> --%>
<!-- 											>>>觀看更多 </a> -->
<!-- 										<div style="display: flex;"> -->
<!-- 											<p> -->
<!-- 												<a href="#"> <img alt="" -->
<!-- 													src="images/post/heart-empty.png" width="7%" height="7%"> -->
<!-- 												</a>123 -->
<!-- 											<p style="font-size: 15px; color: grey;">By NickName</p> -->
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li class="span4"> -->
<!-- 								<div class="thumbnail"> -->
<!-- 									<img alt="300x200" src="images/post/product_01.jpg" /> -->
<!-- 									<div class="caption"> -->
<!-- 										<h3>缩略图标题</h3> -->
<!-- 										<p>123456</p> -->
<!-- 										<a -->
<%-- 											href="<c:url value='/PostNeedLoginController/getPost/${post.postId}' />"> --%>
<!-- 											>>>觀看更多 </a> -->
<!-- 										<div style="display: flex;"> -->
<!-- 											<p> -->
<!-- 												<a href="#"> <img alt="" -->
<!-- 													src="images/post/heart-empty.png" width="7%" height="7%"> -->
<!-- 												</a>123 -->
<!-- 											<p style="font-size: 15px; color: grey;">By NickName</p> -->
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
<!-- 							<li class="span4"> -->
<!-- 								<div class="thumbnail"> -->
<!-- 									<img alt="300x200" src="images/post/product_01.jpg" /> -->
<!-- 									<div class="caption"> -->
<!-- 										<h3>缩略图标题</h3> -->
<!-- 										<p>123456</p> -->
<!-- 										<a -->
<%-- 											href="<c:url value='/PostNeedLoginController/getPost/${post.postId}' />"> --%>
<!-- 											>>>觀看更多 </a> -->
<!-- 										<div style="display: flex;"> -->
<!-- 											<p> -->
<!-- 												<a href="#"> <img alt="" -->
<!-- 													src="images/post/heart-empty.png" width="7%" height="7%"> -->
<!-- 												</a>123 -->
<!-- 											<p style="font-size: 15px; color: grey;">By NickName</p> -->
<!-- 											</p> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</li> -->
						</ul>
					</div>
				</div>
				<div class="row-fluid">
<!-- 					<div class="span12"> -->
<!-- 						<h3 style="padding-left: 3%;">全部</h3> -->
<!-- 					</div> -->
					<div class="span8" style="margin: 0px; margin-bottom: 1%;">
						<nav class="menu">
							<ol>
								<li class="menu-item"><a class="navbara" href="#0">ALL</a></li>
								<li class="menu-item"><a class="navbara" href="#0">Two</a></li>
								<li class="menu-item"><a class="navbara" href="#0">Three</a></li>
								<li class="menu-item"><a class="navbara" href="#0">Four</a></li>
								<li class="menu-item"><a class="navbara" href="#0">Five</a></li>
							</ol>
						</nav>
					</div>
					<div class="span4">
						<div>
							<div class="span10">
								<form class="form-search">
									<input class="input-medium search-query" type="text" />
									<button type="submit" class="btn">Search</button>
								</form>
							</div>
							<div class="span1 text-right">
								<a href="<c:url value='/PostNeedLoginController/addPost '/>">
									<button
										class="btn btn-success btn-large glyphicon glyphicon-plus"
										aria-hidden="true" type="button"></button>
								</a>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span9">
							<div class="media">
								<a class="pull-left" href="#"><img class="media-object"
									src="images/post/product_01.jpg" alt='' /></a>
								<div class="media-body">
									<h4 class="media-heading">標題</h4>
									请尽量使用HTML5兼容的视频格式和视频代码实现视频播放, 以达到更好的体验效果. <a
										href="<c:url value='/PostNeedLoginController/getPost/${post.postId}' />">
										>>>觀看更多 </a>
								</div>
							</div>
						</div>
						<div class="span3 text-right">
							<p>
								<a href="#"> <img alt="" src="images/post/heart-empty.png"
									width="7%" height="7%">
								</a>123
							<p style="font-size: 15px; color: grey;">
								<br> <br> <br> <br> By NickName
							</p>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>