<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<link rel='short icon' href="${pageContext.request.contextPath}/favicon.ico"  />
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function(){
		let password = document.getElementById("password");
		let checkPassword = document.getElementById("checkPassword");
		let passwordSubmit = document.getElementById("passwordSubmit");
		let promptText = document.getElementById("promptText");
		let xhr = new XMLHttpRequest();
		
		passwordSubmit.addEventListener("click", function(){
			xhr.open('POST', "<c:url value='/passwordResetValidate/resetPassword.do'/>" , true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("token=" + "${token}" + "&" + "password=" + password.value + "&" + "checkPassword=" + checkPassword.value);
			xhr.onreadystatechange = function(){
				if (xhr.readyState == 4 && xhr.status == 200){
					let responseMessage = JSON.parse(xhr.responseText);		
					promptText.innerHTML = responseMessage.responseMessage;
				}
			}
		});
	});
</script>
</head>
<body>
	<span>請輸入帳戶密碼</span>
	<input id="password" placeholder="password"><br>
	<span>確認帳戶密碼</span>
	<input id="checkPassword" placeholder="checkpassword"><br>
	<button id="passwordSubmit">送出</button>
	<span id="promptText"></span>
</body>
</html>