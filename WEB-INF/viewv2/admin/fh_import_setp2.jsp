<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

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
				  <h3 class="m_subtit account_title">漫画新增setp2</h3>
                  
					
					<h3  class="m_subtit account_title">要导入的漫画:</h3>
                    <table>
           
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span title="运行" class="icon_status icon_active">运行</span></div></td><td class="tal">${comic.title}</a></td><td class="tac"><img width="40" height="60" src="${comic.cover}" class="attachment-80x60" />	</td>
            <td class="tac">&nbsp;</td></tr>
          
                  </table> 
<h3  class="m_subtit account_title">当前数据库存在的漫画:</h3>              
<c:if test="${fn:length(comics) == 0}">未存在
<input name="isNew" value="1" type="hidden"/>
</c:if>
<table>
                   <c:forEach items="${comics}" var="comic">
            <tr class="odd"><td class="tac sorting_1"><div style="min-width:30px;" class="datatable_itemsbox"><span title="运行" class="icon_status icon_active">运行</span></div></td>
            <td class="tal">${comic.name}</a></td><td class="tac"><img width="40" height="60" src="${comic.cover}" class="attachment-80x60" />	</td>
            <td class="tac">&nbsp;</td></tr>
            </c:forEach>
                  </table>   
                  
                  <form action="fh_import_do.action">
                  <input type="hidden" name="oid" value="${comic.id}"/>
                  <c:if test="${fn:length(comics) == 0}">
<input name="isNew" value="1" type="hidden"/>
</c:if>
<c:if test="${fn:length(comics) != 0}">
<input name="isNew" value="0" type="hidden"/>
</c:if>
                  <input type="submit" class="btn nextone saveBtn" value="下一步"/>
                  </form>
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
