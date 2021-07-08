<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>
	
<title>查詢全部營養師列表(分頁)</title>
<style>
#mainWrapper2 {
	width: 80%;
	padding-left: 10%;
	padding-right: 10%;
}

body * {
	font-family: '微軟正黑體';
}

#uk_breadcrumb {
	flex-wrap: wrap;
	list-style: none;
	display: flex;
	font-size: 18px;
}

#uk_breadcrumb li a {
	text-decoration: none;
}

#h3css {
	font-family: '微軟正黑體';
	color: #FF4D00;
}

#h3css2 {
	font-family: '微軟正黑體';
	color: #007FFF;
}

#pcss {
	font-family: '微軟正黑體';
	color: #B22222;
}


.thumbnail {
	float: left;
	width: 320px;
	height: 600px;
	margin-left: 30px;
	margin-right: 25px;
	margin-top: 30px;
}

.imgvideo {
	max-width: 100%;
	height: 400px;
}

.page-icon {
	margin: 20px 0 0 0;
	/*設置距離頂部20像素*/
	font-size: 0;
	/*修復行內元素之間空隙間隔*/
	text-align: center;
	/*設置內容居中顯示*/
}

/*設置共有的的樣式佈局，主要是進行代碼優化，提高運行效率*/
.page-icon a, .page-disabled, .page-next {
	border: 1px solid #ccc;
	border-radius: 3px;
	padding: 4px 10px 5px;
	font-size: 14PX;
	/*修復行內元素之間空隙間隔*/
	margin-right: 10px;
}

/*對 a 標籤進行樣式佈局 */
.page-icon a {
	text-decoration: none;
	/*取消鏈接的下劃線*/
	color: #005aa0;
}

.page-current {
	color: #ff6600;
	padding: 4px 10px 5px;
	font-size: 14PX;
	/*修復行內元素之間空隙間隔*/
}

.page-disabled {
	color: #ccc;
}

.page-next i, .page-disabled i {
	cursor: pointer;
	/*設置鼠標經過時的顯示狀態，這裏設置的是顯示狀態爲小手狀態*/
	display: inline-block;
	/*設置顯示的方式爲行內塊元素*/
	width: 5px;
	height: 9px;
	background-image:
		url(http://img.mukewang.com/547fdbc60001bab900880700.gif);
	/*獲取圖標的背景鏈接*/
}

.page-disabled i {
	background-position: -80px -608px;
	margin-right: 3px;
}

.page-next i {
	background-position: -62px -608px;
	margin-left: 3px;
}
</style>
<script >
document.addEventListener("DOMContentLoaded",function() {
	//變數宣告------------------------------------------------------------

	var pageNo = 0;
	var totalPage = 0;
	var responseData;
	var categoryStatus="all";
	
	//載入時 取得所有文章-----------------------------------------------------
	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open("GET","<c:url value='/nutritionistController/getAllNutritionist.json' />",true);
	//對伺服器發送請求
	xhr.send();
	//當readyState屬性值改變時呼叫此方法
	xhr.onreadystatechange = function() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	// 				console.log(xhr.responseText);
		var responseData = xhr.responseText;
		displayPageNutritionists(responseData); // 顯示讀取到的非文字性資料
		}
	}
	
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

			xhr.open("GET","<c:url value='/nutritionistController/getAllNutritionist.json' />"+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData = xhr.responseText;
					displayPageNutritionists(responseData);
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
			queryString = "?pageNo=" + no + "&totalPage="+ totalPage;

			xhr.open("GET","<c:url value='/nutritionistController/getAllNutritionist.json' />"+ queryString, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == 4 && xhr.status == 200) {
					var responseData = xhr.responseText;
					displayPageNutritionists(responseData);
				}
			}
		}
		
	}
	
	// 顯示送回來的所有文章
	function displayPageNutritionists(responseData) {
		console.log("123");
		var mapObj = JSON.parse(responseData);
		var nutritionists = mapObj.nutritionistPage;
		pageNo = mapObj.currPage;
		totalPage = mapObj.totalPage;
		
		let content = "";


		//內容
		(nutritionists).forEach(nutritionist =>{
			content += '<div class="thumbnail">'
					+ '<img class="imgvideo" src="<c:url value="/nutritionistController/getImage/'+nutritionist.nutritionistId+'" />"height="500px" width="300px" />'
					+ '<div class="caption">'
					+ '<h3> 姓名 : <font id="h3css2">'+nutritionist.nutritionistName+'</font></h3>'
					+ '<p> 專長 : <font id="pcss">'+nutritionist.nutritionistCategory+'</font></p>'
					+ '<p> 學位 : <font>'+nutritionist.nutritionistDegree+'</font></p>'
					+ '<p><a class="btn btn-primary" href="<c:url value="/nutritionistController/nutritionist/'+nutritionist.nutritionistId+'"/>">進入營養師推薦套餐</a></p>'
					+ '</div>'
					+ '</div>'
		});
		
		document.getElementById("insertNutritionists").innerHTML = content;
		
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
	}
})
</script>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<section>
		<img
			src="${pageContext.request.contextPath}/images/nutritionist/nutritionistHeader.png"
			width="100%" height="100%">
	</section>
	<div id='mainWrapper2'>
		<section>
			<br>
			<div>
				<ul id="uk_breadcrumb">
					<li><a href='<c:url value='/'></c:url>'>首頁</a></li>
					<li>&emsp;&frasl;&emsp;營養師列表</li>
				</ul>
			</div>
			<hr>
			
			<h3 id="h3css">營養師列表</h3>
			<div class="container-fluid">
				<div class="row-fluid">
				<!-- ------------------------------內容區塊--------------------------------- -->
					<div class="span12" id="insertNutritionists">
					</div>
				<!-- ------------------------------內容區塊--------------------------------- -->	
				</div>
			</div>

				<!-- ------------------------------分頁區塊--------------------------------- -->
					<div id='navigation' style='height: 60px;'>
					</div>
				<!-- ------------------------------分頁區塊--------------------------------- -->
			<br>

			<div>
				<a href="<c:url value='/recordController/addRecord'/>"><button>新增日誌</button></a>
				<a href="<c:url value='/recordController/getAllRecords'/>"><button>	所有日誌</button></a>
				<a href="<c:url value='/recordController/record/getRecordByCustomerId'/>"><button> 會員日誌</button></a>
			</div>


		</section>
	</div>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>