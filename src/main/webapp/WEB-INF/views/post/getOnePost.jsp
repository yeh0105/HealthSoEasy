<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-2.0.0.min.js"></script>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/bootstrap.min.js"></script>


<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}
</style>

<script>
document.addEventListener("DOMContentLoaded",function() {
	

	
})
</script>

<script>
document.addEventListener("DOMContentLoaded",function() {
	
	//變數宣告------------------------------------------------------------

	let top3Replies;
	let postBean=${getOnePostBean.postId}
	// 查詢字串包含1.即將要讀取的類別(postCategoryBean),
	// 注意，查詢字串的前面有問號
	let queryString = "?postBean=" + postBean ;

	//變數宣告------------------------------------------------------------

	//新建XMLHttpRequest物件
	let xhr = new XMLHttpRequest();
	//設定連線內容
	xhr.open("GET","<c:url value='/ReplyNeedLoginController/getTop3Reply.json'/>"+queryString,true);
	//對伺服器發送請求
	xhr.send();
	//當readyState屬性值改變時呼叫此方法
	xhr.onreadystatechange = function() {
	if (xhr.readyState == 4 && xhr.status == 200) {

		replies = JSON.parse(xhr.responseText);
// 			console.log(xhr.responseText);
// 			console.log("replies="+replies);

		displayTop3Replies(); 
		}
	}
	
	// 顯示送回來的所有留言
	function displayTop3Replies() {
		
// 		console.log(xhr.responseText);
// 		console.log(replies);


		let contentTop3 = "";
		
		(replies).forEach(reply =>{
			
			contentTop3+='<div class="row-fluid" style="border-top: 4px #C9D8BF dotted; padding-top: 1%">'
				+'<div class="span11" style="display: flex;">'
//					留言者頭像
				+'<img alt="留言者頭像" src="<c:url value="/customerController/getCustomerImgById/'+reply.customerBean.customerId+'" />" class="img-circle"'
				+'style="width: 50px; height: 50px;" />&nbsp;&nbsp;'
				+'<div>'
//					留言者暱稱+樓層+時間
				+reply.customerBean.customerName+'<br>'+reply.replyTime.substring(0,16)
				+'</div>'
				+'</div>'
			
				+'<div class="span1">'
//				Like按鈕SVG
				+ '<a href="#"> <svg viewBox="0 0 520 500" style="width: 20px; height: 20px;" xmlns="http://www.w3.org/2000/svg">'
				+ '<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />'
				+ '</svg>'
//					Like數量
				+'</a>'+reply.replyLike
				+'</div>'
				+'</div>'
			
				+'<div class="row-fluid">'
				+'<div class="span12" style="padding: 2%;">'
				+'<p>'
//					留言內容
				+reply.replyContent
				+'</p>'
				+'</div>'
				+'</div>'
			
		})
		document.getElementById("insertTop3Replies").innerHTML = contentTop3;
	}
})
</script>

<script>
	document.addEventListener("DOMContentLoaded",function() {
		
		//變數宣告------------------------------------------------------------

		let replies;
		let top3Replies;
		let postBean=${getOnePostBean.postId}
		// 查詢字串包含1.即將要讀取的類別(postCategoryBean),
		// 注意，查詢字串的前面有問號
		let queryString = "?postBean=" + postBean ;

		//變數宣告------------------------------------------------------------
		
		//載入時 取得所有此文章的留言-----------------------------------------------------
		
		
		//新建XMLHttpRequest物件
		let xhr = new XMLHttpRequest();
		//設定連線內容
		xhr.open("GET","<c:url value='/ReplyNeedLoginController/getAllReply.json'/>"+queryString,true);
		//對伺服器發送請求
		xhr.send();
		//當readyState屬性值改變時呼叫此方法
		xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			replies = JSON.parse(xhr.responseText);
// 			console.log(xhr.responseText);
// 			console.log("replies="+replies);

			displayReplies(); 
			}
		}
		
		// 顯示送回來的所有留言
		function displayReplies() {
			
// 	 		console.log(xhr.responseText);
// 	 		console.log(replies);
			
			
			let content = "";
			
			for(var i=0; i < replies.length; i++){
				
				content+='<div id="'
						+(i+1)
						+'" class="row-fluid" style="border-top: 4px #C9D8BF dotted; padding-top: 1%">'
						+'<div class="span11" style="display: flex;">'
// 						留言者頭像
						+'<img alt="留言者頭像" src="<c:url value="/customerController/getCustomerImgById/'+replies[i].customerBean.customerId+'" />" class="img-circle"'
						+'style="width: 50px; height: 50px;" />&nbsp;&nbsp;'
						+'<div>'
// 						留言者暱稱+樓層+時間
						+replies[i].customerBean.customerName+'<br> B'+(i+1)+'&nbsp;&nbsp;‧&nbsp;&nbsp;'+replies[i].replyTime.substring(0,16)
						+'</div>'
						+'</div>'
					
						+'<div class="span1">'
//						Like按鈕SVG
						+ '<a href="#"> <svg viewBox="0 0 520 500" style="width: 20px; height: 20px;" xmlns="http://www.w3.org/2000/svg">'
						+ '<path d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />'
						+ '</svg>'
// 						Like數量
						+'</a>'+replies[i].replyLike
						+'</div>'
						+'</div>'
					
						+'<div style="display:flex;">'
						
						+'<div class="row-fluid">'
						+'<div class="span10" style="padding: 2%;">'
						+'<p>'
// 						留言內容
						+replies[i].replyContent
						+'</p>'
						+'</div>'

// 						Update按鈕
						+'<div class="span2">'
						+'<button style="margin: 0% 1%;" data-toggle="modal" data-target="#replyInfoModal"'
				        +'data-id="' + replies[i].replyId
				        +'"data-status="' + replies[i].replyStatus
				        +'"data-content="' + replies[i].replyContent
				        +'">Update</button>'
				        
// 						Delete按鈕
// 						+'<button style="margin: 0% 1%;" data-toggle="modal" data-target="#replyInfoModal"'
// 				        +'data-id="' + replies[i].replyId
// 				        +'"data-status="' + replies[i].replyStatus
// 				        +'"data-content="' + replies[i].replyContent
// 				        +'">Delete</button>'
				        +'</div>'
				        
						+'</div>'
						
						+'</div>'
				        
						
				        
			
				
			}
			document.getElementById("insertReplies").innerHTML = content;
		}
		
		
//		互動視窗--所有留言
//		開啟互動視窗表單
		let inputReplyId = null;
		$('#replyInfoModal').on('show.bs.modal', function (event) {
//	 		取得代入update按鈕的值
			let button = $(event.relatedTarget); 
			let updateReplyId = button.data('id'); 
			inputReplyId=updateReplyId;		//作為表單送出用ID
			let updateReplyStatus = button.data('status'); 
			let updateReplyContent = button.data('content');
			let modal = $(this);
//			依照取得值寫入表單
			modal.find('.modal-title').text('留言修改	ID: ' + updateReplyId);
			if(updateReplyStatus == 1){
	  			modal.find('.modal-body #recipient-status1').prop('checked',true);
			}else if(updateReplyStatus == 2){
	  			modal.find('.modal-body #recipient-status2').prop('checked',true);
			}
			modal.find('.modal-body #recipient-content').val(updateReplyContent);
		})
		
//	 	互動視窗--所有留言--送出按鈕
		let sendReplyInfo = document.getElementById("sendReplyInfo");
		let replyInfo_form = document.getElementById("replyInfo_form");
		
		sendReplyInfo.addEventListener("click", function(){
//			表單資料初始化
		// ID使用原先取得的值
			let inputRreplyStatus1 = document.getElementById("recipient-status1");
			let inputRreplyStatus2 = document.getElementById("recipient-status2");
			let inputRreplyContent = document.getElementById("recipient-content");
			
			let inputReplyStatus = null;
			if(inputReplyStatus1.checked){
				inputReplyStatus = inputReplyStatus1.value;
			}else if(inputReplyStatus2.checked){
				inputReplyStatus = inputReplyStatus2.value;				
			}
			
//	 		建立一支obj，將input內容裝入
			
			let updateReplyrObj = {
					"replyId" : inputReplyId,	//Id為Update代入的值(全域)
					"replyStatus" : inputReplyStatus,
					"replyContent" : inputRreplyContent.value,
			}
			
//	 		將物件轉為JSON字串
			let json = JSON.stringify(updateReplyrObj);
			
			xhr.open('POST', "<c:url value='/ReplyNeedLoginController/updateReply'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(json);	
			
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
//					接收回傳訊息，更新訊息框
					let replyJSON = JSON.parse(xhr.responseText);
//	 				infoMessage.innerHTML = replyJSON.updateMessage;
					console.log(replyJSON);
//					重新搜尋目前類型資料
//	 				applybtn.click();
//	 				document.querySelector(".filter-menu").classList.toggle("active");
				}
			}
		
		})
		
	})
</script>

</head>



<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<hr style="color: transparent;">

	<!-- --------------------------------------------文章顯示區開始------------------------------------------------------- -->
	<div class="container-fluid"
		style="width: 80%; padding: 1% 5%; border: 2px solid lightslategray; border-radius: 10px; box-shadow: 3px 3px 12px lightgrey; margin-left: 5%; margin-top: 8.5%;">
		<!-- 			作者頭像+暱稱開始 -->
		<div class="row-fluid">
			<div class="span10" style="display: flex; align-items: center;">
				<img alt="作者頭像"
					src="<c:url value='/customerController/getCustomerImgById/${getOnePostBean.customerBean.customerId}' />"
					class="img-circle" style="width: 50px; height: 50px;" />
				<p class="text-left">&nbsp;&nbsp;&nbsp;${getOnePostBean.customerBean.customerNickname}</p>
			</div>
			<!-- 			作者頭像+暱稱結束 -->

			<div class="span2" style="display: flex; align-items: center;">
				<!-- --------------------------------------------文章修改區開始------------------------------------------------------- -->
				<a
					href="<c:url value='/PostNeedLoginController/updatePost/${getOnePostBean.postId}' /> "
					style="text-decoration: none; margin: 5%; width: 15%; height: 10%;">
					<svg viewBox="-27 0 512 512.00052"
						xmlns="http://www.w3.org/2000/svg" style="width: 100%;">
						<path
							d="m32.308594 256.488281c0 65.777344 32.679687 123.921875 82.6875 159.082031 8.8125 6.199219 9.28125 19.070313.816406 25.734376l-.238281.1875c-5.527344 4.351562-13.277344 4.640624-19.035157.597656-58.378906-41-96.539062-108.847656-96.539062-185.601563 0-124.496093 103.050781-225.5625 227.296875-226.625v32.316407c-106.414063 1.054687-194.988281 87.648437-194.988281 194.308593zm0 0"
							fill="#1ed688" />
						<path
							d="m233.230469.964844 59.375 40.613281c3.179687 2.175781 3.179687 6.867187 0 9.042969l-59.375 40.613281c-3.636719 2.488281-8.570313-.117187-8.570313-4.519531v-81.226563c0-4.40625 4.933594-7.007812 8.570313-4.523437zm0 0"
							fill="#1ab975" />
						<path
							d="m425.382812 255.511719c0-65.777344-32.683593-123.921875-82.691406-159.082031-8.8125-6.199219-9.28125-19.070313-.816406-25.734376l.238281-.1875c5.527344-4.351562 13.277344-4.640624 19.035157-.597656 58.382812 41 96.539062 108.847656 96.539062 185.601563 0 124.496093-102.875 225.5625-227.125 226.625v-32.316407c106.414062-1.054687 194.820312-87.644531 194.820312-194.308593zm0 0"
							fill="#1ed688" />
						<path
							d="m224.460938 511.035156-59.375-40.613281c-3.179688-2.175781-3.179688-6.867187 0-9.042969l59.375-40.613281c3.632812-2.488281 8.570312.117187 8.570312 4.519531v81.226563c0 4.40625-4.9375 7.011719-8.570312 4.523437zm0 0"
							fill="#1ab975" />
						<path
							d="m329.628906 230.820312-97.257812 80.65625-24.519532 20.335938c-5.777343 4.785156-13.089843 7.382812-20.527343 7.382812-1.238281 0-2.476563-.070312-3.726563-.214843-8.675781-1.019531-16.660156-5.621094-21.898437-12.617188l-37.820313-50.414062c-8.539062-11.386719-6.230468-27.550781 5.160156-36.105469 11.398438-8.539062 27.5625-6.230469 36.105469 5.160156l25.53125 34.042969.207031-.167969 105.828126-87.765625c10.964843-9.085937 27.222656-7.570312 36.3125 3.394531 9.089843 10.964844 7.570312 27.222657-3.394532 36.3125zm0 0"
							fill="#1ed688" />
						<path
							d="m329.628906 230.820312-97.257812 80.65625c-15.90625-7.941406-29.894532-18.917968-41.488282-32.597656l105.828126-87.765625c10.964843-9.085937 27.222656-7.570312 36.3125 3.394531 9.089843 10.964844 7.570312 27.222657-3.394532 36.3125zm0 0"
							fill="#35e298" />
					</svg>
				</a>
				<!-- --------------------------------------------文章修改區結束------------------------------------------------------- -->

				<!-- --------------------------------------------文章刪除區開始------------------------------------------------------- -->
				<a class="deletePost"
					href="<c:url value='/PostNeedLoginController/deletePost/${getOnePostBean.postId}' /> "
					style="text-decoration: none; margin: 3%; width: 15%; height: 10%;">
					<svg height="427pt" viewBox="0 0 427 427.00131"
						style="width: 100%; height: 10%; fill: limegreen;"
						xmlns="http://www.w3.org/2000/svg">
						<path
							d="m232.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" />
						<path
							d="m114.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" />
						<path
							d="m28.398438 127.121094v246.378906c0 14.5625 5.339843 28.238281 14.667968 38.050781 9.285156 9.839844 22.207032 15.425781 35.730469 15.449219h189.203125c13.527344-.023438 26.449219-5.609375 35.730469-15.449219 9.328125-9.8125 14.667969-23.488281 14.667969-38.050781v-246.378906c18.542968-4.921875 30.558593-22.835938 28.078124-41.863282-2.484374-19.023437-18.691406-33.253906-37.878906-33.257812h-51.199218v-12.5c.058593-10.511719-4.097657-20.605469-11.539063-28.03125-7.441406-7.421875-17.550781-11.5546875-28.0625-11.46875h-88.796875c-10.511719-.0859375-20.621094 4.046875-28.0625 11.46875-7.441406 7.425781-11.597656 17.519531-11.539062 28.03125v12.5h-51.199219c-19.1875.003906-35.394531 14.234375-37.878907 33.257812-2.480468 19.027344 9.535157 36.941407 28.078126 41.863282zm239.601562 279.878906h-189.203125c-17.097656 0-30.398437-14.6875-30.398437-33.5v-245.5h250v245.5c0 18.8125-13.300782 33.5-30.398438 33.5zm-158.601562-367.5c-.066407-5.207031 1.980468-10.21875 5.675781-13.894531 3.691406-3.675781 8.714843-5.695313 13.925781-5.605469h88.796875c5.210937-.089844 10.234375 1.929688 13.925781 5.605469 3.695313 3.671875 5.742188 8.6875 5.675782 13.894531v12.5h-128zm-71.199219 32.5h270.398437c9.941406 0 18 8.058594 18 18s-8.058594 18-18 18h-270.398437c-9.941407 0-18-8.058594-18-18s8.058593-18 18-18zm0 0" />
						<path
							d="m173.398438 154.703125c-5.523438 0-10 4.476563-10 10v189c0 5.519531 4.476562 10 10 10 5.523437 0 10-4.480469 10-10v-189c0-5.523437-4.476563-10-10-10zm0 0" />
					</svg>
				</a>
				<!-- --------------------------------------------文章刪除區結束------------------------------------------------------- -->

				<!-- --------------------------------------------前一頁------------------------------------------------------- -->
				<a class="" href="<c:url value="/postByCategory"></c:url>">回上一頁
				</a>
				<!-- --------------------------------------------前一頁------------------------------------------------------- -->
			</div>
		</div>



		<!-- 			作者頭像+暱稱結束 -->

		<!-- 			文章標題+類別+時間 -->
		<div class="row-fluid">
			<div class="span12">
				<h2>${getOnePostBean.postTitle}</h2>
				<a>${getOnePostBean.postCategory}</a>&nbsp;&nbsp;‧&nbsp;&nbsp;${fn:substring(getOnePostBean.postUploadTime,0,16)}
			</div>

		</div>
		<!-- 			文章標題+類別+時間 -->

		<!-- 			文章圖片 -->
		<div class="row-fluid" style="margin-bottom: 2%;">
			<div class="span12" style="text-align: center;">
				<img alt="文章圖片"
					src="<c:url value='/PostController/getPicture/${getOnePostBean.postId}' />"
					class="img-polaroid" />
			</div>
		</div>
		<!-- 			文章圖片 -->

		<!-- 			文章內容 -->
		<div class="row-fluid">
			<div class="span12">
				<p>${getOnePostBean.postContent}</p>
			</div>
		</div>
		<!-- 			文章內容 -->
		<br>
		<!-- 			文章likes -->
		<div class="row-fluid">
			<div class="span11">
				<a href="" style="text-decoration: none;"> <svg class="like"
						viewBox="0 0 520 500" style="width: 20px; height: 20px;"
						xmlns="http://www.w3.org/2000/svg">
						<path id="path1"
							d="m256 455.515625c-7.289062 0-14.316406-2.640625-19.792969-7.4375-20.683593-18.085937-40.625-35.082031-58.21875-50.074219l-.089843-.078125c-51.582032-43.957031-96.125-81.917969-127.117188-119.3125-34.644531-41.804687-50.78125-81.441406-50.78125-124.742187 0-42.070313 14.425781-80.882813 40.617188-109.292969 26.503906-28.746094 62.871093-44.578125 102.414062-44.578125 29.554688 0 56.621094 9.34375 80.445312 27.769531 12.023438 9.300781 22.921876 20.683594 32.523438 33.960938 9.605469-13.277344 20.5-24.660157 32.527344-33.960938 23.824218-18.425781 50.890625-27.769531 80.445312-27.769531 39.539063 0 75.910156 15.832031 102.414063 44.578125 26.191406 28.410156 40.613281 67.222656 40.613281 109.292969 0 43.300781-16.132812 82.9375-50.777344 124.738281-30.992187 37.398437-75.53125 75.355469-127.105468 119.308594-17.625 15.015625-37.597657 32.039062-58.328126 50.167969-5.472656 4.789062-12.503906 7.429687-19.789062 7.429687zm-112.96875-425.523437c-31.066406 0-59.605469 12.398437-80.367188 34.914062-21.070312 22.855469-32.675781 54.449219-32.675781 88.964844 0 36.417968 13.535157 68.988281 43.882813 105.605468 29.332031 35.394532 72.960937 72.574219 123.476562 115.625l.09375.078126c17.660156 15.050781 37.679688 32.113281 58.515625 50.332031 20.960938-18.253907 41.011719-35.34375 58.707031-50.417969 50.511719-43.050781 94.136719-80.222656 123.46875-115.617188 30.34375-36.617187 43.878907-69.1875 43.878907-105.605468 0-34.515625-11.605469-66.109375-32.675781-88.964844-20.757813-22.515625-49.300782-34.914062-80.363282-34.914062-22.757812 0-43.652344 7.234374-62.101562 21.5-16.441406 12.71875-27.894532 28.796874-34.609375 40.046874-3.453125 5.785157-9.53125 9.238282-16.261719 9.238282s-12.808594-3.453125-16.261719-9.238282c-6.710937-11.25-18.164062-27.328124-34.609375-40.046874-18.449218-14.265626-39.34375-21.5-62.097656-21.5zm0 0" />
					</svg>
				</a>${getOnePostBean.postLike}
			</div>
			<div class="span1">
				<button id="addReplyBtn"
					class="btn btn-success btn-large glyphicon glyphicon-plus"
					aria-hidden="true" type="button"></button>
			</div>
		</div>
		<!-- 			文章likes -->

		<!-- --------------------------------------------文章顯示區------------------------------------------------------- -->

		<!-- --------------------------------------------留言區------------------------------------------------------- -->



		<!-- --------------------------------------------留言區------------------------------------------------------- -->

		<!-- ------------------------------------------熱門留言------------------------------------------------------- -->
		<h4 style="border-top: 3px #325b43 solid; padding-top: 1%;">熱門回應</h4>
		<div id="insertTop3Replies" style="background-color: #F0FFF0;">

		</div>
		<!-- ------------------------------------------熱門留言----------------------------------------ㄦ------------- -->

		<!-- ------------------------------------------留言顯示區----------------------------------------------------- -->
		<div id="insertReplies"></div>
		<!-- ------------------------------------------留言顯示區----------------------------------------------------- -->
	</div>
	
			<!-- 			互動視窗--留言資料 -->
		<div class="modal fade" id="ReplyInfoModal" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">ID:</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form id="replyInfo_form" action="#" method="post">
							<div class="form-group">
								<label for="recipient-content" class="col-form-label">Content:</label>
								<input type="text" class="form-control" id="recipient-content">
							</div>
							<div class="form-group"
								style="display: flex; justify-content: flex-start;">
								<label for="recipient-status1" class="col-form-label">Active:</label>
								<input type="radio" class="form-control form-check-input"
									id="recipient-status1" name="radio-status"
									style="margin: 10px 5px 0px 5px" value="1"> <label
									for="recipient-status2" class="col-form-label">Disabled:</label>
								<input type="radio" class="form-control form-check-input"
									id="recipient-status2" name="radio-status"
									style="margin: 10px 5px 0px 5px" value="2">
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary" data-dismiss="modal" id="sendReplyInfo"
							style="background-color: #007500; border-color: #007500">Send</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 			---------------------------------------------------------------------------------------------------------------- -->
	

	<!-- 	---------------------用來接delete的post--------------------------	 -->

	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>

	<!-- ----------------------------刪除單筆資料用-------------------------------- -->
	<script>
		//將 get 請求轉換為 post 請求提交
		$(document).ready(function() {
			$('.deletePost').click(function() {
				if (confirm('確定刪除此文章嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

					console.log(href);
				}
				return false;

			});
		})
	</script>

	<div class="mainWrapper">
		<section id="offer">
			<div>
				<div></div>
			</div>
		</section>
	</div>

	<!-- ----------------------------刪除單筆資料用-------------------------------- -->
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>