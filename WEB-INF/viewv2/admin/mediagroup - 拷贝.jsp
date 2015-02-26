<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>标签 - 漫画数字单行本综合管理平台（CCAPS）</title>
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
多媒体分组	<a href="mediagroup_new.action" class="button add-new-h2">添加分组</a>
<a href="media.action" class="button add-new-h2">管理多媒体文件</a>
</h2>
<form action="" method="get">
  
  <p class="search-box">
	<label class="screen-reader-text" for="user-search-input">搜索用户:</label>
	<input type="text" id="user-search-input" name="s" value="" />
	<input type="submit" name="" id="search-submit" class="button" value="标签查询"  /></p>
<div class="tablenav top">
    
    <!--
    <div class="alignleft actions">

			<select name='action'>
<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>取消发布</option>
</select>
<input type="submit" name="" id="doaction" class="button-secondary action" value="应用"  />
		</div>
        -->
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
		<th scope='col' id='role' class='manage-column column-role'  style="">编号</th>
		</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp"/></th><th scope='col'  class='manage-column column-username sortable desc'  style="">标题</th>
		<th scope='col'  class='manage-column column-role'  style="">编号</th>	</tr>
	</tfoot>

	<tbody id="the-list" class='list:user'>

<c:forEach items="${listmediagroup}" var="mediagroup">
	<tr id='user-1' class="alternate"><th scope='row' class='check-column'><input type='checkbox' name='ids[]' class='ckb' value='${ad.id}' /></th>
	<td class="username column-username"><strong><a href="meidagroup_edit.action?id=${mediagroup.id}">${mediagroup.title}</a></strong><br /><div class="row-actions">
	  
	  <span class='edit'>
	    
	    <a href="mediagroup_edit.action?id=${mediagroup.id}">编辑</a>
	    
	    </span>
          <span class='delete'>
        <a class='submitdelete' onclick='return showNotice.warn();' href='mediagroup_do.action?action=delete&id=${mediagroup.id}'>永久删除</a>
	   </span>
	  </div></td>
	<td class="role column-role">${mediagroup.id}</td>
	  </tr>	
      </c:forEach>
      </tbody>
</table>
	<div class="tablenav bottom">
<!--
		<div class="alignleft actions">
			<select name='action2'>

<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>取消发布</option>
</select>
<input type="submit" name="" id="doaction2" class="button-secondary action" value="应用"  />
		</div>
     -->   
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
