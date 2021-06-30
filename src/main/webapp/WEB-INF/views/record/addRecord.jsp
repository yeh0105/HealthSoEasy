<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增營養師</title>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	<section>
		<img
			src="${pageContext.request.contextPath}/images/nutritionist/nutritionistHeader.png"
			width="100%" height="100%">
	</section>
	<div>
		<fieldset style="width: 900px;">
			<legend>新增身高體重</legend>
			<form:form method="POST" action="addRecord"
				modelAttribute="recordBean" enctype='multipart/form-data'>
				<table>
					<tr>
						<td>您的身高？（公分） :</td>
						<td width='600'><form:input path='recordHeight'
								type="text" /> <form:errors path="recordHeight"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td>您的體重？（公斤） :</td>
						<td width='600'><form:input path='recordWeight'
								type="text" /> <form:errors path="recordWeight"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td>今天的日期？ （格式 : 西元年/月/日）:</td>
						<td width='600'><form:input path='recordDate'
								type="date" /> <form:errors path="recordDate"
								cssClass="error" /></td>
					</tr>
					<tr>
						<td><input type='submit'></td>
					<tr>
				</table>
			</form:form>
		</fieldset>
	</div>


	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>