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
			<p class="m_tit">推荐应用管理</p>
		</div>
		<div id="tabList" class="reprot_chart_ft">
        <ul class="clearfix">
        <li class="" id="income" onclick="Filter.remove('platformId')">全部<!--<span title="0">0<cite>元</cite></span>--></li>
        <c:forEach items="${platforms}" var="platform">
        <li id="shows" class="" onclick="Filter.add('platformId',${platform.id})">${platform.name}<!--<span title="0">0</span>--></li>
        </c:forEach>
        
        
        
        </ul>
        </div>
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0">
	<thead>
	<tr>
		<th scope='col' id='cb' class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp" /></th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">链接</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">图片</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">创建时间</th>
		</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp"/></th><th scope='col'  class='manage-column column-username sortable desc'  style="">标题</th><th scope='col'  class='manage-column column-email sortable desc'  style="">链接</th>
		<th scope='col'  class='manage-column column-role'  style="">图片</th>
		<th scope='col'  class='manage-column column-role'  style="">创建时间</th>
		</tr>
	</tfoot>

	<tbody id="the-list" class='list:user'>

<c:forEach items="${listad}" var="ad">
	<tr id='user-1' class="alternate"><th scope='row' class='check-column'><input type='checkbox' name='ids[]' class='ckb' value='${ad.id}' /></th>
	<td class="username column-username"><strong><a href="ad_edit.action?id=${ad.id}&type=${ad.type}">${ad.title}</a></strong><br /><div class="row-actions">
    
    <span class='edit'>
   
    <a href="ad_edit.action?id=${ad.id}&type=${ad.type}">编辑</a>
     </span>
   <span class='delete'>
    <a  class='submitdelete' onclick='return showNotice.warn();' href="ad_do.action?id=${ad.id}&type=${ad.type}&action=delete">删除</a>
    </span>
    
    </div></td>
	<td class="email column-email">
   ${ad.link}
    </td>
    <td class="role column-role"><img width="40" height="60" src="../uploadimg/ad/${ad.img}" class="attachment-80x60" />	</td>
    <td class="role column-role">${ad.createtime}</td>
	  </tr>	
      </c:forEach>
      </tbody>
</table>
            <jsp:include page="include/page.jsp"></jsp:include>
             <a href="ad_new.action?type=${ad.type}"  class="btn nextone saveBtn">添加</a>
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
