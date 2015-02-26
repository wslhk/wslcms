package com.weisiliang.cms.factory;

public class CmsView {
	String viewName;
	public CmsView(String action){
//		String action=request.getParameter("wslact");
		String viewPath=ConfigWSL.getMessage("view_path");
		if(viewPath==null){
			viewPath="wslcms";
		}
		viewName= viewPath+"/"+action;
	}
	/**
	 * spring view path
	 * @return
	 */
	public String getViewName() {
		return viewName;
	}
	public void setViewName(String viewName) {
		this.viewName = viewName;
	}
	
	
}
