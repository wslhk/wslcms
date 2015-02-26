<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8" />
<title>漫画单行本平台</title>
<meta content="NOKIA 移动广告 开发者平台" name="keywords" />
<meta content="NOKIA 移动广告 开发者平台" name="description" />
<link rel="icon" type="images/Home.ico" href="images/Home.ico" />
<link rel="SHORTCUT ICON" href="images/Home.ico"/>
<link href="iaa/css/reset.css" rel="stylesheet" type="text/css"/>
<link href="iaa/css/common.css" rel="stylesheet" type="text/css"/>
<link href="iaa/css/modual.css" rel="stylesheet" type="text/css"/>
<!--[if IE]>
<script src="iaa/js/plugin/html5.js" ></script>
<![endif]-->
<script src="iaa/js/plugin/jquery.min.js" ></script>
<script src="iaa/js/iaa.js" ></script>
<link href="../css/plugin/jboxskin/jbox.css"  rel="stylesheet" type="text/css"/>
<script src="js/plugin/jquery.ajaxmanager.js" ></script>
<script src="js/plugin/jquery.json-2.2.min.js" ></script>
<script src="js/plugin/jquery.blockUI.js" ></script>
<script src="js/common/common.js" ></script>
<script src="js/plugin/jbox/jquery.jBox-2.3.min.js" ></script>
<script src="js/plugin/jbox/jquery.jBox-zh-CN.js" ></script>
<script src="js/plugin/jquery.cookie.js" ></script>
<script src="js/common/core.js" ></script>
<script src="js/plugin/pidcrypt_util.js" ></script>
<script src="js/lang/message_zh_CN.js" ></script>
<script src="js/login.js" ></script>
</head>
<body>
<header class="header">
	<div class="header_con">
		<h1 class="logo"><a href="javascript:;">移动广告平台</a></h1>
		<menu class="nav">
			<li><a class="cur">首 页</a></li>
			<li><a >产品介绍</a></li>
			<!-- <li><a href="iaa/suc_demo.html">成功案例</a></li> -->
			<li><a >帮助中心</a></li>
			<li><a >合作伙伴</a></li>
			<!--<li><a >SDK下载</a></li>-->
			<li class="bottom_line" style="left:0;width:81px;"></li>
		</menu>
		<!-- <p class="tp_nav"><a href="">联系代理商进行推广</a>|<a href="" target="_blank">注册开发者账户</a></p> -->
	</div>
</header>
<section class="main clearfix">
	<div class="login_box">
    <form name="loginform" id="loginform" action="../j_spring_security_check" method="post">
	  <label><span>用户名：</span><input type="text" name="j_username" id="user_login" class="input" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME']}" size="20" tabindex="10" /></label>
	  <label><span>密　码：</span><input type="password" name="j_password" id="user_pass" class="input" value="" size="20" tabindex="20" /></label>
	  <!-- <label class="rpwdbox"><input type="checkbox" value="" class="rememberpwd" id="rememberpwd">记住密码</label> -->
		<input type="submit" value="登陆" class="submit_btn" id="login">
		<!-- <p class="reg_text">还没有账号？<a href="javascript:;">立即注册</a></p> -->
        </form>
	</div>
	<div class="login_text">
		<ul id="login_ul">
			<li class="ad_client"><a href="javascript:;">
				<dl>
					<dt>行业解决方案</dt>
					<dd>应用模板企业品牌化定制,跨地域多用户协助，多收益方式并存、广告和收益监测，切实提高企业利润</dd>
					
				</dl>
				<!-- <h3>联系代理商进行推广</h3> -->
			</a><div class="layer"></div></li>
			<li class="developer"><a href="#"  style="cursor:pointer;">
				<dl>
					<dt>跨平台支持</dt>
					<dd>采用图形用户界面应用程序框架,共用一套内容源,支持Windows Phone 7/8、iOS多平台输出应用</dd>
					
				</dl>
				
				</a><div class="layer"></div></li>
			<li class="reseller"><a href="javascript:;"><dl>
					<dt>收益模式多样</dt>
					<dd>内容单次下载付费、预览后内支付、试用后购买、广告收益，多种收益模式可选</dd>
					
				</dl></a><div class="layer"></div></li>
			<li class="user"><a href="javascript:;"><dl>
					<dt>巨大的用户市场</dt>
					<dd>海量优质手机上网用户,享受阅读乐趣,精准的数据分析工具,提高客户收益</dd>
					
				</dl></a><div class="layer"></div></li>
		</ul>
	</div>
</section>
<jsp:include page="include/footer.jsp"></jsp:include>
</body>
</html>
