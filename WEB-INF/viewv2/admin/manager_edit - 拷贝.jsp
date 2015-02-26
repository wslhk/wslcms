<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<h2>编辑用户</h2>

<form id="form_manager" action="manager_do.action" method="post">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="id" value="${manager.id}" />
  <p>&nbsp;</p>

<h3>个人选项</h3>
<table class="form-table">
  <tr>
		<th><label for="user_login">用户名</label></th>
		<td>${manager.username}<input type="hidden" name="username" id="user_login" value="${manager.username}"  class="regular-text" /> <span class="description">用户名不可更改。</span></td>
	</tr>
    <tr>
		<th><label>Nick</label></th>
		<td><input name="nick" type="text"  value="${manager.nick}" aria-required="true" /><span></span></td>

	</tr>
    
    <tr>
		<th><label>邮箱 <span class="description">(必填)</span></label></th>
		<td><input name="email" type="email"  value="${manager.email}" aria-required="true" /><span></span></td>

	</tr>

 <tr>
	  <th scope="row"><label for="role">角色</label></th>
	  <td>
<c:forEach items="${listRole}" var="role">
	<input type="checkbox" name="roles" value="${role.id}" <c:if test="${role.selected==true}">checked="checked"</c:if> />${role.title} 
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
</select>
</td>
	  </tr>
</sec:authorize>        
<tr><th><label for="role">是否生效：</label></th>
<td>

<input type="radio" name="publish" value="true"  <c:if test="${manager.publish==true}">checked="checked"</c:if>/>
生效 
<input type="radio" name="publish" value="false" <c:if test="${manager.publish==false}">checked="checked"</c:if>/>
无效</td></tr>
<!--
<tr>
  <th><label for="nickname">昵称 <span class="description">(必填)</span></label></th>
  <td><input type="text" name="nickname" id="nickname" value="wslhk" class="regular-text" /></td>
</tr>
-->

</table>
<h3>关于密码</h3>

<table class="form-table">

<tr>
  <th height="116"><label for="pass1">新密码</label></th>
  
  <td><input type="password" name="passwordedit" id="passwordedit" size="16" value="" autocomplete="off" /> <span></span><br/><span class="description">如果您想修改您的密码请输入一个新密码，否则请留空。</span><br />
    <input type="password" name="repasswordedit"  size="16" value="" autocomplete="off" /> <span></span><br/><span class="description">再输入一遍新密码。</span><br />
    <div id="pass-strength-result">强度</div>
    <p class="description indicator-hint">提示：您的密码最好至少包含 7 个字符。为了保证密码强度，使用大小写字母，数字和符号，例如 ! " ? $ % ^ &amp; )。</p>
    </td>
  
</tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="button-primary" value="更新用户"  /></p>
</form>
</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
