package cn.ifenghui.service.dao.service.impl;



import java.lang.reflect.Method;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;



import cn.ifenghui.service.dao.SuperDao;
import cn.ifenghui.service.dao.service.BaseService;

public class BaseServiceImpl implements BaseService{
	
	@Autowired
	@Qualifier("SuperDao")
	SuperDao superdao;
	

	/**
	 * 验证管理员是否有权限编辑这个对象
	 *  
	 *  true:允许
	 *  false:不允许
	 * @param classes
	 * @param id
	 * @return
	 */
	boolean checkSecuity(Class classes,Integer id) /*throws ApiException*/{
		
		Object obj=superdao.get(classes, id);
		try {
			Method m=obj.getClass().getMethod("getDomainId", null);
			Integer dmId=(Integer)m.invoke(obj, null);
		
		}catch (Exception e) {

			e.printStackTrace();
		}
		return false;
	}

		
	
	
	
	

	
}
