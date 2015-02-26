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
<h2>资源 <a href="comic_package_publish.action?id=${param.id}">查看向导</a></h2>






  <div class="media-single">
    <table cellspacing="0" cellpadding="0" class="wp-list-table widefat  users">
    <col width="139" />
    <col width="231" />
    <col width="429" />
    <col width="386" />
    <thead>
    <tr>
      <th width="139">英文名称</th>
      <th width="231">中文名称</th>
      <th width="429">说明</th>
      <th width="386">建议</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>AppName</td>
      <td>应用名称</td>
      <td></td>
      <td>${comic.name}</td>
    </tr>
    <tr>
      <td>xap</td>
      <td>程序包</td>
      <td>要上传的漫画单行本的包</td>
      <td><a href="../uploadpkg/${pkg.fileName}">下载</a></td>
    </tr>
    <tr>
      <td>xap Version</td>
      <td>程序版本号</td>
      <td>本次要上传的漫画单行本的版本号</td>
      <td>V1.${pkg.id}</td>
    </tr>
    <tr>
      <td>Description</td>
      <td>应用商店说明</td>
      <td>要在商店应用下载界面显示的说明性文字（支持多语言）</td>
      <td>${comic.intro}</td>
    </tr>
    <tr>
      <td>Key words</td>
      <td>关键词</td>
      <td>漫画包搜索的关键词</td>
      <td>${comic.name},漫画</td>
    </tr>
    <tr>
      <td>Tile Logo</td>
      <td>应用磁贴图标</td>
      <td>在商店显示的漫画包的LOGO</td>
      <td><img src="../uploadimg/comic/${comic.icon}" /></td>
    </tr>
    <tr>
      <td>Screen Shot</td>
      <td>应用截屏</td>
      <td>应用内的截屏图  （支持多分辨率）</td>
      <td></td>
    </tr>
    </tbody>
  </table>
</div>




</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
