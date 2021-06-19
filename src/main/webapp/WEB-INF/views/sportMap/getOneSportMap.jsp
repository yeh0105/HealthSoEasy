<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>所有運動地點</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />


	<form method='POST'>
		<input type='hidden' name='_method' value='score'>
	</form>

	<!-- 			下面為前端頁面單一筆呈現 -->

	<table>
		<tr>
			<td>${sportMapBean.sportMapName}</td>
		</tr>
		<tr>
			<td>${sportMapBean.sportMapMap}</td>
		</tr>
		<tr>
			<td>${sportMapBean.sportCategoryId}</td>
		</tr>

		<tr>
			<td>${sportMapBean.sportMapAddress}</td>
		</tr>
		<tr>
			<td>${sportMapBean.sportMapInfo}</td>
		</tr>
		<tr>

			<td><a class='getLikeLink'
				href="<c:url value='/' />sportMapNeedLogin/getLike/${sportMapBean.sportMapId}"><button>收藏</button></a></td>
			<td><a class='getScoreLink'
				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}"><button>來個評分吧！</button></a></td>

		</tr>

	</table>

	<!-- -----------------------------收藏地點------------------------------- -->
	<script>
		$(document).ready(function() {
			$('.getLikeLink').click(function() {
				if (confirm('要收藏這個地點嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<!-- -----------------------------收藏地點------------------------------- -->
	<!-- -----------------------------評分一下------------------------------- -->
	<script>
		$(document).ready(function() {
			$('.getScoreLink').click(function() {
				if (confirm('要來個評分嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<!-- -----------------------------評分一下------------------------------- -->


	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>