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
				  <h3 class="m_subtit account_title">基础信息</h3>
                
<table class="form-table" style="border:1px solid;">
						<tbody>
                        
                        
                        <tr><th><label>名称：</label></th>
<td><input type="text" name="name" value="${comic.name}" class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${comic.intro}"  class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label for="role">封面图：</label></th>
<td><img src="../uploadimg/comic/${comic.cover}" width="100" id="imgCover"/><input type="text" name="cover" id="inputCover" value="${comic.cover}" class="ipt ipt_text" /><span></span>
</td></tr>


                        
					</tbody></table>

<c:forEach items="${languages}" var="language">
<c:forEach items="${comicLanguages}" var="comicLanguage">
<c:if test="${language.id==comicLanguage.language}">
  <form id="form_adapter" action="comic_language_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input type="hidden" name="comicId" value="${comic.id}" />
<input type="hidden" name="language" value="${language.id}" />
<h4 class="m_subtit account_title">${language.name}</h4>
					<table class="form-table" style="border:1px solid;">
						<tbody>
                        
                        
                        <tr><th><label>名称：</label></th>
<td><input type="text" name="name" value="${comicLanguage.name}" class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${comicLanguage.intro}"  class="ipt ipt_text"/><span></span>
</td></tr>
<tr><th><label for="role">封面图：</label></th>
<td><img src="../uploadimg/comic/${comicLanguage.cover}" width="100"/><input readonly type="text" name="cover" value="${comicLanguage.cover}" class="ipt ipt_text" /><span></span><input type="button" value="使用漫画图片" onClick="this.form.cover.value=$('#inputCover').val();"><br>
<input type="file" name="file_cover" class="ipt ipt_text"/>
</td></tr>


                        
					</tbody></table>
                     <input type="submit" class="btn nextone saveBtn" value="保存"/>
                      <input type="reset" class="btn nextone saveBtn" value="重置"/>
<c:if test="${comicLanguage.name!=null}">
<a class="btn nextone saveBtn" href="product_new.action?comicId=${comicLanguage.comicId}&language=${language.id}">增加商品</a>
</c:if>
</form>
        </c:if>
 </c:forEach>
</c:forEach>

                   
					
					
                   
				</div>
				
		
					
		  </div>
				
				
	  </div>
  </div>
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>


</body></html>
