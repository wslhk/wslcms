package com.weisiliang.cms.process;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.criterion.Example;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;

import org.springframework.ui.ModelMap;

import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.inter.Pag;

import com.weisiliang.cms.view.TableList;
import com.weisiliang.cms.view.ViewList;


public class CmsProcessList extends CmsProcessBase implements CmsProcess{


	
	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		TableWSL tablewsl=classobj.getAnnotation(TableWSL.class);
		if(tablewsl==null){
			throw new WSLCmsException(classobj.getName()+" not set "+TableWSL.class.getSimpleName());
		}
	
		Object obj=this.getSearchObjFromRequest(request, classobj);
		//getset
		
		Integer pageNo=(request.getParameter("p")==null||request.getParameter("p").equals(""))
				?1:Integer.parseInt(request.getParameter("p"));
		
		int pageSize=10;
		int firstResult=(pageNo - 1) * pageSize;
		
		//执行查询
        Long totalCount = (Long)( super.sessionFactory.getCurrentSession()
        		.createCriteria(obj.getClass()).add(
        				 Example.create(obj)).setProjection(Projections.rowCount())
        		.uniqueResult());
        
        Pag pag=new Pag(request);
        pag.setRsall(totalCount.intValue());
        pag.setPagelength(tablewsl.pagesize());
        
        List<?> list = super.sessionFactory.getCurrentSession()
				.createCriteria(obj.getClass()).setFirstResult(firstResult).setMaxResults(pageSize).add(
			 Example.create(obj)).addOrder(Property.forName(tablewsl.orderby()).desc()).list();
        
      
//        NewPager newPager=new NewPager(totalCount,);
//        criteria.setFirstResult((pageNo - 1) * pageSize);
//		criteria.setMaxResults(pageSize);
        
        super.sessionFactory.getCurrentSession().flush();
		ViewList view=new ViewList(super.sessionFactory,obj);
		view.setTableList(new TableList(super.sessionFactory,totalCount.intValue(),list));
//		view.setTitle(tablewsl.title());
		
//		pag.getFirstpage().getHref()
		modelMap.put("pager", pag);
		modelMap.put("wslViewList", view);
		modelMap.put("listTable", listTable);
		modelMap.put("wslconfig", configwsl);
	}


}
