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

	<%-- <div id="insert"><a href="<c:url value='/_20_productMaintain/BookInsert?pageNo=${pageNo}' />" >新增紀錄</a></div> --%>


	<table border='2' width="690">
		<c:forEach varStatus="stVar" var="entry" items="${sportMaps_DPP}">
			<c:set var="rowColor" value="#DEFADE" />
<%-- 			<c:if test="${ stVar.count % 2 == 0 }"> --%>
<%-- 				<c:set var="rowColor" value="#FFEBFF" /> --%>
<%-- 			</c:if> --%>

			<tr height='18' bgColor="${rowColor}">
			<td width='600' colspan='2' align='left'>
			<table border='1' width='600'>
				<tr>
				<td width='200' align="left">
					運動分類：${(entry.value.sportCategoryBean.sportCategoryName)}</td>
					<td width='600' align="left">運動地點名稱：${entry.value.}
<%-- 					<a href="BookUpdate/${entry.value.bookId}/${pageNo}">${entry.value.title}</a> --%> --%>
					</td>
					
					<td width='600' align="left">地址：${entry.value.}
					<td width='600' align="left">地圖：${entry.value.}
				</tr>
			</table>
			</td>
			
		</c:forEach>


	</table>
</body>
</html>