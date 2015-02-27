<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>title</title>
   

</head>

<body>
edit
 ${wslViewObj}
<form method="post" action="?wslact=edit_do&${wslViewObj.line.objId.column}=${wslViewObj.line.objId.value}" enctype="multipart/form-data">
<input type="hidden" name="referer" value="${referer}"/>
<input type="hidden" name="wslobj" value="${wslobj}"/>
<table>
	<c:forEach items="${wslViewObj.line.items}" var="item">
    	<tr>
        <th>${item.title}</th>
        <td>
        
<c:if test="${item.itemType=='HIDDEN'}">
        ${item.title}	
        <input type="hidden" name="${item.column}" value="${item.value}"/>
</c:if>

<c:if test="${item.itemType=='SHOW'}">
     ${item.value}
</c:if>

        <c:if test="${item.itemType=='TEXT'}">
        
        <input type="text" name="${item.column}" value="${item.value}"/>
        </c:if>
        
      <c:if test="${item.itemType=='RADIO'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="radio" name="${item.column}" value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>
        /> ${sitem.title}
        </c:forEach>
      </c:if>
       
     <c:if test="${item.itemType=='SELECT'}">
     	<select name="${item.column}">
     		
        <c:forEach items="${item.selectItems}" var="sitem">
        <option value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        selected="selected"
        </c:if>
        >${sitem.title}</option>
        </c:forEach>
        </select>
      </c:if>  
       
   <c:if test="${item.itemType=='CHECKBOX'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="checkbox" name="${item.column}" value="${sitem.id}" <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>/>
        
        </c:forEach>
        
      </c:if>       
   
 <c:if test="${item.itemType=='FILE'||item.itemType=='FILEIMG'}">
       <c:if test="${item.itemType=='FILEIMG'}">
       
     
       	<img width="100" src="${wslconfig.file_url}/${item.value}"/>
       </c:if>
   <input type="hidden" name="${item.column}" value="${item.value}" />
   <input type="file" name="_${item.column}"/>
  <input type="button" value="clearFile" />
</c:if>      
  <c:if test="${item.itemType=='TEXTAREA'}">
  <textarea name="${item.column}">${item.value}</textarea>

</c:if>          
        </td>
    	</tr>
    </c:forEach>
    <tr>
    <td colspan="2">
    <input type="submit"/>
    </td>
</tr>
</table>
</form>



</body>
</html>
