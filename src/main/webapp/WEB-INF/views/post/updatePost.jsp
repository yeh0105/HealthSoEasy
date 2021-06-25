<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Post</title>

<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}
</style>
</head>
<body>
	<div>
		<a
			href="<c:url value="/PostNeedLoginController/getPost/${postId}"></c:url>">回上一頁</a>
	</div>
	<br>
	<div style="padding: 3% 5%; margin-top: -3%;">
		<fieldset style="width: 90%; height: 100%;">
			<legend>新增文章</legend>
			<form:form method="POST" modelAttribute="postBean"
				enctype='multipart/form-data'>
				<table>
					<tr>
						<td>文章標題：</td>
						<td width='600'><form:input path='postTitle' type="text" />
							<form:errors path="postTitle" cssClass="error" /></td>
					</tr>
					<tr>
					<tr>
						<td>文章分類</td>
						<td><form:select path='postCategoryBean.postCategoryId'>
								<form:option label="請挑選" value="-1" />
								<form:options items="${postCategoryBeanList}"
									itemLabel='postCategoryName' itemValue='postCategoryId' />
							</form:select> <form:errors path="postCategoryBean" cssClass="error" /></td>

					</tr>
					<tr style="display:none;">
						<td>文章狀態：</td>
						<td width='600'>
						<form:radiobutton path="postStatus" value="1" />正常 
						<form:radiobutton path="postStatus" value="2" />刪除文章</td>
					</tr>
					<tr>
						<td>文章圖片：</td>
						<td width='600'><form:input path='postMultiImg' type="file" />
							<form:errors path="postMultiImg" cssClass="error" /></td>
					</tr>
					<tr>
						<td>文章內容：</td>
						<td width='600'><form:textarea path='postContent'
								style="width: 140%; height: 310px; overflow-y: scroll;" /> <form:errors
								path="postContent" cssClass="error" /></td>
					<tr>
						<td><input type='submit'></td>
						<td><input type="reset" value="Reset"></td>
					<tr>
				</table>
			</form:form>
		</fieldset>
	</div>
	<!-- partial -->
	<script src="${pageContext.request.contextPath}/js/admin.js"></script>
</body>
</html>