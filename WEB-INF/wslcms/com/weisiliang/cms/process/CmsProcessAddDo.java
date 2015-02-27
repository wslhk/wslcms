package com.weisiliang.cms.process;

import java.lang.reflect.Field;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;


public class CmsProcessAddDo extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		//获得提交数据
		Object obj=this.getObjFromRequest(request, classobj);
		Transaction tx1;
		//getset
		Object respObj;
		Session session;
		try {
			respObj = classobj.newInstance();
		
		
			Field fieldsearch=null;
			//设置被设置的属性
			for (Field fieldsrc:respObj.getClass().getDeclaredFields()){
//				for (Field fieldsearch:obj.getClass().getDeclaredFields()){
				if(fieldsrc.getAnnotation(ColumnWSL.class)==null){
					continue;
				}
				
		
					fieldsearch=obj.getClass().getDeclaredField(fieldsrc.getName());
					fieldsrc.setAccessible(true);
					fieldsearch.setAccessible(true);
					
					if(fieldsrc.getAnnotation(ColumnWSL.class).defaultData()==ColumnWSL.DefaultData.DATE_NOW){
						fieldsrc.set(respObj, new Date());
						continue;
					}
					
					if(fieldsearch.get(obj)!=null){
						
						fieldsrc.set(respObj, fieldsearch.get(obj));
					}

			}
			
			
	//		this.sessionFactory.getCurrentSession().
			super.sessionFactory.getCurrentSession().flush();
			session=super.sessionFactory.getCurrentSession();
//			System.out.println(session.isConnected());
			tx1 = session.beginTransaction();
			session.save(respObj);
			tx1.commit();
		
		} catch (Exception e) {
			throw new WSLCmsException(e);
		} finally{
			respObj=null;
		}
		modelMap.put("wslViewObj", null);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getParameter("referer"));
		modelMap.put("wslconfig", configwsl);
	}
	
}
