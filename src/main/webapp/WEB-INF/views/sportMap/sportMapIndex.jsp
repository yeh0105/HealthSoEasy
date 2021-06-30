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
	//設定連線內容(此方法為依照積分最高顯示前三筆地圖)
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

// -----------------------------------------------------------------//
	document.addEventListener("DOMContentLoaded", function () {

            // let areas = document.getElementsByTagName("area");
            let areas = document.querySelectorAll("area.imgbut");
            let areasLen = areas.length;
            console.log(areas);
            console.log(areas.length);
            for (let i = 0; i < areas.length; i++) {
                areas[i].addEventListener("mouseover", mouseOver);
                areas[i].addEventListener("mouseout", mouseOut);
                areas[i].addEventListener("click", Click);
            }
        });

        function mouseOver() {
            console.log(this);
            console.log(this.id);
            document.images[1].src ="${pageContext.request.contextPath}/images/sportMap/Map" + this.id.substr(2) + ".png";
        }


        function mouseOut() {
            document.images[1].src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png";
        }


        function Click() {
            // document.getElementById("mapdiv").innerHTML = "<img src='images/" + this.id.substr(2) + ".gif'/>";
            // document.getElementById("mapdiv").innerHTML = "<img src='images/" + this.id.substr(2) + ".gif'/>";

        }



// ---------------------------------------------------------------//

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
	
	
    <!-- --------------------------------依區域區塊--------------------------------- -->

	<div class="centerDiv">
		<div class="btnBy1">
						
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=台北市' />"><button class="font1">所有台北市</button></a>
				
			</div>
			<div>
				<span>依區域：</span>
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=中正區' />"><button class="font1">中正區</button></a>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=萬華區' />"><button class="font1">萬華區</button></a>
				
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=大安區' />"><button class="font1">大安區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=文山區' />"><button class="font1">文山區</button></a>
				
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=信義區' />"><button class="font1">信義區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=南港區' />"><button class="font1">南港區</button></a>
				
			</div>
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=士林區' />"><button class="font1">士林區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=北投區' />"><button class="font1">北投區</button></a>
				
			</div>	
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=中山區' />"><button class="font1">中山區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=大同區' />"><button class="font1">大同區</button></a>
				
			</div>	
			<div>
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=松山區' />"><button class="font1">松山區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=內湖區' />"><button class="font1">內湖區</button></a>
				
			</div>	
		 

		</div>
<!-- ------------------------------中間地圖區塊開始------------------------------ -->
				
		<div class="btnBy2">
			
			<div>
			<form>
			<input name="" id="" type="text" placeholder="今天 想找什麼地點呢？">
			<input type='submit' value="Go">
			</form>
			</div>
		
		
<%-- 			<a href="<c:url value='/sportMapController/displaySportMaps' />"><img --%>
<%-- 				src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png" --%>
<!-- 				width="120%" height="120%"></a> -->
<!-------------------------------------測試區塊--------------------------------- -->
	
        <img id="imgMap" alt="" src="${pageContext.request.contextPath}/images/sportMap/MapSport4.png" usemap="#FPMap0" 
          />
               
        <map id="imgMap" name="FPMap0">
            <area target="" alt="" title="" id="idTaipei" class="imgbut"
                href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=台北' ></c:url>"
                coords="311,109,302,120,281,135,266,146,225,188,225,202,247,210,262,225,264,250,243,258,254,284,266,274,276,274,285,284,285,296,297,306,315,321,349,325,345,280,359,277,375,272,364,232,364,207"
                shape="poly">
            <area target="" alt="" title="" id="idTamsui" class="imgbut"
                href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=淡水' ></c:url>"
                coords="248,413,252,425,247,441,238,450,225,466,209,481,196,497,199,520,213,546,239,564,247,580,269,572,292,564,300,550,315,547,328,540,334,530,343,514,341,491,347,476,362,475,369,461,398,457,421,454,435,438,412,424,374,416,328,405,304,389"
                shape="poly">
        </map>

    
<!--     <div id="mapdiv" style="float:left;width:auto;height:auto;"></div> -->




	<!-------------------------------------測試區塊--------------------------------- -->				
	
<!-- -------------------------------中間地圖區塊結束------------------------------ -->
			
			<div>
			依分類：
				<a href="<c:url value='/sportMapController/displaySportMaps' />"><button class="font2">所有運動地點</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=1' />"><button class="font2">運動中心</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=2' />"><button class="font2">市區場館</button></a>

			
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=3' />"><button class="font2">游泳池</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=4' />"><button class="font2">其他室內場地</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsByCategoryId?sportCategoryBean=5' />"><button class="font2">其他戶外場地</button></a>
			</div>		
				
				
				
		</div>
<!-- 	----------------------------------依分類區塊----------------------------------- -->
		<div class="btnBy3">
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=新北市' />"><button class="font1">所有新北市</button></a>
			</div>
			<div>
				<span>依區域：</span>
			</div>
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=板橋區' />"><button class="font1">板橋區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=中和區' />"><button class="font1">中和區</button></a>
			</div>
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=新莊區' />"><button class="font1">新莊區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=淡水區' />"><button class="font1">淡水區</button></a>
			</div>
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=三重區' />"><button class="font1">三重區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=新店區' />"><button class="font1">新店區</button></a>
			</div>
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=五股區' />"><button class="font1">五股區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=林口區' />"><button class="font1">林口區</button></a>
			</div>	
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=蘆洲區' />"><button class="font1">蘆洲區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=八里區' />"><button class="font1">八里區</button></a>
			</div>	
			<div>
				
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=土城區' />"><button class="font1">土城區</button></a>
			
				<a
					href="<c:url value='/sportMapController/displaySportMapsBySportMapAddress?sportMapAddress=永和區' />"><button class="font1">永和區</button></a>
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