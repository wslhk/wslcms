package com.weisiliang.cms.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;


import com.weisiliang.cms.exception.WSLCmsException;


public class CmsProcessIndex extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
//		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
//		if(tablewsl==null){
//			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
//		}
//		
//
//
//		ViewObj viewObj=new ViewObj();
//		try {
//			viewObj.setLine(new TableLine(super.sessionFactory,classobj.newInstance()));
//		} catch (InstantiationException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (IllegalAccessException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

//		modelMap.put("wslViewObj", viewObj);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getHeader("referer"));
		modelMap.put("wslconfig", configwsl);
	}

}
