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
				  <h3 class="m_subtit account_title">漫画修改</h3>
                  <form id="form_adapter" action="comic_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input type="hidden" name="id" value="${comic.id}" />
					<table>
						<tbody>
                        
                        
                        <tr><th><label>名称：</label></th>
<td><input type="text" name="name" value="${comic.name}"/><span></span>
</td></tr>
<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${comic.intro}" /><span></span>
</td></tr>

<tr><th><label>首页图片：</label></th>
  <td>
  <img width="40" height="60" src="../uploadimg/comic/${comic.cover}" class="attachment-80x60" />
  <input  name="file_cover" type="file" value="" /><input type="hidden" name="cover" value="${comic.cover}" /><span></span>
</td></tr>

<tr><th><label>icon(114x114)：</label></th>
  <td>
  <img width="40" height="40" src="../uploadimg/comic/${comic.icon}" class="attachment-80x60" />
  <input  name="file_icon" type="file" value="" /><input type="hidden" name="icon" value="${comic.icon}" /><span></span>
</td></tr>

<tr><th><label>状态：</label></th>
<td>
<input type="radio" name="pubStatus" value="1"  <c:if test="${comic.pubStatus==1}">checked="checked"</c:if>/>
启用 
<input type="radio" name="pubStatus" value="0" <c:if test="${comic.pubStatus==0}">checked="checked"</c:if>/>
屏蔽<span></span>

</td></tr>

<tr><th><label>作者：</label></th>
<td><input  name="author" value="${comic.author}" type="text" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>翻译：</label></th>
<td><input  value="${comic.subTrans}"  name="subTrans" type="text" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>嵌字：</label></th>
<td><input  value="${comic.subFiller}"  name="subFiller" type="text" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>修正：</label></th>
<td><input  name="subCheck" type="text"  value="${comic.subCheck}" class="ipt ipt_text"  /><span></span>
</td></tr>
<tr><th><label>上色：</label></th>
<td><input  name="subColor" type="text" value="${comic.subColor}" class="ipt ipt_text" /><span></span>
</td></tr>
<tr><th><label>图源：</label></th>
<td><input  name="subSource" type="text"  value="${comic.subSource}"  class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label>出版社：</label></th>
<td><input  name="publisher" type="text"  value="${comic.publisher}" class="ipt ipt_text" /><span></span>
</td></tr>
                        
					</tbody></table>
                    <input type="submit" class="btn nextone saveBtn" value="保存"/>
                     
                  </form>
					
					
                   
				</div>
				
		
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
