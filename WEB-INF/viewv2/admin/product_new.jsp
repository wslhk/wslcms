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
                  <form id="form_adapter" action="product_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="add" />
<input type="hidden" name="referer" value="${referer}" />
<input  value="${platformId}" name="platformId" type="hidden" />
<input value="${param.comicId}"  name="comicId" type="hidden" />
<input value="1"  name="publish" type="hidden" />
					<table class="form-table">
						<tbody>
 <tr><th><label for="role">语言：</label></th>
<td>${language.name}
</td></tr>   
<tr><th><label for="role">漫画：</label></th>
<td>${comic.name}
</td></tr>                     
                        
<tr><th><label for="role">名称：</label></th>
<td><input type="text" name="name" value="" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label for="role">封面图：</label></th>
<td><input type="file" name="file_cover"  class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label for="role">类型：</label></th>
<td>
<input type="radio" name="type" value="0">章节 
<input type="radio" name="type" value="1">卷

<span></span>
</td></tr>

<tr><th><label for="role">语言：</label></th>
<td>
<input type="hidden" name="language" value="${language.id}"/>${language.name}
<span></span>
</td></tr>

<tr><th><label for="role">价格：</label></th>
<td><select name="priceType">
<c:forEach items="${prices}" var="price">
<option value="${price.id}">${price.priceCn}</option>
</c:forEach>

</select><span></span>
</td></tr>

<tr>
  <th>流派:(英文逗号分割)</th>
  <td><input type="text" name="geners" value="" class="ipt ipt_text" /></td>
</tr>
<tr>
  <th>作者:(英文逗号分割)</th>
  <td><input type="text" name="authors" value="" class="ipt ipt_text" /></td>
</tr>
<tr><th><label for="role">请选择章节：</label></th>
<td><p>
<ul>
<c:forEach items="${chapters}" var="chapter">
	<li class="tal sorting_1" style="width:170px; float:left;">
    <span><input name="chapterIds" type="checkbox" value="${chapter.id}"></span>
    <span>${chapter.name}</span>
    <span>${chapter.language}</span>
    </li>
</c:forEach>
</ul>
</p>
  <p>chapters</p></td></tr>
                        
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
