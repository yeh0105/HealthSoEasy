<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sport Map</title>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css'>	
<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/sportMap_index.css"
	rel="stylesheet">
	
<link href="${pageContext.request.contextPath}/css/sportMap_getAll.css"
	rel="stylesheet">	


<script>

document.addEventListener("DOMContentLoaded", function(){
	let showTop = document.getElementById("showTopMaps")
	let topMaps;
	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open('GET',"<c:url value='/sportMapController/allSportMapsByTopNo.json' />",true);//true==>用非同步送出
	//對伺服器發送請求
	xhr.send();
	
	//進頁面顯示第一頁
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status ==200){
		topMaps = JSON.parse(xhr.responseText);
		console.log(topMaps);
		console.log("123");
		displayTopMaps();				
			
		}
		
	}		
		
	function displayTopMaps(){
		
		let content = "<div class='container'>";
		
		(topMaps).forEach(topMap =>{
		
		content += "<div class='column'>"+
	    "<div class='demo-title'>"+"</div>"
        +"<div class='post-module'>"+"<div class='thumbnail'>"+"<div class='date'>"
        +"<div class='day'>"+"Hot"+"</div>"+"<div class='month'>"+""+"</div>"                                                    
        +"</div>"+topMap.sportMapMap+"</div>"+"<div class='post-content'>"
        +"<div class='category'>"+"累積"+topMap.sportMapScore+"分！</div>"
        +"<h3 class='sub_title'>"+"運動地點："+topMap.sportMapName+"</h3>"
        +"<h3 class='description'>"+"地址："+topMap.sportMapAddress+"</h3>"
        +"<div class='post-meta'>"+"<span class='timestamp'>"+"<i class='fa fa-clock-o'>"+"</i>"
        +topMap.sportCategoryBean.sportCategoryName+"</span>"
        +"<span class='comments'>"+"<i class='fa fa-comments'>"+"</i>"
		+"<a href=' " + "<c:url value='/sportMapController/sportMap/' />" + topMap.sportMapId  +  " '>詳細資訊</a>"        
        
        +"</span>"+"</div>"+"</div>"+"</div>"+"</div>"
		
		});   
		content+= "</div>"
		showTop.innerHTML=content;		
		
		}	
	
	}
)

</script>


</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<div class="mainWrapper">
		<section id="offer">
			<div style="background-color: #C9D8BF; text-align: center;">
				<div style="margin: 5% auto;">
					<h1 style="color: #1d3b2a; font-family: Caudex;">So Map</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						揮灑你的汗水，展現你的風采</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						運動使我們充滿活力，活力讓生命變得美麗！</p>
				</div>

			</div>

		</section>
	</div>
	<!-- ------------------------------內容1開始區塊--------------------------------- -->

	<div class="centerDiv">
		<div class="btnBy1">
			依分類：
			<div>
				<a href="<c:url value='/sportMapController/displaySportMaps' />"><button class="font1">所有運動地點</button></a>
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=1' />"><button class="font1">運動中心</button></a>
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=2' />"><button class="font1">市區場館</button></a>

			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=3' />"><button class="font1">游泳池</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他室內場地</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他戶外場地</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他1</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">其他2</button></a>
			</div>			

		</div>
		<div class="btnBy2">
			<a href="<c:url value='/sportMapController/displaySportMaps' />"><img
				src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png"
				width="100%" height="100%"></a>
		</div>
		<div class="btnBy3">
			依區域：
			<div>
				<a href="#"><button class="font1">地區A</button></a>
<!-- 				<a href="#"><button class="font1">地區B</button></a> -->
			</div>
			<div>
				<a href="#"><button class="font1">地區C</button></a>
				<a href="#"><button class="font1">地區D</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區E</button></a>
				<a href="#"><button class="font1">地區F</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區G</button></a>
				<a href="#"><button class="font1">地區H</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區 I</button></a>
				<a href="#"><button class="font1">地區J</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區K</button></a>
				<a href="#"><button class="font1">地區L</button></a>
			</div>
			<div>
				<a href="#"><button class="font1">地區M</button></a>
				<a href="#"><button class="font1">地區N</button></a>
			</div>
			<div>
<!-- 				<a href="#"><button class="font1">地區O</button></a> -->
				<a href="#"><button class="font1">地區P</button></a>
			</div>			
		</div>
	</div>
	<!-- ------------------------------內容1結束區塊--------------------------------- -->
	<!-- ------------------------------內容2開始區塊--------------------------------- -->	
	<div class="centerDiv">
		<div>

			<span>熱門運動地點Top 3</span><br>
			<div id="showTopMaps" >
				
			</div>
		</div>

	</div>
	<!-- ------------------------------內容2結束區塊--------------------------------- -->	
	<!-- ------------------------------內容3開始區塊--------------------------------- -->	
	<div class="centerDiv">

		<div>

			<img
				src="${pageContext.request.contextPath}/images/sportMap/MapSport2.png"
				width="90%" height="90%">
		</div>
		<div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>
			<div class="">說明文字說明文字說明文字說明文字說明文字說明文字</div>				

		</div>
	</div>	
	

	<!-- ------------------------------內容3結束區塊--------------------------------- -->	
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />





</body>
</html>