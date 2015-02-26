<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>图片 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>
		<script src="../js/jquery.Jcrop.min.js" type="text/javascript"></script>
        <script src="../js/json2.js"></script>
        <script src="../js/vcomicview_select.js"></script>
		<link rel="stylesheet" href="../css/jquery.Jcrop.css" type="text/css" />

        <style>
        #shots li{ display:block; width:110px; height:120px; float:left; border:1px solid #999; margin:1px;}
		#shots li.selected{ background:#09F}
		#shots li .viewicon{ display:block; overflow:hidden; background:#666; }
		#shots li .viewiconout{ display:block; overflow:hidden; height:80px; width:80px; margin:10px; }
		#shots li .view_delete{ clear:both; text-align:center; text-align:center; display:block;}
		#shots{ width:100%; display:block; height:630px;}
		#post_addView{ position:absolute; z-index:999; cursor:pointer;}
#viewjsp_layout{}
		/*viewjsp_layout*/
.baselayout{ position:absolute; border:1px solid; filter: Alpha(Opacity=50);-moz-opacity:0.5;opacity: 0.5; background:#06C; font-size:20px; color:#FFF;}
        </style>
        <script>
var pageId='${page.id}';
var chapterId='${page.chapterId}';
var comicId='${page.comicId}';
var comic_img_width=${page.width};
var comic_img_height=${page.height};

        </script>
</head>
<body class="wp-admin no-js  upload-php">


<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content">
<div id="screen-meta">
<div id="screen-options-wrap" class="hidden">
	<form id="adv-settings" action="" method="post">
			<h5>在页面上显示</h5>
		<div class="metabox-prefs">
<label for="author-hide"><input class="hide-column-tog" name="author-hide" type="checkbox" id="author-hide" value="author" checked='checked' />作者</label>
<label for="parent-hide"><input class="hide-column-tog" name="parent-hide" type="checkbox" id="parent-hide" value="parent" checked='checked' />附加到</label>

<label for="comments-hide"><input class="hide-column-tog" name="comments-hide" type="checkbox" id="comments-hide" value="comments" checked='checked' />评论</label>
<label for="date-hide"><input class="hide-column-tog" name="date-hide" type="checkbox" id="date-hide" value="date" checked='checked' />日期</label>
			<br class="clear" />
		</div>
			<h5>在页面上显示</h5>
		<div class='screen-options'>
<input type='text' class='screen-per-page' name='wp_screen_options[value]' id='upload_per_page' maxlength='3' value='20' /> <label for='upload_per_page'>媒体项目</label>
<input type="submit" name="screen-options-apply" id="screen-options-apply" class="button" value="应用"  /><input type='hidden' name='wp_screen_options[option]' value='upload_per_page' /></div>

<div><input type="hidden" id="screenoptionnonce" name="screenoptionnonce" value="e064d58d02" /></div>
</form>
</div>

	<div id="contextual-help-wrap" class="hidden">
	<div class="metabox-prefs"><p>您上传的所有文件都在"媒体库"中列出，按上传时间先后排列。您可以在"页面选项"选项卡中自定义此页面。</p><p>通过点击页面上方的过滤器链接（按照文件类型或状态）来缩小列表列出文件的范围。使用列表上方的下拉菜单，您也可以通过指定时间段来过滤列表项。</p><p>将鼠标光标移动到某一行上方，将出现几个新的链接：<em>编辑</em>、<em>永久删除</em>和<em>查看</em>。点击<em>编辑</em>或文件名，会出现一个简单的编辑页面，您可用它进行文件属性的编辑；点击<em>永久删除</em>将从媒体库中删除该文件（同时，也会从所有包含它的文章中删除）；<em>查看</em>将带您到该文件的显示页面。</p><p>若某个多媒体文件未被加入任何文章，您将在这个文件的<em>附加到</em>栏看到一个<em>现在添加到文章</em>链接，点击它，将会弹出一个新的窗口，您可搜索一篇文章并将其加入。</p><p><strong>更多信息：</strong></p><p><a href="http://codex.wordpress.org/Media_Library_SubPanel" target="_blank">关于媒体库的文档</a></p><p><a href="http://wordpress.org/support/" target="_blank">支持论坛</a></p></div>

	</div>

<div id="screen-meta-links">
<div id="contextual-help-link-wrap" class="hide-if-no-js screen-meta-toggle">
<a href="#contextual-help" id="contextual-help-link" class="show-settings">帮助</a>
</div>
<div id="screen-options-link-wrap" class="hide-if-no-js screen-meta-toggle">
<a href="#screen-options" id="show-settings-link" class="show-settings">显示选项</a>
</div>
</div>
</div>

<div class="wrap">
	<div id="icon-upload" class="icon32"><br /></div>
<h2>

管理视角-${vc.name}
<a href="page.action?comicId=${page.comicId}&chapterId=${page.chapterId}" class="button add-new-h2">返回</a>
<a href="vcomic_view_show.action?pageId=${page.id}" class="button add-new-h2">模拟查看</a>

</h2>



<br class="clear"/>
<ul class='subsubsub'>
<li>当前第 ${page.position} 页</li>
    <li><a href="shot.action?pageId=${pageNext.id}">下一页(${pageNext.position})</a></li>
     
 
</ul>

<form id="posts-filter" action="" method="get">



	<div class="tablenav top">
<br class="clear" />
	</div>
<table class="wp-list-table widefat fixed media" cellspacing="0">
	<thead>
	<tr>
		<th width="510">图片<a class='submitdelete' onclick='return showNotice.warn();' href='vcomic_thumb_remove.action?pageId=${page.id}'>删除图片缓存</a></th>
		<th><span>视角列表</span></th>	</tr>

	</thead>



	<tbody id="the-list">
   
			<tr valign="top">
		<td>
<div id="viewjsp_layout">			
          <img id="target" src="
 ../uploadimg/comic/${page.picture}" <c:if test="${page.width>500}">width="500"</c:if><c:if test="${page.width<=500}">width="${page.width}"</c:if> />
</div>
		  <br/></td>
		<td>
        

     
      <label><input type="hidden" size="4" id="page_id" name="page_id" value="${page.id}" /></label>
			<label> <input type="hidden" size="4" id="x1" name="x1" /></label>
			<label> <input type="hidden" size="4" id="y1" name="y1" /></label>
			<label> <input type="hidden" size="4" id="x2" name="x2" /></label>
			<label><input type="hidden" size="4" id="y2" name="y2" /></label>
			<label> <input type="hidden" size="4" id="w1" name="w" /></label>
			<label> <input type="hidden" size="4" id="h1" name="h" /></label>
   
      
		
        <div>
  <div class="list_button"><input type="button" onclick="addView()" value="增加选框到列表" /> <input type="button" value="保存列表" onclick="saveViewList();" />
         <input type="button" value="播放" onclick="playView();" />
         <input type="button" value="停止" onclick="stopView();" />
         <input type="button" value="显示全部" onclick="showAllView()" onmouseout="removeAllView()"/>
         
         <!--<input type="button" value="auto" onclick="autoView()"/>-->
         </div>
    <ul id="shots">
            	
            </ul>
        
    </div>

		  
		  </td>
		</tr>

	</tbody>
  
</table>
  
	<div class="tablenav bottom">
<!--
		<div class="alignleft actions">
			<select name='action2'>
<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>永久删除</option>

</select>
<input type="submit" name="" id="doaction2" class="button-secondary action" value="应用"  />
		</div>
     -->   
		<div class="alignleft actions">
		</div>
		<br class="clear" />
	</div>

<div id="ajax-response"></div>
	<div id="find-posts" class="find-box" style="display:none;">
		<div id="find-posts-head" class="find-box-head">查找文章或页面</div>
		<div class="find-box-inside">
			<div class="find-box-search">

				
				<input type="hidden" name="affected" id="affected" value="" />
				<input type="hidden" id="_ajax_nonce" name="_ajax_nonce" value="5aaecf5d95" />				<label class="screen-reader-text" for="find-posts-input">搜索</label>
				<input type="text" id="find-posts-input" name="ps" value="" />
				<input type="button" id="find-posts-search" value="搜索" class="button" /><br />

								<input type="radio" name="find-posts-what" id="find-posts-post" value="post"  checked='checked' />
				<label for="find-posts-post">文章</label>
								<input type="radio" name="find-posts-what" id="find-posts-page" value="page"  />

				<label for="find-posts-page">页面</label>
							</div>
			<div id="find-posts-response"></div>
		</div>
		<div class="find-box-buttons">
			<input id="find-posts-close" type="button" class="button alignleft" value="关闭" />
			<input type="submit" name="find-posts-submit" id="find-posts-submit" class="button-primary alignright" value="选择"  />		</div>
	</div>

<br class="clear" />

</form>
</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->
</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
