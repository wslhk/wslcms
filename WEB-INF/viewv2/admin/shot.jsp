<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
<jsp:include page="include/head_script.jsp"></jsp:include>
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
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">分镜头</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll"><table class="wp-list-table widefat fixed media" cellspacing="0">
	<thead>
	<tr>
		<th width="510">图片<a class='submitdelete' onclick='return showNotice.warn();' href='vcomic_thumb_remove.action?pageId=${page.id}'>删除图片缓存</a> <a href="shot.action?pageId=${pageNext.id}">下一页(${pageNext.position})</a></th>
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
  
</table><div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
       
       
             

<a href="page.action?chapterId=${page.chapterId}" class="btn nextone saveBtn">返回</a>		
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
