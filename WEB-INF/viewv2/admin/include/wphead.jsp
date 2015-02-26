<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div id="wphead">
<span id="header-logo" style="width:80px; height:30px; display:inline-block;"></span>

<h1 id="site-heading" >
	<a title="查看站点">
		<span id="site-title">漫画数字单行本综合管理平台（CCAPS）</span>

	</a>
</h1>


<div id="wphead-info">
<div id="user_info">
<p>欢迎您，<a href="#" title="编辑您的资料信息"><sec:authentication property="name"></sec:authentication> </a> | <a href="../j_spring_security_logout" title="登出">登出</a></p>
</div>
<!--
<div id="favorite-actions"><div id="favorite-first"><a href="post-new.php">添加新文章</a></div><div id="favorite-toggle"><br /></div><div id="favorite-inside"><div class='favorite-action'><a href='edit.php?post_status=draft'>草稿</a></div>

<div class='favorite-action'><a href='post-new.php?post_type=page'>添加新页面</a></div>
<div class='favorite-action'><a href='media-new.php'>上传</a></div>
<div class='favorite-action'><a href='edit-comments.php'>评论</a></div>
</div></div>
-->
</div>
</div>