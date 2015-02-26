<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>编辑广告 - 漫画数字单行本综合管理平台（CCAPS）</title><jsp:include page="include/include_head.jsp"></jsp:include>
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

<h2>漫画</h2>

<form id="form_adapter" action="comic_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />

  <p>&nbsp;</p>

<h3>编辑</h3>
<table class="form-table">


<tr><th><label for="role">id：</label></th>
<td><input type="hidden" name="id" value="${comic.id}" /><span></span>
</td></tr>
<tr><th><label>名称：</label></th>
<td><input type="text" name="name" value="${comic.name}"/><span></span>
</td></tr>
<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${comic.intro}" /><span></span>
</td></tr>

<tr><th><label>首页图片：</label></th>
  <td>
  <img width="40" height="60" src="../uploadimg/comic/${comic.cover}" class="attachment-80x60" />
  <input  name="file_cover" type="file" value="" /><input type="hidden" name="cover" value="${comic.cover}" /><span></span>
</td></tr>

<tr><th><label>icon(114x114)：</label></th>
  <td>
  <img width="40" height="40" src="../uploadimg/comic/${comic.icon}" class="attachment-80x60" />
  <input  name="file_icon" type="file" value="" /><input type="hidden" name="icon" value="${comic.icon}" /><span></span>
</td></tr>

<tr><th><label>状态：</label></th>
<td>
<input type="radio" name="pubStatus" value="1"  <c:if test="${comic.pubStatus==1}">checked="checked"</c:if>/>
启用 
<input type="radio" name="pubStatus" value="0" <c:if test="${comic.pubStatus==0}">checked="checked"</c:if>/>
屏蔽<span></span>

</td></tr>

<tr><th><label>作者：</label></th>
<td><input  name="author" value="${comic.author}" type="text"  /><span></span>
</td></tr>
<tr><th><label>翻译：</label></th>
<td><input  value="${comic.subTrans}"  name="subTrans" type="text"  /><span></span>
</td></tr>
<tr><th><label>嵌字：</label></th>
<td><input  value="${comic.subFiller}"  name="subFiller" type="text"  /><span></span>
</td></tr>
<tr><th><label>修正：</label></th>
<td><input  name="subCheck" type="text"  value="${comic.subCheck}"  /><span></span>
</td></tr>
<tr><th><label>上色：</label></th>
<td><input  name="subColor" type="text" value="${comic.subColor}"  /><span></span>
</td></tr>
<tr><th><label>图源：</label></th>
<td><input  name="subSource" type="text"  value="${comic.subSource}"  /><span></span>
</td></tr>
<tr><th><label>出版社：</label></th>
<td><input  name="publisher" type="text"  value="${comic.publisher}"  /><span></span>
</td></tr>

</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="button-primary" value="修改"  /></p>
</form>
</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
