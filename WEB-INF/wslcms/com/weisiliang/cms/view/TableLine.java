package com.weisiliang.cms.view;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Id;

import org.hibernate.SessionFactory;

import com.weisiliang.cms.annotation.ColumnWSL;

/**
 * 列表中的对象，用户表格输出
 * @author wslhk
 *
 */
public class TableLine {
	//输出内容，字符串格式
	List<TableItem> items;
	
	//主键
	TableItem objId;

	public TableLine(){};
	public TableLine(SessionFactory sessionFactory,Object obj){
		//格式化输出
		TableItem item;
		Field[] fields=obj.getClass().getDeclaredFields();
		for(Field f:fields){
			if(f.getAnnotation(ColumnWSL.class)==null){continue;}
			item=new TableItem(sessionFactory,f,obj);
			this.getItems().add(item);
			
			if(f.getAnnotation(Id.class)!=null){
				objId=item;
			}
		}
	
	}
	
//	public TableLine(Class obj){
//		//格式化输出
//		TableItem item;
//		Field[] fields=obj.getDeclaredFields();
//		for(Field f:fields){
//			if(f.getAnnotation(ColumnWSL.class)==null){continue;}
//			item=new TableItem(f);
//			
//			this.getItems().add(item);
//			
//			if(f.getAnnotation(Id.class)!=null){
//				objId=item;
//			}
//		}
//	
//	}
	public List<TableItem> getItems() {
		if(this.items ==null){
			this.items =new ArrayList<TableItem>();
		}
		return items;
	}


	public void setItems(List<TableItem> items) {
		this.items = items;
	}
	public TableItem getObjId() {
		return objId;
	}
	public void setObjId(TableItem objId) {
		this.objId = objId;
	}
	
//	public void initMultiselect(Field field,Object obj){
//		field.setAccessible(true);
//		ColumnWSL columnWsl=field.getAnnotation(ColumnWSL.class);
//		
//		try {
//			if(columnWsl.inputType()==ColumnWSL.INPUT_TYPE.RADIO
////					||columnWsl.inputType()==ColumnWSL.INPUT_TYPE.CHECKBOX
//					||columnWsl.inputType()==ColumnWSL.INPUT_TYPE.SELECT
//					){
//				
//				//list
//				//获得关联字段
//				String selectId=columnWsl.selectId();
//			
//				
//				//获得列表
//				Class testclass=obj.getClass();
//				Field selectField=obj.getClass().getDeclaredField(selectId);;
//				selectField.setAccessible(true);
//				Object objList=selectField.get(obj);
//				if(objList==null){
//					return;
//				}
//				if(List.class.isAssignableFrom(objList.getClass())){
//					SelectItem itemObj;
//					for(Object item:(List)objList){
//						itemObj=new SelectItem(item);
//						
//						
//						if(field.get(obj)!=null&&field.get(obj).toString().equals(itemObj.getId())){
//							itemObj.setSelected(1);
//						}
//						
//						
//						this.getSelectItems().add(itemObj);
//					}
//				}
//				
////				this.getSelectItems().add(new SelectItem());
//				
////				this.itemType=ITEM_TYPE.RADIO.toString();
//				
//				
//				
//			}else if(columnWsl.inputType()==ColumnWSL.INPUT_TYPE.CHECKBOX){
//				//获得关联字段
//				String selectId=columnWsl.selectId();
//			
//				
//				//获得列表
//				Class testclass=obj.getClass();
//				Field selectField=obj.getClass().getDeclaredField(selectId);;
//				selectField.setAccessible(true);
//				Object objList=selectField.get(obj);
//				
//				String[] args=new String[0];
//				if(field.get(obj)!=null){
//					args=field.get(obj).toString().split(",");
//				}
//				
//				
//				if(List.class.isAssignableFrom(objList.getClass())){
//					SelectItem itemObj;
//					for(Object item:(List)objList){
//						itemObj=new SelectItem(item);
//						for(String sitem:args){
//							if(sitem.toString().equals(itemObj.getId())){
//								itemObj.setSelected(1);
//								break;
//							}
//						}
//						this.getSelectItems().add(itemObj);
//					}
//				}
//				
//			}else{
//				
////				this.itemType=ITEM_TYPE.TEXT.toString();
//			}
//			
//			value=field.get(obj)==null?"":field.get(obj).toString();
//		} catch (Exception e) {
//	
//			e.printStackTrace();
//		} 
		
//	}
	
}
