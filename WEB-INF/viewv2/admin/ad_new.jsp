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
				  <h3 class="m_subtit account_title">漫画新增</h3>
                  <form id="form_ad" action="ad_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="type" value="${ad.type}" />

<input type="hidden" name="publish" value="true">

  <p>&nbsp;</p>

<h3>增加</h3>
<table class="form-table">
<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" class="ipt ipt_text"  /><span></span>
</td></tr>
<tr><th><label>链接：</label></th>
<td><input type="text" name="link" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label>平台：</label></th>
<td>
<c:forEach items="${platforms}" var="platform">
<input type="radio" name="platformId" value="${platform.id}" <c:if test="${platform.id==param.type}"></c:if>/>${platform.name}
</c:forEach>
<span></span>
</td></tr>

<tr><th><label>图片：(http://xxx | comic_id:xx)</label></th>
  <td><input  name="file_img" type="file" value=""  class="ipt ipt_text" /><span></span>
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
