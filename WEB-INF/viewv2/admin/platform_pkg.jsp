<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="1"></jsp:param>
</jsp:include>
<div id="content">
    <div class="main">
	  <div class="local">
			<p class="m_tit">${domain.name}平台可用包</p>
		</div>
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" ><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="">
            <form action="platform_pkg.action">
            <label>选择内容商 <select name="domainId" size="1">
            <c:forEach items="${domains}" var="domain">
<option value="${domain.id}" <c:if test="${domain.id==param.domainId}">selected</c:if>>${domain.name}</option>
            </c:forEach>
           </select> <input type="submit" value="选择"></label>
           </form>
           </div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">操作</th>
		</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
  <c:forEach items="${listplatformPkg}" var="platformPkg">
	<tr id='user-1' class="alternate">
	  <td class="username column-username"><strong><a href="ad_edit.action?id=${ad.id}&type=${ad.type}">${platformPkg.platform.name}</a></strong><br /><div class="row-actions"></div></td>
	<td class="email column-email"><span class="row-actions"><span class='edit'><a href="platform_pkg_edit.action?action=edit&platformId=${platformPkg.platformId}&domainId=${platformPkg.domainId}">编辑</a> | </span> <span class='delete'><a class='submitdelete' onClick='return showNotice.warn();' href='platform_pkg_do.action?action=delete&platformId=${platformPkg.platformId}&domainId=${platformPkg.domainId}'>永久删除</a></span></span></td>
	</tr>	
      </c:forEach>
    </tbody>
</table>
<jsp:include page="include/page.jsp"></jsp:include>
 
 <c:if test="${domain!=null}">
 <a href="platform_pkg_new.action?domainId=${domain.id}"  class="btn nextone saveBtn">添加</a>
</c:if>
<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
			
	  </div>
	</div>
<jsp:include page="include/sidebar_manager.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
