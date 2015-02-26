<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>图片编辑 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>
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


function scriptAdd(obj,comicId,chapterId,pageId,shotId){
	if($(obj).parent('.scriptNew').children('.scritpNewDiv').length>0){
	return;	
	}
	//alert('1111');
	var carrentobj=$(obj);
	//carrentobj.html('--');
	var html='<div class="scritpNewDiv"><from><input type="hidden" name="action" value="save"/><input type="hidden" name="comicId" value="'+comicId+'"/><input type="hidden" name="chapterId" value="'+chapterId+'"/><input type="hidden" name="pageId" value="'+pageId+'"/><input type="hidden" name="shotId" value="'+shotId+'"/><select name="language"><option value="1">中文</option><option value="2">英语</option></select><select name="sex"><option value="1">男</option><option value="2">女</option></select><input type="input" name="line"/><input type="button" value="保存" onClick="saveScript(this)"/></form></div>';
	carrentobj.parent().append(html);
}
function deleteScript(obj){
	var currentobj=$(obj);
	var formobj=currentobj.parent();
	//alert(formobj.children('input[name=comicId]').val());
	var id=formobj.children('input[name=id]').val();
	var shotId=formobj.children('input[name=shotId]').val();
	
	var action='delete';
	datevar='action='+action
	+'&id='+id;
	$.ajax({
		   type: "POST",
		   url: "script_do.action",
		   data: datevar+'&'+Math.random(),
		   dataType:'json',
		   success: function(msg){
			   if(msg.success==true){
				   getScripts(obj,shotId);
				  // $('#operationlogdev').remove();
				  // alert('保存成功!');
				   //OperationLog.createForm=function(,type,comicid,chapterid);
				   //$('#operationlogdev').remove()
			   }
			 //alert( "Data Saved: " + msg );
		   }
		}); 
}
function saveScript(obj){
	var currentobj=$(obj);
	var formobj=currentobj.parent();
	//alert(formobj.children('input[name=comicId]').val());
	var comicId=formobj.children('input[name=comicId]').val();
	var chapterId=formobj.children('input[name=chapterId]').val();
	var pageId=formobj.children('input[name=pageId]').val();
	var shotId=formobj.children('input[name=shotId]').val();
	
	var sex=formobj.children('select[name=sex]').val();
	
	var language=formobj.children('select[name=language]').val();
	var line=formobj.children('input[name=line]').val();
	var action=formobj.children('input[name=action]').val();
	var id=formobj.children('input[name=id]').val();
	
	datevar='action='+action
	+'&comicId='+comicId
	+'&chapterId='+chapterId
	+'&pageId='+pageId
	+'&shotId='+shotId
	+'&sex='+sex
	+'&language='+language
	+'&line='+line
	+'';
	if(id!=null){
		datevar+='&id='+id;
	}
	//encodeURIComponent
	//alert(datevar);
	//保存
	$.ajax({
		   type: "POST",
		   url: "script_do.action",
		   data: datevar+'&'+Math.random(),
		   dataType:'json',
		   success: function(msg){
			   if(msg.success==true){
				   getScripts(obj,shotId);
				  // $('#operationlogdev').remove();
				  // alert('保存成功!');
				   //OperationLog.createForm=function(,type,comicid,chapterid);
				   //$('#operationlogdev').remove()
			   }
			 //alert( "Data Saved: " + msg );
		   }
		}); 
}
//script_line_ajax.action

function getScripts(obj,shotId){
	
	var datevar='shotId='+shotId;
	$.ajax({
		   type: "GET",
		   url: "script_line_ajax.action",
		   data: datevar+'&'+Math.random(),
		   dataType:'json',
		   success: function(msg){
			   
			   var resulthtml="";
			  for(var i=0;i<msg.length;i++){
				  resulthtml+='<div><from><input type="hidden" name="action" value="edit"/><input type="hidden" name="id" value="'+msg[i].id+'"/><input type="hidden" name="comicId" value="'+msg[i].comicId+'"/><input type="hidden" name="chapterId" value="'+msg[i].chapterId+'"/><input type="hidden" name="pageId" value="'+msg[i].pageId+'"/><input type="hidden" name="shotId" value="'+msg[i].shotId+'"/><select name="language"><option value="1" '+(msg[i].language==1?'selected':'')+'>中文</option><option value="2" '+(msg[i].language==2?'selected':'')+'>英语</option></select><select name="sex"><option value="1" '+(msg[i].sex==1?'selected':'')+'>男</option><option value="2" '+(msg[i].sex==2?'selected':'')+'>女</option></select><input type="input" value="'+msg[i].line+'" name="line"/><input type="button" value="修改" onClick="saveScript(this)"/><input type="button" value="删除"  onclick="deleteScript(this);" /></form></div>';
				  
			  }
			 // alert(resulthtml);
			  // alert(msg);
			  $(obj).parents('td').find('.scriptList').html(resulthtml);
			   $(obj).parents('.scritpNewDiv').remove();
			//$(obj).parent().children('.scritpNewDiv').remove();
		   }
		}); 
}
 
 function updateFrameView(span,currentImg){
	var img=span.children('img');
	w=span.attr('w');
	h=span.attr('h');
	x=span.attr('x');
	y=span.attr('y');

	img_width=currentImg.width;

	var tbiliw=w/200;
	var tbilih=h/200;
	var tbili=tbiliw>tbilih?tbiliw:tbilih;

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

}
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
<body class="wp-admin no-js  media-php">


<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content">
  <div class="wrap">
	<div id="icon-upload" class="icon32"><br /></div>
<h2>

脚本/台词


</h2>


<ul class='subsubsub'>
	<li class='all'><a class="current">杂志管理<!-- <span class="count">(60)</span>--></a> &gt; </li>
  
    <li class='image'>特效管理</li>
<br class="clear" />

<li>当前第 ${vpage.position} 页</li>
    <li><a href="frame.action?id=${vpageNext.id}">下一页(${vpageNext.position})</a></li>
    
</ul>

<form id="posts-filter" action="frame_do.action" method="post">

	<div class="tablenav top">


<jsp:include page="include/page1.jsp"></jsp:include>
<span class="title column-title">

</span> <br class="clear" />
	</div>
<table class="wp-list-table widefat  media" cellspacing="0">
	<thead>
	<tr>
		<th ><input type="checkbox" /></th>
        <th >缩略图/标题</th>
		<th >台词</th>
		<!--<th>背景声音</th>-->
		<!--<th scope='col' id='comments' class='manage-column num sortable desc'  style="">切换效果</th>-->		</tr>

	</thead>

	<tfoot>
	<tr>
		<th><input type="checkbox" /></th>
		<th>缩略图/标题</th>
		<th>台词</th>
		<!--<th>背景声音</th>-->
		<!--<th><span class="manage-column num sortable desc">切换效果</span></th>-->		</tr>
	</tfoot>

	<tbody id="the-list-view">
    <c:forEach items="${listShot}" var="frame">
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
		<td>
		 <div class="scriptList">
         <c:forEach items="${frame.scripts}" var="script">
         
         <div class="scriptItem"><from><input type="hidden" name="id" value="${script.id}"/><input type="hidden" name="action" value="edit"/><input type="hidden" name="comicId" value="${script.comicId}"/><input type="hidden" name="chapterId" value="${script.chapterId}"/><input type="hidden" name="pageId" value="${script.pageId}"/><input type="hidden" name="shotId" value="${script.shotId}"/><select name="language"><option value="1" <c:if test="${script.language==1}">selected</c:if>>中文</option><option value="2" <c:if test="${script.language==2}">selected</c:if>>英语</option></select><select name="sex"><option value="1" <c:if test="${script.sex==1}">selected</c:if>>男</option><option value="2" <c:if test="${script.sex==2}">selected</c:if>>女</option></select><input type="input" name="line" value="${script.line}"/><input type="button" value="修改" onClick="saveScript(this)"/><input type="button" onclick="deleteScript(this);" value="删除"/></div>
         </c:forEach>
          </div>
          
          
		  <div class="scriptNew"> 
          <a onclick="scriptAdd(this,${frame.comicId},${frame.chapterId},${frame.pageId},${frame.id});">增加台词</a>
          
          </div>
		  
		  </td>

		</tr>
</c:forEach>
<!--
	<tr id='post-1606' class='author-self status-inherit' valign="top">
	  <th scope="row" class="check-column"><input type="checkbox" name="media[]" value="1606" /></th>
	  <td class="column-icon media-icon">				<a href="http://phone.vistastory.com/vista/wp-admin/media.php?attachment_id=1606&amp;action=edit" title="编辑《25RELAXATION》">
	    <img width="42" height="60" src="http://phone.vistastory.com/vista/wp-content/uploads/2011/06/世2大.jpg" class="attachment-80x60" alt="25RELAXATION" title="25RELAXATION" />				</a>
	    
	    </td>
	  <td class='title column-title'><strong><a href="#" title="编辑《25RELAXATION》">图片一</a></strong>
	    <p>
	      
	      JPG			</p>
	    <div class="row-actions"><span class='edit'><a href="#">编辑</a> | </span><span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='#'>永久删除</a> | </span><span class='view'><a href="http://phone.vistastory.com/vista/?attachment_id=1606" title="查看"法式减压"" rel="permalink">查看</a></span></div>		</td>
	  <td class='author column-author'></td>
	  <td class='parent column-parent'>&nbsp;</td>
	  <td class="comments column-comments num">&nbsp;</td>
	  
	  <td class="comments column-comments num">
	    <div class="post-com-count-wrapper">
	      <a href='http://phone.vistastory.com/vista/wp-admin/edit-comments.php?p=1606' title='0 待审中' class='post-com-count'><span class='comment-count'>0</span></a>			</div>
	    </td>
	  </tr>
      -->
	</tbody>
</table>
	<div class="tablenav bottom">

		<div class="alignleft actions">

<input type="submit" value="保存"  />
		</div>
    
		<div class="alignleft actions">
		</div>
<jsp:include page="include/page2.jsp"></jsp:include>
		<br class="clear" />
	</div>

<div id="ajax-response"></div>
	<div id="find-posts" class="find-box" style="display:none;">
		<div id="find-posts-head" class="find-box-head">查找文章或页面</div>
		<div class="find-box-inside">
			<div class="find-box-search">

				
				<input type="hidden" name="affected" id="affected" value="" />
				<input type="hidden" id="_ajax_nonce" name="_ajax_nonce" value="5aaecf5d95" />				<label class="screen-reader-text" for="find-posts-input">搜索</label>
				<input type="text" id="find-posts-input" name="ps" value="" />
				<input type="button" id="find-posts-search" value="搜索" class="button" /><br />

								<input type="radio" name="find-posts-what" id="find-posts-post" value="post"  checked='checked' />
				<label for="find-posts-post">文章</label>
								<input type="radio" name="find-posts-what" id="find-posts-page" value="page"  />

				<label for="find-posts-page">页面</label>
				</div>
			<div id="find-posts-response"></div>
		</div>
		<div class="find-box-buttons">
			<input id="find-posts-close" type="button" class="button alignleft" value="关闭" />
			<input type="submit" name="find-posts-submit" id="find-posts-submit" class="button-primary alignright" value="选择"  />		</div>
	</div>

<br class="clear" />

</form>
</div>


<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->

</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
