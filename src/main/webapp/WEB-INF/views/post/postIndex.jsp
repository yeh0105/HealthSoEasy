<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So Share</title>
 <script type="text/javascript"
    src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
    rel="stylesheet" media="screen">
    <link href="https://fonts.googleapis.com/css2?family=Caudex&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/categoryNav.css">
    <link href="css/header&footer.css" rel="stylesheet">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<div>
		<section id="offer">
			<!-- <img src="images/section1.png" width="100%" height="100%"> -->
			<div style="background-color: #C9D8BF;">
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

	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<div class="row-fluid">
					<div class="span12">
						<h3>熱門文章</h3>
						<ul class="thumbnails">
							<li class="span4">
								<div class="thumbnail">
									<img alt="300x200" src="images/product_01.jpg" />
									<div class="caption">
										<h3>標題</h3>
										<p>內文</p>
										<p>
											<a href="#"> <img alt="" src="images/heart-empty.png"
												width="7%" height="7%">
											</a>123
										</p>
									</div>
								</div>
							</li>
							<li class="span4">
								<div class="thumbnail">
									<img alt="300x200" src="images/product_01.jpg" />
									<div class="caption">
										<h3>標題</h3>
										<p>內文</p>
										<p>
											<a href="#"> <img alt="" src="images/heart-empty.png"
												width="7%" height="7%">
											</a>123
										</p>
									</div>
								</div>
							</li>
							<li class="span4">
								<div class="thumbnail">
									<img alt="300x200" src="images/product_01.jpg" />
									<div class="caption">
										<h3>標題</h3>
										<p>內文</p>
										<p>
											<a href="#"> <img alt="" src="images/heart-empty.png"
												width="7%" height="7%">
											</a>123
										</p>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<h3 style="padding-left: 3%;">全部</h3>
					</div>
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
								<button
									class="btn btn-success btn-large glyphicon glyphicon-plus"
									aria-hidden="true" type="button" alt="新增文章"></button>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span9">
							<div class="media">
								<a class="pull-left" href="#"><img class="media-object"
									src="images/product_01.jpg" alt='' /></a>
								<div class="media-body">
									<h4 class="media-heading">標題</h4>
									请尽量使用HTML5兼容的视频格式和视频代码实现视频播放, 以达到更好的体验效果.
								</div>
							</div>
						</div>
						<div class="span3 text-right">
							<p>
								<a href="#"> <img alt="" src="images/heart-empty.png"
									width="7%" height="7%">
								</a>123
							</p>
						</div>
					</div>
					<div class="pagination pagination-large pagination-centered">
						<ul>
							<li><a href="#">上一页</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li>
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