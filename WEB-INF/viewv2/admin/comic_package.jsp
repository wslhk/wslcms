<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
<jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp"><jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">漫画包-${comic.name}</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
            <form id="posts-filter" action="vcomic_import.action" method="get">
<input type="hidden"  name="menuId" value="${article.menuId}" />	
            <table cellspacing="0">
	<thead>
	<tr>
		<th>平台类型</th>
		<th ><span>状态</span></th>
        <th >请求时间</th>
        <th >完成时间</th>
		<th >操作</th>
	

	</thead>
	<tbody id="the-list">
	  
  <c:forEach items="${listpkg}" var="pkg">
<tr id='post-1658' class='alternate author-self status-inherit' valign="top">
		<td class="column-icon">
		  <c:forEach items="${listPlatform}" var="platform">  
		    <c:if test="${pkg.platformId==platform.id}">${platform.name}</c:if>
		    </c:forEach>
		  
		  </td>
		<td class='title column-title'><strong><a>
        <c:if test="${pkg.status==1}">请求创建中</c:if>
        <c:if test="${pkg.status==2}">创建完成</c:if>
        
        
        <c:if test="${pkg.status==10}">下载资源</c:if>
        <c:if test="${pkg.status==11}">文件创建中</c:if>
        </a></strong>
		  
		  <p>
  </p>
  		</td>
		<td>${pkg.createtime}</td>
		<td >${pkg.uploadtime}</td>
		<td ><span class='edit'><a onclick='return showNotice.warn();'  class='submitdelete' href="comic_package_do.action?id=${pkg.id}&action=delete">删除</a>  | </span>
  <c:if test="${pkg.fileName!=null}">
 <a href="../uploadpkg/${pkg.fileName}">下载</a> 
 </c:if>
  <c:if test="${pkg.platformId==1}">
  <a href="config_item_comic.action?comicId=${comic.id}">配置</a>
  </c:if>
 <c:if test="${pkg.platformId==1&&pkg.status==2}">
    <a href="http://192.168.1.170/pkg/${pkg.id}/cartoon_dev.ipa">ios测试包</a> 
    
    <a href="http://192.168.1.170/pkg/${pkg.id}/cartoon_store.ipa">ios正式包</a> 
    </c:if>
 |
 <a href="comic_package_source.action?id=${pkg.id}">发布</a> 
</td>
		<!--<td class='date column-date'>${article.pubTime}	</td>-->        </tr>
 </c:forEach>
	</tbody>
</table>
</form>
<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
       
      

             <c:if test="${param.comicId!=null}">
             
             <a href="comic.action" class="btn nextone saveBtn">返回漫画列表</a>
             
<a href="comic_package_new.action?id=${param.comicId}" class="btn nextone saveBtn">创建漫画包</a>
</c:if>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
