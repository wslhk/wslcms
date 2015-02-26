<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="0"></jsp:param>
</jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">应用推荐</h3>
                  <form id="form_adapter" action="ad_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="id" value="${ad.id}" />
<input type="hidden" name="type" value="${ad.type}" />
<input type="hidden" name="publish" value="${ad.publish}"/>
  <p>&nbsp;</p>

<h3>编辑</h3>
<table class="form-table">
  <tr>
		<th><label for="user_login">分类编号</label></th>
		<td></td>
	</tr>

<tr><th><label for="role">标题：</label></th>
<td><input type="text" name="title" value="${ad.title}" class="ipt ipt_text"  /><span></span>
</td></tr>
<tr><th><label>链接：</label></th>
<td><input type="text" name="link" value="${ad.link}" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label>平台：</label></th>
<td>
<c:forEach items="${platforms}" var="platform">
<input type="radio"  name="platformId" value="${platform.id}" <c:if test="${platform.id==ad.platformId}"> checked</c:if>/>${platform.name}
</c:forEach>
<span></span>
</td></tr>

<tr><th><label>首页图片：</label></th>
  <td>
    <img width="40" height="60" src="../uploadimg/ad/${ad.img}" class="attachment-80x60" />
    <input  name="file_img" class="ipt ipt_text"  type="file" value="" /><input type="hidden" name="img" value="${ad.img}" /><span></span>
</td></tr>
</table>
<p class="submit"><input type="submit" name="submit" id="submit"  class="btn nextone saveBtn" value="保存"  /></p>
</form>
					
					
                   
				</div>
				
		
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
