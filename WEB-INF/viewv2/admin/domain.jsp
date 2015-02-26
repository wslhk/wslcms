<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
<jsp:include page="include/head_script.jsp"><jsp:param name="nav" value="2"></jsp:param></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">内容商</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style="">id</th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">操作</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">介绍</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">logo</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">状态</th>
		</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
  <c:forEach items="${listdomain}" var="domain">
	<tr id='user-1' class="alternate">
	  <td class="username column-username">${domain.id}</td>
	<td class="username column-username"><strong>${domain.name}</strong><br /><div class="row-actions"></div></td>
	<td class="email column-email"><span class="row-actions"><span class='edit'><a href="domain_edit.action?id=${domain.id}">编辑</a> | </span> <span class='delete'><a class='submitdelete' onClick='return showNotice.warn();' href='domain_do.action?action=delete&id=${domain.id}'>永久删除</a></span></span></td>
	<td class="email column-email">
   ${domain.intro}
    </td>
    <td class="role column-role"><img width="40" height="60" src="../uploadimg/domain/${domain.logo}" class="attachment-80x60" />	</td>
    <td class="role column-role">${domain.status}</td>
    </tr>	
      </c:forEach>
    </tbody>
</table>
            
            
            <div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;">
            
            <div class="dataTables_scrollFootInner" style="width: 767px;">
            
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table>
            <jsp:include page="include/page.jsp"></jsp:include>
            </div></div></div>
            
            <div class="dataTables_info" id="AppList_info" style=""></div></div></div>
       
             <a href="domain_new.action"  class="btn nextone saveBtn">添加</a>

             
			
		</div>
	</div>
<jsp:include page="include/sidebar_manager.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
