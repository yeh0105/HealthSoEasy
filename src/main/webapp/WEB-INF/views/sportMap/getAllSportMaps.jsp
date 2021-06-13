<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有運動地點</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />

	<a href='add'><button>新增運動地圖</button></a>
	<a href="<c:url value='/sportMapController/displaySportMaps' />"><button>所有運動地點</button></a>
		
	<table border='2' width="1000">
		<tr>
		
		<td width='800' colspan='2' align='left'>
		<table border='1' width='800'>
			<tr>
			<td width='200'>運動分類</td>		
		
			<td width='200'>運動地點名稱</td>
			<td width='200'>地址</td>
			<td width='200'>地點簡介</td>
			<td width='200'>地圖	</td>
			</tr>
		</table>
		</td>
		
		</tr>
		<c:forEach varStatus="stVar" var="entry" items="${sportMaps_DPP}">
			<c:set var="rowColor" value="#DEFADE" />
			<tr height='18' bgColor="${rowColor}">
				<td width='800' colspan='2' align='left'>
					<table border='1' width='800'>
						<tr>
							<td width='200' align="left">
								${(entry.value.sportCategoryBean.sportCategoryName)}</td>
							<td width='200' align="left">${entry.value.sportMapName}
							</td>

							<td width='200' align="left">${entry.value.sportMapAddress}
							
							<td width='200' align="left">${entry.value.sportMapInfo}

							
							<td width='200' align="left">${entry.value.sportMapMap}
						</tr>
					</table>
				</td>
			</tr>
		</c:forEach>


	</table>

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>