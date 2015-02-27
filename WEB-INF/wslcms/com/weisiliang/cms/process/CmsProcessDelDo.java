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
import com.weisiliang.cms.factory.ConfigWSL;
import com.weisiliang.cms.inter.ItemType;


public class CmsProcessDelDo extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		//获得提交数据
//		Object obj=this.getEditObjFromRequest(request, classobj);
		
		Field field=this.getObjIdField(classobj);
		String idname=field.getName();
		String[] objs=request.getParameterValues(idname+"[]");
		
		super.sessionFactory.getCurrentSession().flush();
		Session session=super.sessionFactory.getCurrentSession();
		
//		System.out.println(session.isOpen()+" "+session.isDirty()+" "+session.isConnected());
		Transaction tx=session.beginTransaction();
		Object arg0;
		for(String obj:objs){
			
			arg0=session.get(classobj,this.parseSer(field.getType(), obj));
			this.removeFile(request, arg0);
			session.delete(arg0);
			
			
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
	
	private void removeFile(HttpServletRequest request,Object obj){
		for (Field fieldsrc:obj.getClass().getDeclaredFields()){
			
		
					if(fieldsrc.getAnnotation(ColumnWSL.class)==null){
						continue;
					}
					try {
						fieldsrc.setAccessible(true);
	
						
						if(fieldsrc.getAnnotation(ColumnWSL.class).inputType()==ItemType.FILE
							||fieldsrc.getAnnotation(ColumnWSL.class).inputType()==ItemType.FILEIMG
						){
						
								this.remove(request, ConfigWSL.getMessage("file_path"), (String)fieldsrc.get(obj));
							
						}
					} catch (Exception e) {
						e.printStackTrace();
					} 
				
			
		}
	}
	
}
