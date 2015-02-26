<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>
    <script src="../js/json2.js"></script>
<script>

$().ready(function(){
	initTable();
	
	});
var data=${revenues};
function initTable(){
	
;
/* for (var key in data) { 
    alert("key = " + key + "  value = " + data[key]); 
 } 
 */
	var htmlval='';
for (var key in data){
		htmlval+="<tr>";
		htmlval+="<td>"+key+"</td>";
		htmlval+="<td>"+data[key].value+"</td>";
		htmlval+="<td>"+data[key].appstore+"</td>";
		htmlval+="<td>"+data[key].application+"</td>";
		htmlval+="<td>"+data[key].country+"</td>";
		htmlval+="</tr>";
		
	}
	
$('#tbody').html(htmlval);	
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
			<p class="m_tit">漫画管理</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" width="100%" ><thead><tr><th class="sorting_disabled tac" rowspan="1" colspan="1" >时间</th>
			<th class="sorting_disabled tal" rowspan="1" colspan="1" >下载数</th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" ><pre id="line1">appstore</pre></th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" ><pre id="line2">application</pre></th>
			<th class="sorting_disabled tac" rowspan="1" colspan="1" >country</th></tr></thead>
            
            
            
           <tbody id="tbody">
            
            
            </tbody></table>
            <jsp:include page="include/page.jsp"></jsp:include>
             <a href="comic_new.action"  class="btn nextone saveBtn">添加</a>
             
             
            <div class="dataTables_scrollFoot" style="border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info"></div></div></div>
			
		</div>
	</div>
<jsp:include page="include/sidebar_analytics.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
