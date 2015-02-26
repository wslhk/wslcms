<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html>
<html><head>
    <meta charset="utf-8">
    <title>添加应用 - 漫画数字单行本综合管理平台（CCAPS</title>
  <jsp:include page="include/head_script.jsp"></jsp:include>

  

</head>
<body>
<jsp:include page="include/header.jsp">
<jsp:param name="nav" value="2"></jsp:param>
</jsp:include>
<div id="content">
	<div class="main">
        <!--create_ad-->
        <div class="clearfix">
		  <div class="int_info">
			  <!--case1 选择平台-->
			  
				<!--case2 基本信息-->
				<div style="" class="create_ad_target content_table">
				  <h3 class="m_subtit account_title">配置文件参数</h3>
                  
<c:if test="${config.type==0}">
<form id="form_adapter" action="config_item_do.action" method="post">
</c:if>
<c:if test="${config.type==1}">
<form id="form_adapter" enctype="multipart/form-data" action="config_item_do.action" method="post">
</c:if>      
                  
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input type="hidden" name="configId" value="${config.id}" />
<input type="hidden" name="id" value="${config.item.id}" />
<input type="hidden" name="comicId" value="${param.comicId}" />
					<table>
						<tbody>
                        
                        
                       <tr><th><label for="role">名称-键值：</label></th>
<td><input type="text" name="name" class="ipt ipt_text" value="${config.name}" readonly /><span></span>
</td></tr>
<tr><th><label>介绍：</label></th>
<td><input type="text" name="intro" class="ipt ipt_text" value="${config.intro}" readonly /><span></span>
</td></tr>

<tr><th><label>值：</label></th>
<td>
<c:if test="${config.type==0}">
<input type="text" name="val" class="ipt ipt_text" value="${config.item.val}" />
</c:if>
<c:if test="${config.type==1}">
<input type="hidden" name="val" class="ipt ipt_text" value="${config.item.val}" />${config.item.val}

<input type="file" name="valFile"/>
</c:if>
<span></span>
</td></tr>

<tr><th><label>平台：</label></th>
  <td>
  <c:forEach items="${platforms}" var="platform">
  <input type="radio" name="platformId" readonly value="${platform.id}"
  <c:if test="${platform.id==config.platformId}"> checked="checked"</c:if>
  />
  ${platform.name}
  </c:forEach>
  
  <span></span>
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
		
	<jsp:include page="include/sidebar_goback.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
