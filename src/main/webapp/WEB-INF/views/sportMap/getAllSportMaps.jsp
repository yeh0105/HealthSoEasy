<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
	.btn1{  border-radius: 20px 20px;
            border-color: #D7FFEE;
            background-color:#D7FFEE;
        }
        

</style>


<title>所有運動地點</title>
</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
		
		<div id="mainWrapper">
			<img src="${pageContext.request.contextPath}/images/MapSport1.png" width="100%" height="100%">
        </div>

	<a href='add'><button>新增運動地圖</button></a>
	<a href="<c:url value='/sportMapController/displaySportMaps' />"><button>所有運動地點</button></a>
		
	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>	
		
		
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
							

							<td><a href="<c:url value='sportMap/${entry.value.sportMapId}' />"><button>修改</button></a></td>
<%-- 							<td><a class='deleteSportMap' href="<c:url value='/sportMapController/delete/${entry.value.sportMapId}' />"><button>刪除</button></a></td> --%>
							<td><a class='deleteSportMap' href="<c:url value='/' />sportMapController/del/${entry.value.sportMapId}"><button>刪除</button></a></td>
							


					
						</tr>						
						
					</table>
				</td>
			</tr>
		</c:forEach>


	</table><br>
	
	<script>
	
    $(document).ready(function() {
        $('.deleteSportMap').click(function() {
        	if (confirm('確定刪除此筆紀錄? ')) {
        		var href = $(this).attr('href');
                $('form').attr('action', href).submit();
                
                console.log(href);
        	} 
        	return false;
            
        });
    })
	</script>
	
	

	<jsp:include page="/fragment/footer.jsp" />

</body>
</html>