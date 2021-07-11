<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			console.log(emailInput.value);
			console.log(1);
			xhr.open('POST', "<c:url value='/passwordResetValidate/sendCustomerValidationEmail.do'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("email=" + emailInput.value);
			
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
					let responseMessage = JSON.parse(xhr.responseText);					
				}
// 				console.log(responseMessage);
			}
		});
	});

</script>

</head>
<body>
	<div>
		
		<span>請輸入電子郵件以搜尋帳號</span>
		<input id="emailInput" type="email" placeholder="email">
		<button id="emailSubmit">送出</button>
		
	</div>
</body>
</html>