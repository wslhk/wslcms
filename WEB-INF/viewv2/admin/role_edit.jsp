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
				  <h3 class="m_subtit account_title">权限修改</h3>
                  <form id="form_manager" action="role_do.action" method="post">
<input type="hidden" name="action" value="edit" />

  <p>&nbsp;</p>

<h3>权限属性</h3>
<table class="form-table">
  <tr>
		<th><label for="user_login">id</label></th>
		<td><input type="text" name="id" id="user_login" value="${role.id}"   class="ipt ipt_text" readonly="readonly" /> <span class="description"></span></td>
	</tr>
    <tr>
		<th><label for="user_login">标题</label></th>
		<td><input type="text" name="title" id="user_login" value="${role.title}"   class="ipt ipt_text" /> <span class="description"></span></td>
	</tr>
    <tr>
		<th><label>KEY<span class="description"></span></label></th>
		<td><input name="key" type="key"  value="${role.key}" aria-required="true"  class="ipt ipt_text"/><span></span></td>

	</tr>

<tr><th><label for="role">角色描述：</label></th>
<td>
<input type="text" name="intro" value="${role.intro}"  class="ipt ipt_text" /> 

</td></tr>
<!--
<tr><th><label for="role">api：</label>(是否是调试用户)</th>
<td><input type="radio" />
是
  <input type="radio" />
否</td></tr>
--><!--
<tr>
  <th><label for="nickname">昵称 <span class="description">(必填)</span></label></th>
  <td><input type="text" name="nickname" id="nickname" value="wslhk" class="regular-text" /></td>
</tr>
-->

</table>
<p class="submit"><input type="submit" name="submit" id="submit"  class="btn nextone saveBtn"  value="保存"  /></p>
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
