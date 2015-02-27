<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>title</title>
   

</head>

<body>

 ${viewList}


 ${viewList}
 确认删除这些内容？
 <form method="post" action="?wslact=del_do">
 <input type="hidden" name="referer" value="${referer}"/>
 <input type="hidden" name="wslobj" value="${wslobj}"/>
<table border="1">
<tr>
	<c:forEach items="${wslTableList.columns}" var="formItem">

       	<th> ${formItem.title}</th>

    </c:forEach>
</tr>
<c:forEach items="${wslTableList.lines}" var="line">
<input type="hidden" name="${line.objId.column}[]" value="${line.objId.value}"/>
<tr>
       	<c:forEach items="${line.items}" var="item">
       	<td> ${item.value}</td>

 </c:forEach>
 </tr>
 </c:forEach>

</table>

<input type="submit" value="确认"/>
<input type="button" onClick="history.go(-1);" value="返回"/>
</form>
</body>
</html>
