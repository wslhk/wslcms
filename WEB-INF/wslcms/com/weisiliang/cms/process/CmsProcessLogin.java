package com.weisiliang.cms.process;

import java.io.IOException;
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
import com.weisiliang.cms.factory.CmsFactoryImpl;
import com.weisiliang.cms.factory.ConfigWSL;


public class CmsProcessLogin extends CmsProcessBase implements CmsProcess{

	@Override
	public void process(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap, Class<Object> classobj) throws WSLCmsException{
		
		
//		String username=request.getParameter("username");
//		String password=request.getParameter("password");
//		
//		if(this.authLogin(request, username, password)){
//			modelMap.put("status", 1);
//		}else{
//			modelMap.put("status", 0);
//		}
		modelMap.put("wslconfig", configwsl);
	}
	

	
}
