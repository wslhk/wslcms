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


function scriptAdd(obj,comicId,chapterId,pageId,shotId){
	if($(obj).parent('.scriptNew').children('.scritpNewDiv').length>0){
	return;	
	}
	//alert('1111');
	var carrentobj=$(obj);
	//carrentobj.html('--');
	var html='<div class="scritpNewDiv"><from><input type="hidden" name="action" value="save"/><input type="hidden" name="comicId" value="'+comicId+'"/><input type="hidden" name="chapterId" value="'+chapterId+'"/><input type="hidden" name="pageId" value="'+pageId+'"/><input type="hidden" name="shotId" value="'+shotId+'"/><select name="language"><option value="1">中文</option><option value="2">英语</option></select><select name="sex"><option value="1">男</option><option value="2">女</option></select><input type="text" name="line"/><input type="button" value="保存" onClick="saveScript(this)"/></form></div>';
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
				  resulthtml+='<div><from><input type="hidden" name="action" value="edit"/><input type="hidden" name="id" value="'+msg[i].id+'"/><input type="hidden" name="comicId" value="'+msg[i].comicId+'"/><input type="hidden" name="chapterId" value="'+msg[i].chapterId+'"/><input type="hidden" name="pageId" value="'+msg[i].pageId+'"/><input type="hidden" name="shotId" value="'+msg[i].shotId+'"/><select name="language"><option value="1" '+(msg[i].language==1?'selected':'')+'>中文</option><option value="2" '+(msg[i].language==2?'selected':'')+'>英语</option></select><select name="sex"><option value="1" '+(msg[i].sex==1?'selected':'')+'>男</option><option value="2" '+(msg[i].sex==2?'selected':'')+'>女</option></select><input type="text" value="'+msg[i].line+'" name="line"/><input type="button" value="修改" onClick="saveScript(this)"/><input type="button" value="删除"  onclick="deleteScript(this);" /></form></div>';
				  
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
input{ border:1px #999 solid;}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
    <div class="main">
		<div class="local">
			<p class="m_tit">台词</p>
		</div>
		
		<div style="padding:10px 0;" class="m_cont clearfix">
        
			<div id="datatableDiv" class="datatable_con" style="display: block;"><div class="dataTables_wrapper" id="AppList_wrapper"><div id="AppList_length" class="dataTables_length"><label>显示 <select name="AppList_length" size="1"><option value="10" selected="selected">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> 条数据</label></div><div class="dataTables_scroll">
  <table class="wp-list-table widefat  media" cellspacing="0" width="100%;">
	<thead>
	<tr>
		<th >缩略图/标题</th>
		<th >台词</th>
		<!--<th>背景声音</th>-->
		<!--<th scope='col' id='comments' class='manage-column num sortable desc'  style="">切换效果</th>-->		</tr>

	</thead>
	<tbody id="the-list-view">
	  <c:forEach items="${listShot}" var="frame">
			<tr id='post-1658' class='alternate author-self status-inherit' valign="top">
		<td width="200">				
		 
		  <span class="viewicon" style="width:200px;height:200px;" x='${frame.x}' y='${frame.y}' w='${frame.w}' h='${frame.h}'>
		    <img src="../uploadimg/comic/${vpage.picture}" class="imgView" alt="缩略图"/>
		    </span>
		  
		  
		  </td>
		<td>
		 <div class="scriptList">
         <c:forEach items="${frame.scripts}" var="script">
         
         <div class="scriptItem"><from><input type="hidden" name="id" value="${script.id}"/><input type="hidden" name="action" value="edit"/><input type="hidden" name="comicId" value="${script.comicId}"/><input type="hidden" name="chapterId" value="${script.chapterId}"/><input type="hidden" name="pageId" value="${script.pageId}"/><input type="hidden" name="shotId" value="${script.shotId}"/><select name="language"><option value="1" <c:if test="${script.language==1}">selected</c:if>>中文</option><option value="2" <c:if test="${script.language==2}">selected</c:if>>英语</option></select><select name="sex"><option value="1" <c:if test="${script.sex==1}">selected</c:if>>男</option><option value="2" <c:if test="${script.sex==2}">selected</c:if>>女</option></select><input type="text" name="line" value="${script.line}"/><input type="button" value="修改" onClick="saveScript(this)"/><input type="button" onclick="deleteScript(this);" value="删除"/></div>
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
</table><div class="dataTables_scrollFoot" style="overflow: hidden; border: 0px none; width: 100%;"><div class="dataTables_scrollFootInner" style="width: 767px;"><table cellspacing="0" cellpadding="0" border="0" class="datatable totaltable" style="margin-left: 0px; width: 750px;"><tfoot><tr><td colspan="12" class="tar" style="width: 740px;"></td></tr></tfoot></table></div></div></div><div class="dataTables_info" id="AppList_info" style="display: none;"></div></div></div>
       
 		
		</div>
	</div>
<jsp:include page="include/sidebar_comic.jsp"></jsp:include>

<!--点击应用名称查看弹出层-->


</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
