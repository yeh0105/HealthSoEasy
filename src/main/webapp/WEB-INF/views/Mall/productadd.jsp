<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
   span.error {
	color: red;
	display: inline-block;
	font-size: 10pt;
}
</style>

<meta charset="UTF-8">
<title>${AppName}</title>
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
function setFocus(fld) {
     document.getElementById(fld).focus();
}
</script>

</head>
<body onload="setFocus('title')" background="../images/bookMaintain.jpg">
<!-- 引入共同的頁首 -->  
<jsp:include page="/fragment/header.jsp" />
<div id='main' align='center'>

  <div id="afterBookInsert">
     <font color='red' size='-1'>${successMsg.success}${ErrMsg.Exception}</font><br/>
     <c:remove var="successMsg" scope='session'/>
  </div>
  <div id="backToBookMaintainList">
      <a href="DisplayPageProducts?pageNo=${param.pageNo}">回維護首頁</a>   
  </div>
<!-- 上傳檔案時<form>標籤的 enctype屬性必須是 "multipart/form-data" -->
<!-- 而且method屬性必須是 "post" -->
<form:form  id="form1" modelAttribute='productBean' method="post"  enctype="multipart/form-data" >
  
<table  class="table_color" border="2" align="center" cellpadding="2" cellspacing="2" bordercolorlight="#FFFFFF" bordercolordark="#330033">
   <tr height='40'>
       <td colspan="4" align="center" valign="bottom"> 
           <table style="background:#ffE4C4">
            <tr height='5' >
                <td align='center' >&nbsp;</TD>
            </tr>
            <tr height='20' >
                <td  align='center' >
                   <font color='#8000FA' size='+2' style="font-weight:900;" >
                      新增產品資料
                   </font>
                </td>
            </tr>
            <tr height='5' >
                <td align='center' >&nbsp;</td>
            </tr>
         </TABLE>
           
       </td>
    </tr>
    <tr height='42'>
       <td width="60" align="right" class="title_font">商品名</td>
       <td colspan="3"> 
           <form:input path="productName" size='40'/>
           <form:errors path="productName" cssClass="error"/>
       </td>
    </tr>
    <tr height='42'>
       <td width="45" align="right" class="title_font">廠商</td>
       <td width="300" >
           <form:input path="author" size='20'/>
           <form:errors path="author" cssClass="error"/>
       </td>
       <td width="60" align="right" class="title_font">價格</td>
       <td width="300">
           <form:input path="listPrice" size='4'/>
           <form:errors path="listPrice" cssClass="error"/>
       </td>
    </tr>
    <tr height='42'>
        <td width="60" class="title_font" ><div align="right">書號</div></td>
         <td width="300">
           <form:input path="bookNo" size='6'/>
           <form:errors path="bookNo" cssClass="error"/>
       </td>
        <td width="60" class="title_font" ><div align="right">出版社</div></td>
			<td width="300">
            <form:select path='ShopBean.id' >
            	<form:option value="-1" label="請挑選" />
            	<form:options  items="${companyBeanList}"
	   	  	   			itemLabel='name' itemValue='id'/>
            </form:select>
            <form:errors path="ShopBean"  cssClass="error" />
        </td> 
    </tr>
    <tr height='42'>
        <td width="60" align="right" class="title_font">圖片</td>
        <td colspan="1" width="300">
	   	  	 <form:input path="productImage" type='file' />
	   	  	 <form:errors path="productImage"  cssClass="error" />
        </td>

        <td width="60" align="right" class="title_font">類型</td>
        <td width="300">
           <form:select path='category' >
            	<form:option value="0" label="請挑選" />
            	<form:options  items="${category}" />
            </form:select>
            <form:errors path="category" cssClass="error"/>
            </td>   
    </tr>
    
    <tr height="42" >
      <td height="61" colspan="6" align="center">
          
         <input type="submit" name="Submit" value="新增" />
      </td>
    </tr>
  </table>
</form:form>
</div>
<p>&nbsp;</p>
<c:remove var="ErrMsg" scope='session'/>
</body>
</html>