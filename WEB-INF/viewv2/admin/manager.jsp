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
			<p class="m_tit">管理员</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>用户名</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">内容商</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">操作</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">角色</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">是否启用 </th><th scope='col' id='posts' class='manage-column column-posts num'  style="">&nbsp;</th>	</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
	  
  <c:forEach items="${listmanager}" var="manager">
  <tr class="alternate">
    <td class="username column-username">
      <strong>${manager.username}</strong><br /><div class="row-actions"></div>
    </td>
    <td class="email column-email">
    <c:if test="${manager.domain!=null}">${manager.domain.name}</c:if>
    </td>
    <td class="email column-email"><span class="row-actions"><span class="edit"><a href="manager_edit.action?id=${manager.id}">编辑</a></span></span></td>
    <td class="email column-email">
      
        <c:forEach items="${manager.listRole}" var="role">
          ${role.title}
        </c:forEach>
        
        </td>
    
    <td class="role column-role">
      <input disabled="disabled" type="checkbox" <c:if test="${manager.publish==true}">checked="checked"</c:if> />
      </td>
    <td class="posts column-posts num">&nbsp;
      </td>
    </tr>
</c:forEach>
      
      
      	
      </tbody>
</table>
<jsp:include page="include/page.jsp"></jsp:include>
<a href="manager_new.action" class="btn nextone saveBtn">添加新用户</a>


<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_manager.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
