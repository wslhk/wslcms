<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../../include_page/jstl.jsp"%>
<style>
#mainNav li.current a{ height:36px;}
</style>
<div id="header">
    <h1><a title="" href="#app" id="logo">漫画数字单行本综合管理平台</a></h1>
    <ul id="mainNav" class="nav">
        <li id="nav_manageapp"<c:if test="${param.nav==0}"> class="current"</c:if>><a href="comic.action">内容管理</a></li>
        <li id="nav_report" <c:if test="${param.nav==1}"> class="current"</c:if>><a href="report_new.action?mId=1" >数据</a></li>
        <li id="nav_info" <c:if test="${param.nav==2}"> class="current"</c:if>><a href="manager.action">系统设置</a></li>
    </ul>
	<div class="logout">
		<a id="logouttext" onclick="$('.logoutmain').slideToggle()"><span></span>账户</a>
		<div class="logoutmain">
			<p><em>开发者</em><span id="p_username" balance="0.00" revenue="0.00"><sec:authentication property="name"></sec:authentication></span></p>
			<div class="logout_btnwrap">
				<!--<a href="javascript:;" id="switching_account"><span></span>切换账户</a>-->
				<a id="logout" class="logout_exitsys" href="../j_spring_security_logout"><span></span>退出系统</a>
			</div>
		</div>
	</div>
</div>