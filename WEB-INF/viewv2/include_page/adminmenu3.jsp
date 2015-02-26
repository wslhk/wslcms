<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<ul id="adminmenu">
	<li class="wp-first-item wp-has-submenu wp-has-current-submenu wp-menu-open menu-top menu-top-first menu-icon-dashboard menu-top-last" id="menu-dashboard">

	<div class='wp-menu-image'><a href='index.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='index.php' class="wp-first-item wp-has-submenu wp-has-current-submenu wp-menu-open menu-top menu-top-first menu-icon-dashboard menu-top-last" tabindex="1">系统设置</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>控制板</div>
    <ul>
    <li class="wp-first-item current"><a href='index.php' class="wp-first-item current" tabindex="1">控制板</a></li>
    
  
    </ul>
    </div>
    
    </li>
	<li class="wp-menu-separator"><a class="separator" href="?unfoldmenu=1"><br /></a></li>
	<li class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" id="menu-posts">
    
	<div class='wp-menu-image'><a href='edit.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='edit.php' class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" tabindex="1">文章内容</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>文章</div><ul><li class="wp-first-item"><a href='edit.php' class="wp-first-item" tabindex="1">杂志管理</a></li>
    <li><a href='post-new.php' tabindex="1">漫画管理</a></li>
    <li><a href='edit-tags.php?taxonomy=category' tabindex="1">精彩图片</a></li>
    </ul></div></li>

<!--
	<li class="wp-has-submenu menu-top menu-icon-media" id="menu-media">
	<div class='wp-menu-image'><a href='upload.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='upload.php' class="wp-has-submenu menu-top menu-icon-media" tabindex="1">媒体</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>媒体</div><ul><li class="wp-first-item"><a href='upload.php' class="wp-first-item" tabindex="1">媒体库</a></li><li><a href='media-new.php' tabindex="1">添加多媒体文件</a></li></ul></div></li>
    -->
    <!--
	<li class="wp-has-submenu menu-top menu-icon-links" id="menu-links">
	<div class='wp-menu-image'><a href='link-manager.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='link-manager.php' class="wp-has-submenu menu-top menu-icon-links" tabindex="1">链接</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>链接</div><ul><li class="wp-first-item"><a href='link-manager.php' class="wp-first-item" tabindex="1">链接</a></li><li><a href='link-add.php' tabindex="1">添加新链接</a></li><li><a href='edit-tags.php?taxonomy=link_category' tabindex="1">链接分类目录</a></li></ul></div></li>
-->
	<li class="wp-has-submenu menu-top menu-icon-page" id="menu-pages">
	<div class='wp-menu-image'><a href='edit.php?post_type=page'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='edit.php?post_type=page' class="wp-has-submenu menu-top menu-icon-page" tabindex="1">页面</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>页面</div>
    <ul>
    <li class="wp-first-item"><a href='edit.php?post_type=page' class="wp-first-item" tabindex="1">页面</a></li>
    <li><a href='post-new.php?post_type=page' tabindex="1">添加新页面</a></li>
    </ul>
    
    </div></li>
    
	<li class="wp-has-submenu menu-icon-comments menu-top-last" id="menu-comments">
	<div class='wp-menu-image'><a href='edit-comments.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='edit-comments.php' class="menu-top menu-icon-comments menu-top-last" tabindex="1">评论和反馈 <span id='awaiting-mod' class='count-0'><span class='pending-count'>0</span></span></a>
    <div class='wp-submenu'><div class='wp-submenu-head'>评论和反馈</div>
    <ul>
    <li class="wp-first-item"><a href='edit.php?post_type=page' class="wp-first-item" tabindex="1">评论</a></li>
    <li><a href='post-new.php?post_type=page' tabindex="1">反馈</a></li>
    </ul>
    
    </div>
    </li>
	<li class="wp-menu-separator"><a class="separator" href="?unfoldmenu=1"><br /></a></li>

	<li class="wp-has-submenu menu-top menu-icon-appearance menu-top-first" id="menu-appearance">
	<div class='wp-menu-image'><a href='themes.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='themes.php' class="wp-has-submenu menu-top menu-icon-appearance menu-top-first" tabindex="1">统计信息</a>
	<div class='wp-submenu'>
    <div class='wp-submenu-head'>外观</div>
    <ul>
    <li class="wp-first-item"><a href='themes.php' class="wp-first-item" tabindex="1">主题</a></li>
    <li><a href='widgets.php' tabindex="1">小工具</a></li>
    <li><a href='nav-menus.php' tabindex="1">菜单</a></li>
    </ul>
    </div>
    </li>
    
	<li class="wp-has-submenu menu-top menu-icon-plugins" id="menu-plugins">
	<div class='wp-menu-image'><a href='plugins.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='plugins.php' class="wp-has-submenu menu-top menu-icon-plugins" tabindex="1">订单信息 <span class='update-plugins count-0'><span class='plugin-count'>0</span></span></a>

	<div class='wp-submenu'><div class='wp-submenu-head'>订单信息 <span class='update-plugins count-0'><span class='plugin-count'>0</span></span></div>
    <ul>
        <li class="wp-first-item"><a href='plugins.php' class="wp-first-item" tabindex="1">插件</a></li>
        <li><a href='plugin-install.php' tabindex="1">添加新插件</a></li>
        <li><a href='plugin-editor.php' tabindex="1">编辑</a></li>
    </ul>
    </div>
    </li>
	<li class="wp-has-submenu menu-top menu-icon-users" id="menu-users">
	<div class='wp-menu-image'><a href='users.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='users.php' class="wp-has-submenu menu-top menu-icon-users" tabindex="1">用户</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>用户</div><ul><li class="wp-first-item"><a href='users.php' class="wp-first-item" tabindex="1">用户</a></li><li><a href='user-new.php' tabindex="1">添加新用户</a></li><li><a href='profile.php' tabindex="1">我的资料</a></li></ul></div></li>
<!--
	<li class="wp-has-submenu menu-top menu-icon-tools" id="menu-tools">
	<div class='wp-menu-image'><a href='tools.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='tools.php' class="wp-has-submenu menu-top menu-icon-tools" tabindex="1">工具</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>工具</div><ul><li class="wp-first-item"><a href='tools.php' class="wp-first-item" tabindex="1">工具</a></li><li><a href='import.php' tabindex="1">导入</a></li><li><a href='export.php' tabindex="1">导出</a></li></ul></div></li>
    -->
	<li class="wp-has-submenu menu-top menu-icon-settings menu-top-last" id="menu-settings">
	<div class='wp-menu-image'><a href='options-general.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='options-general.php' class="wp-has-submenu menu-top menu-icon-settings menu-top-last" tabindex="1">设置</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>设置</div>
    <ul>
    <li class="wp-first-item"><a href='options-general.php' class="wp-first-item" tabindex="1">常规</a></li>
    <li><a href='#' tabindex="1">统计</a></li>
    <li><a href='#' tabindex="1">资费类型设置</a></li>
  <li><a href='#' tabindex="1">适配设备组设置</a></li>
  <li><a href='#' tabindex="1">漫画体裁设置</a></li>
  
</ul></div></li>

	<li class="wp-menu-separator-last"><a class="separator" href="?unfoldmenu=1"><br /></a></li></ul>