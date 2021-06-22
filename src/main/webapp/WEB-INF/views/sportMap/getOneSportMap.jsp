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
<!-- <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/css/sportMap_getOne.css" rel="stylesheet">
<title>所有運動地點</title>
</head>
<body>
	<jsp:include page="/fragment/header.jsp" />

<!-- ----------------------------------- -->
 <div class="blog-card">
<!--  <div class=""> -->
        <div> ${sportMapBean.sportMapMap} </div>

        <div class="description">

            <p class="read-more">
                <a class='getLikeLink' href="<c:url value='/' />sportMapNeedLogin/getLike/${sportMapBean.sportMapId}">
                    點我收藏</a>
            </p>
            <h1>${sportMapBean.sportMapName}</h1>
            <h2>${sportMapBean.sportMapAddress}</h2>
            <p> ${sportMapBean.sportMapInfo}</p>
            <br>
            <br>
            <p class="read-more">
                來個評分吧！
                <a class='getScore1Link'
                    href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/1"> 
                    <img src="${pageContext.request.contextPath}/images/sportMap/MapSportstar1.png"></a>
                <a class='getScore2Link'
                    href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/2"> 
                    <img src="${pageContext.request.contextPath}/images/sportMap/MapSportstar2.png"></a>
                <a class='getScore3Link'
                    href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/3"> 
                    <img src="${pageContext.request.contextPath}/images/sportMap/MapSportstar3.png"></a>
                <a class='getScore4Link'
                    href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/4"> 
                    <img src="${pageContext.request.contextPath}/images/sportMap/MapSportstar4.png"></a>
                <a class='getScore5Link'
                    href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/5"> 
                    <img src="${pageContext.request.contextPath}/images/sportMap/MapSportstar5.png"></a>

            	<span>，目前累積分數：${sportMapBean.sportMapScore}分</span>
            </p>
        </div>
    </div>



<!-- ---------------------------------------------------	 -->
<!-- 	<table> -->
<!-- 		<tr> -->
<%-- 			<td>${sportMapBean.sportMapName}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>${sportMapBean.sportMapMap}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>${sportMapBean.sportCategoryId}</td> --%>
<!-- 		</tr> -->

<!-- 		<tr> -->
<%-- 			<td>${sportMapBean.sportMapAddress}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->
<%-- 			<td>${sportMapBean.sportMapInfo}</td> --%>
<!-- 		</tr> -->
<!-- 		<tr> -->

<!-- 			<td><a class='getLikeLink' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getLike/${sportMapBean.sportMapId}"><button>收藏</button></a></td> --%>
			
			
<!-- 			<td>來個評分吧 -->
<!-- 			<a class='getScore1Link' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/1"><button>1</button></a></td> --%>
<!-- 				<td><a class='getScore2Link' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/2"><button>2</button></a></td> --%>
<!-- 			<td><a class='getScore3Link' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/3"><button>3</button></a></td> --%>
<!-- 				<td><a class='getScore4Link' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/4"><button>4</button></a></td> --%>
<!-- 				<td><a class='getScore5Link' -->
<%-- 				href="<c:url value='/' />sportMapNeedLogin/getScore/${sportMapBean.sportMapId}/5"><button>5</button></a></td> --%>
<!-- 		</tr> -->

<!-- 	</table> -->


<!-- ------------------------------用來接POST-------------------------------- -->
	<form method='POST'>
		<input type='hidden' name='_method' value='score'>
	</form>

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
			$('.getScore1Link').click(function() {
				if (confirm('要來個評分嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<script>
		$(document).ready(function() {
			$('.getScore2Link').click(function() {
				if (confirm('要來個評分嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<script>
		$(document).ready(function() {
			$('.getScore3Link').click(function() {
				if (confirm('要來個評分嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<script>
		$(document).ready(function() {
			$('.getScore4Link').click(function() {
				if (confirm('要來個評分嗎? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();

				}
				return false;

			});
		})
	</script>
	<script>
		$(document).ready(function() {
			$('.getScore5Link').click(function() {
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