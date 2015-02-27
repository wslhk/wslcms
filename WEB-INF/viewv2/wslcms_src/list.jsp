<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>title</title>
   

</head>

<body>

<ul>
<c:forEach items="${listTable}" var="ltable">
<li><a href="?wslobj=${ltable.className}&wslact=list">${ltable.title}</a></li>
</c:forEach>
</ul>

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
<form>
<input type="submit" method="get" action="?" />
<input type="hidden" name="wslobj" value="${wslobj}"/>
<select name="wslact">
	<option value="-1">请选择</option>
	<option value="del">批量删除</option>
</select>

<table border="1">
<tr>
<th><input type="checkbox"/></th>
	<c:forEach items="${wslViewList.navForm.formItems}" var="formItem">

       	<th> ${formItem.title}</th>

    </c:forEach><th>操作</th>
</tr>
<c:forEach items="${wslViewList.tableList.lines}" var="line">
<tr>
<td><input type="checkbox" name="${line.objId.column}[]" value="${line.objId.value}"/></td>
       	<c:forEach items="${line.items}" var="item">

       	<td>
        
        <c:if test="${item.itemType=='FILEIMG'}">
       
     
       	<img width="50" src="${wslconfig.file_url}/${item.value}"/>

        
       </c:if>
       
        ${item.value}
        </td>

 </c:forEach>
 <td><a href="?wslobj=${wslViewList.objName}&wslact=edit&${line.objId.column}=${line.objId.value}">编辑</a> <a href="?wslobj=${wslViewList.objName}&wslact=del&${line.objId.column}[]=${line.objId.value}">删除</a></td>
</tr>
 </c:forEach>

</table>
</form>
<div class="pages">
<span>${pager.pagenow}/${pager.pageall}</span>
	<a href="${pager.firstpage.href}">第一页</a>
    <a href="${pager.prevpage.href}">上一页</a>
    <a></a>
    <a href="${pager.nextpage.href}">下一页</a>
    <a href="${pager.lastpage.href}">最后一页</a>
</div>

<a href="?wslobj=${wslViewList.objName}&wslact=add">new</a>

</body>
</html>
