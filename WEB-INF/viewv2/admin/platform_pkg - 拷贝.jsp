<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.*" errorPage="" %><%@ include file="../include_page/jstl.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"  dir="ltr" lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>广告 - 漫画数字单行本综合管理平台（CCAPS）</title>
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

<h2>平台可用包类型
<a href="platform_pkg_new.action" class="button add-new-h2">添加</a>

</h2>
<form action="" method="get">
<div class="tablenav top">
    
    <div class="alignleft actions">

			<select name='action' id="action1">
<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>删除</option>
</select>
<input type="button" name="" id="doaction" class="button-secondary action" onclick="operation.batch('ad',1)" value="应用"  />
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
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style="">id</th>
		<th scope='col' id='username' class='manage-column column-username sortable desc'  style=""><span>标题</span></th>
		<th scope='col' id='email' class='manage-column column-email sortable desc'  style="">介绍</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">pro</th>
		<th scope='col' id='role' class='manage-column column-role'  style="">状态</th>
		</tr>
	</thead>

	<tfoot>
	<tr>
		<th scope='col'  class='manage-column column-cb check-column'  style=""><input type="checkbox" class="ckbp"/></th>
		<th scope='col'  class='manage-column column-username sortable desc'  style="">id</th>
		<th scope='col'  class='manage-column column-username sortable desc'  style="">标题</th><th scope='col'  class='manage-column column-email sortable desc'  style="">介绍</th>
		<th scope='col'  class='manage-column column-role'  style="">pro</th>
		<th scope='col'  class='manage-column column-role'  style="">状态</th>
		</tr>
	</tfoot>

	<tbody id="the-list" class='list:user'>

<c:forEach items="${listplatformPkg}" var="platformPkg">
	<tr id='user-1' class="alternate"><th scope='row' class='check-column'><input type='checkbox' name='ids[]' class='ckb' value='${ad.id}' /></th>
	  <td class="username column-username">${platformPkg.id}</td>
	<td class="username column-username"><strong><a href="ad_edit.action?id=${ad.id}&type=${ad.type}">${platformPkg.platform.name}</a></strong><br /><div class="row-actions">
    
    <span class='edit'>
   
    <a href="platform_pkg_edit.action?id=${platformPkg.id}">编辑</a>
    | 
    </span>
    <span class='delete'><a class='submitdelete' onclick='return showNotice.warn();' href='platform_pkg_do.action?action=delete&id=${platformPkg.id}'>永久删除</a>  </span>
    </div></td>
	<td class="email column-email">
   ${platformPkg.intro}
    </td>
    <td class="role column-role"><a width="40" height="60" href="../uploadfile/pro/${platformPkg.pro}" >	下载地址</a></td>
    <td class="role column-role">${platformPkg.status}</td>
    </tr>	
      </c:forEach>
      </tbody>
</table>
	<div class="tablenav bottom">

		<div class="alignleft actions">
			<select name='action2' id="action2">

<option value='-1' selected='selected'>批量操作</option>
	<option value='delete'>删除</option>
</select>
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
