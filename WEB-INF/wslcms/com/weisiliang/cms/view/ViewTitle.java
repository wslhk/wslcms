package com.weisiliang.cms.view;

import com.weisiliang.cms.annotation.TableWSL;

public class ViewTitle {
	
	public ViewTitle(Class<?> clas){
		if(clas==null){
			return ;
		}
		TableWSL tablewsl=(TableWSL)clas.getAnnotation(TableWSL.class);
		if(tablewsl!=null){
			this.title=tablewsl.title();
		}
		this.className=clas.getSimpleName();
		
//		this.url=
	}
	
	String title;
	
//	String url;
	
	String className;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

//	public String getUrl() {
//		return url;
//	}
//
//	public void setUrl(String url) {
//		this.url = url;
//	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
//	TableLine line;

//	public String getTitle() {
//		return title;
//	}
//
//	public void setTitle(String title) {
//		this.title = title;
//	}
//
//	public TableLine getLine() {
//		return line;
//	}
//
//	public void setLine(TableLine line) {
//		this.line = line;
//	}
	
	
}
