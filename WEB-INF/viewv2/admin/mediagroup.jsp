<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">媒体分组</p>
		</div>
		
        
        
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='role' class='manage-column column-role'  style="">操作</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">编号</th>
		</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
  <c:forEach items="${listmediagroup}" var="mediagroup">
	<tr id='user-1' class="alternate">
	<td class="username column-username"><strong>${mediagroup.title}</strong><br /><div class="row-actions"></div></td>
	<td class="role column-role"><span class="row-actions"><span class='edit'><a href="mediagroup_edit.action?id=${mediagroup.id}">编辑</a> </span> <span class='delete'> <a class='submitdelete' onClick='return showNotice.warn();' href='mediagroup_do.action?action=delete&id=${mediagroup.id}'>永久删除</a></span></span></td>
	<td class="role column-role">${mediagroup.id}</td>
	  </tr>	
      </c:forEach>
    </tbody>
</table>
<jsp:include page="include/page.jsp"></jsp:include>
 <a href="mediagroup_new.action"  class="btn nextone saveBtn">添加</a>


<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
