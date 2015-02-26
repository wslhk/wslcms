<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理员增加 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>
</head>
<body class="wp-admin no-js  user-new-php">


<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content"><div class="wrap">
	<div id="icon-users" class="icon32"><br /></div>
<h2 id="add-new-user"> 增加新权限</h2>


<div id="ajax-response"></div>

<p>新建用户账户，并将用户加入此站点。</p>
<form action="role_do.action" method="post" name="createuser"  id="form_manager"><input type="hidden" name="action" value="add" /><table class="form-table">
<tr>
		<th scope="row"><label for="user_login">编号 <span class="description">(必填)</span></label></th>
		<td><input name="id" type="text"  value="" aria-required="true" /><span></span></td>

	</tr>
	<tr>
		<th scope="row"><label for="user_login">权限中文名 <span class="description">(必填)</span></label></th>
		<td><input name="title" type="text"  value="" aria-required="true" /><span></span></td>

	</tr>
    <tr>
		<th><label>key
		  <span class="description">(必填)</span></label>
		  如 ROLE_EDITER</th>
		<td><input name="key" type="text"  value="" aria-required="true" maxlength="32" /><span></span></td>

	</tr>
	<tr>
	  <th scope="row"><label for="pass1">简介 <span class="description">(必填)</span></label></th>
	  <td><input name="intro"  /><span></span>
	 
	    </td>
	  </tr>
      
     
      
	</table>
    
   
    <p class="submit"><input type="submit" id="createusersub" class="button-primary" value="增加"  /></p>
</form>
</div>

<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->
</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>


</body>
</html>
