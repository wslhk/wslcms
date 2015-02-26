<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param>
</jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">漫画管理</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
            <form action="comic.action" method="get"><input type="text" name="name"  class="ipt ipt_text"/><input type="submit" value="查询" class="btn nextone saveBtn"/> <input type="button" value="全部" class="btn nextone saveBtn" onclick="location.href='comic.action'"/></form>
            
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr><th class="sorting_disabled tac" rowspan="1" colspan="1" >状态</th><th class="sorting_disabled tal" rowspan="1" colspan="1" >网站和应用程序</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >cover</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >icon</th><th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
            <c:forEach items="${listcomic}" var="comic">
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span title="运行" class="icon_status icon_active">运行</span></div></td><td class="tal">${comic.name}</a></td><td class="tac"><img width="40" height="60" src="../t/comic/238/308/1/${comic.cover}" class="attachment-80x60" />	</td><td class="tac"><div  class="datatable_itemsbox platform"><span title="Meego程序" class="qt"><img width="40" height="40" src="../t/comic/72/72/1/${comic.icon}" class="attachment-80x60" /></span></div></td>
            <td class="tac">
            
   
    <a href="comic_edit.action?id=${comic.id}">内容编辑</a>
    | 
   
   <a href="config_item_comic.action?comicId=${comic.id}">配置</a>
    |
    <a href="product_item.action?comicId=${comic.id}">内支付</a>
    | 
    <a href="chapter.action?comicId=${comic.id}">查看章节</a>
    | 
    
   
    <span class='edit'>
   
    <a href="comic_package.action?comicId=${comic.id}">查看漫画包</a>
    | 
    
    </span>
    
    <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='comic_do.action?action=delete&id=${comic.id}'>删除</a>  </span> |
    <span class='delete'><a href='message_new.action?comicId=${comic.id}'>消息推送</a> 
    |
    <span class='delete'><a href='fh_import_setp2.action?id=${comic.oid}'>更新</a>   </span>
            </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
             <a href="comic_new.action"  class="btn nextone saveBtn">添加</a>
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
