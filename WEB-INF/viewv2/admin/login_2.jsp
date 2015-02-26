<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link rel='stylesheet' href='../css/css.css' type='text/css' media='all' />
<link rel='stylesheet' href='../css/login.css' type='text/css' media='all' />
</head>

<body>

<div id="login"><h1><a style=" display:none;" href="#" title="">Vista</a></h1>

<form name="loginform" id="loginform" action="../j_spring_security_check" method="post">
	<p>
		<label>用户名<br />
		<input type="text" name="j_username" id="user_login" class="input" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" size="20" tabindex="10" /></label>
	</p>
	<p>
		<label>密码<br />
		<input type="password" name="j_password" id="user_pass" class="input" value="" size="20" tabindex="20" /></label>

	</p>
	<p class="forgetmenot"><label><input name="_spring_security_remember_me" type="checkbox" id="rememberme" value="forever" tabindex="90" /> 记住我的登录信息</label></p>
	<p class="submit">
		<input type="submit" name="wp-submit" id="wp-submit" class="button-primary" value="登录" tabindex="100" />
		<input type="hidden" name="redirect_to" value="http://phone.vistastory.com/vista/wp-admin/" />
		<input type="hidden" name="testcookie" value="1" />
	</p>
    <p class="clear"></p>
</form>

<p id="nav">

</p>
</div>


<jsp:include page="../include_page/mini_bar.jsp"></jsp:include>



</body>
</html>