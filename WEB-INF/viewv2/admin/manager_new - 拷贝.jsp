<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
<h2 id="add-new-user"> 添加新用户</h2>


<div id="ajax-response"></div>

<p>新建用户账户，并将用户加入此站点。</p>
<form action="manager_do.action" method="post" name="createuser"  id="form_manager"><input type="hidden" name="action" value="add" /><table class="form-table">
	<tr>
		<th scope="row"><label for="user_login">用户名 <span class="description">(必填)</span></label></th>
		<td><input name="username" type="text"  value="" aria-required="true" /><span></span></td>

	</tr>
    <tr>
		<th scope="row"><label for="user_login">Nick <span class="description"></span></label></th>
		<td><input name="nick" type="text"  value="" aria-required="true" /><span></span></td>

	</tr>
    <tr>
		<th><label>邮箱 <span class="description">(必填)</span></label></th>
		<td><input name="email" type="email"  value="" aria-required="true" maxlength="32" /><span></span></td>

	</tr>
	<tr>
	  <th scope="row"><label for="pass1">密码 <span class="description">(重复两次，必填)</span></label></th>
	  <td><div><input name="password" type="password" id="password" autocomplete="off" maxlength="32" /><span></span></div>
	   <div>
	    <input name="repassword" type="password" id=autocomplete="off" maxlength="32" /><span></span>
	    </div>
	    
	    <div id="pass-strength-result">强度</div>
	    <p class="description indicator-hint">提示：您的密码最好至少包含 7 个字符。为了保证密码强度，使用大小写字母，数字和符号，例如 ! " ? $ % ^ &amp; )。</p>
	    </td>
	  </tr>
	<!--<tr>
	  <th scope="row"><label for="role">角色(老)</label></th>
	  <td>
<input type="checkbox" name="roleAdmin" />管理员 
<input type="checkbox" name="roleEditer" />漫画编辑 
<input type="checkbox" name="roleOrder" />订单查看 
<input type="checkbox" name="roleReporter" />统计报表 
<input type="checkbox" name="roleApi" />api查看 
<input type="checkbox" name="roleChecker" />内容检查
<input type="checkbox" name="roleCopyright" />版权审核
<input type="checkbox" name="roleEditerImg" />图片编辑 

</td>
	  </tr>-->
      <tr>
	  <th scope="row"><label for="role">角色</label></th>
	  <td>
<c:forEach items="${listRole}" var="role">
	<input type="checkbox" name="roles" value="${role.id}" />${role.title} 
</c:forEach>
</td>
	  </tr>
<sec:authorize ifAllGranted="ROLE_ADMIN">     
       <tr>
	  <th scope="row"><label for="role">属于内容商</label></th>
	  <td>
      <select name="domainId">
<c:forEach items="${listDomain}" var="domain">
	<option value="${domain.id}">${domain.name}</option>
</c:forEach>
</select>dd
</td>
	  </tr>
</sec:authorize>      
      <tr>
	  <th scope="row"><label for="role">是否发布</label></th>
	  <td>
<input type="radio" name="publish" value="true" />
发布
<input type="radio" name="publish" value="false" checked="checked" />
取消
<span></span>
</td>
	  </tr>
      
     
      
	</table>
    
   
    <p class="submit"><input type="submit" name="createuser" id="createusersub" class="button-primary" value="添加新用户"  /></p>
</form>
</div>

<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->
</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>


</body>
</html>
