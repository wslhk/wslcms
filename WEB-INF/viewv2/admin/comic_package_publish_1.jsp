<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"><jsp:param name="nav" value="0"></jsp:param></jsp:include>

  

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
				  <h3 class="m_subtit account_title">发布向导</h3>
                  <form method="post" action="comic_package_do.action" id="form_article" enctype="multipart/form-data"><input type="hidden" name="action" value="add" />
<input type="hidden" name="comicId" value="${comic.id}" />

<div class="media-single">
<div class='media-item'>
	
	<div class="media-single">
<div class=WordSection1 style='layout-grid:15.6pt'>

<p class=MsoNormal><span lang=EN-US style='color:blue'><strong>1. </strong></span><strong><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman";color:blue'>进入链接</span><span lang=EN-US style='color:blue'>
  <o:p></o:p>
</span></strong></p>

<p class=MsoNormal><u><span lang=EN-US style='color:blue'><a
href="https://dev.windowsphone.com/zh-cn/AppSubmission/Hub"><span
style='color:blue'>https://dev.windowsphone.com/zh-cn/AppSubmission/Hub</span></a></span></u><span
lang=EN-US> </span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><img border=0 width=554 height=425
src="../images/publish2/image002.gif" v:shapes="_x0000_i1025"><![endif]></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:0cm;text-indent:0cm;mso-list:l0 level1 lfo1'><![if !supportLists]><span
lang=EN-US style='mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'><strong>2、</strong></span></span><strong><![endif]><span style='font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>点击应用信息</span>
    <span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>（资源</span><span lang=EN-US>ID : 1</span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>）</span></strong></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>界面中只用处理</span> <span style='font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman";
color:red'>应用信息</span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>，其他默认即可，</span> <span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>如下所示：</span></p>

<p class=MsoNormal><span lang=EN-US><!--[if gte vml 1]><v:shape id="_x0000_i1026"
 type="#_x0000_t75" style='width:414.75pt;height:214.5pt;mso-wrap-style:square'>
 <v:imagedata src="../images/publish2/image003.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img border=0 width=553 height=286
src="../images/publish2/image004.gif" v:shapes="_x0000_i1026"><![endif]></span></p>

<p class=MsoNormal>${comic.name}</p>
<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>填入</span> <span style='font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman";
color:red'>资源表中</span><span lang=EN-US style='color:red'>ID</span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman";color:red'>为</span><span lang=EN-US style='color:red'>2 </span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>的</span> <span style='font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>应用名称，类别选择</span><span
lang=EN-US><span style='mso-spacerun:yes'>&nbsp; </span></span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman";color:red'>娱乐</span><span lang=EN-US style='color:red'>,<span
style='mso-spacerun:yes'>&nbsp; </span></span><span style='font-family:宋体;
mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>子类别为不可选状态，保存。</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal style='margin-left:0cm;text-indent:0cm;mso-list:l0 level1 lfo1'><![if !supportLists]><span
lang=EN-US style='mso-fareast-font-family:"Times New Roman"'><span
style='mso-list:Ignore'><strong>3、</strong></span></span><strong><![endif]><span style='font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>选择上传并描述你的</span><span
lang=EN-US>XAP</span></strong></p>

<p class=MsoNormal style='text-indent:21.0pt'><span lang=EN-US><!--[if gte vml 1]><v:shape
 id="_x0000_i1027" type="#_x0000_t75" style='width:414.75pt;height:228pt;
 mso-wrap-style:square'>
 <v:imagedata src="../images/publish2/image005.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img border=0 width=553 height=304
src="../images/publish2/image006.gif" v:shapes="_x0000_i1027"><![endif]></span></p>

<p class=MsoNormal style='text-indent:21.0pt'><span lang=EN-US><o:p>&nbsp;</o:p></span>
<a href="../uploadpkg/${pkg.fileName}">文件包</a>
</p>

<p class=MsoNormal style='text-indent:21.0pt'><span style='font-family:宋体;
mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>选择浏览，找到资源</span><span
lang=EN-US>ID=3</span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>的</span><span lang=EN-US> xap</span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>包</span><span lang=EN-US>, </span><span style='font-family:
宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:"Times New Roman"'>等待上传完成，之后会自动从</span><span
lang=EN-US>xap</span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>包里分析出漫画包的一些信息。</span></p>

<p class=MsoNormal style='text-indent:21.0pt'><span lang=EN-US><!--[if gte vml 1]><v:shape
 id="_x0000_i1028" type="#_x0000_t75" style='width:415.5pt;height:237pt;
 mso-wrap-style:square'>
 <v:imagedata src="../images/publish2/image007.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img border=0 width=554 height=316
src="../images/publish2/image008.gif" v:shapes="_x0000_i1028"><![endif]></span></p>

<p class=MsoNormal>v1.0.0.${pkg.id}</p>
<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>其中版本号是需要手动填入的，在资源表中查找</span><span
lang=EN-US>ID=4</span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>的项填入。</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><!--[if gte vml 1]><v:shape id="_x0000_i1029"
 type="#_x0000_t75" style='width:415.5pt;height:293.25pt;mso-wrap-style:square'>
 <v:imagedata src="../images/publish2/image009.png" o:title=""/>
</v:shape><![endif]--><![if !vml]><img border=0 width=554 height=391
src="../images/publish2/image010.gif" v:shapes="_x0000_i1029"><![endif]></span></p>

<p class=MsoNormal>${comic.intro}</p>
<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>在资源表中找到</span><span lang=EN-US>ID=5 </span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>的项，填入应用商店说明，</span><span lang=EN-US> ID=6</span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>的项，填入</span> <span style='font-family:宋体;mso-ascii-font-family:
"Times New Roman";mso-hansi-font-family:"Times New Roman"'>指定关键词，每行</span><span
lang=EN-US>1</span><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";

mso-hansi-font-family:"Times New Roman"'>个单词</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>下面需要上传一些图片，</span></p>

<p class=MsoNormal><img border=0 width=472 height=139
src="../images/publish2/image012.gif" v:shapes="_x0000_i1030"></p>

<p class=MsoNormal><span lang=EN-US>
</v:shape><![endif]--><![if !vml]><img border=0 width=553 height=345
src="../images/publish2/image014.gif" v:shapes="_x0000_i1031"><![endif]></span></p>

<p class=MsoNormal><img src="../uploadimg/comic/${comic.icon}" /></p>
<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>找到资源表</span><span lang=EN-US>ID=7</span><span
style='font-family:宋体;mso-ascii-font-family:"Times New Roman";mso-hansi-font-family:
"Times New Roman"'>的图标，上传到应用磁贴图标，</span></p>

<p class=MsoNormal>找到资源表ID=8的图标，上传到应用截屏</p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span style='font-family:宋体;mso-ascii-font-family:"Times New Roman";
mso-hansi-font-family:"Times New Roman"'>点击保存，界面自动返回，提交即可！</span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

<p class=MsoNormal><span lang=EN-US><o:p>&nbsp;</o:p></span></p>

</div>
</div>
</div>
</div>

<p class="submit">

<a href="comic_package_source.action?id=${param.id}" class="btn nextone saveBtn">返回资源</a>
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
