<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="../include_page/jstl.jsp"%><!DOCTYPE HTML>
<html><head>
    <meta charset="utf-8">
    <title>管理应用 - 漫画数字单行本综合管理平台（CCAPS</title>
<jsp:include page="include/head_script.jsp"></jsp:include>
<script src="../js/frame_select.js"></script>
<script type="text/javascript" src="http://webplayer.yahooapis.com/player.js"></script>
<script>


$().ready(function(){
	var picture='${vpage.picture}';
	if(picture!=''){
		var currentImg=new Image();
		currentImg.src = '../uploadimg/comic/${vpage.picture}';

		 if(currentImg.complete){
	//window.alert('图片加载完成');
		//img=o;
		  }else{
			currentImg.onload = function(){
	
			//  window.alert('图片加载中:'+currentImg.src+'  '+currentImg.width);
			  //初始化数据
			 // loadImage(currentImg.src);
	
			};
			currentImg.onerror = function(){
	
			  window.alert('图片加载失败:'+currentImg.src);
	
			};
		  }
	}
	  

var spans=$('span.viewicon');
for(var i=0;i<spans.length;i++){
	updateFrameView(spans.eq(i),currentImg);
}
});

function updateFrameView(span,currentImg){
	var img=span.children('img');
	w=span.attr('w');
	h=span.attr('h');
	x=span.attr('x');
	y=span.attr('y');
	//alert('<<<'+y);
	//var imgs=loadImage(img.attr('src'));
	//alert(loadImage(img.attr('src')).width);
	//imgs.src=img.attr('src');
	img_width=currentImg.width;

	var tbiliw=w/200;
	var tbilih=h/200;
	var tbili=tbiliw>tbilih?tbiliw:tbilih;
			//alert(tbili+'->'+viewjson.listView[i].w);
			//alert(tbili+"<<"+y);
			twidth=Math.round(w/tbili);
			theight=Math.round(h/tbili);
			tleft=-Math.round(x/tbili);
			ttop=-Math.round(y/tbili);
			iwidth=Math.round(img_width/tbili);
			//iheight=Math.round(h);
		span.css('width',twidth);
		span.css('height',theight);
		span.css('overflow','hidden');
		span.css('display','block');
		//overflow
		img.attr('width',iwidth);
		
		//alert(tleft);
		img.attr('style','margin-left:'+tleft+'px; margin-top:'+ttop+'px;max-height:none;max-width:none');
		//img.css({'margin-left:':tleft+'px'});
			//height=listview[i]/tbili
			/*html+='<li listid="'+i+'">\
			<span class="viewiconout">\
				<span class="viewicon" style="width:'+twidth+'px;height:'+theight+'px;">\
					<img width="'+iwidth+'" src="'+img.src+'"  style="margin-left:'+tleft+'px; margin-top:'+ttop+'px;"/>\
				</span>\
			</span>*/	
	
}

 //图片加载
 /* function loadImage(url){
      var o= new Image();
      o.src = url;
      if(o.complete){
window.alert('图片加载完成:'+o.src+'  '+o.width);
	//img=o;
	currentImg= o;
      }else{
        o.onload = function(){

          window.alert('图片加载中:'+url+'  '+o.width);
		  //初始化数据
		 // return loadImage(url);

        };
        o.onerror = function(){

          window.alert('图片加载失败:'+url);

        };
      }
	 // currentImg= o;
  }*/
</script>
<style>
/*特效选择*/
#effect_select_div{
	 position:fixed;
	 background:#FFF; 
	 width:500px; 
	 height:300px;
	 top:30%;
	 left:30%;
	 z-index:999;
	  padding-top:20px; border:1px solid;
}
#effect_select_div .close_btn{ width:15px; height:15px; position:absolute; right:2px; top:2px; border:1px solid;}

#effect_select_div ul,#effect_select_div li{ list-style:none; padding:0; margin:0; display:inherit;}
#effect_select_div ul{ clear:both; display:block;}
#effect_select_div li{ line-height:20px; border:1px solid; padding:3px; display:inline-block;
margin:1px; cursor:pointer;}
td span{ display:block; background:#ccc; width:100%; height:30px;;}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"><jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">效果</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
            <form id="posts-filter" action="frame_do.action" method="post">
  <table  class="datatable totaltable" width="100%" cellspacing="0">
	<thead>
	<tr>
		<th ><input type="checkbox" /></th>
        <th >缩略图/标题</th>
		<th >类型</th>
		<th >gif图片</th>
		<!--<th>背景声音</th>-->
		<th>音效</th>
		<th>特效</th>
		<!--<th scope='col' id='comments' class='manage-column num sortable desc'  style="">切换效果</th>-->
		<th scope='col' id='comments' class='manage-column num sortable desc'  style="">片头视频</th>
			</tr>

	</thead>
	<tbody id="the-list">
	  
	  
	  </tbody>
	<tbody id="the-list-view">
    <c:forEach items="${listframeView}" var="frame">
			<tr id='post-1658' class='alternate author-self status-inherit' valign="top">
		<th>
        <input type="hidden" name="pageId" value="${frame.pageId}" />
        <input type="hidden" name="chapterId" value="${frame.chapterId}" />
        <input type="hidden" name="comicId" value="${frame.comicId}" />
		  <input type="hidden" name="id" value="${frame.id}" /></th>
		<td width="200">				
        缩略图
        <span class="viewicon" style="width:200px;height:200px;" x='${frame.x}' y='${frame.y}' w='${frame.w}' h='${frame.h}'>
			<img src="../uploadimg/comic/${vpage.picture}" class="imgView"/>
			</span>
             
       
		 </td>
		<td>分镜头
</td>
		<td>
          
          <span class="mediaSelect">${frame.mediaGif.title}</span>
		  <input name="gifId" type="hidden"  value="${frame.gifId}">
		  </td>
		<!--<td><span class="mediaSelect">${frame.mediaMusic.title}</span>
		  <input name="musicId" type="hidden"  value="${frame.musicId}">
		  
		  </td>-->
		<td>
       
        <span class="mediaSelect">${frame.mediaSound.title}</span>
      
        <input name="soundId"  type="hidden"  value="${frame.soundId}"></td>
		<td>
       
        <span class="effectSelect">${frame.effect.title}</span>
       
        <input name="effectId"  type="hidden" value="${frame.effectId}"></td>
		
		<td >
        
        <span class="mediaSelect">${frame.mediaVideo.title}</span>
        
        <input name="videoId" type="hidden" value="${frame.videoId}">
        </td>
			
		</tr>
</c:forEach>

	</tbody>
</table>
</form>
<div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
       
 		
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
