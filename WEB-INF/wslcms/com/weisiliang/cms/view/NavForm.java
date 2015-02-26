package com.weisiliang.cms.view;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.TableWSL;

/**
 * 表单组件
 * 通过注解生成，用于表现层
 * @author wslhk
 *@deprecated
 */
public class NavForm {
	String action;
	String method;
	ColumnWSL column;
	List<TableItem> formItems;
	Field[] fields;
	TableWSL tablewsl;
	
	public NavForm(){}
	
	public NavForm(SessionFactory sessionFactory,Object obj){
		tablewsl=obj.getClass().getAnnotation(TableWSL.class);
		if(tablewsl==null){
			return;
		}
		
		fields=obj.getClass().getDeclaredFields();
		TableItem item;
//		formItems=new Arra
		for(Field f:fields){
			column=f.getAnnotation(ColumnWSL.class);
			if(column==null){
//				throw new ExceptionWSLCms(f.getName() +" not set "+ColumnWSL.class.getSimpleName());
				continue;
			}
			item=new TableItem(sessionFactory,f,obj);
			this.getFormItems().add(item);
		}
	}
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public List<TableItem> getFormItems() {
		if(formItems==null){
			formItems=new ArrayList<TableItem>();
		}
		return formItems;
	}

	public void setFormItems(List<TableItem> formItems) {
		this.formItems = formItems;
	}
	
	
	
}
