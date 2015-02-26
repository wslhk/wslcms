package com.weisiliang.cms.process;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.view.TableLine;
import com.weisiliang.cms.view.TableList;
import com.weisiliang.cms.view.ViewObj;

public class CmsProcessBatchEdit extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
		
		Field field=this.getObjIdField(classobj);
		String idname=field.getName();
		String[] objs=request.getParameterValues(idname+"[]");
//		request.getParameterValues(arg0)
		
//		List<?> delojb=new ArrayList();
		List<Object> list=new ArrayList<Object>();
		
		
		if(objs!=null)
			for(String obj:objs){
				Object arg0=super.sessionFactory.getCurrentSession().get(classobj,this.parseSer(field.getType(), obj));
//				this.sessionFactory.getCurrentSession().delete(arg0);
//				List<Ad> ads=((Tag)arg0).getAds();
//				System.out.println(ads);
				list.add(arg0);
			}
	


		
			TableList tableList=new TableList(super.sessionFactory,classobj,list.size(),list);
		
			//
			ViewObj viewObj=new ViewObj();
			try {
				viewObj.setLine(new TableLine(super.sessionFactory,classobj.newInstance()));
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			modelMap.put("wslViewObj", viewObj);

		modelMap.put("wslTableList", tableList);
		modelMap.put("listTable", listTable);
		modelMap.put("referer", request.getHeader("referer"));
		modelMap.put("wslconfig", configwsl);
	}

}
