<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>漫画包 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>

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

漫画包管理
<a href="comic.action" class="button add-new-h2">返回漫画列表</a>


</h2>
<ul class='subsubsub'>
<li class='all'>平台:</li>
	<li class='all'><a href='#' onclick="Filter.remove('id')" class="">全部<span class="count"></span></a> |</li>

<c:forEach items="${listPlatform}" var="platform">    
    
	<li class='image'><a href="#" onclick="Filter.add('id',${platform.id})"><span class="count">${platform.name}</span></a> |</li>
</c:forEach>

</ul>
<br class="clear"/>
<ul class='subsubsub'>
<li class='all'>状态:</li>
	<li class='all'><a href='#' onclick="Filter.remove('chargeable')" class="">全部 <span class="count"></span></a> |</li>
	<li class='image'><a href="#" onclick="Filter.add('chargeable',false)">请求中 <span class="count"></span></a> |</li>

	<li class='detached'><a href="#" onclick="Filter.add('chargeable',true)">已完成 <span class="count"></span></a></li>
</ul>
<br class="clear"/>
<c:if test="${param.comicId!=null}">
<a href="comic_package_new.action?id=${param.comicId}">创建漫画包</a>
</c:if>

<form id="posts-filter" action="vcomic_import.action" method="get">
<input type="hidden"  name="menuId" value="${article.menuId}" />	<div class="tablenav top">
<!--
		<div class="alignleft actions">
			<select name='action'>
<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>永久删除</option>
</select>
<input type="submit" name="" id="doaction" class="button-secondary action" value="应用"  />
		</div>
        -->
		<div class="alignleft actions">
		<!--<select name='m' id="action1">

			<option selected='selected' value='article.action?menuId=${article.menuId}'>全部</option>
			<option  value='article.action?recommend=true&menuId=${article.menuId}'>编辑推荐</option>
<option  value='article.action?recommend=false&menuId=${article.menuId}'>编辑未推荐</option>
		</select>
<input type="button" name="" id="post-query-submit" class="button-secondary" value="过滤" onclick="location.href=$('#action1').val()" />	-->	</div>

<jsp:include page="include/page1.jsp"></jsp:include>


		<br class="clear" />
	</div>
<table class="wp-list-table widefat fixed media" cellspacing="0">
	<thead>
	<tr>
		<th scope='col' id='cb' class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp" /></th>
		<th>漫画名</th>
		<th>平台类型</th>
		<th width="200"><span>状态</span></th>
        <th >请求时间</th>
		<th >完成时间</th>
		<!--		<th scope='col' id='date' class=''  style="">发布时间</th>	</tr>-->

	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp" /></th>
		<th scope='col'  class=''  style="">漫画名</th>
		<th scope='col'  class=''  style="">平台类型</th><th scope='col'  class=''  style="">状态</th>
		<th>请求时间</th>
		<th scope='col'  class=''  style="">完成时间</th>
		<!--<th scope='col'  class='manage-column column-date sortable asc'  style="">发布时间</th>-->	</tr>
        
	</tfoot>

	<tbody id="the-list">
    
<c:forEach items="${listpkg}" var="pkg">
<tr id='post-1658' class='alternate author-self status-inherit' valign="top">
		<th scope="row" class="check-column"><input type="checkbox" name="ids" value="${vc.id}" class="ckb" /></th>
		<td class="column-icon">${pkg.comic.name}</td>
		<td class="column-icon">
        <c:forEach items="${listPlatform}" var="platform">  
        <c:if test="${pkg.platformId==platform.id}">${platform.name}</c:if>
        </c:forEach>
       
		</td>
		<td class='title column-title'><strong><a>
        <c:if test="${pkg.status==1}">请求创建中</c:if>
        <c:if test="${pkg.status==2}">创建完成</c:if>
        </a></strong>
		  
		  <p>
  </p>
  <div class="row-actions"><span class='edit'><a onclick='return showNotice.warn();'  class='submitdelete' href="comic_package_do.action?id=${pkg.id}&action=delete">删除</a>  | </span>
  <c:if test="${pkg.fileName!=null}">
 <a href="../uploadpkg/${pkg.fileName}">下载</a> 
 </c:if>
 <a href="comic_package_source.action?id=${pkg.id}">发布</a> 
</div>		</td>
		<td>${pkg.createtime}</td>
		<td >${pkg.uploadtime}</td>
		<!--<td class='date column-date'>${article.pubTime}	</td>-->        </tr>
 </c:forEach>
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
<jsp:include page="include/page2.jsp"></jsp:include>
		<br class="clear" />
	</div>

<div id="ajax-response"></div>
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
