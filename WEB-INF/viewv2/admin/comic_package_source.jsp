<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp"><jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">发布资源</h3>
                  <form method="post" action="comic_package_do.action" id="form_article" enctype="multipart/form-data"><input type="hidden" name="action" value="add" />
<input type="hidden" name="comicId" value="${comic.id}" />

<div class="media-single">
<div class='media-item'>
	
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

<p class="submit">
<a href="comic_package.action?comicId=${comic.id}" class="btn nextone saveBtn">返回漫画包列表</a>

<a href="comic_package_publish.action?id=${param.id}" class="btn nextone saveBtn">查看向导</a>
</p>
</form>
					
					
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
