<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
<meta charset="utf-8">
    <title>漫画数字单行本综合管理平台（CCAPS</title>
    <jsp:include page="include/head_script.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">管理应用</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;">
			  <p>&nbsp;</p>
			  <p>welcome</p>
			</div>
			<div style="display:none;" id="batch" class="batch">
			  <ul>
					<li><a class="tit"><span class="icon"></span>批&nbsp;量</a></li>
					<li><a title="启动" value="ACTIVE" class="start"><span class="icon"></span>启动</a></li>
					<li><a title="暂停" value="PAUSED" class="suspend"><span class="icon"></span>暂停</a></li>
					<li><a title="删除" value="DELETED" class="delete"><span class="icon"></span>删除</a></li>
				</ul>
			</div>
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>





</body></html>
