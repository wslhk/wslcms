<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp"><jsp:param name="nav" value="0"></jsp:param></jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">漫画包新增</h3>
                  <form method="post" action="comic_package_do.action" id="form_article" ><input type="hidden" name="action" value="add" />
<input type="hidden" name="comicId" value="${comic.id}" />

<div class="media-single">
<div class='media-item'>
	
	<table class='slidetoggle describe form-table'>
		<tbody>
		  
		  
		  <tr><td style='display:none' colspan='2' class='image-editor' id='image-editor-1658'></td></tr>
		  
		  <tr class='post_title form-required'>
		    <th valign='top' scope='row' class='label'><span class='alignleft'>漫画名</span></th>
		    <td class='field'>${comic.id}.${comic.name}</td>
		    </tr>
            
            <tr>
              <th valign='top' scope='row' class='label'>平台</th>
              
              <td class='field'>
 <c:forEach items="${listPlatform}" var="platform">
 <input type='radio'  name='platformId' value='${platform.id}'  /> ${platform.name}
 </c:forEach>
  </td>
            </tr>
            <!--<tr>
		    <th valign='top' scope='row' class='label'><label><span class="field">cer文件</span><br class='clear' /></label></th>
		    
		    <td class='field'><input name="file_cer" type="file" value=""  /><span></span></td>
		    </tr>
            <tr >
		    <th valign='top' scope='row' class='label'><label>页数<br class='clear' /></label></th>
		    
		    <td class='field'><input type="text" value="${comic.pageCount}"  readonly="readonly"/><span></span></td>
		    </tr>
-->
		  </tbody>

	</table>
</div>
</div>

<p class="submit"><input type="submit" name="save" id="save" class="btn nextone saveBtn" value="保存"  />
</p>
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
