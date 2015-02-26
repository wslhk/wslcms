<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %>
<%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>管理员 - 漫画数字单行本综合管理平台（CCAPS）</title>
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

<h2>
用户	<a href="manager_new.action" class="button add-new-h2">添加新用户</a>
</h2>

<ul class='subsubsub'>
	<li class='all'><a href='manager.action' class="current">全部 <span class="count"></span></a> |</li>
	<li class='administrator'><a href='manager.action?roleAdmin=true'>管理员</a></li>
    <li class='administrator'><a href='manager.action?roleOrder=true'>财务</a></li>
    <li class='administrator'><a href='manager.action?roleEditer=true'>编辑</a></li>
    <li class='administrator'><a href='manager.action?roleReporter=true'>统计</a></li>

</ul>
<form action="" method="get">

<p class="search-box">
	<label class="screen-reader-text" for="user-search-input">搜索用户:</label>
	<input type="text" id="user-search-input" name="s" value="" />
	<input type="submit" name="" id="search-submit" class="button" value="搜索用户"  /></p>

<div class="tablenav top">

		<div class="alignleft actions">
		  <select name='action'>
		    <option value='-1' selected='selected'>批量操作</option>
		    <option value='delete'>删除</option>
		    </select>
		  <input type="button" name="" id="doaction" class="button-secondary action" value="应用"  />
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
		<th scope='col' id='cb' class='manage-column column-cb check-column'  style=""><input type="checkbox" /></th><th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>用户名</span></th><th scope='col' id='email' class='manage-column column-email sortable desc'  style="">角色</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">是否启用 </th><th scope='col' id='posts' class='manage-column column-posts num'  style="">&nbsp;</th>	</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" /></th><th scope='col'  class='manage-column column-username sortable desc'  style=""><span>用户名</span></th><th scope='col'  class='manage-column column-email sortable desc'  style="">角色</th><th scope='col'  class='manage-column column-role'  style="">是否启用</th><th scope='col'  class='manage-column column-posts num'  style="">&nbsp;</th>	</tr>
	</tfoot>

	<tbody id="the-list" class='list:user'>
      
      
<c:forEach items="${listmanager}" var="manager">
  <tr class="alternate">
    <th scope='row' class='check-column'>
      <input type='checkbox' name='users[]' id='user_1' class='administrator' value='1' />
      </th>
    <td class="username column-username">
      <strong><a href="manager_edit.action?id=${manager.id}">${manager.username}</a></strong><br /><div class="row-actions"><span class='edit'><a href="manager_edit.action?id=${manager.id}">编辑</a></span> 
      
      </div>
      </td>
    <td class="email column-email">
      
        <c:forEach items="${manager.listRole}" var="role">
          ${role.title}
        </c:forEach>
        
        </td>
    
    <td class="role column-role">
      <input disabled="disabled" type="checkbox" <c:if test="${manager.publish==true}">checked="checked"</c:if> />
      </td>
    <td class="posts column-posts num">&nbsp;
      </td>
    </tr>
</c:forEach>
      
      
      	
        </tbody>
</table>
	<div class="tablenav bottom">

		<div class="alignleft actions">
			<select name='action2'>

<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>删除</option>
</select>
<input type="submit" name="" id="doaction2" class="button-secondary action" value="应用"  />
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
