<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  <script>
  $().ready(function(e) {
	showPreview(); 
	
	
});
  function showPreview(){
    $.ajax({  
					url:"product_preview.action?productId=${product.id}", 
					//data:'text='+str+'&url='+localhref+'&'+Math.random(),//this.menuId, 
					//async:false,  
					type:'get',
					//dataType:"json",  
					processData:false,  
 
					success:function(jsondata) { 
		
						$('#showPreview').html(jsondata);
					}  
			 });
	}
  
  </script>

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
                  <form id="form_adapter" action="product_do.action" enctype="multipart/form-data" method="post">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input  value="${platformId}" name="platformId" type="hidden" />
<input value="${param.comicId}"  name="comicId" type="hidden" />
<input value="${product.id}"  name="id" type="hidden" />
					<table class="form-table">
						<tbody>
                        
                        
<tr><th><label for="role">商品名</label></th>
<td><input type="text" name="name" value="${product.name}" class="ipt ipt_text " /><span></span>
</td></tr>

<tr><th><label for="role">商品图片</label></th>
<td><img width="80" src="../uploadimg/comic/${product.cover}"/>
<input type="hidden" name="cover" value="${product.cover}"  class="ipt ipt_text" />
<input type="file" name="file_cover"  class="ipt ipt_text" />
<span></span>
</td></tr>

<tr><th><label for="role">简介：</label></th>
<td><input type="text" name="intro" value="${product.intro}" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label for="role">类型：</label></th>
<td>
<input  type="radio" name="type" value="0" <c:if test="${product.type==0}">checked</c:if>>章节 
<input type="radio" name="type" value="1" <c:if test="${product.type==1}">checked</c:if>>卷

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
<option value="${price.id}" <c:if test="${price.id==product.priceType}">selected</c:if>>${price.priceCn}</option>
</c:forEach>

</select><span></span>
</td></tr>

<tr><th><label for="role">商品流派</label></th>
<td><input type="text" name="geners" value="${geners}" class="ipt ipt_text" />  <span></span>
</td></tr>

<tr><th><label for="role">作者</label></th>
<td><input type="text" name="authors" value="${authors}" class="ipt ipt_text" />  <span></span>
</td></tr>
   <tr>
     <th>预览图片</th>
     <td><div id="showPreview"></div></td>
   </tr>
   <tr><th><label for="role">请选择章节：</label></th>
<td><p>
<ul>
<c:forEach items="${chapters}" var="chapter">
	<li class="tal sorting_1" style="width:170px; float:left;">
    <span>
    <input name="chapterIds" type="checkbox" value="${chapter.id}"
    <c:forEach items="${product.chapterIds}" var="chapterId">
    	<c:if test="${chapterId==chapter.id}"> checked</c:if>
    </c:forEach>
    >
    
    </span>
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
				<hr/>	
<form id="form_adapter" action="product_price_do.action" method="post">
<input type="hidden" name="action" value="editPrice" />
<input type="hidden" name="referer" value="${referer}" />

<input value="${product.id}"  name="productId" type="hidden" />
					<table class="form-table">
						<tbody>

<tr><th>内支付码：</th>
  <td>
<%--  <c:forEach items="${applications}" var="application">
    ${application.name}
  <input type="hidden" name="applicationIds" value="${application.id}">
  
  <input type="text" name="marks" class="ipt ipt_text" value="<c:forEach items="${marks}" var="mark"><c:if test="${mark.app==application.id}">${mark.mark}</c:if></c:forEach>">
  
  <input type="button" value="填充默认标记"/>
  
  <c:forEach items="${marks}" var="mark">[${mark.app},${application.id}]<c:if test="${mark.app==application.id}"><input type="radio" name="active" value="0" <c:if test="${mark.active==0}"> checked="checked"</c:if>/>未启用
<input type="radio" name="active" value="1" <c:if test="${mark.active==1}">  checked="checked"</c:if>/> 启用</c:if></c:forEach>

  </c:forEach>--%>
    
</td>
<td>
 <c:forEach items="${marks}" var="mark">
 <input type="hidden" name="applicationIds" value="${mark.app}">
  ${mark.application.name}:
  <input type="text" name="marks" class="ipt ipt_text" value="${mark.mark}">
  
 
<input type="radio" name="active" value="0" <c:if test="${mark.active==0}"> checked="checked"</c:if>/>未启用
<input type="radio" name="active" value="1" <c:if test="${mark.active==1}">  checked="checked"</c:if>/> 启用
<br>

审核完成时间<input type="text" value="${mark.pubTime}" width="100" name="pubTimes" class="datepicker ipt ipt_text"/>
</c:forEach>

</td>
</tr>
                        
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
