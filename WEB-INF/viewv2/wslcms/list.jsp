<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="include_page/jstl.jsp"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="${wslconfig.static_path}bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="${wslconfig.static_path}bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

<!-- Timeline CSS -->
<link href="${wslconfig.static_path}dist/css/timeline.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${wslconfig.static_path}dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Morris Charts CSS -->
<link href="${wslconfig.static_path}bower_components/morrisjs/morris.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="${wslconfig.static_path}bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
ul.pagination{ margin:0;}
</style>
</head>

<body>
<div id="wrapper"> 
  
  <!-- Navigation -->
  <jsp:include page="include_page/navbar.jsp"></jsp:include>
  <div id="page-wrapper">
    <div class="row">
      <div class="col-lg-12">
        <h1 class="page-header">${viewTitle.title} list <a href="?wslobj=${wslViewList.objName}&wslact=add" class="btn btn-info">新增</a></h1>
        
      </div>
      <!-- /.col-lg-12 --> 
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading"> 
         
          <form method="get" action="">
          <input type="hidden" name="wslobj" value="${wslobj}"/>
          <input type="hidden" name="wslact" value="list"/>
  <c:forEach items="${wslViewList.navForm.items}" var="formItem">
    <c:if test="${formItem.itemType=='TEXT'||formItem.itemType=='TEXTAREA'}"> ${formItem.title}
      <input type="text" name="${formItem.column}" value="${formItem.value}"/>
    </c:if>
    
     <c:if test="${formItem.itemType=='SELECT'||formItem.itemType=='RADIO'}">
     ${formItem.title}
     	<select name="${formItem.column}">
     		<option value="">全部</option>
        <c:forEach items="${formItem.selectItems}" var="sitem">
        <option value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        selected="selected"
        </c:if>
        >${sitem.title}</option>
        </c:forEach>
        </select>
      </c:if>  
    
  </c:forEach>
  <input type="submit" value="查询"/>
  <input type="reset" value="清除条件"/>
</form>

          
          </div>
          <!-- /.panel-heading -->
          <div class="panel-body">
            <div class="dataTable_wrapper">
            <form  method="get"  action="?">
            
  <input type="hidden" name="wslobj" value="${wslobj}"/>
  <select name="wslact">
    <option value="-1">请选择</option>
    <option value="batchEdit">批量编辑</option>
    <option value="del">批量删除</option>
  </select>
  <input type="submit" />
              <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                <th><input type="checkbox"/></th>
                  <c:forEach items="${wslViewList.navForm.items}" var="formItem">
                    <th> ${formItem.title}</th>
                  </c:forEach>
                  <th>操作</th>
                </tr>
                  </thead>
                
                <tbody>
                  <c:forEach items="${wslViewList.tableList.lines}" var="line">
                    <tr>
                      <td><input type="checkbox" name="${line.objId.column}[]" value="${line.objId.value}"/></td>
                      <c:forEach items="${line.items}" var="item">
                        <td><c:if test="${item.itemType=='FILEIMG'}"> <img width="50" src="${wslconfig.file_url}/${item.value}"/> </c:if>
                          ${item.value} </td>
                      </c:forEach>
                      <td><a href="?wslobj=${wslViewList.objName}&wslact=edit&${line.objId.column}=${line.objId.value}">编辑</a> <a href="?wslobj=${wslViewList.objName}&wslact=del&${line.objId.column}[]=${line.objId.value}">删除</a></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              </form>
            </div>
            <!-- /.table-responsive -->
            <div class="row">
      <div class="col-sm-6">
        <div class="dataTables_info" id="dataTables-example_info" role="status" aria-live="polite">Showing ${pager.rsfirst} to ${pager.rsfirst+pager.limit} of ${pager.rsall} entries</div>
      </div>
      <div class="col-sm-6">
        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
          <ul class="pagination">
          
          <li><a>${pager.pagenow}/${pager.pageall}</a></li> 
          
           
            
            
          
            <li class="paginate_button previous disabled" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_previous"><a href="${pager.firstpage.href}">第一页</a></li>
            <li class="paginate_button active" aria-controls="dataTables-example" tabindex="0"><a href="${pager.prevpage.href}">上一页</a> </li>
            <li class="paginate_button " aria-controls="dataTables-example" tabindex="0"><a href="${pager.nextpage.href}">下一页</a> </li>
            
            <li class="paginate_button next" aria-controls="dataTables-example" tabindex="0" id="dataTables-example_next"><a href="${pager.lastpage.href}">最后一页</a></li>
          </ul>
        </div>
      </div>
    </div>
          </div>
          <!-- /.panel-body --> 
        </div>
        <!-- /.panel --> 
      </div>
      <!-- /.col-lg-12 --> 
    </div>
    
    
    <!-- /.row --><!-- /.row --><!-- /.row --><!-- /.row --> 
  </div>
  <!-- /#page-wrapper --> 
  
</div>
<!-- /#wrapper --> 

<!-- jQuery --> 
<script src="${wslconfig.static_path}bower_components/jquery/dist/jquery.min.js"></script> 

<!-- Bootstrap Core JavaScript --> 
<script src="${wslconfig.static_path}bower_components/bootstrap/dist/js/bootstrap.min.js"></script> 

<!-- Metis Menu Plugin JavaScript --> 
<script src="${wslconfig.static_path}bower_components/metisMenu/dist/metisMenu.min.js"></script> 

<!-- DataTables JavaScript --> 
<script src="${wslconfig.static_path}bower_components/DataTables/media/js/jquery.dataTables.min.js"></script> 
<script src="${wslconfig.static_path}bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script> 

<!-- Custom Theme JavaScript --> 
<script src="${wslconfig.static_path}dist/js/sb-admin-2.js"></script> 

<!-- Page-Level Demo Scripts - Tables - Use for reference --> 
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>
</html>
