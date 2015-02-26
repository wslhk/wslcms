<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS)</title>
  
	<jsp:include page="include/head_script.jsp"></jsp:include>
<script src="../js/jquery.metadata.js"></script>
<script src="../js/jquery.tablesorter.min.js"></script>
<script>
$(document).ready(function() { 
        $("#myTable").tablesorter(); 
}); 
</script>
</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="1"></jsp:param>
</jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
        <form>
        开始时间
        <input name="begintime" type="text" class="datepicker" value="<fmt:formatDate value="${begintime}" pattern="yyyy-MM-dd" />" style="border:1px solid;" />
         结束时间
        <input name="endtime" type="text" class="datepicker" value="<fmt:formatDate value="${endtime}" pattern="yyyy-MM-dd" />" style="border:1px solid;"  />
        
        名字<input name="title" value="" style="border:1px solid;"/>
        <input type="submit"/>
        </form>
			<p class="m_tit">内容查看数</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
            
<div id="filter_form_div">
<!--
<form action="analytics_downloads.action" method="get">
应用商店
<select name="appstores" id="appstore_select"></select>
国家/地区
<select name="countries" id="countires_select"></select>
<input type="submit" value="更新数据"/>
</form>
-->
</div>  
         
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" id="myTable" ><thead><tr>
			<th >漫画</th>
			<th  >wp</th>
			<th >苹果</th>
			<th >全部</th>
			<th >&nbsp;</th></tr></thead>
            
            
            
           <tbody id="tbody">
           <c:forEach items="${list}" var="log">
           <tr>
            <td >${log.comic.name}</td>
			<td class="sorting_disabled tal" >${log.wp}</td>
			<td ><pre id="line1"><span class="sorting_disabled tal">${log.ios}</span></pre></td>
			<td ><pre id="line2"><span class="sorting_disabled tal">${log.all}</span></pre></td>
			<td >&nbsp;</td></tr>
            </c:forEach>
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
             <a href="comic_new.action"  class="btn nextone saveBtn">添加</a>
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_analytics.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
