<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %><%@ include file="include_page/jstl.jsp"%><!DOCTYPE html>
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

    <!-- Custom CSS -->
    <link href="${wslconfig.static_path}dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${wslconfig.static_path}bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <jsp:include page="include_page/navbar.jsp"></jsp:include>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${viewTitle.title}Forms</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                <form role="form" method="post" action="?wslact=add_do&${wslViewObj.line.objId.column}=${wslViewObj.line.objId.value}" enctype="multipart/form-data">
<input type="hidden" name="referer" value="${referer}"/>
<input type="hidden" name="wslobj" value="${wslobj}"/>
<c:forEach items="${wslViewObj.line.items}" var="item">
<div class="form-group">
<label>${item.title}</label>
 
     
        
<c:if test="${item.itemType=='HIDDEN'}">
        ${item.title}	
        <input type="hidden" name="${item.column}" value="${item.value}"/>
</c:if>

<c:if test="${item.itemType=='SHOW'}">
     ${item.value}
</c:if>

        <c:if test="${item.itemType=='TEXT'}">
                                 
        <input class="form-control" type="text" name="${item.column}" value="${item.value}"/>
        <p class="help-block">please input.</p>
        </c:if>
        
      <c:if test="${item.itemType=='RADIO'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="radio" name="${item.column}" value="${sitem.id}"
        <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>
        /> ${sitem.title}
        </c:forEach>
      </c:if>
       
     <c:if test="${item.itemType=='SELECT'}">
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
       
   <c:if test="${item.itemType=='CHECKBOX'}">
        <c:forEach items="${item.selectItems}" var="sitem">
        <input type="checkbox" name="${item.column}" value="${sitem.id}" <c:if test="${sitem.selected==1}">
        checked="checked"
        </c:if>/>
        
        </c:forEach>
        
      </c:if>       
   
 <c:if test="${item.itemType=='FILE'||item.itemType=='FILEIMG'}">
       <c:if test="${item.itemType=='FILEIMG'}">
       <p class="form-control-static">
       	<img width="100" src="${wslconfig.file_url}/${item.value}"/>
       </p>
       </c:if>
   <input type="hidden" name="${item.column}" value="${item.value}" />
   <input type="file" name="_${item.column}" />

</c:if>      
  <c:if test="${item.itemType=='TEXTAREA'}">
                                  
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
            <!-- /.row -->
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

    <!-- Custom Theme JavaScript -->
    <script src="${wslconfig.static_path}dist/js/sb-admin-2.js"></script>



</body>

</html>

