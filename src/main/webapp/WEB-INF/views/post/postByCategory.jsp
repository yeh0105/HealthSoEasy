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
<title>Share</title>
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
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		var likeBtn = document.getElementById("like");
		likeBtn.addEventListener("click", function() {
			likeBtn.classList.toggle('red');
		})
	})
</script>

<script type="text/javascript"
	src="<c:url value='/js/jquery-1.12.2.min.js' />"></script>
<script>
window.onload = function() {
	let firstPageBtn = document.getElementById("firstPageBtn")
	let prePageBtn = document.getElementById("prePageBtn")
	let currPageBtn = document.getElementById("currPageBtn")
	let nextPageBtn = document.getElementById("nextPageBtn")
	let lastPageBtn = document.getElementById("lastPageBtn")
	let insertP = document.getElementById("insertPosts")
	let posts;
	
// 	console.log("posts="+posts);

	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open('GET', "<c:url value='/PostController/getAllPost' />", true); //true==>用非同步送出
	//對伺服器發送請求
	xhr.send();
	
	//進入頁面顯示第一頁
	xhr.onreadystatechange = function() {
		//假如請求操作已完成(readyState == 4) 以及HTTP狀態碼成功(status == 200)
		if (xhr.readyState == 4 && xhr.status == 200) {
			posts = JSON.parse(xhr.responseText);
			diplayPosts();
			
			currPageBtn.innerHTML = posts.currPage;
			prePageBtn.style = "visibility:hidden";
		}
	}
	
	//第一頁
	firstPageBtn.onclick = function() {
		//設定連線內容
		xhr.open('GET', "<c:url value='/pagingPostData.json' />", true); //true==>用非同步送出
		//對伺服器發送請求
		xhr.send();
		//當readyState屬性值改變時呼叫此方法
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			//假如請求操作已完成(readyState == 4) 以及HTTP狀態碼成功(status == 200)
			if (xhr.readyState == 4 && xhr.status == 200) {
				//JSON 變物件
				posts = JSON.parse(xhr.responseText);
				diplayPosts();

				prePageBtn.innerHTML = posts.currPage - 1;
				prePageBtn.value = posts.currPage - 1;
				//假如前一頁=第一頁==>前一頁按鈕隱藏
				if (posts.currPage == 1) {
					prePageBtn.style = "visibility:hidden";
				}

				currPageBtn.innerHTML = posts.currPage;
// 				currPageBtn.value = posts.currPage;

				nextPageBtn.innerHTML = posts.currPage + 1;
// 				nextPageBtn.value = posts.currPage + 1;

				nextPageBtn.style = "visibility:none";
			}
		}
	}
			

	//前一頁
	prePageBtn.onclick = function() {
		//設定連線內容
		xhr.open('GET', "<c:url value='/pagingPostData.json' />"
				+ "?pageNo=" + (posts.currPage - 1), true); //true==>用非同步送出
		//對伺服器發送請求
		xhr.send();
		//當readyState屬性值改變時呼叫此方法
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			//假如請求操作已完成(readyState == 4) 以及HTTP狀態碼成功(status == 200)
			if (xhr.readyState == 4 && xhr.status == 200) {
				//JSON 變物件
				posts = JSON.parse(xhr.responseText);
				diplayposts();

				prePageBtn.innerHTML = posts.currPage - 1;
				prePageBtn.value = posts.currPage - 1;
				//假如前一頁=第一頁==>前一頁按鈕隱藏
				if (posts.currPage == 1) {
					prePageBtn.style = "visibility:hidden";
				}

				currPageBtn.innerHTML = posts.currPage;
// 				currPageBtn.value = posts.currPage;

				nextPageBtn.innerHTML = posts.currPage + 1;
// 				nextPageBtn.value = posts.currPage + 1;

				nextPageBtn.style = "visibility:none";
			}
		}
	}

	//下一頁
	nextPageBtn.onclick = function() {
		//設定連線內容
		xhr.open('GET', "<c:url value='/pagingPostData.json' />"
				+ "?pageNo=" + (posts.currPage + 1), true); //true==>用非同步送出
		//對伺服器發送請求
		xhr.send();
		//當readyState屬性值改變時呼叫此方法
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			//假如請求操作已完成(readyState == 4) 以及HTTP狀態碼成功(status == 200)
			if (xhr.readyState == 4 && xhr.status == 200) {
				//JSON 變物件
				posts = JSON.parse(xhr.responseText);
				diplayposts();

				prePageBtn.innerHTML = posts.currPage - 1;
// 				prePageBtn.value = posts.currPage - 1;

				currPageBtn.innerHTML = posts.currPage;
// 				currPageBtn.value = posts.currPage;

				nextPageBtn.innerHTML = posts.currPage + 1;
// 				nextPageBtn.value = posts.currPage + 1;
				//假如下一頁=最後一頁==>下一頁按鈕隱藏
				if (posts.currPage == posts.totalPage) {
					nextPageBtn.style = "visibility:hidden";
				}

				prePageBtn.style = "visibility:none";
			}
		}
	}

	//最後頁
	lastPageBtn.onclick = function() {
		xhr.open('GET', "<c:url value='/pagingPostData.json' />"
				+ "?pageNo=" + posts.totalPage, true); //用非同步送出
		xhr.send();
		xhr.onreadystatechange = function() {
			console.log(xhr.readyState);
			if (xhr.readyState == 4 && xhr.status == 200) {
				//JSON 變物件
				posts = JSON.parse(xhr.responseText);
				diplayposts();

				prePageBtn.innerHTML = posts.currPage - 1;

				currPageBtn.innerHTML = posts.currPage;

				nextPageBtn.innerHTML = posts.currPage + 1;
				
				if (posts.currPage == posts.totalPage) {
					nextPageBtn.style = "visibility:hidden";
				}

				prePageBtn.style = "visibility:none";
			}
		}
	}
}
</script>

</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<div class="container-fluid">
		<div class="row-fluid" style="width: 80%; padding-left: 10%;">
			<div class="span12">
				<div class="row-fluid">
					<div class="row-fluid"
						style="border-top: 7px solid #325b43; border-radius: 5px; padding-top: 5%;">
						<!-- 	<div class="span12"> -->
						<!-- 		<h3 style="padding-left: 3%; border-top: 7px solid #325b43; border-radius: 5px;">全部</h3> -->
						<!-- 	</div> -->
						<div class="span8" style="margin: 0px; margin-bottom: 1%;">
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
						<div id="insertPosts">
							<c:forEach var='post' items="${post_DPP}">
								<div class="row-fluid"
									style="border-bottom: 4px #325b43 dotted; margin-bottom: 1%; padding-bottom: 1%;">
									<div class="span9">
										<div class="media">
											<!-- getPicture所對應的Servlet會到資料庫讀取圖片並傳送給前端的瀏覽器 -->
											<a class="pull-left"
												href="">
												<img class="media-object"
												style="width: 100px; height: 100px; border: 1px lightgrey dashed;"
												src="<c:url value='/PostController/getPicture/${post.value.postId}' />"
												alt='' />
											</a>
											<div class="media-body" style="line-height: 30px;">
												<h3 class="media-heading">${post.value.postTitle}
													&nbsp;
													<button class="btn-success">${post.value.postCategory}</button>
												</h3>
												${fn:substring(post.value.postContent,0,100)}... <a
													href="<c:url value='/PostNeedLoginController/getPost/${post.value.postId}' />">
													>>>觀看更多 </a>
											</div>
										</div>
									</div>
									<div class="span2 text-right">
										<a href="#"> 
											<svg viewBox="0 0 520 500"
											style="width:20px; height:20px;"
												xmlns="http://www.w3.org/2000/svg">
												<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />
											</svg>
										</a>${post.value.postLike}
										<p style="font-size: 15px; color: grey;">
											<br> <br> By
											${post.value.customerBean.customerNickname} <br>
											${fn:substring(post.value.postUploadTime,0,19)}
										</p>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- ---------------------------控制分頁用----------------------------------- -->
						<div class='container'>
							<table border="1" id="tb2">
								<tr align="center">
									<td width='80' height='20'>
										<c:if test="${currPage > 1}">
											<div id="">
												<a href="<c:url value='getAllPosts?pageNo=1#' />"> <img
													border='0' alt='第一頁' height='30' width='30' />
												</a>
											</div>
										</c:if>
									</td>
									<td width='80'><c:if test="${currPage > 1}">
											<div id="">
												<a
													href="<c:url value='getAllPosts?pageNo=${currPage-1}' />">
													<img border='0' alt='前一頁' height='30' width='30' />
												</a>
											</div>
										</c:if></td>
									<td width='76'>${currPage}/${totalPages}</td>
									<td width='80'><c:if test="${currPage != totalPages}">
											<div id="">
												<a
													href="<c:url value='getAllPosts?pageNo=${currPage+1}' />">
													<img border='0' alt='下一頁' height='30' width='30' />
												</a>
											</div>
										</c:if></td>
									<td width='80'><c:if test="${currPage != totalPages}">
											<div id="">
												<a
													href="<c:url value='getAllPosts?pageNo=${totalPages}' />">
													<img border='0' alt='最末頁' height='30' width='30' />
												</a>
											</div>
										</c:if></td>
								</tr>
							</table>
						</div>

						<!-- ------------------------------控制分頁結束區塊--------------------------------- -->

						<!-- ------------------------------分頁區塊--------------------------------- -->
						<div id='somediv' align='center'>
							<button id="firstPageBtn">第一頁</button>
							<button id="prePageBtn">0</button>
							<button id="currPageBtn" value="1">1</button>
							<button id="nextPageBtn" value="2">2</button>
							<button id="lastPageBtn">最後頁</button>
						</div>
						<!-- 						<div class="pagination pagination-large pagination-centered"> -->
<!-- 							<ul> -->
<!-- 								<li><a href="#">上一页</a></li> -->
<!-- 								<li><a href="#">1</a></li> -->
<!-- 								<li><a href="#">2</a></li> -->
<!-- 								<li><a href="#">3</a></li> -->
<!-- 								<li><a href="#">4</a></li> -->
<!-- 								<li><a href="#">5</a></li> -->
<!-- 								<li><a href="#">下一页</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>