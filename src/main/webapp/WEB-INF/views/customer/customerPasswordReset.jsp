<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Forgot Password</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(){
		let emailInput = document.getElementById("emailInput");
		let emailSubmit = document.getElementById("emailSubmit");
		let xhr = new XMLHttpRequest();
		
		emailSubmit.addEventListener("click", function(){
			let email = {"email" : emailInput};
			let json = JSON.stringify(email);
			
			xhr.open('POST', "<c:url value='/passwordResetValidate/sendCustomerValidationEmail'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr.send(json);
			
			xhr.onreadystatechange = function(){
				let responseMessage = JSON.parse(xhr.responseText);
				console.log(responseMessage);
			}
		});
	});

</script>

</head>
<body>
	<div>
		<form id="emailForm" action="">
			<span>請輸入電子郵件以搜尋帳號</span>
			<input id="emailInput" type="email" placeholder="email">
			<button id="emailSubmit">送出</button>
		</form>
	</div>
</body>
</html>