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
				  <h3 class="m_subtit account_title">预览图新增</h3>
                  <form id="form_adapter" action="product_preview_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />
<input  value="${param.productId}" name="productId" type="hidden" />
<input value="1"  name="publish" type="hidden" />
					<table class="form-table">
						<tbody>

<tr><th><label for="role">预览图：</label></th>
  <td><input type="file" name="file_img"  class="ipt ipt_text" /><span></span>
</td></tr>


                        
					</tbody></table>
                    
                   
                    <input type="submit" class="btn nextone saveBtn" value="保存"/>
                     
                  </form>
                  
                   从前10页直接选择
<form action="product_preview_do.action" method="post">
<input  value="${param.productId}" name="productId" type="hidden" />
<input  value="linkproduct" name="action" type="hidden" />
<table class="form-table">
						<tbody>

<tr><th><label for="role">内容图：</label></th>
  
  <td>
  <c:forEach items="${pages}" var="page">
  
  	<input type="checkbox" value="${page.id}" name="pageIds">
  <img src="${page.picture}" width="80"/>
  </c:forEach>

</td></tr>
                    
</tbody></table>
<input type="submit" class="btn nextone saveBtn" value="保存"/>
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
