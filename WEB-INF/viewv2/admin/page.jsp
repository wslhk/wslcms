<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
<jsp:include page="include/head_script.jsp"></jsp:include>

</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">管理单页</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
            
            
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr>
			  <th class="sorting_disabled tac" rowspan="1" colspan="1" ><span class="manage-column column-username sortable desc">id</span></th><th class="sorting_disabled tal" rowspan="1" colspan="1" >标题</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >位置</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
            <c:forEach items="${listpage}" var="page">
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span class="username column-username">${page.id}</span></div></td><td class="tal"><div><a href="ad_edit.action?id=${ad.id}&type=${ad.type}">
   <c:if test="${comic.isRemoteImg==1}">
   <a href="${page.picture}">
   <img src="${page.picture}" width="80" />
   </a>
   </c:if>  
    <c:if test="${comic.isRemoteImg==0}">
    <a href="../uploadimg/comic/${page.picture}">
   <img src="../uploadimg/comic/${page.picture}" width="80" />
   </a>
   </c:if>        
            </a></div></td><td class="tac">
            <a href="page_do.action?action=up&id=${page.id}">上移</a>,<a href="page_do.action?action=down&id=${page.id}">下移</a>
            </td><td class="tac">
             <span class='edit'>
	    
	    <a href="shot.action?pageId=${page.id}">查看分镜头</a>
	    | 
	    </span>
        
         <span class='edit'>
	    
	    <a href="script.action?pageId=${page.id}">编辑台词</a>
	    | 
	    </span>
        
	  <span class='edit'>
	    
	    <a href="page_edit.action?id=${page.id}">编辑单页</a>
	    | 
	    </span>
        <span class='edit'>
	    
	    <a href="frame.action?id=${page.id}">分镜头特效</a>
	    | 
	    </span>
	  <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='page_do.action?action=delete&id=${page.id}'>永久删除</a>  </span>
            </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
            <div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
       
       
             
	<a href="page_new.action?chapterId=${param.chapterId}"  class="btn nextone saveBtn">添加</a>
<a href="chapter.action?chapterId=${page.chapterId}" class="btn nextone saveBtn">返回</a>		
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
