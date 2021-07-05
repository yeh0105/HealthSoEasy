<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>So Share</title>
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
<style type="text/css">
	.addbtn{
		border-radius: 20px; 
		border: 3px solid #28A745; 
		background-color: transparent; 
		padding: 1% 3%; 
		font-family: Microsoft JhengHei;
	}
	.addbtn:hover{
		background-color: #28A745; 
		color:white;
	}
</style>
<!-- -----------------------------取得所有文章的Top3區塊------------------------------------ -->
<script>
document.addEventListener("DOMContentLoaded",function() {
	
	//變數宣告------------------------------------------------------------

	let top3Posts;

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

// 		console.log(xhr.responseText);
		top3Posts = JSON.parse(xhr.responseText);
// 		console.log("top3Posts="+top3Posts);

		displaytop3Post(); // 顯示讀取到的非文字性資料
		}
	}
	
	// 顯示送回來的所有文章
	function displaytop3Post() {
		
		let contentTop3 = "";
		
		(top3Posts).forEach(post =>{
			
// 			console.log(post.postTitle);
			
			contentTop3 += '<li class="span4">'
						+ '<div class="thumbnail">'
//						文章圖片
						+'<img alt="" src="<c:url value="/PostController/getPicture/'+post.postId+' " />" style="width: 300px; height: 300px; object-fit: cover;"/>'
						+'<div class="caption">'
//						文章標題
						+'<h3>'+post.postTitle+'</h3>'
//						文章內容
						+'<p>'+post.postContent.substring(0,27)+ '...</p>'
//						觀看更多
						+'<a href="<c:url value="/PostNeedLoginController/getPost/'+post.postId+'" />"> >>>觀看更多 </a>'
						+'<div style="display: block; text-align: right;">'
//						Like按鈕SVG
						+'<a href="#"> <svg viewBox="0 0 520 500" style="width: 20px; height: 20px;" xmlns="http://www.w3.org/2000/svg">'
						+ '<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />'
						+ '</svg></a>'
//						Like數量
						+ post.postLike
						+'<p style="font-size: 15px; color: grey;">By &nbsp;'+post.customerBean.customerNickname+'</p>'
//						文章上傳時間
						+'<p style="font-size: 15px; color: grey;">'+post.postUploadTime.substring(0,16)+'</p>'
						+'</div>'
						+'</div>'
						+'</div>'
						+'</li>'
						+''
		})
		document.getElementById("insertTop3").innerHTML = contentTop3;
	}
})
</script>
<!-- -----------------------------取得所有文章的Top3區塊------------------------------------ -->

<!-- -----------------------------取得文章類別的Top10區塊------------------------------------ -->

<script>
document.addEventListener("DOMContentLoaded",function() {
	
	//變數宣告------------------------------------------------------------

	let top10PostsByCategory;

	//變數宣告------------------------------------------------------------
	
	//載入時 取得所有文章的Top10-----------------------------------------------------
	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open("GET","<c:url value='/PostController/getTop10Post'/>",true);
	//對伺服器發送請求
	xhr.send();
	//當readyState屬性值改變時呼叫此方法
	xhr.onreadystatechange = function() {
	if (xhr.readyState == 4 && xhr.status == 200) {

		top10PostsByCategory = JSON.parse(xhr.responseText);
// 		console.log(xhr.responseText);
// 		console.log("top10PostsByCategory="+top10PostsByCategory);

		displaytop10PostByCategory(); // 顯示讀取到的非文字性資料
		}
	}
	
	// 當使用者按下『類別』的連結時，由本方法發出非同步請求。
	// id為前端的唯一值的id
	function categoryAsynRequest(id) {
		var xhr = new XMLHttpRequest();
		var postCategoryBean = 0; // 類別
		var queryString = ""; // queryString紀錄查詢字串
		
		// 判斷類別
		// 假如類別為全部則送全部的請求
		if (id == "all") { 
			xhr.open("GET","<c:url value='/PostController/getTop10Post' />", true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					top10PostsByCategory = JSON.parse(xhr.responseText);
					displaytop10PostByCategory();
				}
			}	
			
		// 假如類別為各類別則送類別的請求
		} else { // 算出查詢字串中，要送出的postCategoryBean為何?
			if (id == "c1") {
				postCategoryBean = 1;
			} else if (id == "c2") {
				postCategoryBean = 2;
			} else if (id == "c3") {
				postCategoryBean = 3;
			} else if (id == "c4") {
				postCategoryBean = 4;
			} else if (id == "c5") {
				postCategoryBean = 5;
			} else if (id == "c6") {
				postCategoryBean = 6;
			} else if (id == "c7") {
				postCategoryBean = 7;
			} else if (id == "c8") {
				postCategoryBean = 8;
			}
			
			// 查詢字串包含1.即將要讀取的類別(postCategoryBean),
			// 注意，查詢字串的前面有問號
			queryString = "?postCategoryBean=" + postCategoryBean ;

			xhr.open("GET","<c:url value='/PostController/getTop10PostByPostCategoryId.json' />"+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					top10PostsByCategory = JSON.parse(xhr.responseText);
					displaytop10PostByCategory();
				}
			}
		}		
	}
	
	// 顯示送回來的所有文章
	function displaytop10PostByCategory() {
		
// 		console.log(xhr.responseText);
// 		console.log(top10PostsByCategory);
		
		
		let contentTop10 = "";
		console.log(top10PostsByCategory.length == 0);
		
		if(top10PostsByCategory.length == 0){
			contentTop10 += '<div style="display:flex; width:100%">'
				
				+'<div class="span6">'
				+'<img src="${pageContext.request.contextPath}/images/post/postNoFind.jpg" style="width:200%;">'
				+'</div>'
				
				+'<div class="span6" style="padding-top:10%;">'
				+'<h2 style="letter-spacing: 3px;font-family: Microsoft YaHei;">還未有人在此發過文章</h2>'
				+'<h4 style="letter-spacing: 3px; line-height: 30px; font-family: Microsoft JhengHei;">還未有人在此發過文章。'
				+'<br>'
				+'趕快來分享你的故事。'
				+'<br>'
				+'成為第一個發文的人。'
				+'</h4>'
				+'<a href="<c:url value="/PostNeedLoginController/addPost "/>">'
				+'<button class="addbtn" style="letter-spacing: 3px;">'
				+'Add Share'
				+'</button>'
				+'</a>'
				+'</div>'
				
				+'</div>'
		}else{
		
		(top10PostsByCategory).forEach(post =>{
			
// 			console.log(post.postTitle);
			
			contentTop10 += '<div class="row-fluid" style="border-bottom: 4px #325b43 dotted; margin-bottom: 1%; padding: 1% 1% 0% 1%;">'
				+ '<div class="row-fluid" style="margin-bottom: 1%; padding-bottom: 1%;">'
				+ '<div class="span9">'
				+ '<div class="media">'
//					文章圖片
				+ '<a class="pull-left" href=""> <img class="media-object" style="width: 100px; height: 100px; border: 1px lightgrey dashed;" src="<c:url value="/PostController/getPicture/'+post.postId+' " />" /></a>'
				+ '<div class="media-body" style="line-height: 30px;">'
//					文章標題+類別
				+ '<h3 class="media-heading">'
				+ post.postTitle
				+ '&nbsp;<button class="btn-success">'
				+ post.postCategory
				+ '</button></h3>'
//					文章內容(取前100字)
				+ post.postContent.substring(0,100)+ '...'
//					觀看單篇文章
				+ ' <a href="<c:url value="/PostNeedLoginController/getPost/'+post.postId+'" />">>>>觀看更多 </a>'
				+ '</div>'
				+ '</div>'
				+ '</div>'
//					Like按鈕SVG
				+ '<a href="#"> <svg viewBox="0 0 520 500" style="width: 20px; height: 20px;" xmlns="http://www.w3.org/2000/svg">'
				+ '<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />'
				+ '</svg>'
//					Like數量
				+ '</a>'
				+ post.postLike
				+ '<p style="font-size: 15px; color: grey;">'
				+ '	<br> <br> By'
//					暱稱
				+ post.customerBean.customerNickname
				+ '<br>'
//					文章上傳時間
				+ post.postUploadTime.substring(0,16)
				+ '</p>'
				+ '</div>'
				+ '</div>'
			
		});
		}
// 		console.log(contentTop10);
		document.getElementById("insertTop10").innerHTML = contentTop10;
	}
	
// 	類別事件----------------------------------------------------------------------------------------------
	
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
		}
	}
	
	if (categoryC1 != null) {
		categoryC1.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC2 != null) {
		categoryC2.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC3 != null) {
		categoryC3.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC4 != null) {
		categoryC4.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC5 != null) {
		categoryC5.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC6 != null) {
		categoryC6.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC7 != null) {
		categoryC7.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	if (categoryC8 != null) {
		categoryC8.onclick = function() {
			categoryAsynRequest(this.id);
		}
	}
	
	// 	類別事件----------------------------------------------------------------------------------------------
	
	
})
</script>

<!-- -----------------------------取得文章類別的Top10區塊------------------------------------ -->

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
<!-- 	---------------------------insertTop3區塊------------------------------ -->
						<ul class="thumbnails" id=insertTop3>

						</ul>
<!-- 	---------------------------insertTop3區塊------------------------------ -->
					</div>
				</div>
				<div class="row-fluid">
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
								<li class="menu-item"><a class="navbara" href="<c:url value="/postByCategory" />">觀看更多</a></li>
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
					<br><br><br><br><br>
					
<!-- 	---------------------------insertTop10區塊------------------------------ -->
					<div class="row-fluid" id="insertTop10">
						
					</div>
<!-- 	---------------------------insertTop10區塊------------------------------ -->
				</div>
			</div>
		</div>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>