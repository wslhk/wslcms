<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">添加消息</h3>
<form action="message_do.action" method="post" name="createuser"  id="form_message"><input type="hidden" name="action" value="add" /><table class="form-table">
	<tr>
		<th scope="row">消息内容</th>
		<td>
        <textarea name="body" cols="50"></textarea>
        <span></span></td>

	</tr>
    <tr>
		<th scope="row"><label for="user_login">参数(动作) <span class="description"></span></label></th>
		<td><input name="param" type="text"  value="" aria-required="true"  class="ipt ipt_text"  /><span></span></td>

	</tr>
    
    <tr>
		<th scope="row"><label for="user_login">推送类型 <span class="description"></span></label></th>
		<td>
        <c:if test="${message.comicId!=null}"><input name="type" type="text"  value="1" aria-required="true"  class="ipt ipt_text"  /></c:if>
        <c:if test="${message.comicId==null}"><input name="type" type="text"  value="0" aria-required="true"  class="ipt ipt_text"  /></c:if>
        <span></span></td>

	</tr>
    
    <tr>
		<th scope="row"><label for="user_login">漫画 <span class="description"></span></label></th>
		<td><input name="comicId" type="text"  value="${message.comicId}" aria-required="true"  class="ipt ipt_text"  /><span></span></td>

	</tr>
	
<sec:authorize ifAllGranted="ROLE_ADMIN"></sec:authorize>
      
     
      
	</table>
    
   
    <p class="submit"><input type="submit" name="createuser" id="createusersub" class="btn nextone saveBtn" value="添加新消息"  /></p>
</form>
					
					
                   
				</div>
				
		
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
