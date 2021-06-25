<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share</title>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />

	<div>
		<fieldset style="width: 70%; height: 550px;">
			<legend>新增文章</legend>
			<table>
				<tr>
					<td>文章標題：</td>
					<td width='600'>${getOnePostBean.postTitle}</td>
				</tr>
				<tr>
				<tr>
					<td>文章分類</td>
					<td>${getOnePostBean.postCategory}</td>

				</tr>
				<tr>
					<td>文章圖片：</td>
					<td width='600'><img class="media-object"
						style="width: 100px; height: 100px;"
						src="<c:url value='/PostController/getPicture/${getOnePostBean.postId}' />"
						alt='' /></td>
				</tr>
				<tr>
					<td>文章內容：</td>
					<td width='600'>
						<div style="width: 140%; height: 310px; overflow-y: scroll;">${getOnePostBean.postContent}</div>
					</td>
			</table>
			<a class="deletePost"
				href="<c:url value='/PostNeedLoginController/updatePost/${getOnePostBean.postId}' /> "
				style="text-decoration: none; color: black">
				<button>Upadate</button>
			</a> <a class="deletePost"
				href="<c:url value='/PostNeedLoginController/deletePost/${getOnePostBean.postId}' /> "
				style="text-decoration: none; color: black">
				<button>Delete(未完成)</button>
			</a>
		</fieldset>
	</div>

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
	<!-- ----------------------------刪除單筆資料用-------------------------------- -->
	
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />
</body>
</html>