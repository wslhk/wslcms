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
            <table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr>
			  <th class="sorting_disabled tac" rowspan="1" >编号</th>
			            <th class="sorting_disabled tac" rowspan="1" colspan="1" >内容商</th>
			            <th class="sorting_disabled tac" rowspan="1" >&nbsp;</th>
			            <th class="sorting_disabled tac" rowspan="1" >位置</th>
	              <th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
<c:forEach items="${listlink}" var="link">
            <tr class="odd">
              <td class="tac sorting_1">${link.id}</td>
              <td class="tac sorting_1">${link.domain.name}</td>
              <td class="tac"><img width="100" src="../uploadimg/domain/${link.domain.logo}"/></td>
              <td class="tac"><a href="listitem_link_do.action?action=up&id=${link.id}">上移</a> | 
                <a href="listitem_link_do.action?action=down&id=${link.id}">下移</a>
              </td>
              <td class="tac"><span class='edit'> </span>
                
                <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='listitem_link_do.action?action=delete&id=${link.id}'>删除</a>  </span>
              </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
        <a href="listitem_domain_new.action?id=${listitem.id}"  class="btn nextone saveBtn">添加</a>     
            
             
          </div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
