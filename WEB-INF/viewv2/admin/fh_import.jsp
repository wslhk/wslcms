<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  
<script>
$().ready(function(e) {
	setInterval(showThread,3000); 
	
	
});
function showThread(){
    $.ajax({  
					url:"fh_import_thread.action", 
					//data:'text='+str+'&url='+localhref+'&'+Math.random(),//this.menuId, 
					//async:false,  
					type:'get',
					//dataType:"json",  
					processData:false,  
 
					success:function(jsondata) { 
		
						$('#showThread').html(jsondata);
					}  
			 });
	}
</script>
</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">漫画新增</h3>
                  <form id="form_adapter" action="fh_import.action" method="get">

					<table>
						<tbody>
                        
                        
                       <tr><th><label for="role">名称(输入关键词,2个字以上)：</label></th>
<td><input type="text" name="keyword" class="ipt ipt_text" /><span></span>
</td>
<td><input type="submit" class="btn nextone saveBtn" value="查询"/>
</td>
</tr>
                        
					</tbody></table>
                    
                     
                  </form>
					
					<h3  class="m_subtit account_title">请选择</h3>
                    <table>
                   <c:forEach items="${comics}" var="comic">
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span title="运行" class="icon_status icon_active">运行</span></div></td><td class="tal">${comic.title}</a></td><td class="tac"><img width="40" height="60" src="${comic.cover}" class="attachment-80x60" />	</td>
            <td class="tac"><a href="fh_import_setp2.action?id=${comic.id}">我要导入这个漫画</a></td></tr>
            </c:forEach>
                  </table> 
         
                 
              <div id="showThread"></div>    
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
