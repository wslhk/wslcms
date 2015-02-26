<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>
<script>
function searchAtType(type){
	var keyword=$('#keyword').val();
	if(keyword.length<2){
		return;
	}
	
}

</script>
</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param>
</jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">
            <c:if test="${listitem.type==0}">商品</c:if>
            <c:if test="${listitem.type==1}">漫画</c:if>
            <c:if test="${listitem.type==2}">内容商</c:if>
            --列表
          </p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
		  <div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
<h3>当前列表</h3>
<form action="listitem_comic_new.action">
<input type="hidden" name="id" value="${param.id}"/>
<input type="text" name="keyword" value="${param.keyword}"/>
<input type="submit" value="查询"/>
</form>
<form action="listitem_link_do.action">
<input type="hidden" name="listId" value="${listitem.id}"/>
<input type="hidden" name="type" value="${listitem.type}"/>
<input type="hidden" name="action" value="add"/>
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr>
              <th class="sorting_disabled tac" rowspan="1" >&nbsp;</th>
			  <th class="sorting_disabled tac" rowspan="1" >漫画</th>
			  <th class="sorting_disabled tac" rowspan="1" >漫画封面</th>
		            <th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
<c:forEach items="${comics}" var="comic">
            <tr class="odd">
              <td class="tac sorting_1"><input type="checkbox" name="comicIds" value="${comic.id}"/></td>
              <td class="tac sorting_1">${comic.name}</td>
              <td class="tac sorting_1"><img src="../uploadimg/comic/${comic.cover}" width="100"/></td>
              <td class="tac">&nbsp;</td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
        <input type="submit" class="btn nextone saveBtn" value="添加">     
</form>  
             
          </div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_goback.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
