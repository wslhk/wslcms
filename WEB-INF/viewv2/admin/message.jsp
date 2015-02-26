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
			<p class="m_tit">消息</p>
		</div>
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed users" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style="">id</th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style="">漫画</th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>内容</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">参数</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">操作</th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">创建时间</th>
		</tr>
	</thead>
	<tbody id="the-list" class='list:user'>
	  
  <c:forEach items="${listmessage}" var="message">
	<tr id='user-1' class="alternate">
	  <td class="username column-username">${message.id}</td>
	  <td class="username column-username">
      <c:if test="${message.comic!=null}">${message.comic.name}</c:if>
      </td>
	<td class="username column-username">${message.body}
 </td>
	<td class="email column-email">${message.param}</td>
	<td class="email column-email" align="center">
   
    <a href="message_edit.action?id=${message.id}">编辑</a>
    <a href="message_push.action?id=${message.id}" onclick='return showNotice.warn();'>发送</a>
   <a class='submitdelete' onclick='return showNotice.warn();' href='message_do.action?action=delete&id=${message.id}'>永久删除</a> </td>
	<td class="email column-email">
	  ${message.createtime}
	  </td>
    </tr>	
      </c:forEach>
    </tbody>
</table>
<jsp:include page="include/page.jsp"></jsp:include>
 <a href="message_new.action"  class="btn nextone saveBtn">添加</a>

<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
			
	  </div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->
<div id="divpop" style="display:none;" class="divpop">
	<ul id="tabMenu" class="tabs clearfix">
		<li class="current"><a href="javascript:;">选择平台</a></li>
		<li><a href="javascript:;">基本信息</a></li>
		<li><a href="javascript:;">广告设置</a></li>
		<li><a href="javascript:;">CDKey</a></li>
	</ul>
	<div style="left:20px;width:90px;" class="line_bottom"></div>
    <div class="tabs_cont" style="overflow: hidden; padding: 0px; width: 460px;">
        
        
        
		
    <div class="jspContainer" style="width: 460px; height: 190px;"><div class="jspPane" style="padding: 10px 0px 0px; top: 0px; width: 460px;"><div class="tabs_item" style="display: block;">
			<dl class="create_ad_extend clearfix">
				<dt>选择平台:</dt>
				<dd><em>应用平台:</em><span style="clear:left;" id="message">--</span></dd>
			</dl>
        </div><div class="tabs_item" style="display: none;">
           <dl class="clearfix create_ad_extend ">
				<dt>基本信息</dt>
				<dd><em>应用名称：</em><span id="appName">--</span></dd>
				<dd><em>应用&ensp;URl：</em><span id="pubUrl">--</span></dd>
				<dd><em>应用属性：</em><span id="category">--</span></dd>
				<dd><em>关&ensp;键&ensp;字：</em><span id="setting_tags">--</span></dd>
				<dd><em>功能介绍：</em><span id="description">--</span></dd>
			</dl>
        </div><div class="tabs_item" style="display: none;">
           <dl class="clearfix">
				<dt>广告设置</dt>
				<dd><em>广告位&ensp;1：</em><span id="adTypes_1">--</span></dd>
				<dd><em>广告位&ensp;2：</em><span id="adTypes_2">--</span></dd>
				<dd><em>URL&ensp;过滤：</em><span id="negativeDomains">--</span></dd>
				<dd><em>文本过滤：</em><span id="negativeText">--</span></dd>
				<dd><em>类别/类型过滤：</em><span id="negativeCampaignCategories">--</span></dd>
			</dl>
        </div><div class="tabs_item" style="display: none;">
           <dl class="clearfix ads">
				<dt>CDkey</dt>
				<dd><em>广告位1 ID：</em><span id="spaceId_1">--</span></dd>
				<dd><em>广告位2 ID：</em><span id="spaceId_2">--</span></dd>
				<dd><em>程序 ID:</em><span id="extId">--</span></dd>
				<dd><em>密 钥:</em><span id="appSecretKey">--</span></dd>
				<!--<dd>Lib文件：<span id="timeView">--</span></dd>
				<dd>sample应用：<span id="sexView">--</span></dd>-->
			</dl>
			<div style="display:none;" id="step4_set" class="clearfix step4_set">
				<a id="" class="btn down_btn" href="javascript:;">下载SDK</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="uploadApp" class="btn upload_btn" href="javascript:;"><span>上传应用</span><img style="display:none;" src="../images/icon_uploading.gif"></a>
			</div>
        </div></div></div></div>
	<div class="select_set">
		<span id="edit_box"><a id="editBtn" class="btn btn_save" href="javascript:;">编辑</a>&nbsp;&nbsp;或者&nbsp;&nbsp;</span><a class="btn_close" href="javascript:;">关闭</a>
	</div>
	<div id="pop_loading" style="display:none;" class="pop_loading">
		<div style="position:absolute;left:50%;top:50%;margin-left:-150px;margin-top:-20px;width:300px;background:#f6f6f6;" class="pop_task">
			<p style="width:130px;margin-left:-70px;amrgin-top:-15px;" class="task_tit">数据正在努力加载中...</p>
		</div>
	</div>
</div>

</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
