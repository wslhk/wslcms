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
				  <h3 class="m_subtit account_title">权限新增</h3>
                  <form action="role_do.action" method="post" name="createuser"  id="form_manager"><input type="hidden" name="action" value="add" /><table class="form-table">
<tr>
		<th scope="row"><label for="user_login">编号 <span class="description">(必填)</span></label></th>
		<td><input name="id" type="text"  value="" aria-required="true" class="ipt ipt_text" /><span></span></td>

	</tr>
	<tr>
		<th scope="row"><label for="user_login">权限中文名 <span class="description">(必填)</span></label></th>
		<td><input name="title" type="text"  value="" aria-required="true" class="ipt ipt_text" /><span></span></td>

	</tr>
    <tr>
		<th><label>key
		  <span class="description">(必填)</span></label>
		  如 ROLE_EDITER</th>
		<td><input name="key" type="text"  value="" aria-required="true" class="ipt ipt_text" maxlength="32" /><span></span></td>

	</tr>
	<tr>
	  <th scope="row"><label for="pass1">简介 <span class="description">(必填)</span></label></th>
	  <td><input name="intro"  class="ipt ipt_text" /><span></span>
	 
	    </td>
	  </tr>
      
     
      
	</table>
    
   
    <p class="submit"><input type="submit" id="createusersub" class="btn nextone saveBtn" value="增加"  /></p>
</form>
					
					
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_manager.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
