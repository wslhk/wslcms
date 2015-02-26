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
				  <h3 class="m_subtit account_title">平台新增</h3>
                  <form id="form_platform" action="platform_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />
  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">id：</label></th>
<td><input type="text" name="id" class="ipt ipt_text" />
<span></span> *
</td></tr>
<tr><th><label for="role">名称：</label></th>
<td><input type="text" name="name" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>介绍：</label></th>
<td><input type="text" name="intro" class="ipt ipt_text"/><span></span>
</td></tr>


<tr><th><label>logo：</label></th>
<td><input  name="file_icon" type="file" value=""  class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label>是否发布：</label></th>
  <td>
    

  <input type="radio" name="status" checked="checked" value="1">发布
  <input type="radio" name="status" value="0"> 不发布
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
