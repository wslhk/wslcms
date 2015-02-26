<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广告增加 - 漫画数字单行本综合管理平台（CCAPS）</title><jsp:include page="include/include_head.jsp"></jsp:include>
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

<h2>平台可用包类型</h2>

<form id="form_platform_pkg" action="platform_pkg_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />
  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">id：</label></th>
<td><input type="hidden" name="id" />
<span></span> *
</td></tr>
<tr><th><label for="role">选择平台：</label></th>
<td>
<select name="platformId" >
<c:forEach items="${listPlatform}" var="platform">
	<option value="${platform.id}">${platform.name}</option>
</c:forEach>    
</select>
<span></span>
</td></tr>
<tr><th><label>介绍：</label></th>
<td><input type="text" name="intro"/><span></span>
</td></tr>


<tr><th><label>pro：</label></th>
<td><input  name="file_pro" type="file" value="" /><span></span>
</td></tr>

<tr><th><label>是否发布：</label></th>
  <td>
    

  <input type="radio" name="status" checked="checked" value="1">发布
  <input type="radio" name="status" value="0"> 不发布
 <span></span>
</td></tr>


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
