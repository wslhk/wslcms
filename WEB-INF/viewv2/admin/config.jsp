<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="2"></jsp:param>
</jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">配置文件可用参数</p>
		</div>
        
        <div id="tabList" class="reprot_chart_ft">
        <ul class="clearfix">
        <li class="" id="income" onclick="location.href='config.action?location=2'">全局设置<!--<span title="0">0<cite>元</cite></span>--></li>
        
        <c:forEach items="${platforms}" var="platform">
        <li class="" onclick="Filter.add('platformId',${platform.id})">${platform.name}<!--<span title="0">0</span>--></li>
        </c:forEach>
        
        </ul>
        </div>
        
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr><th class="sorting_disabled tac" rowspan="1" colspan="1" >状态</th>
			  <th class="sorting_disabled tal" rowspan="1" colspan="1" >name</th>
			  <th class="sorting_disabled tac" rowspan="1" >介绍</th>
			  <th class="sorting_disabled tac" rowspan="1" >配置位置</th>
			  <th class="sorting_disabled tac" rowspan="1" >类型</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
            <c:forEach items="${configs}" var="config">
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span title="运行" class="icon_status icon_active">运行</span></div></td><td class="tal"><div><a onclick="manageApp.prototype.showinfo(104)" href="javascript:;">${config.name}</a></div></td>
              <td class="tac">${config.intro}</td>
              <td class="tac">
              <c:if test="${config.location==0}">平台设置</c:if>
              <c:if test="${config.location==1}">漫画设置</c:if>
              </td>
              <td class="tac"><c:if test="${config.type==0}">字符串</c:if>
              <c:if test="${config.type==1}">文件</c:if>
              </td>
              <td class="tac">
            <span class='edit'>
   
    <a href="config_edit.action?id=${config.id}">编辑</a>
    |</span><span class='edit'> </span>
    
    <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='config_do.action?action=delete&id=${config.id}'>永久删除</a>  </span>
            </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
             <a href="config_new.action"  class="btn nextone saveBtn">添加</a>
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_manager.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>

<!--创建广告等待弹出层-->




</body></html>
