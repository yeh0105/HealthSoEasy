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
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<script>
	document.addEventListener("DOMContentLoaded",function() {

		//變數宣告------------------------------------------------------------

		var pageNo = 0;
		var totalPage = 0;
		var responseData;
		var categoryStatus=0;

		//變數宣告------------------------------------------------------------

		
		//載入時 取得所有文章-----------------------------------------------------
		//新建XMLHttpRequest物件
		let xhr = new XMLHttpRequest();
		//設定連線內容
		xhr.open("GET","<c:url value='/PostController/getAllPost.json' />",true);
		//對伺服器發送請求
		xhr.send();
		//當readyState屬性值改變時呼叫此方法
		xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
		// 				console.log(xhr.responseText);

			var responseData = xhr.responseText;

			displayPagePosts(responseData); // 顯示讀取到的非文字性資料
			}
		}
		//載入時 取得所有文章-----------------------------------------------------

		// 當使用者按下『第一頁』、『前一頁』、『下一頁』、『最末頁』的連結時，由本方法發出非同步請求。
		// id為前端的唯一值的id
		function asynRequest(id) {
			var xhr = new XMLHttpRequest();
			var no = 0; // 頁數
			var queryString = ""; // queryString紀錄查詢字串
			
			if(categoryStatus=="all"){
				// 判斷頁數
				if (id == "first") { // 算出查詢字串中，要送出的pageNo為何?
					no = 1;
				} else if (id == "prev") {
					no = parseInt(pageNo) - 1;
				} else if (id == "next") {
					no = parseInt(pageNo) + 1;
				} else if (id == "last") {
					no = totalPage;
				}

				// 查詢字串包含1.即將要讀取的頁數(pageNo), 2.總共有幾頁(totalPage)
				// 注意，查詢字串的前面有問號
				queryString = "?pageNo=" + no + "&totalPage="+ totalPage;

				xhr.open("GET","<c:url value='/PostController/getAllPost.json' />"+ queryString, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var responseData = xhr.responseText;
						displayPagePosts(responseData);
					}
				}
			} else {
				// 判斷頁數
				if (id == "first") { // 算出查詢字串中，要送出的pageNo為何?
					no = 1;
				} else if (id == "prev") {
					no = parseInt(pageNo) - 1;
				} else if (id == "next") {
					no = parseInt(pageNo) + 1;
				} else if (id == "last") {
					no = totalPage;
				}

				// 查詢字串包含1.即將要讀取的頁數(pageNo), 2.總共有幾頁(totalPage)
				// 注意，查詢字串的前面有問號
				queryString = "?postCategoryBean="+categoryStatus+"&pageNo=" + no + "&totalPage="+ totalPage;

				xhr.open("GET","<c:url value='/PostController/getAllPostByPostCategoryId.json' />"+ queryString, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var responseData = xhr.responseText;
						displayPagePosts(responseData);
					}
				}
			}
			
		}
		
		// 當使用者按下『類別』的連結時，由本方法發出非同步請求。
		// id為前端的唯一值的id
		function categoryAsynRequest(name) {
			var xhr = new XMLHttpRequest();
			var postCategoryBean = 0; // 類別
			var queryString = ""; // queryString紀錄查詢字串
			
			// 判斷類別
			// 假如類別為全部則送全部的請求
			if (name == "all") { 
				xhr.open("GET","<c:url value='/PostController/getAllPost.json' />", true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var responseData = xhr.responseText;
						displayPagePosts(responseData);
					}
				}	
				
			// 假如類別為各類別則送類別的請求
			} else { // 算出查詢字串中，要送出的postCategoryBean為何?
				if (name == "c1") {
					postCategoryBean = 1;
				} else if (name == "c2") {
					postCategoryBean = 2;
				} else if (name == "c3") {
					postCategoryBean = 3;
				} else if (name == "c4") {
					postCategoryBean = 4;
				} else if (name == "c5") {
					postCategoryBean = 5;
				} else if (name == "c6") {
					postCategoryBean = 6;
				} else if (name == "c7") {
					postCategoryBean = 7;
				} else if (name == "c8") {
					postCategoryBean = 8;
				}
				
				// 查詢字串包含1.即將要讀取的類別(postCategoryBean),
				// 注意，查詢字串的前面有問號
				queryString = "?postCategoryBean=" + postCategoryBean ;

				xhr.open("GET","<c:url value='/PostController/getAllPostByPostCategoryId.json' />"+ queryString, true);
				xhr.send();
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var responseData = xhr.responseText;
						displayPagePosts(responseData);
					}
				}
			}		
		}

		// 顯示送回來的所有文章
		function displayPagePosts(responseData) {

			var mapObj = JSON.parse(responseData);
			var posts = mapObj.post_DPP;
			pageNo = mapObj.currPage;
			totalPage = mapObj.totalPage;
			
			let content = "";


			//內容
			(posts).forEach(post =>{
// 			Object.entries(posts).forEach(([i,post]) =>{
			
				content += '<div class="row-fluid" style="border-bottom: 4px #325b43 dotted; margin-bottom: 1%; padding: 1% 1% 0% 1%;">'
						+ '<div class="row-fluid" style="margin-bottom: 1%; padding-bottom: 1%;">'
						+ '<div class="span9">'
						+ '<div class="media">'
// 						文章圖片
						+ '<a class="pull-left" href=""> <img class="media-object" style="width: 100px; height: 100px; border: 1px lightgrey dashed;" src="<c:url value="/PostController/getPicture/'+post.postId+' " />" /></a>'
						+ '<div class="media-body" style="line-height: 30px;">'
//	 					文章標題+類別
						+ '<h3 class="media-heading">'
						+ post.postTitle
						+ '&nbsp;<button class="btn-success">'
						+ post.postCategory
						+ '</button></h3>'
//	 					文章內容(取前100字)
						+ post.postContent.substring(0,100)+ '...'
//	 					觀看單篇文章
						+ ' <a href="<c:url value="/PostNeedLoginController/getPost/'+post.postId+'" />">>>>觀看更多 </a>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
//	 					Like按鈕SVG
						+ '<a href="#"> <svg viewBox="0 0 520 500" style="width: 20px; height: 20px;" xmlns="http://www.w3.org/2000/svg">'
						+ '<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />'
						+ '</svg>'
//	 					Like數量
						+ '</a>'
						+ post.postLike
						+ '<p style="font-size: 15px; color: grey;">'
						+ '	<br> <br> By'
//	 					暱稱
						+ post.customerBean.customerNickname
						+ '<br>'
//	 					文章上傳時間
						+ post.postUploadTime.substring(0,19)
						+ '</p>'
						+ '</div>'
						+ '</div>'

			});
			
			document.getElementById("insertPosts").innerHTML = content;
		

			// 	頁數區塊----------------------------------------------------------------------------------------------
			var navContent = "<div class='pagination pagination-large pagination-centered'><ul>";
			if (pageNo != 1) {
				navContent += "	<li><a id='first' style='color:green;'>第一頁</a></li>";
				navContent += "<li><a id='prev' style='color:green;'>前一頁</a></li>";
			} else {
				navContent += "<li>&nbsp;</li>";
				navContent += "<li>&nbsp;</li>";
			}
			
			
			navContent += "<li><a style='text-decoration:none; color:green;'>第" + pageNo + "頁 / 共"+ totalPage + "頁</a></li>";
			if (pageNo != totalPage) {
				navContent += "<li><a id='next' style='color:green;'>下一頁</a></li>";
				navContent += "<li><a id='last' style='color:green;'>最末頁</a></li>";
			} else {
				navContent += "<li>&nbsp;</li>";
				navContent += "<li>&nbsp;</li>";
			}
			document.getElementById("navigation").innerHTML = navContent;
			
			// 	頁數區塊----------------------------------------------------------------------------------------------
			
			// 	頁數事件----------------------------------------------------------------------------------------------

			var firstBtn = document.getElementById("first");
			var prevBtn = document.getElementById("prev");
			var nextBtn = document.getElementById("next");
			var lastBtn = document.getElementById("last");
							
			if (firstBtn != null) {
				firstBtn.onclick = function() {
				asynRequest(this.id);
				}
			}

			if (prevBtn != null) {
				prevBtn.onclick = function() {
				asynRequest(this.id);
				}
			}

			if (nextBtn != null) {
				nextBtn.onclick = function() {
				asynRequest(this.id);
				}
			}

			if (lastBtn != null) {
				lastBtn.onclick = function() {
				asynRequest(this.id);
				}
			}

			// 	頁數事件----------------------------------------------------------------------------------------------
			

		}
//	 	類別事件----------------------------------------------------------------------------------------------
		
		var categoryall = document.getElementById("all");
		var categoryC1 = document.getElementById("c1");
		var categoryC2 = document.getElementById("c2");
		var categoryC3 = document.getElementById("c3");
		var categoryC4 = document.getElementById("c4");
		var categoryC5 = document.getElementById("c5");
		var categoryC6 = document.getElementById("c6");
		var categoryC7 = document.getElementById("c7");
		var categoryC8 = document.getElementById("c8");
						
		if (categoryall != null) {
			categoryall.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=all;
			}
		}
		
		if (categoryC1 != null) {
			categoryC1.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=1;
			}
		}
		if (categoryC2 != null) {
			categoryC2.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=2;
			}
		}
		if (categoryC3 != null) {
			categoryC3.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=3;
			}
		}
		if (categoryC4 != null) {
			categoryC4.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=4;
			}
		}
		if (categoryC5 != null) {
			categoryC5.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=5;
			}
		}
		if (categoryC6 != null) {
			categoryC6.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=6;
			}
		}
		if (categoryC7 != null) {
			categoryC7.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=7;
			}
		}
		if (categoryC8 != null) {
			categoryC8.onclick = function() {
				categoryAsynRequest(this.id);
				categoryStatus=8;
			}
		}
		
		// 	類別事件----------------------------------------------------------------------------------------------

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

	<div class="container-fluid">
		<div class="row-fluid" style="width: 80%; padding-left: 10%;">
			<div class="span12">
				<div class="row-fluid">
					<div class="row-fluid" style="border-radius: 5px; padding-top: 5%;">
						<!-- 	<div class="span12"> -->
						<!-- 		<h3 style="padding-left: 3%; border-top: 7px solid #325b43; border-radius: 5px;">全部</h3> -->
						<!-- 	</div> -->
						<div class="span8" style="margin: 0px; margin-bottom: 1%;">
							<nav class="menu">
								<ol>
									<li class="menu-item"><a class="navbara" href="#0" id="all">全部</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c1">減肥</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c2">飲食</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c3">運動</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c4">健康</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c5">健身</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c6">講座</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c7">商品</a></li>
									<li class="menu-item"><a class="navbara" href="#0" id="c8">問答</a></li>
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
						<hr style="color: transparent;">
						<br> <br> <br> <br>
						
						<!-- ------------------------------內容區塊--------------------------------- -->
						<div id="insertPosts">
							
						</div>
						<!-- ------------------------------內容區塊--------------------------------- -->
						
						<!-- ------------------------------分頁區塊--------------------------------- -->
						<div id='navigation' style='height: 60px;'>
						
						</div>
						<!-- ------------------------------分頁區塊--------------------------------- -->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>