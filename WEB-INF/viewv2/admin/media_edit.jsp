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
				  <h3 class="m_subtit account_title">媒体编辑</h3>
                  <form id="form_ad" action="media_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="id" value="${media.id}" />
  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" value="${media.title}" class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label>文件：</label></th>
  <td><input  name="file_media" type="file" value="" class="ipt ipt_text"/> 
  <input type="hidden" name="fileName" value="${media.fileName}" /><span></span>
</td></tr>

<tr><th><label for="role">文件播放长度(秒)：</label></th>
<td><input type="text" name="second" value="${media.second}" class="ipt ipt_text"/>秒<span></span>
</td></tr>

<tr><th><label>分组：</label></th>
  <td>
    
<c:forEach items="${listmediagroup}" var="mediagroup">
 <input type="radio" name="mediaGroupId" value="${mediagroup.id}" <c:if test="${mediagroup.id==media.mediaGroupId}"> checked="checked"</c:if>
 
 >${mediagroup.title}
 </c:forEach>
 

 <span></span>
</td></tr>
<tr>
  <th><label>类型：</label></th>
  <td>
     <input type="radio" name="type" value="1"  <c:if test="${1==media.type}"> checked="checked"</c:if> /> 声效(短)
  <input type="radio" name="type" value="2" <c:if test="${2==media.type}"> checked="checked"</c:if> 
  /> 背景音乐(长)
   <input type="radio" name="type" value="3" 
   <c:if test="${3==media.type}"> checked="checked"</c:if> /> 视频
<input type="radio" name="type" value="4" 
   <c:if test="${4==media.type}"> checked="checked"</c:if> /> GIF


 <span></span>
</td></tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit" value="保存" class="btn nextone saveBtn" /></p>
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
