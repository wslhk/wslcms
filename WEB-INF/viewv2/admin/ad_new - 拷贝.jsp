<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>- 漫画数字单行本综合管理平台（CCAPS）</title><jsp:include page="include/include_head.jsp"></jsp:include>
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

<h2>增加</h2>

<form id="form_ad" action="ad_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="type" value="${ad.type}" />

<input type="hidden" name="publish" value="true">

  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" /><span></span>
</td></tr>
<tr><th><label>链接：</label></th>
<td><input type="text" name="link"/><span></span>
</td></tr>

<tr><th><label>图片：(http://xxx | comic_id:xx)</label></th>
  <td><input  name="file_img" type="file" value="" /><span></span>
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
