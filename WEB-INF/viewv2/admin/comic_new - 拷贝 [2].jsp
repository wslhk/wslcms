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
        <div class="create_ad clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">漫画新增</h3>
                  <form id="form_adapter" action="comic_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />
<input type="hidden" name="id" />
					<table>
						<tbody>
                        
                        
                       <tr><th><label for="role">名称：</label></th>
<td><input type="text" name="name" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>介绍：</label></th>
<td><input type="text" name="intro" class="ipt ipt_text"/><span></span>
</td></tr>


<tr><th><label>cover：</label></th>
<td><input  name="file_cover" type="file" value="" class="ipt ipt_text" /><span></span>
</td></tr>


<tr><th><label>icon(114x114)：</label></th>
<td><input  name="file_icon" type="file" value=""  class="ipt ipt_text"/><span></span>
</td></tr>

<tr><th><label>作者：</label></th>
<td><input  name="author" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>翻译：</label></th>
<td><input  name="subTrans" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>嵌字：</label></th>
<td><input  name="subFiller" type="text" value=""  class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label>修正：</label></th>
<td><input  name="subCheck" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>上色：</label></th>
<td><input  name="subColor" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>图源：</label></th>
<td><input  name="subSource" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>出版社：</label></th>
<td><input  name="publisher" type="text" value="" class="ipt ipt_text" /><span></span>
</td></tr>
                        
					</tbody></table>
                    <input type="submit" class="btn nextone saveBtn" value="保存"/>
                     
                  </form>
					
					
                   
				</div>
				
				<!--case3 广告设置-->
				
				<!--case4 上传应用-->
				
					<!--网站类型-->
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
