<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><ul id="adminmenu">
	<li class="wp-first-item wp-has-submenu wp-has-current-submenu wp-menu-open menu-top menu-top-first menu-icon-dashboard menu-top-last" id="menu-dashboard">

	<div class='wp-menu-image'><a><br /></a></div><div class="wp-menu-toggle"><br /></div><a class="wp-first-item wp-has-submenu wp-has-current-submenu wp-menu-open menu-top menu-top-first menu-icon-dashboard menu-top-last" tabindex="1">系统设置</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>控制板</div>
    <ul>
    <li class="wp-first-item"><a href='index.action' class="wp-first-item" tabindex="1">控制板</a></li>
   
    </ul>
    </div>
    
    </li>
	<li class="wp-menu-separator"><a class="separator" href="../../include_page/?unfoldmenu=1"><br /></a></li>
	<li class="wp-has-submenu menu-top menu-icon-post menu-top-first" id="menu-posts">
    
	<div class='wp-menu-image'><a><br /></a></div><div class="wp-menu-toggle"><br /></div>
	<a class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" tabindex="1">内容管理V2</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>文章</div><ul>
    <li class="wp-first-item"><a href='comic.action' class="wp-first-item" tabindex="2">漫画</a></li>
   
    <li class="wp-first-item"><a href='ad.action?type=1' class="wp-first-item" tabindex="2">闪屏</a></li>
    </ul></div></li>
    <!--
    <li class="wp-has-submenu menu-top menu-icon-post menu-top-first" id="menu-posts">
    
	<div class='wp-menu-image'><a><br /></a></div><div class="wp-menu-toggle"><br /></div>
	<a class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" tabindex="1">内容审核</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>文章</div><ul>
   
   
    <li class="wp-first-item"><a class="wp-first-item" href='vcomiccheck.action' tabindex="1">审核版权</a></li>
     <li><a href='vcomiccheck_chapter.action' tabindex="1">章节审核</a></li>
    </ul></div></li>
    -->
    <li class="wp-has-submenu menu-top menu-icon-media menu-top-last" id="menu-posts">
    
	<div class='wp-menu-image'><a><br /></a></div><div class="wp-menu-toggle"><br /></div>
	<a class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" tabindex="1">资源管理</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>文章</div><ul>
    <li class="wp-first-item"><a href='media.action' class="wp-first-item" tabindex="1">多媒体素材</a></li>
      
    </ul></div></li>
<!--
	<li class="wp-has-submenu menu-icon-comments menu-top-last" id="menu-comments">
	<div class='wp-menu-image'><a href='../../include_page/edit-comments.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a class="menu-top menu-icon-comments menu-top-last" tabindex="1">营销管理 <span id='awaiting-mod' class='count-0'><span class='pending-count'>0</span></span></a>
    <div class='wp-submenu'><div class='wp-submenu-head'>评论和反馈</div>
    <ul>
     <li><a href='ad.action?type=2'>初始页广告</a></li>
     <li><a href='news.action' tabindex="1">首页新闻</a></li>
       <li><a href='message.action'>消息盒子</a></li>

  
    <li><a href='ad.action?type=1'>应用推荐</a></li>
    <li><a href='ad.action?type=3'>壁纸推广位</a></li>
     
    
    </ul>
    
    </div>
    </li>
    -->

<li class="wp-menu-separator"><a class="separator" href="../../include_page/?unfoldmenu=1"><br /></a></li>

<sec:authorize ifAllGranted="ROLE_MANAGER">
	
    
    <li class="wp-has-submenu menu-top menu-icon-settings menu-top-last" id="menu-posts">
    
	<div class='wp-menu-image'><a><br /></a></div><div class="wp-menu-toggle"><br /></div>
	<a class="wp-has-submenu open-if-no-js menu-top menu-icon-post menu-top-first" tabindex="1"><span class="wp-has-submenu menu-top menu-icon-settings menu-top-last">管理/设置</span></a>
	<div class='wp-submenu'><div class='wp-submenu-head'>文章</div><ul>
   <li><a href='manager.action' tabindex="3">管理员2</a></li>
      
        <li><a href='platform_pkg.action' tabindex="4">平台可用包</a></li>
   
    
    </ul></div></li>
</sec:authorize>

<sec:authorize ifAllGranted="ROLE_ADMIN">
	<li class="wp-has-submenu menu-top menu-icon-settings menu-top-last " id="menu-appearance">
	<div class='wp-menu-image'><a href='../../include_page/themes.php'><br /></a></div><div class="wp-menu-toggle"><br /></div>
	<a class="wp-has-submenu menu-top menu-icon-appearance menu-top-first" tabindex="1">高级</a>
	<div class='wp-submenu'>
    <div class='wp-submenu-head'>外观</div>
    <ul>
    <li class="wp-first-item"><a href='domain.action' tabindex="1">内容商管理</a></li>
        <li><a href='role.action' tabindex="2">权限编辑</a></li>
        <li><a href='manager.action' tabindex="3">管理员</a></li>
        <li><a href='platform.action' tabindex="4">平台</a></li>
        <li><a href='platform_pkg.action' tabindex="4">平台可用包</a></li>
        
    
    
    </ul>
    </div>
    </li>
</sec:authorize>
  <!--
	<li class="wp-has-submenu menu-top menu-icon-tools" id="menu-tools">
	<div class='wp-menu-image'><a href='tools.php'><br /></a></div><div class="wp-menu-toggle"><br /></div><a href='tools.php' class="wp-has-submenu menu-top menu-icon-tools" tabindex="1">工具</a>
	<div class='wp-submenu'><div class='wp-submenu-head'>工具</div><ul><li class="wp-first-item"><a href='tools.php' class="wp-first-item" tabindex="1">工具</a></li><li><a href='import.php' tabindex="1">导入</a></li><li><a href='export.php' tabindex="1">导出</a></li></ul></div></li>
    -->

<li class="wp-menu-separator-last"><a class="separator" href="../../include_page/?unfoldmenu=1"><br /></a></li></ul>