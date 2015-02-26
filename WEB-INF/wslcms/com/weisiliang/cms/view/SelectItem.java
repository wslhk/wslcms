package com.weisiliang.cms.view;

import java.lang.reflect.Field;


import com.weisiliang.cms.annotation.SelectIdWSL;
import com.weisiliang.cms.annotation.SelectTitleWSL;

/**
 * 备选选项
 * id,value
 * @author wslhk
 *
 */
public class SelectItem {
	
	String id;
	String title;
	
	Integer selected;
	
	public SelectItem(){}
	
	public SelectItem(Object obj){
			
		Field[] fields=obj.getClass().getDeclaredFields();
		SelectIdWSL selectIdWSL;
		SelectTitleWSL selectTitleWSL;
		for(Field field:fields){
			field.setAccessible(true);
			selectIdWSL=field.getAnnotation(SelectIdWSL.class);
			selectTitleWSL=field.getAnnotation(SelectTitleWSL.class);
			
			if(selectIdWSL!=null){
				try {
					Object idval=field.get(obj);
					this.id=idval.toString();
				} catch (Exception e) {
					
					e.printStackTrace();
				} 
			}else if(selectTitleWSL!=null){
				try {
					this.title=field.get(obj).toString();
				} catch (Exception e) {
					
					e.printStackTrace();
				} 
			}
			
		}

	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
	}
	
}
