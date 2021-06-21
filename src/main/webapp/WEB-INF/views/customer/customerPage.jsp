<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="http://www.francescomalagrino.com/BootstrapPageGenerator/3/css/bootstrap-combined.min.css"
	rel="stylesheet" media="screen">

<link
	href="https://fonts.googleapis.com/css2?family=Caudex&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Lobster&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/customerPage.css" rel="stylesheet">

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(){
// 		基本資料欄位
		let customerName = document.getElementById("customerName");
		let customerNickname = document.getElementById("customerNickname");
		let customerPhone = document.getElementById("customerPhone");
		let customerBirthDay = document.getElementById("customerBirthDay");
// 		按鈕、回傳訊息欄位
// 		let informationUpdateDiv = document.getElementById("informationUpdateDiv");
		let informationUpdate = document.getElementById("informationUpdate");
		let infoMessage = document.getElementById("infoMessage");
		
		let informationUpdateMode = "update";
		
// 		初始化XMLHttpRequest物件
		let xhr = new XMLHttpRequest();
		
// 		會員基本資料修改按鈕
		informationUpdate.addEventListener("click", switchUpdateMode);
		
		//切換按鈕模式
		function switchUpdateMode () {
			if(informationUpdateMode == "update"){
				updateCustomerInfo ();
				informationUpdateMode = "submit";
			} else if(informationUpdateMode == "submit"){
				submitCustomerInfo ();
				informationUpdateMode = "update";
			}
		}
		
        //按下修改--打開編輯欄位--按鈕變成確認
        function updateCustomerInfo () {
        	customerName.disabled = "";
			customerNickname.disabled = "";
			customerPhone.disabled = "";
			customerBirthDay.disabled = "";
			informationUpdate.innerHTML = "確認";
        }
		
        //按下確認--送出JSON字串資料--關閉欄位--按鈕變成修改
        function submitCustomerInfo () {
//         	建立一支obj，裝入input內容
			let customerInformationBean = {
					'customerId' : ${customerSignInSuccess.customerId},
					'customerName' : customerName.value,
					'customerNickname' : customerNickname.value,
					'customerPhone' : customerPhone.value,
					'customerBirthDay' : customerBirthDay.value
			}
//			將物件轉為JSON字串
			let json = JSON.stringify(customerInformationBean);
			
			console.log(json);
			
			xhr.open('POST', "<c:url value='/customerController/updateCustomerInfo'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(json);	
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
// 					接收回傳訊息，更新訊息框
					let customerJSON = JSON.parse(xhr.responseText);
					infoMessage.innerHTML = customerJSON.updateMessage;
					console.log(customerJSON);
					
					
					//關閉欄位--模式設定為修改
					customerName.disabled = "disabled";
					customerNickname.disabled = "disabled";
					customerPhone.disabled = "disabled";
					customerBirthDay.disabled = "disabled";
					informationUpdate.innerHTML = "修改";
				}
			}
        }
        
//    ---------------------------------------------------------------------------------------------------
// 		健康資料欄位
		let customerGender1 = document.getElementById("customerGender1");
		let customerGender2 = document.getElementById("customerGender2");
		let customerDiet1 = document.getElementById("customerDiet1");
		let customerDiet2 = document.getElementById("customerDiet2");
		let customerExerciseHabits1 = document.getElementById("customerExerciseHabits1");
		let customerExerciseHabits2 = document.getElementById("customerExerciseHabits2");
		let customerExerciseHabits3 = document.getElementById("customerExerciseHabits3");
		let customerHeight = document.getElementById("customerHeight");
		let customerWeight = document.getElementById("customerWeight");
// 		按鈕、回傳訊息欄位
		let healthInfoMessage = document.getElementById("healthInfoMessage");
		let healthInformationUpdate = document.getElementById("healthInformationUpdate");
		
		let healthInformationUpdateMode = "update";
		
// // 		初始化XMLHttpRequest物件
// 		let xhr = new XMLHttpRequest();
		
// 		會員健康資料修改按鈕
		healthInformationUpdate.addEventListener("click", switchHealthUpdateMode);
		
		//切換按鈕模式
		function switchHealthUpdateMode () {
			if(healthInformationUpdateMode == "update"){
				updateHealthCustomerInfo ();
				healthInformationUpdateMode = "submit";
			} else if(healthInformationUpdateMode == "submit"){
				submitCustomerHealthInfo ();
				healthInformationUpdateMode = "update";
			}
		}
		
        //按下修改--打開編輯欄位--按鈕變成確認
        function updateHealthCustomerInfo () {
        	customerGender1.disabled = "";
        	customerGender2.disabled = "";
        	customerDiet1.disabled = "";
        	customerDiet2.disabled = "";
        	customerExerciseHabits1.disabled = "";
        	customerExerciseHabits2.disabled = "";
        	customerExerciseHabits3.disabled = "";
        	customerHeight.disabled = "";
        	customerWeight.disabled = "";
        	healthInformationUpdate.innerHTML = "確認";
        }
		
        //按下確認--送出JSON字串資料--關閉欄位--按鈕變成修改
        function submitCustomerHealthInfo () {
//         	建立一支obj，裝入input內容
			let customerHealthInformationBean = {
					'customerId' : ${customerSignInSuccess.customerId},
					'customerHealthBean' : {
							'customerGender' : customerGender.value,
							'customerDiet' : customerDiet.value,
							'customerExerciseHabits' : customerExerciseHabits.value,
							'customerHeight' : customerHeight.value,
							'customerWeight' : customerWeight.value
					}
			}
//			將物件轉為JSON字串
			let json = JSON.stringify(customerInformationBean);
			
			console.log(json);
			
			xhr.open('POST', "<c:url value='/customerController/updateCustomerHealthInfo'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(json);	
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
// 					接收回傳訊息，更新訊息框
					let customerJSON = JSON.parse(xhr.responseText);
					infoMessage.innerHTML = customerJSON.updateMessage;
					console.log(customerJSON);
					
					
					//關閉欄位--模式設定為修改
					customerGender.disabled = "disabled";
					customerDiet.disabled = "disabled";
					customerExerciseHabits.disabled = "disabled";
					customerHeight.disabled = "disabled";
					customerWeight.disabled = "disabled";
					healthInformationUpdate.innerHTML = "修改";
				}
			}
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
					<h1 style="color: #1d3b2a; font-family: Caudex;">About You</h1>
					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Taking Our Health in Our Hands!</p>

					<p style="color: #325b43; font-family: Lobster; font-size: 18px;">
						Let's Know About You.</p>
				</div>

			</div>
		</section>
	</div>
	<div class="customer-main">
		<div>
			<div class="customer-img">
				<div>
					<img alt="" src="${pageContext.request.contextPath}/images/goodcat.jpg">
				</div>
			</div>
			<div class="customer-information" >
				<div class="customer-information-inside">
						<div class="customer-information-items">
							<div>
								<div style="width: 20%">姓名：</div>
								<div style="width: 80%">
									<input id='customerName' value='${customerSignInSuccess.customerName}' disabled="disabled" type='text' placeholder='請輸入姓名'>
								</div>
							</div>
							<div>
								<div  style="width: 20%">暱稱：</div>
								<div style="width: 80%">
									<input id='customerNickname' value='${customerSignInSuccess.customerNickname}' disabled="disabled" type='text' placeholder='請輸入暱稱'>
								</div>
							</div>
							<div>
								<div style="width: 20%">電話：</div>
								<div style="width: 80%">
									<input id='customerPhone' value='${customerSignInSuccess.customerPhone}' disabled="disabled" type='text' placeholder='請輸入電話'>
								</div>
							</div>
							<div>
								<div style="width: 20%">生日：</div>
								<div style="width: 80%">
									<input id='customerBirthDay' value='${customerSignInSuccess.customerBirthDay}' disabled="disabled" type='date' placeholder='請輸入生日'>
								</div>
							</div>
							<div id="informationUpdateDiv" class="customer-information-items-button">
								<div id="infoMessage" style="justify-content: flex-start; font-size: 16px ; color: red ; width: 75%;"></div>
								<button id="informationUpdate">修改</button>
							</div>
						</div>
				</div>
			</div>
		</div>
		<div>
			<div class="customer-health-information">
				<div class="customer-health-information-inside">
						<div class="customer-health-information-items">
							<div>
								<div style="width: 20%">性別：</div>
								<div style="width: 80%">
										<input style="height: 40%" id='customerGender1' value='1' disabled="disabled" type='radio' name="customerGender">
										<label for="customerGender1">男</label>
										<input style="height: 40%" id='customerGender2' value='2' disabled="disabled" type='radio' name="customerGender">
										<label for="customerGender2">女</label>
								</div>
							</div>
							<div>
								<div style="width: 20%">飲食：</div>
								<div style="width: 80%">
									<input style="height: 40%" id='customerDiet1' value='1' disabled="disabled" type='radio' name="customerDiet">
									<label for="customerDiet1">葷</label>
									<input style="height: 40%" id='customerDiet2' value='2' disabled="disabled" type='radio' name="customerDiet">
									<label for="customerDiet2">素</label>
								</div>
							</div>
							<div>
								<div style="width: 20%">運動：</div>
								<div style="width: 80%">
									<input style="height: 40%" id='customerExerciseHabits3' value='3' disabled="disabled" type='radio' name="customerExerciseHabits">
									<label for="customerExerciseHabits3">強</label>
									<input style="height: 40%" id='customerExerciseHabits2' value='2' disabled="disabled" type='radio' name="customerExerciseHabits">
									<label for="customerExerciseHabits2">中</label>
									<input style="height: 40%" id='customerExerciseHabits1' value='1' disabled="disabled" type='radio' name="customerExerciseHabits">
									<label for="customerExerciseHabits1">弱</label>
								</div>
							</div>
							<div>
								<div style="width: 20%">身高：</div>
								<div style="width: 80%">
									<input id='customerHeight' value='${customerSignInSuccess.customerHealthBean.customerHeight}' disabled="disabled" type='text' name="customerHeight" placeholder='請輸入身高(公分)'>
								</div>
							</div>
							<div>
								<div style="width: 20%">體重：</div>
								<div style="width: 80%">
									<input id='customerWeight' value='${customerSignInSuccess.customerHealthBean.customerWeight}' disabled="disabled" type='text' name="customerWeight" placeholder='請輸入體重(公斤)'>
								</div>
							</div>
							<div class="customer-health-information-items-button">
								<div id="healthInfoMessage" style="justify-content: flex-start; font-size: 16px ; color: red ; width: 75%;"></div>
								<button id="healthInformationUpdate">修改</button>
							</div>
						</div>
				</div>
			</div>
				
			<div class="customer-favorite"></div>
			
				
		</div>
	</div>
					

	<script type="text/javascript">
		
	</script>
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>