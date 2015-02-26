<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>title</title>
   

</head>

<body>

 ${viewList}
<form method="get" action="">
	<c:forEach items="${wslViewList.navForm.formItems}" var="formItem">
    	
        <c:if test="${formItem.itemType=='TEXT'}">
        ${formItem.title}	<input type="text" name="${formItem.column}" value="${formItem.value}"/>
        </c:if>
    	
    </c:forEach>
    <input type="submit"/>
</form>

 ${viewList}
 
<table border="1">
<tr>
	<c:forEach items="${wslViewList.navForm.formItems}" var="formItem">

       	<th> ${formItem.title}</th><th>操作</th>

    </c:forEach>
</tr>
<c:forEach items="${wslViewList.tableList.lines}" var="line">
<tr>
       	<c:forEach items="${line.items}" var="item">

       	<td> ${item.val}</td>

 </c:forEach>
 <td><a href="?action=${viewList.objName}_edit">编辑</a> 删除</td>
</tr>
 </c:forEach>

</table>


</body>
</html>
