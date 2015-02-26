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
<div class='media-item'>
	
	<table class='slidetoggle describe form-table'>
		<tbody>
		  
		  
		  <tr><td style='display:none' colspan='2' class='image-editor' id='image-editor-1658'></td></tr>
		  
		  <tr class='post_title form-required'>
		    <th valign='top' scope='row' class='label'><span class='alignleft'>漫画名</span></th>
		    <td class='field'>${comic.id}.${comic.name}</td>
		    </tr>
            
            <tr>
              <th valign='top' scope='row' class='label'>平台</th>
              
              <td class='field'>
 <c:forEach items="${listPlatform}" var="platform">
 <input type='radio'  name='platformId' value='${platform.id}'  /> ${platform.name}
 </c:forEach>
  </td>
            </tr>
            <tr>
		    <th valign='top' scope='row' class='label'><label><span class="field">cer文件</span><br class='clear' /></label></th>
		    
		    <td class='field'><input name="file_cer" type="file" value=""  /><span></span></td>
		    </tr>
            <tr >
		    <th valign='top' scope='row' class='label'><label>页数<br class='clear' /></label></th>
		    
		    <td class='field'><input type="text" value="${comic.pageCount}"  readonly="readonly"/><span></span></td>
		    </tr>

		  </tbody>

	</table>
</div>
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
