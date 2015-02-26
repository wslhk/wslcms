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
			<p class="m_tit">媒体文件</p>
		</div>
		
        <div id="tabList" class="reprot_chart_ft">
        <ul class="clearfix">
        <li class="" id="income" onclick="Filter.remove('type')">全部<!--<span title="0">0<cite>元</cite></span>--></li>
        <li id="shows" class="" onclick="Filter.add('type',3)">视频<!--<span title="0">0</span>--></li>
        <li id="fillrate"  onclick="Filter.add('type',2)">背景音<!--<span title="0.00%">0.00%</span>--></li>
        <li id="ecpm" onclick="Filter.add('type',1)">音效<!--<span title="0">0</span>--></li>
        
        </ul>
        </div>
        
        
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">操作</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">文件名</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">播放</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">分组</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">大小</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">播放长度</th>
		</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
  <c:forEach items="${listmedia}" var="media">
	<tr id='user-1' class="alternate">
	<td class="username column-username"><strong>${media.title}</strong><br /><div class="row-actions"></div></td>
	<td class="email column-email"><span class="row-actions"><span class="edit"><a href="media_edit.action?id=${media.id}">编辑</a></span></span></td>
	<td class="email column-email">
   ${media.fileSrc}
    </td>
    <td class="role column-role">
<a href="../uploadfile/media/${media.fileName}" >播放</a>

</td>
    <td class="role column-role">${media.mediaGroup.title}</td>
    <td class="role column-role">${media.size}</td>
	  <td class="role column-role">${media.second}秒</td>
	  </tr>	
      </c:forEach>
    </tbody>
</table>
<jsp:include page="include/page.jsp"></jsp:include>
 <a href="media_new.action"  class="btn nextone saveBtn">添加</a>

<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
