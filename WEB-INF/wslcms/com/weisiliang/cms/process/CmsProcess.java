package com.weisiliang.cms.process;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.ui.ModelMap;

import com.weisiliang.cms.exception.WSLCmsException;

public interface CmsProcess {
	
//	@Autowired
	SessionFactory sessionFactory=null;
	
	public void setSessionFactory(SessionFactory sessionFactory);
	
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap,Class<Object> classobj)  throws WSLCmsException;
}
