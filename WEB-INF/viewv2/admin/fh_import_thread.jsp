<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>

导入中的内容:<br>
漫画数:${thread.comicCount}|${comicCount}<br>
章节数:${thread.chapterCount}<br>
页数:${thread.pageCount}<br>
完成状态:${thread.start}<br>
${thread}
<table>
<c:forEach items="${thread.items}" var="item">
<tr>${item.comic.title}</tr>
</c:forEach>
</table>
