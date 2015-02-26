<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><table border="1" cellpadding="0" cellspacing="0" style="width:auto;">
<tr height="100">
<c:forEach items="${previews}" var="preview">
<td width="100">
<img src="../uploadimg/comic/${preview.img}" width="100"><br />
 <a class='submitdelete' onclick='return showNotice.warn();' href='product_preview_do.action?action=delete&id=${preview.id}'>删除</a> 

</td>
</c:forEach>
<td width="100">
<a href="product_preview_new.action?productId=${preview.productId}">新增</a>
</td>
</tr>
</table>