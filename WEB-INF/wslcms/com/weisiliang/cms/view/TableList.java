package com.weisiliang.cms.view;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;






import org.hibernate.SessionFactory;

import com.weisiliang.cms.annotation.ColumnWSL;


/**
 * 返回的集合
 * @author wslhk
 *
 */
public class TableList {
	
	List<TableLine> lines;
	
	List<TableItem> columns;//列名
	
	int count;
	
	
	public TableList(){}
	
	public TableList(SessionFactory sessionFactory,Class<?> objclass,int count,List<?> list){
//		TableWSL tablewsl=objclass.getAnnotation(TableWSL.class);
//		if(tablewsl==null){
//			return;
//		}
		Field[] fields=objclass.getDeclaredFields();
		TableItem item;
//		formItems=new Arra
		for(Field f:fields){
			ColumnWSL column=f.getAnnotation(ColumnWSL.class);
			if(column==null){
//				throw new ExceptionWSLCms(f.getName() +" not set "+ColumnWSL.class.getSimpleName());
				continue;
			}
			item=new TableItem(f);
			this.getColumns().add(item);
		}
		this.init(sessionFactory,count, list);
		
	}
	public TableList(SessionFactory sessionFactory ,int count,List<?> list){
		this.init(sessionFactory,count, list);
	}
	
	private void init(SessionFactory sessionFactory,int count,List<?> list){
		
		this.count=count;

		TableLine tbline;
		for(Object o:list){
			tbline=new TableLine(sessionFactory,o);
			this.getLines().add(tbline);
		}
		
		
	}
	
	public void setCount(int count) {
		this.count = count;
	}

	public int getCount() {
		return count;
	}



	public List<TableLine> getLines() {
		if(lines==null){lines=new ArrayList<TableLine>();}
		return lines;
	}

	public void setLines(List<TableLine> lines) {
		this.lines = lines;
	}

	public List<TableItem> getColumns() {
		if(columns==null){
			columns=new ArrayList<TableItem>();
		}
		return columns;
	}

	public void setColumns(List<TableItem> columns) {
		this.columns = columns;
	}

	
	
}
