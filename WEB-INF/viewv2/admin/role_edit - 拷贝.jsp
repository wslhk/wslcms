<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理员编辑 - 漫画数字单行本综合管理平台（CCAPS）</title><jsp:include page="include/include_head.jsp"></jsp:include>
</head>
<body class="wp-admin no-js  user-edit-php">


<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content">
  <div class="wrap" id="profile-page">
    <div id="icon-users" class="icon32"><br /></div>

<h2>编辑权限属性</h2>

<form id="form_manager" action="role_do.action" method="post">
<input type="hidden" name="action" value="edit" />

  <p>&nbsp;</p>

<h3>权限属性</h3>
<table class="form-table">
  <tr>
		<th><label for="user_login">id</label></th>
		<td><input type="text" name="id" id="user_login" value="${role.id}"  class="regular-text" readonly="readonly" /> <span class="description"></span></td>
	</tr>
    <tr>
		<th><label for="user_login">标题</label></th>
		<td><input type="text" name="title" id="user_login" value="${role.title}"  class="regular-text" /> <span class="description"></span></td>
	</tr>
    <tr>
		<th><label>KEY<span class="description"></span></label></th>
		<td><input name="key" type="key"  value="${role.key}" aria-required="true" /><span></span></td>

	</tr>

<tr><th><label for="role">角色描述：</label></th>
<td>
<input type="text" name="intro" value="${role.intro}"  /> 

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
<p class="submit"><input type="submit" name="submit" id="submit" class="button-primary" value="保存"  /></p>
</form>
</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
