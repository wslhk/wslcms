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
			<p class="m_tit">专题（只显示前6个）</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
        <div id="tabList" class="reprot_chart_ft">
       
        
        </div>
    
     
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr>
			  <th class="sorting_disabled tac" rowspan="1" >编号</th>
			            <th class="sorting_disabled tac" rowspan="1" colspan="1" >专题名</th>
			            <th class="sorting_disabled tal" rowspan="1" colspan="1" >icon</th>
			            <th class="sorting_disabled tac" rowspan="1" >位置</th>
	              <th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
<c:forEach items="${specials}" var="special">
            <tr class="odd">
              <td class="tac sorting_1">${special.id}</td>
              <td class="tac sorting_1">${special.title}</td>
              <td class="tal">
  <img width="50" src="../uploadimg/special/${special.icon}"/>
                
              </td>
              <td class="tac"><a href="special_do.action?action=up&id=${special.id}">上移</a> | 
                <a href="special_do.action?action=down&id=${special.id}">下移</a>
              </td>
              <td class="tac">
                
                
                <a href="special_edit.action?id=${special.id}">编辑</a>
                |
                 <a href="special_comic.action?id=${special.id}">查看列表</a>
                |
                <span class='edit'> </span>
                
                <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='special_do.action?action=delete&id=${special.id}'>删除</a>  </span>
              </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
        <a href="special_new.action"  class="btn nextone saveBtn">添加</a>     
             
             
            </div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
