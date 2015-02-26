package com.weisiliang.cms.process;

import java.io.Serializable;
import java.lang.reflect.Field;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;


public class CmsProcessEditDo extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		//获得提交数据
		Object obj=this.getObjFromRequest(request, classobj);
		
		
		
		
		String idstr=request.getParameter("id");
		if(idstr==null){
			throw new WSLCmsException(" request param id is null");
		}
//		Integer id=Integer.parseInt(idstr);

//		System.out.println(classobj.getName());
		//getset
		Serializable ser=super.getObjId(obj);
		Object respObj = super.sessionFactory.getCurrentSession().get(classobj, ser);
		
		//设置被设置的属性
		for (Field fieldsrc:respObj.getClass().getDeclaredFields()){
			for (Field fieldsearch:obj.getClass().getDeclaredFields()){
				if(fieldsrc.getName().equals(fieldsearch.getName())){
					if(fieldsrc.getAnnotation(ColumnWSL.class)==null||fieldsearch.getAnnotation(ColumnWSL.class)==null){
						continue;
					}
					try {
						fieldsrc.setAccessible(true);
						fieldsearch.setAccessible(true);
						if(fieldsearch.get(obj)!=null){
							fieldsrc.set(respObj, fieldsearch.get(obj));
//							if(fieldsrc.getType()==String.class){
//								fieldsrc.set(respObj);
//							}
						}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		
//		this.sessionFactory.getCurrentSession().
		super.sessionFactory.getCurrentSession().flush();
		Session session=super.sessionFactory.getCurrentSession();
		System.out.println(session.isConnected());
		Transaction tx1 = session.beginTransaction();
		session.update(respObj);
		tx1.commit();
		

		modelMap.put("wslViewObj", null);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getParameter("referer"));
		modelMap.put("wslconfig", configwsl);
	}
	
}
