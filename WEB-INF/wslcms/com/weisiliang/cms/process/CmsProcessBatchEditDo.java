package com.weisiliang.cms.process;


import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;


public class CmsProcessBatchEditDo extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		//获得提交数据
				Object objEdit=this.getObjFromRequest(request, classobj);
		
		Field field=this.getObjIdField(classobj);
		String idname=field.getName();
		String[] objs=request.getParameterValues(idname+"[]");
		
		super.sessionFactory.getCurrentSession().flush();
		Session session=super.sessionFactory.getCurrentSession();
		
//		System.out.println(session.isOpen()+" "+session.isDirty()+" "+session.isConnected());
		Transaction tx=session.beginTransaction();
		Object arg0;
		Field fieldSrc;
		for(String obj:objs){
			
			arg0=session.get(classobj,this.parseSer(field.getType(), obj));
			
			for(Field fieldEdit:objEdit.getClass().getDeclaredFields()){
				ColumnWSL columnWsl=fieldEdit.getAnnotation(ColumnWSL.class);
				
				if(columnWsl!=null&&columnWsl.batchUpdate()){
					try {
						fieldSrc=arg0.getClass().getDeclaredField(fieldEdit.getName());
						if(fieldSrc==null){
							continue;
						}
						fieldSrc.setAccessible(true);
						fieldEdit.setAccessible(true);
						fieldSrc.set(arg0, fieldEdit.get(objEdit));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
			
			session.update(arg0);
			
			
		}
		tx.commit();
		arg0=null;
		objs=null;
		field=null;
		idname=null;
		session.flush();

		
		modelMap.put("wslViewObj", null);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getParameter("referer"));
		modelMap.put("wslconfig", configwsl);
	}
	
}
