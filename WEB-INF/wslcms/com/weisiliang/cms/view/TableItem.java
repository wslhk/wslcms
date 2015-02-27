package com.weisiliang.cms.view;

import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;






import javax.persistence.GeneratedValue;






import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.inter.ItemType;



/**
 * 子单元
 * @author wslhk
 *
 */
public class TableItem {
//	enum ITEM_TYPE{CHECKBOX,RADIO,TEXT,SELECT,HIDDEN,FILE,TEXTAREA,SHOW};
	//类型
		String itemType;
	//输出内容，字符串格式
	String value;
	String title;
	String column;
	SessionFactory sessionFactory;

		List<SelectItem> selectItems;
		
		ColumnWSL annotation;

	public TableItem(){};
	public TableItem(SessionFactory sessionFactory,Field field,Object obj){
		this.sessionFactory=sessionFactory;
		this.initField(field);
		
		this.initFieldValue(field, obj);
	
	}
	public TableItem(Field field){
		
		this.initField(field);
	
	}
	
	public void initField(Field field){
		ColumnWSL columnWsl=field.getAnnotation(ColumnWSL.class);
		if(columnWsl==null){
			return;
		}
		this.annotation=columnWsl;
		
		GeneratedValue generatedValue=field.getAnnotation(GeneratedValue.class);
		
		field.setAccessible(true);
		//格式化
		try {
//			value=field.get(obj)==null?"":field.get(obj).toString();
			
			title=columnWsl==null?"":columnWsl.name();
			column=field.getName();

			if(generatedValue!=null){
				this.itemType=ItemType.HIDDEN.toString();
			}else{
				this.itemType=columnWsl.inputType().toString();
			}
			
		} catch (IllegalArgumentException e) {
	
			e.printStackTrace();
		}
	
	}
	
	
	
	public void initFieldValue(Field field,Object obj){
		ColumnWSL columnWsl=field.getAnnotation(ColumnWSL.class);
		if(columnWsl==null){
			return;
		}
		field.setAccessible(true);
	
			try {
				if(columnWsl.inputType()==ItemType.RADIO
//						||columnWsl.inputType()==ColumnWSL.INPUT_TYPE.CHECKBOX
						||columnWsl.inputType()==ItemType.SELECT
						){
					
					if(columnWsl.targetEntity()!=Object.class){
						this.setManyToOne(columnWsl, obj, field);
					}else{
						this.setSelectInner(columnWsl, obj, field);
					}
					
					
				}else if(columnWsl.inputType()==ItemType.CHECKBOX){
					//获得关联字段
					String selectId=columnWsl.selectId();
				
					
					//获得列表
//					Class testclass=obj.getClass();
					Field selectField=obj.getClass().getDeclaredField(selectId);;
					selectField.setAccessible(true);
					Object objList=selectField.get(obj);
					
					String[] args=new String[0];
					if(field.get(obj)!=null){
						args=field.get(obj).toString().split(",");
					}
					
					
					if(List.class.isAssignableFrom(objList.getClass())){
						SelectItem itemObj;
						for(Object item:(List<?>)objList){
							itemObj=new SelectItem(item);
							for(String sitem:args){
								if(sitem.toString().equals(itemObj.getId())){
									itemObj.setSelected(1);
									break;
								}
							}
							this.getSelectItems().add(itemObj);
						}
					}
					
					args=null;
					
				}else{
					
//					this.itemType=ITEM_TYPE.TEXT.toString();
				}
				if(Date.class.isAssignableFrom(field.getType())){
					DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					  String reTime = format2.format(field.get(obj));
					  format2=null;
					value=reTime;
					return;
				}
				value=field.get(obj)==null?"":field.get(obj).toString();
			} catch (Exception e) {
		
				e.printStackTrace();
			} 
			
			
		
	
	}
	
	/**
	 * 设置内部关联
	 * @param columnWsl
	 * @param obj
	 * @param field
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	private void setSelectInner(ColumnWSL columnWsl,Object obj,Field field) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException{
		//list
		//获得关联字段
		String selectId=columnWsl.selectId();
	
		
		//获得列表
//		Class testclass=obj.getClass();
		Field selectField=obj.getClass().getDeclaredField(selectId);;
		selectField.setAccessible(true);
		Object objList=selectField.get(obj);
		if(objList==null){
			return;
		}
		if(List.class.isAssignableFrom(objList.getClass())){
			SelectItem itemObj;
			for(Object item:(List<?>)objList){
				itemObj=new SelectItem(item);
				
				
				if(field.get(obj)!=null&&field.get(obj).toString().equals(itemObj.getId())){
					itemObj.setSelected(1);
				}
				
				
				this.getSelectItems().add(itemObj);
			}
		}
//		else if(Set.class.isAssignableFrom(objList.getClass())){
//			Object objj=null;
//			try {
//				objj=obj.getClass().getMethod("getTags", null).invoke(obj, null);
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			System.out.println(objj+" "+((Set)objj).size());
//			SelectItem itemObj;
//			for(Object item:(Set)objList){
//				itemObj=new SelectItem(item);
//				
//				
//				if(field.get(obj)!=null&&field.get(obj).toString().equals(itemObj.getId())){
//					itemObj.setSelected(1);
//				}
//				
//				
//				this.getSelectItems().add(itemObj);
//			}
//		}
		
		
	}
	
	//读取多对一
	private void setManyToOne(ColumnWSL columnWsl,Object obj,Field field) throws NoSuchFieldException, SecurityException, IllegalArgumentException, IllegalAccessException, HibernateException, InstantiationException{
		//获得关联字段
//				String selectId=columnWsl.selectId();
			
//				ManyToOne mto=obj.getClass().getAnnotation(ManyToOne.class);
				
				Class<?> clas=columnWsl.targetEntity();
				if(clas==Object.class){
					return;
				}
				
				List<?> objList=this.sessionFactory.getCurrentSession().createCriteria(clas)
						.add(
						 Example.create(clas.newInstance()))
						 .list();
						
				//获得列表
//				Class testclass=obj.getClass();
//				Field selectField=obj.getClass().getDeclaredField(selectId);;
//				selectField.setAccessible(true);
//				Object objList=selectField.get(obj);
				if(objList==null){
					return;
				}
				if(List.class.isAssignableFrom(objList.getClass())){
					SelectItem itemObj;
					for(Object item:(List<?>)objList){
						itemObj=new SelectItem(item);
						
						
						if(field.get(obj)!=null&&field.get(obj).toString().equals(itemObj.getId())){
							itemObj.setSelected(1);
						}
						
						
						this.getSelectItems().add(itemObj);
					}
				}
	}

	
	
	public String getValue() {
		return value;
	}
	public void setValue(String val) {
		this.value = val;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColumn() {
		return column;
	}
	public void setColumn(String name) {
		this.column = name;
	}
	public String getItemType() {
		return itemType;
	}
	public void setItemType(String itemType) {
		this.itemType = itemType;
	}
	public List<SelectItem> getSelectItems() {
		if(selectItems==null){
			selectItems=new ArrayList<SelectItem>();
		}
		return selectItems;
	}
	public void setSelectItems(List<SelectItem> selectItems) {
		this.selectItems = selectItems;
	}
	public ColumnWSL getAnnotation() {
		return annotation;
	}
	public void setAnnotation(ColumnWSL annotation) {
		this.annotation = annotation;
	}
	

	
}
