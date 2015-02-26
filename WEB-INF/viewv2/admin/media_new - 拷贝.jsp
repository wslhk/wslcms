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

<h2>多媒体资料库添加</h2>

<form id="form_ad" action="media_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />

  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" /><span></span>
</td></tr>

<tr><th><label>文件：</label></th>
  <td><input  name="file_media" type="file" value="" /><span></span>
</td></tr>

<tr><th><label for="role">文件播放长度(秒)：</label></th>
<td><input type="text" name="second" />秒<span></span>
</td></tr>

<tr><th><label>分组：</label></th>
  <td>
    
<c:forEach items="${listmediagroup}" var="mediagroup">
 <input type="radio" name="mediaGroupId" value="${mediagroup.id}">${mediagroup.title}
 </c:forEach>
 

 <span></span>
</td></tr>
<tr><th><label>类型：</label></th>
  <td>
    

 <input type="radio" name="type" value="1" checked="checked" /> 声效(短)
  <input type="radio" name="type" value="2" /> 
  背景音乐(长)
   <input type="radio" name="type" value="3" /> 视频
 <input type="radio" name="type" value="4" /> GIF
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
