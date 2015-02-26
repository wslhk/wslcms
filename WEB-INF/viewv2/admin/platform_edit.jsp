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
				  <h3 class="m_subtit account_title">修改平台信息</h3>
                  <form id="form_adapter" action="platform_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
  <p>&nbsp;</p>

<h3>编辑</h3>
<table class="form-table">


<tr><th><label for="role">id：</label></th>
<td><input type="text" name="id" value="${platform.id}" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>名称：</label></th>
<td><input type="text" name="name" value="${platform.name}" class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${platform.intro}"  class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label>首页图片：</label></th>
  <td>
  <img width="40" height="60" src="${platform.icon}" class="attachment-80x60" />
  <input  name="file_icon" type="file" value=""  class="ipt ipt_text"/><input type="hidden" name="icon" value="${platform.icon}" /><span></span>
</td></tr>


<tr><th><label>状态：</label></th>
<td>
<input type="radio" name="status" value="1"  <c:if test="${platform.status==1}">checked="checked"</c:if>/>
启用 
<input type="radio" name="status" value="0" <c:if test="${platform.status==0}">checked="checked"</c:if>/>
屏蔽<span></span>

</td></tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="btn nextone saveBtn" value="修改"  /></p>
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
