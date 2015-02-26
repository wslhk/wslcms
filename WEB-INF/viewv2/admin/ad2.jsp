<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>闪屏 - 漫画数字单行本综合管理平台（CCAPS）</title>
<jsp:include page="include/include_head.jsp"></jsp:include>

</head>
<body class="wp-admin no-js  users-php">


<div id="wpwrap">
<div id="wpcontent">
<jsp:include page="include/wphead.jsp"></jsp:include>

<div id="wpbody">

<jsp:include page="include/adminmenu.jsp"></jsp:include>

<div id="wpbody-content">

<div class="wrap">
  <div id="icon-users" class="icon32"><br /></div>

<h2>闪屏

<c:if test="${listad==null|| fn:length(listad) == 0}">
<a href="ad_new.action?type=${ad.type}" class="button add-new-h2">添加</a>
</c:if>
</h2>
<form action="" method="get">
  <!--
<p class="search-box">
	<label class="screen-reader-text" for="user-search-input">搜索用户:</label>
	<input type="text" id="user-search-input" name="s" value="" />
	<input type="submit" name="" id="search-submit" class="button" value="搜索用户"  /></p>
--><div class="tablenav top">
    
    <div class="alignleft actions">

		
		</div>
        <!--
	<div class="alignleft actions">
		<label class="screen-reader-text" for="new_role">改变角色为 &hellip;</label>
		<select name="new_role" id="new_role">

			<option value=''>改变角色为 &hellip;</option>
			
	<option value='administrator'>管理员</option>
	<option value='editor'>编辑</option>
	<option value='author'>作者</option>
	<option value='contributor'>投稿者</option>
	<option value='subscriber'>订阅者</option>		</select>

		<input type="submit" name="changeit" id="changeit" class="button-secondary" value="更改"  />	</div>
        -->
        
<jsp:include page="include/page1.jsp"></jsp:include>
		<br class="clear" />

	</div>
<table class="wp-list-table widefat fixed users" cellspacing="0">
	<thead>
	<tr>
		<th scope='col' id='cb' class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp" /></th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">链接</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">图片</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">创建时间</th>
		</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp"/></th><th scope='col'  class='manage-column column-username sortable desc'  style="">标题</th><th scope='col'  class='manage-column column-email sortable desc'  style="">链接</th>
		<th scope='col'  class='manage-column column-role'  style="">图片</th>
		<th scope='col'  class='manage-column column-role'  style="">创建时间</th>
		</tr>
	</tfoot>

	<tbody id="the-list" class='list:user'>

<c:forEach items="${listad}" var="ad">
	<tr id='user-1' class="alternate"><th scope='row' class='check-column'><input type='checkbox' name='ids[]' class='ckb' value='${ad.id}' /></th>
	<td class="username column-username"><strong><a href="ad_edit.action?id=${ad.id}&type=${ad.type}">${ad.title}</a></strong><br /><div class="row-actions">
    
    <span class='edit'>
   
    <a href="ad_edit.action?id=${ad.id}&type=${ad.type}">编辑</a>
     </span>
   <span class='delete'>
    <a  class='submitdelete' onclick='return showNotice.warn();' href="ad_do.action?id=${ad.id}&type=${ad.id}&action=delete">删除</a>
    </span>
    
    </div></td>
	<td class="email column-email">
   ${ad.link}
    </td>
    <td class="role column-role"><img width="40" height="60" src="${ad.img}" class="attachment-80x60" />	</td>
    <td class="role column-role">${ad.createtime}</td>
	  </tr>	
      </c:forEach>
      </tbody>
</table>
	<div class="tablenav bottom">

		<div class="alignleft actions">
		
<input type="button" name="" id="doaction2" class="button-secondary action"  onclick="operation.batch('ad',2)" value="应用"  />
		</div>
<jsp:include page="include/page2.jsp"></jsp:include>
		<br class="clear" />
	</div>
</form>


<br class="clear" />
</div>

<div class="clear"></div></div><!-- wpbody-content -->
<div class="clear"></div></div><!-- wpbody -->
<div class="clear"></div></div><!-- wpcontent -->
</div><!-- wpwrap -->

<jsp:include page="include/footer.jsp"></jsp:include>

</body>
</html>
