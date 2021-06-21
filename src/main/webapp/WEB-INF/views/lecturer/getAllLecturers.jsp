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


<title>所有講師</title>
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

	<!-- 綠底表頭區 -->
	<div class="mainWrapper">
		<section id="offer">
		<div style="background-color: #C9D8BF; text-align: center;">
			<div style="margin: 5% auto;">
				<h1 style="color: #1d3b2a; font-family: Caudex;">So
					Lecturer(講座首頁暫時先放這頁測試用)</h1>
				<p style="color: #325b43; font-family: Lobster; font-size: 18px;">現在開始你/妳的健康革命！</p>
				<p style="color: #325b43; font-family: Lobster; font-size: 18px;">聽聽講師怎麼說，讓你越吃越瘦、越動越健康！</p>
			</div>
		</div>
		</section>
	</div>
	
	<!-- 內容開始 -->
	<a href='add'><button>新增講師</button></a>

	<table border='2' width="1000">
		<tr>
			<td width='1400' colspan='2' align='left'>
				<table border='1' width='1400'>
					<tr>
						<td width='200'>講師編號</td>
						<td width='200'>講師姓名</td>
						<td width='200'>講師專長</td>
						<td width='200'>講師經歷</td>
						<td width='200'>講師照片</td>
						<td width='200'>修改</td>
						<td width='200'>刪除</td>
					</tr>
				</table>
			</td>
		</tr>
		<c:forEach varStatus="stVar" var="entry" items="${lecturer}">
			<c:set var="rowColor" value="#DEFADE" />
			
			<tr height='18' bgColor="${rowColor}">
				<td width='1400' colspan='2' align='left'>
					<table border='1' width='1400'>
						<tr>
							<td width='200' align="left">${entry.value.lecturerId}</td>
							<td width='200' align="left">${entry.value.lecturerName}</td>
							<td width='200' align="left">${entry.value.lecturerTalent}</td>
							<td width='200' align="left">${entry.value.lecturerExp}</td>
							<td width='200' align="left">${entry.value.lecturerImg}</td>
							<td><a href="<c:url value='lecturerController/updateLecturer/${entry.value.lecturerId}' />"><button>修改</button></a></td>
							<td><a href="<c:url value='lecturerController/deleteLecturer/${entry.value.lecturerId}' />"><button>刪除</button></a></td>
						</tr>
					</table>
				</td>
			</tr>
		</c:forEach>


	</table>

	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>