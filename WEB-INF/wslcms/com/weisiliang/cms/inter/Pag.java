package com.weisiliang.cms.inter;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

public class Pag  implements java.io.Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
int pageall=0;//共多少页
int pagenow=1;//现在第几页
int pagelength=0;//每页多少条

int rsall=0;//总条目数
int rsfirst=0;//本页起始条目
int rsprev=0;//上一页开始记录
int rsnext=0;//下一页开始记录
int rsto=0;
int limit=0;

List<Pag> listpage;
//Page prevpage=null;
//Page nextpage=null;
boolean selected=false;

int length=5;//分页显示页号的数量

String href="#";//超链接
@SuppressWarnings("rawtypes")
Map pmap=null;//paramMap;//保存超链接中的参数
public Pag(){
	
}

public Pag(HttpServletRequest request){
//	int rs=0;
	//int p=0;
	if(request==null)return;
	if(request.getParameter("p")!=null){
		
		try{
			pagenow=Integer.parseInt(request.getParameter("p"));
			
//			this.pagenow=pagenow;
		}catch(Exception e){
			
		}
	}else{
		pagenow=1;
	}

	pmap=request.getParameterMap();
	
	href=request.getRequestURI().toString();
}

public int getPagenow() {
//	if(rsfirst==0)return 1;
//	else
//	pagenow=rsfirst/pagelength+1;
//	return this.rsfirst/this.pagelength;
	return this.pagenow;
}
public void setPagenow(int page) {
	this.pagenow = page;
}
public int getPageall() {
	if(rsall==0||pagelength==0)return 0;
	 if(rsall%pagelength==0){
	    	pageall=rsall/pagelength;//共多少页
	    }else{
	    	pageall=rsall/pagelength+1;
	    }
	return pageall;
}
@SuppressWarnings("unused")
private void setPageall(int pageall) {
	this.pageall = pageall;
}
public int getPagelength() {
	return pagelength;
}
public void setPagelength(int pagelength) {
	this.pagelength = pagelength;
}
public int getRsall() {
	return rsall;
}
public void setRsall(int srsallall) {
	this.rsall = srsallall;
}
public int getRsfirst() {
	return (pagenow-1)*pagelength;
//	return rsfirst;
}
private void setRsfirst(int rsfirst) {
	this.rsfirst = rsfirst;
}
public int getRsnext() {
	rsnext=rsfirst+pagelength;
	if(rsnext>rsall){
    	rsnext=rsfirst;
    }
	return rsnext;
}
@SuppressWarnings("unused")
private void setRsnext(int rsnext) {
	this.rsnext = rsnext;
}
public int getRsprev() {
	rsprev=(rsfirst-pagelength);
    if(rsprev<0){rsprev=0;}
	return rsprev;
}
@SuppressWarnings("unused")
private void setRsprev(int rsprev) {
	this.rsprev = rsprev;
}
public int getLimit() {
	limit=pagelength;
	if(rsall-rsfirst<pagelength){
		//System.out.println(rsnext+"."+rsall+"."+limit);
		limit=rsall-getRsnext();
		//System.out.println(limit);
	}
	return limit;
}
//public int getRsto(int topage){
//	rsto=(topage)*pagelength;
//	return rsto;
//}
@SuppressWarnings({ "unchecked", "rawtypes" })
public List<Pag> getListpage(){
	
	listpage=new ArrayList();
	Pag page=null;
	int beginrs=0;
	int overrs=0;
	int groupnum=0;//在第几组中

	try{
		groupnum=this.getRsfirst()/(this.pagelength*length);
		
		beginrs=groupnum*this.pagelength*length;
		
	//begin=this.getPagenow()-(this.getPagenow()==(length)?length:(this.getPagenow()%length));
		
		overrs=beginrs+(this.pagelength*length);
	
	//System.out.println("groupnum:+"+groupnum+" 当前:"+this.getRsfirst()+"  长度:"+length+" 开始:"+beginrs+" 结束:"+overrs);
	if(overrs>this.getRsall()){
		overrs=this.getRsall();
	}

	for(int i=beginrs;i<overrs;i+=this.pagelength){
		//if(page<length){
		page=new Pag();
		page.setRsall(this.rsall);
		page.setPagelength(this.pagelength);
		page.setRsfirst(i);
		
//		page.setPagenow(i);
		page.setHref(this.href);
		page.pmap=this.pmap;
		
		if(page.getRsfirst()==this.getRsfirst()){
			page.selected=true;
		}
		
		listpage.add(page);

	}

	}catch(Exception e){
		System.out.print(e.getMessage());
	}
	return listpage;
}


public String getHref() {
//		if(href.indexOf("${page}")!=-1){
//			return href.replace("${page}", ""+this.getPagenow());
//		}
	String parm=null;
	if(pmap!=null){
		@SuppressWarnings("rawtypes")
		Set pset=pmap.keySet();
		@SuppressWarnings("rawtypes")
		Iterator pit=pset.iterator();
		String key=null;
		String value=null;
		while(pit.hasNext()){
			key=(String)pit.next();
			value=((String[])pmap.get(key))[0];
			if(key.equals("p")){
				//value=this.getRsfirst()+"";
				continue;
			}
			try {
				value=new String(value.getBytes("iso-8859-1"),"utf-8");
				if(parm==null){
					
						parm="?"+key+"="+URLEncoder.encode(value,"utf-8");
					
				}else{
					parm+="&"+key+"="+URLEncoder.encode(value,"utf-8");
				}
			} catch (UnsupportedEncodingException e) {

				e.printStackTrace();
			}
		}
		if(parm==null){
			parm="?p="+this.getPagenow();
		}else{
			parm+="&p="+this.getPagenow();
		}
		return (href+parm).replace("//", "/");
	}
	
		return (href).replace("//","/");

	
	//return href;
}
private void setHref(String href) {
	this.href = href;	
}




public Pag getNextpage() {
	Pag page=new Pag();
	page.setHref(href);
	page.pmap=pmap;
	page.setRsall(rsall);
	page.setPagelength(pagelength);
//	page.setRsfirst(getRsnext());
//	page.setPagenow(pagenow);
	if(this.getPagenow()+1>this.getPageall()){
		page.setPagenow(this.getPageall());
	}else{
		page.setPagenow(this.getPagenow()+1);
	}
	return page;
}




public Pag getPrevpage() {

	Pag page=new Pag();
	page.setHref(href);
	page.setRsall(rsall);
	page.pmap=pmap;
	page.setPagelength(pagelength);
//	page.setRsfirst(getRsprev());
	if(this.getPagenow()>1){
		page.setPagenow(pagenow-1);
	}else{
		page.setPagenow(1);
	}
	
	return page;
}

public Pag getFirstpage() {
	Pag page=new Pag();
	page.setHref(href);
	page.pmap=pmap;
	page.setRsall(rsall);
	page.setPagelength(pagelength);
	page.setPagenow(1);
	
	return page;
}

public Pag getLastpage() {
	Pag page=new Pag();
	page.setHref(href);
	page.pmap=pmap;
	page.setRsall(rsall);
	page.setPagelength(pagelength);
	page.setPagenow(this.getPageall());
	
	return page;
}



/**
 * 创造副本
 * @return
 */
@SuppressWarnings("unused")
private Pag clonethis(){
	Pag page=new Pag();
	page.setHref(href);
	page.setRsall(rsall);
	page.setPagelength(pagelength);
	page.setPagenow(pagenow);
	return page;
}
public boolean isSelected() {
	return selected;
}

public static void main(String[] args){
///	pageall=rsall/pagelength;//共多少页
//}else{
//	pageall=rsall/pagelength+1;
	System.out.println(9%10);
}

}
