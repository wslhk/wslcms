<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">平台可用包新增</h3>
                  <form id="form_platform_pkg" action="platform_pkg_do.action" method="post">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />

<input type="hidden" name="domainId" value="${domain.id}" />

  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">id：</label></th>
<td><input type="hidden" name="id" />
<span></span> *
</td></tr>
<tr><th><label for="role">选择平台：</label></th>
<td>
<select name="platformId" class="ipt ipt_text">
<c:forEach items="${listPlatform}" var="platform">
	<option value="${platform.id}">${platform.name}</option>
</c:forEach>    
</select>
<span></span>
</td></tr>


</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="btn nextone saveBtn" value="保存"  /></p>
</form>
					
					
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_manager.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
