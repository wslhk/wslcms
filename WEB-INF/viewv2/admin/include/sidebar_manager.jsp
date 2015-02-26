<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="sidebar">
		<ul class="sidenav">
			
            <sec:authorize ifAllGranted="ROLE_MANAGER">
            
            <li  ><a href="manager.action">管理员</a></li>
           
           <li>
           <a href="config_item.action" class="current">包配置</a>
           </li>
           
           <li>
           <a href="config_item_domain.action" class="current">全局配置</a>
           </li>
          
            </sec:authorize>
            <sec:authorize ifAllGranted="ROLE_ADMIN">
             <li  ><a href="manager.action">管理员</a></li>
		<li id="snav_dc" class=""><a href="platform.action">平台</a></li>
        <li>
           <a href="platform_pkg.action" class="current">平台可用包</a>
           </li>
			<li id="snav_man" class=""><a href="platform_pkg.action">平台可用包</a></li>
			<li id="snav_set" class=""><a href="domain.action">内容商管理</a></li>
			<li id="snav_down" class=""><a href="role.action">权限管理</a></li>
            <li id="snav_down" class=""><a href="config.action">可用参数设置</a></li>
            </sec:authorize>
            <!---->
		</ul>
	</div>