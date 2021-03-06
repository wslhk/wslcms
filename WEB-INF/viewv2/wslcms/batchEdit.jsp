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
        <h1 class="page-header">${viewTitle.title} 批量编辑</h1>
      </div>
      <!-- /.col-lg-12 --> 
    </div>
    <!-- /.row -->
    <div class="row">
      <div class="col-lg-12">
        <div class="panel panel-default">
          <div class="panel-heading"> 
			请确认
          批量编辑以下内容</div>
          <!-- /.panel-heading -->
          <div class="panel-body">
            <div class="dataTable_wrapper">
 <form method="post" action="?wslact=del_do">
 <input type="hidden" name="referer" value="${referer}"/>
 <input type="hidden" name="wslobj" value="${wslobj}"/>
              <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
               
    <c:forEach items="${wslTableList.columns}" var="formItem">

       	<th> ${formItem.title}</th>

    </c:forEach>
                </tr>
                  </thead>
                
                <tbody>
<c:forEach items="${wslTableList.lines}" var="line">
<input type="hidden" name="${line.objId.column}[]" value="${line.objId.value}"/>
<tr>
       	<c:forEach items="${line.items}" var="item">
       	<td> ${item.value}
        <c:if test="${item.itemType=='FILEIMG'}"> <img width="50" src="${wslconfig.file_url}/${item.value}"/> </c:if>
        </td>

 </c:forEach>
 </tr>
 </c:forEach>
                </tbody>
              </table>
              </form>
            </div>
            <!-- /.table-responsive -->
<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <form role="form" method="post" action="?wslact=batchEdit_do" enctype="multipart/form-data">
 <c:forEach items="${wslTableList.lines}" var="line">                               
        <input type="hidden" name="${line.objId.column}[]" value="${line.objId.value}"/>
 </c:forEach>                               
<input type="hidden" name="referer" value="${referer}"/>
<input type="hidden" name="wslobj" value="${wslobj}"/>
<c:forEach items="${wslViewObj.line.items}" var="item">
<div class="form-group">
<c:if test="${item.annotation.batchUpdate()==true}">
<label>${item.title}${item.annotation.batchUpdate()}</label>
</c:if>

        <c:if test="${item.annotation.batchUpdate()==true&&item.itemType=='TEXT'}">
                                 
        <input class="form-control" type="text" name="${item.column}" value="${item.value}"/>
        <p class="help-block">please input.</p>
        </c:if>
        
      <c:if test="${item.annotation.batchUpdate()==true&&item.itemType=='RADIO'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="radio" name="${item.column}" value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>
        /> ${sitem.title}
        </c:forEach>
      </c:if>
       
     <c:if test="${item.annotation.batchUpdate()==true&&item.itemType=='SELECT'}">
     	<select name="${item.column}"  class="form-control">
     		
        <c:forEach items="${item.selectItems}" var="sitem">
        <option value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        selected="selected"
        </c:if>
        >${sitem.title}</option>
        </c:forEach>
        </select>
      </c:if>  
       
   <c:if test="${item.annotation.batchUpdate()==true&&item.itemType=='CHECKBOX'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="checkbox" name="${item.column}" value="${sitem.id}" <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>/>
        
        </c:forEach>
        
      </c:if>       
   
 <c:if test="${item.annotation.batchUpdate()==true&&(item.itemType=='FILE'||item.itemType=='FILEIMG')}">
       <c:if test="${item.itemType=='FILEIMG'}">
       <p class="form-control-static">
       	<img width="100" src="${wslconfig.file_url}/${item.value}"/>
       </p>
       </c:if>
   <input type="hidden" name="${item.column}" value="${item.value}" />
   <input type="file" name="_${item.column}" />

</c:if>      
  <c:if test="${item.annotation.batchUpdate()==true&&item.itemType=='TEXTAREA'}">
                                  
  <textarea name="${item.column}" class="form-control" rows="3">${item.value}</textarea>

</c:if>          
     
</div>
    </c:forEach>
   <button type="submit" class="btn btn-default">Submit Button</button> 
    
                                      
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <div class="row">
      <div class="col-sm-6">
        <button type="submit" class="btn btn-default">确认删除</button> 
        <button type="button" class="btn btn-default" onClick="history.go(-1);" />返回</button>
      </div>
      <div class="col-sm-6">
       
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


