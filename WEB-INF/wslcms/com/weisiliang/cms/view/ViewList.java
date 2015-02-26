package com.weisiliang.cms.view;

import org.hibernate.SessionFactory;


public class ViewList {
//	String title;
	
	//筛选表单
	TableLine navForm;
	
	//内容列表
	TableList tableList;
	
	//对象名称，用于设置url使用
	String objName;

//	public ViewList(){};
	public ViewList(SessionFactory sessionFactory,Object obj){
		this.navForm=new TableLine(sessionFactory,obj);
		this.objName=obj.getClass().getSimpleName();
	}
	
//	public String getTitle() {
//		return title;
//	}
//
//	public void setTitle(String title) {
//		this.title = title;
//	}

	public TableLine getNavForm() {
		return navForm;
	}

	public void setNavForm(TableLine navForm) {
		this.navForm = navForm;
	}
	public TableList getTableList() {
		return tableList;
	}
	public void setTableList(TableList tableList) {
		this.tableList = tableList;
	}
	public String getObjName() {
		return objName;
	}
	public void setObjName(String objName) {
		this.objName = objName;
	}
	

	
}
