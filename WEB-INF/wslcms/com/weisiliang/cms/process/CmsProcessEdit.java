package com.weisiliang.cms.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.view.TableLine;
import com.weisiliang.cms.view.ViewObj;

public class CmsProcessEdit extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		String idstr=request.getParameter("id");
		if(idstr==null){
			throw new WSLCmsException(" request param id is null");
		}
		Integer id=Integer.parseInt(idstr);

		//getset
		Object respObj = super.sessionFactory.getCurrentSession().get(classobj, id);
		super.sessionFactory.getCurrentSession().flush();
		ViewObj viewObj=new ViewObj();
		viewObj.setLine(new TableLine(super.sessionFactory,respObj));

		modelMap.put("wslViewObj", viewObj);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getHeader("referer"));
		modelMap.put("wslconfig", configwsl);
	}

}
