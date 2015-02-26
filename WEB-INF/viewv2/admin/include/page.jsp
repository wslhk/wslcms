<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ include file="../../include_page/jstl.jsp"%>
<c:if test="${pag!=null}">
    <div class='tablenav-pages'><span class="displaying-num">${pag.rsall} 个项目</span>
    <a class='first-page disabled' title='前往第一页' href='${pag.firstpage.href}'>&laquo;</a>
    <a class='prev-page disabled' title='前往上一页' href='${pag.prevpage.href}'>&lsaquo;</a>
    
    <span class="paging-input">第 <input class='current-page' title='当前页面' type='text' name='p' value='${pag.pagenow}' size='2' readonly="readonly" /> 页，共 <span class='total-pages'>${pag.pageall}</span> 页</span>
    
    <a class='next-page' title='前往下一页' href='${pag.nextpage.href}'>&rsaquo;</a>
    <a class='last-page' title='前往最后一页' href='${pag.lastpage.href}'>&raquo;</a></div>
</c:if>
<c:if test="${pag!=null}">
<!--
<div class="dataTables_paginate paging_two_button" id="AppList_paginate" ><div class="paginate_disabled_next" title=" 下一页 " id="AppList_next"></div><div class="paginate_disabled_previous" title=" 上一页 " id="AppList_previous"></div><span class="paginate_page">当前第 </span><select style="display: inline;"><option value="1">1</option></select><span class="paginate_of"> 页,共 1 页&nbsp;</span></div>
-->
</c:if>