<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="2"></jsp:param>
</jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">管理员编辑</h3>
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
		<td><input name="nick" type="text"  value="${manager.nick}"  class="ipt ipt_text"  aria-required="true" /><span></span></td>

	</tr>
    
    <tr>
		<th><label>邮箱 <span class="description">(必填)</span></label></th>
		<td><input name="email" type="email"  value="${manager.email}" aria-required="true"  class="ipt ipt_text"  /><span></span></td>

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
      <select name="domainId"  class="ipt ipt_text" >
<c:forEach items="${listDomain}" var="domain">
	<option  value="${domain.id}" <c:if test="${domain.id==manager.domainId}"> selected="selected"</c:if>>${domain.name}</option>
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



<tr>
  <th height="116"><label for="pass1">新密码</label></th>
  
  <td><input type="password" name="passwordedit" id="passwordedit" size="16" value="" autocomplete="off"  class="ipt ipt_text" /> <span></span><br/><span class="description">如果您想修改您的密码请输入一个新密码，否则请留空。</span><br />
    <input type="password" name="repasswordedit"  size="16" value="" autocomplete="off"  class="ipt ipt_text" /> <span></span><br/><span class="description">再输入一遍新密码。</span><br />
    <div id="pass-strength-result">强度</div>
    <p class="description indicator-hint">提示：您的密码最好至少包含 7 个字符。为了保证密码强度，使用大小写字母，数字和符号，例如 ! " ? $ % ^ &amp; )。</p>
    </td>
  
</tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="btn nextone saveBtn" value="更新用户"  /></p>
</form>
					
					
                   
				</div>
				
		
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
