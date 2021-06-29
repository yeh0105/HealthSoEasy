<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.btn1 {
	border-radius: 20px 20px;
	border-color: #D7FFEE;
	background-color: #D7FFEE;
}
</style>


<title>新增講師</title>
<script type="text/javascript"
	src="http://www.francescomalagrino.com/BootstrapPageGenerator/3/js/jquery-ui"></script>
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
<link href="css/header&footer.css" rel="stylesheet">
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<!-- 這邊是綠底標頭區 -->
	<div class="mainWrapper">
		<section id="offer">
		<div style="background-color: #C9D8BF; text-align: center;">
			<div style="margin: 5% auto;">
				<h1 style="color: #1d3b2a; font-family: Caudex;">So
					Lecturer</h1>
				<p style="color: #325b43; font-family: Lobster; font-size: 18px;">現在開始你/妳的健康革命！</p>
				<p style="color: #325b43; font-family: Lobster; font-size: 18px;">聽聽講師怎麼說，讓你越吃越瘦、越動越健康！</p>
			</div>
		</div>
		</section>
	</div>


	<a href='allLecturers'><button>查詢所有講師</button></a>

	<div>
		<fieldset style="width: 900px;">
			<legend>新增運動地圖</legend>
			<div>
			<form:form method="POST" action="add" modelAttribute="lecturerBean"
				enctype='multipart/form-data'>
				<table>
					<tr>
						<td>講師姓名：</td>
						<td width='600'><form:input path='lecturerName' /> <form:errors path="lecturerName" cssClass="error" /></td>
					</tr>
					<tr>
						<td>講師專長：</td>
						<td width='600'><form:input path='lecturerTalent' /> <form:errors path="lecturerTalent" cssClass="error" /></td>
					</tr>
					<tr>
						<td>講師經歷：</td>
						<td width='600'><form:input path='lecturerExp' /> <form:errors path="lecturerExp" cssClass="error" /></td>
					<tr>
						<td>講師照片：</td>
						<td width='600'><input type="file" /> <form:errors path="lecturerImg" cssClass="error" /></td>
					</tr>
					<tr>
						<td><input type='submit' value="送出"></td>
						<td><input type='reset' value="清除重填"></td>
					<tr>
				</table>
			</form:form>
			</div>
		</fieldset>
	</div>
	
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" /></body>
</html>