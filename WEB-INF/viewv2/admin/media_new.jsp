<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">媒体增加</h3>
                  <form id="form_ad" action="media_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />

  <p>&nbsp;</p>

<table class="form-table">
<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label>文件：</label></th>
  <td><input  name="file_media" type="file" value="" class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label for="role">文件播放长度(秒)：</label></th>
<td><input type="text" name="second" class="ipt ipt_text" />秒<span></span>
</td></tr>

<tr><th><label>分组：</label></th>
  <td>
    
<c:forEach items="${listmediagroup}" var="mediagroup">
 <input type="radio" name="mediaGroupId" value="${mediagroup.id}">${mediagroup.title}
 </c:forEach>
 

 <span></span>
</td></tr>
<tr><th><label>类型：</label></th>
  <td>
    

 <input type="radio" name="type" value="1" checked="checked" /> 声效(短)
  <input type="radio" name="type" value="2" /> 
  背景音乐(长)
   <input type="radio" name="type" value="3" /> 视频
 <input type="radio" name="type" value="4" /> GIF
 <span></span>
</td></tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit" class="btn nextone saveBtn" value="保存"  /></p>
</form>
					
					
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
