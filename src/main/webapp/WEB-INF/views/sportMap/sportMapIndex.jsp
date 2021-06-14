<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
 .btn1{  border-radius: 20px 20px;
            border-color: #D7FFEE;
            background-color:#D7FFEE;

        }

</style>

<title>Sport Map</title>

</head>
<body>
	<!-- 引入共同的頁首  copy這行-->
	<jsp:include page="/fragment/header.jsp" />
	
	<div id="mainWrapper">
        
        <section id="offer">
            <img src="${pageContext.request.contextPath}/images/MapSport1.png" width="100%" height="50%">
        </section>
        <section id="offer2">
            
                <img src="${pageContext.request.contextPath}/images/MapSport2.png" width="40%" height="40%">
                
    
                <img src="${pageContext.request.contextPath}/images/MapSport4.png" width="25%" height="25%">
			
				<a href="<c:url value='/sportMapController/displaySportMaps' />"><button class="btn1">所有運動地點</button></a>
			            
				<a href='add'><button class="btn1">新增運動地圖</button></a>			
            
           
       </section>
		
            
        

            <div id="">
                <h3></h3>
                <P></P>
                <a></a>
            </div><br>

      
    </div>
	
	
	
	
	<!-- 引入共同的頁尾  copy這行-->
	<jsp:include page="/fragment/footer.jsp" />


	


</body>
</html>