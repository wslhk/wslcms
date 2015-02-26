<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>创建新的包请求 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>
</head>
<body class="wp-admin no-js  media-php">

<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content">
  <div class="wrap">
    <div id="icon-upload" class="icon32"><br /></div>

创建package





<form method="post" action="comic_package_do.action" id="form_article" enctype="multipart/form-data"><input type="hidden" name="action" value="add" />
<input type="hidden" name="comicId" value="${comic.id}" />

<div class="media-single">
  <p><img src="../images/publish/1.png" width="499" height="311" /></p>
  <p><img src="../images/publish/2.png" width="589" height="497" /></p>
   <p><img src="../images/publish/3.png" /></p>
   <p><img src="../images/publish/4.png" /></p>
   <p><img src="../images/publish/5.png" /></p>
   <p><img src="../images/publish/6.png" /></p>
   <p><img src="../images/publish/7.png" /></p>
   <p><img src="../images/publish/8.png" /></p>
   <p><img src="../images/publish/9.png" /></p>
   <p><img src="../images/publish/10.png" /></p>
   <p><img src="../images/publish/11.png" /></p>
   <p><img src="../images/publish/12.png" /></p>
   <p><img src="../images/publish/13.png" /></p>
   <p><img src="../images/publish/14.png" /></p>
   <p><img src="../images/publish/15.png" /></p>
   

  <p></p>
</div>

<p class="submit"><input type="submit" name="save" id="save" class="button-primary" value="保存"  />
</p>
</form>

</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
