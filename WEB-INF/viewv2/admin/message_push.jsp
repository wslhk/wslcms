<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  <script>
  //message_do_ajax.action
  function send(){
  $.ajax({
	type:'get',
	url:'message_do_ajax.action',
	data:'messageId='+${param.id},//可以直接加一个函数名。
	dataType:'json',
	success:function(msg){
		alert(msg);
	}
});
  }
  </script>

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
				  <h3 class="m_subtit account_title">消息推送中...</h3>
<form action="message_do.action" method="post" name="createuser"  id="form_message"><input type="hidden" name="action" value="add" /><table class="form-table">
	<tr>
	  <th scope="row">单独发送标记:</th>
	  <td><input name="param2" type="text"  value=""   class="ipt ipt_text"  />
	    设备标记,不填写为全部发送</td>
	  </tr>
	<tr>
	  <th scope="row">发送状态:</th>
	  <td>发送中</td>
	  </tr>
	<tr>
		<th scope="row">发送设备数</th>
		<td>
        <input name="param" type="text"  value=""   class="ipt ipt_text"  />
        <span></span></td>

	</tr>
    <tr>
      <th scope="row">启动时间</th>
      <td>&nbsp;</td>
    </tr>
    <tr>
		<th scope="row"><label for="user_login"><span class="description">当前发送日志信息</span></label></th>
		<td><textarea></textarea></td>

	</tr>
	
<sec:authorize ifAllGranted="ROLE_ADMIN"></sec:authorize>
      
     
      
	</table>
    
   
    <p class="submit"><input type="button" onClick="send()" name="createuser" id="createusersub" class="btn nextone saveBtn" value="添加新消息"  /></p>
</form>
					
					
                   
				</div>
				
		
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
