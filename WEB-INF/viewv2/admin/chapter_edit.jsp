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
				  <h3 class="m_subtit account_title">修改章节</h3>
<form id="form_adapter" action="chapter_do.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input type="hidden" name="id" value="${chapter.id}" />
<input type="language" name="${chapter.language}" />
					<table>
						<tbody>
                        
         

<tr><th><label for="role">章节名称：</label></th>
<td><input type="text" name="name" class="ipt ipt_text" value="${chapter.name}"/><span></span>
</td></tr>

<tr><th><label for="role">章节编号(数字)：</label></th>
<td><input type="text" value="${chapter.chapterNumber}" name="chapterNumber" class="ipt ipt_text" /><span></span>
</td></tr>

<tr><th><label for="role">章节类型：</label></th>
<td><input type="radio" name="type" value="0" <c:if test="${chapter.type==0}">checked="checked"</c:if>>预览 <input type="radio" name="type" value="1" <c:if test="${chapter.type==1}">checked="checked"</c:if>>正文 <input type="radio" name="type" value="2" <c:if test="${chapter.type==2}">checked="checked"</c:if>>番外 <span></span>
</td></tr>

<tr>
  <th>分级</th>
  <td style="text-align:left;">
  <c:forEach items="${ranks}" var="rank">
  	<input type="radio" name="rankId" value="${rank.id}" <c:if test="${rank.id==chapter.rankId}">checked</c:if>>${rank.name}:${rank.intro}<br>

  </c:forEach>
  </td>
</tr>
<tr><th><label>状态：</label></th>
  <td>
    <input  type="radio" name="statusCheck" value="1"  <c:if test="${chapter.statusCheck==1}">checked="checked"</c:if>/>
    启用 
    <input type="radio" name="statusCheck" value="0" <c:if test="${chapter.statusCheck==0}">checked="checked"</c:if>/>
    屏蔽<span></span>
    
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
