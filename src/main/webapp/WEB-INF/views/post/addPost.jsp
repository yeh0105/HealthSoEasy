<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Share</title>
<style>
span.error {
	color: red;
	display: inline-block;
	font-size: 8pt;
}
</style>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<div>
		<fieldset style="width: 70%;  height: 500px;">
			<legend>新增文章</legend>
			<form:form method="POST" action="addPost" modelAttribute="postBean"
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
					<tr>
						<td>文章圖片：</td>
						<td width='600'><form:input path='postMultiImg' type="file" />
							<form:errors path="postMultiImg" cssClass="error" /></td>
					</tr>
					<tr>
						<td>文章內容：</td>
						<td width='600'><form:textarea path='postContent' style="width: 100%; height: 350px; overflow-y: scroll;"/> 
						<form:errors path="postContent" cssClass="error" /></td>
					<tr>
						<td><input type='submit'></td>
						<td><input type="reset" value="Reset"></td>
					<tr>
				</table>
			</form:form>
		</fieldset>
	</div>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>