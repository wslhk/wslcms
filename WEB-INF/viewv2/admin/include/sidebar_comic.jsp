<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %><%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="sidebar">

		<ul class="sidenav">
<sec:authorize ifAllGranted="ROLE_EDITER">
			<li id="snav_oabalance"><a href="comic.action">漫画</a></li>
            <li id="snav_oabalance"><a href="message.action">消息</a></li>
           <li id="snav_oabalance"><a href="media.action">多媒体文件</a></li>
            <li id="snav_dc" class=""><a href="mediagroup.action">多媒体分组</a></li>
            
            <li id="snav_dc" class=""><a href="fh_import.action">漫画导入</a></li>
             <li id="snav_oabalance"><a href="ad.action?type=1">应用推荐</a></li> 
              <li id="snav_oabalance"><a target="_blank" href="fh_check_new.action">检查更新更新</a></li> 
              
               <li id="snav_oabalance"><a href="special.action">专题</a></li>
               <li id="snav_oabalance"><a href="comic_store.action">商店中的漫画</a>
               </li>  
               <li id="snav_oabalance"><a href="../store_update_wp.action">更新商店信息</a>
               </li>   

               
</sec:authorize>
<sec:authorize ifAllGranted="ROLE_ADMIN">
   <li id="snav_oabalance"><a href="comic_language.action">漫画发布</a></li>
   <li id="snav_oabalance"><a href="product.action">商品</a></li>  
    <li id="snav_oabalance"><a href="special.action?language=1&view=1">专题</a></li>   
    <li id="snav_oabalance"><a href="view.action">视图</a></li>
    
   
          
</sec:authorize>
            
			<!--<li id="snav_dc" class=""><a href="comic_new.action">增加漫画</a></li>
			<li id="snav_man" class=""><a href="#put_manage_app">广告</a></li>
			<li id="snav_set" class=""><a href="#put_set_app">投放设置</a></li>
			<li id="snav_down" class=""><a href="#down_sdk_app">下载SDK</a></li>-->
		</ul>
        
       
	</div>