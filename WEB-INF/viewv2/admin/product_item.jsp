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
			<p class="m_tit">内支付</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr>
			            <th class="sorting_disabled tac" rowspan="1" colspan="1" >平台</th>
			            <th class="sorting_disabled tal" rowspan="1" colspan="1" >内支付码</th>
			            <th class="sorting_disabled tac" rowspan="1" >建议价格</th>
			            <th class="sorting_disabled tac" rowspan="1" >是否允许支付</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >操作</th></tr></thead>
            
            
            
           <tbody>
            <c:forEach items="${platforms}" var="platform">
            <tr class="odd"><td class="tac sorting_1">${platform.name}</td><td class="tal">
<c:forEach items="${items}" var="item">
<c:if test="${item.platformId==platform.id}">
${item.productId}
</c:if>

</c:forEach>
            
            </td>
              <td class="tac">${item.price}</td>
              <td class="tac">
<c:forEach items="${items}" var="item">
<c:if test="${item.platformId==platform.id}">

             
              <c:if test="${item.allowPay==1}"><span title="运行" class="icon_status icon_active">运行</span></c:if>
             <c:if test="${item.allowPay==0}"><span title="暂停" class="icon_status icon_paused">暂停</span></c:if> 
           </c:if>

</c:forEach>   
              
              </td>
              <td class="tac">
            
   
    <a href="product_item_edit.action?comicId=${param.comicId}&platformId=${platform.id}">编辑</a>
    |<span class='edit'> </span>
    
    <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='comic_do.action?action=delete&id=${comic.id}'>清除</a>  </span>
            </td></tr>
            </c:forEach>
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
             
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
