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
                  <form id="form_adapter" action="product_item_do.action" method="post">
<input type="hidden" name="action" value="edit" />
<input type="hidden" name="referer" value="${referer}" />
<input  value="${platformId}" name="platformId" type="hidden" />
<input value="${param.comicId}"  name="comicId" type="hidden" />
					<table>
						<tbody>
                        
                        
                       <tr><th><label for="role">内支付代码：</label></th>
<td><input type="text" name="productId" value="${item.productId}" class="ipt ipt_text" /><span></span>
</td></tr>

                       <tr>
                         <th>建议价格</th>
                         <td><input type="text" name="price" value="${item.price}" class="ipt ipt_text" /></td>
                       </tr>
                       <tr><th><label for="role">是否允许付费：</label></th>
<td>
<input type="radio" name="allowPay" value="0"  <c:if test="${item.allowPay==null||item.allowPay==0}">checked</c:if>/>不允许

<input type="radio" name="allowPay" value="1"  <c:if test="${item.allowPay==1}">checked</c:if>/>允许
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
		
	<jsp:include page="include/sidebar_comic.jsp"></jsp:include>
</div>
<jsp:include page="include/footer.jsp"></jsp:include>
</body></html>
