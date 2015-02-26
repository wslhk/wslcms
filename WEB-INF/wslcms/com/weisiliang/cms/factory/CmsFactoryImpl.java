package com.weisiliang.cms.factory;


import java.util.ArrayList;
import java.util.HashMap;


import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;



import org.hibernate.metadata.ClassMetadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;






import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.process.CmsProcess;
import com.weisiliang.cms.view.ViewTitle;

@Component("CmsFactory")
public class CmsFactoryImpl implements CmsFactory {
	
	@Autowired
	SessionFactory sessionFactory;
	
	final static String wslProcessKey="wslProcess";
	final static String wslEntityKey="wslEntity";
	public final static String wslAuthKey="wslAuth";
	
	CmsProcess currentProcess;
	
	static Map<String,CmsProcess> wslProcessMap;
	
	static Map<String,Class<Object>> entityMap;
	
	public CmsFactoryImpl(){
//		this.initBySessionFactory();
	}
	public CmsFactoryImpl(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
//		this.initBySessionFactory();
		
	}
	
	
	
	@SuppressWarnings("unchecked")
	private Class<Object> getEntityClass(HttpServletRequest request,String wslobjName) throws WSLCmsException{
//		this.sessionFactory=sessionFactory;
		
		entityMap=(Map<String,Class<Object>>)request.getSession().getServletContext().getAttribute(wslEntityKey);
		

		if(entityMap==null){
			entityMap=new HashMap<String,Class<Object>>();
			for(String str:this.sessionFactory.getStatistics().getEntityNames()){
	//			EntityStatistics entity=this.sessionFactory.getStatistics().getEntityStatistics(str);
				
				Class<Object> entity=this.sessionFactory.getClassMetadata(str).getMappedClass();
				entityMap.put(entity.getSimpleName(), entity);
				System.out.println(entity);
			}
			request.getSession().getServletContext().setAttribute(wslEntityKey,entityMap);
		}
		if (entityMap.get(wslobjName)==null){
//			throw new WSLCmsException("entityMap not find "+wslobjName);
			return null;
		}
		return entityMap.get(wslobjName);
	}
	
	

	@SuppressWarnings("unchecked")
	private CmsProcess getProcess(HttpServletRequest request,String action) throws WSLCmsException{
		
//		@SuppressWarnings("unchecked")
		wslProcessMap=(Map<String,CmsProcess>)request.getSession().getServletContext().getAttribute(wslProcessKey);
		
		if(wslProcessMap==null){
			wslProcessMap=new HashMap<String,CmsProcess> ();
		}
		String className="com.weisiliang.cms.process.CmsProcess"+underlineToCamel("_"+action);
		CmsProcess process=wslProcessMap.get(action);
		if(process==null){
			
			try {
				process=(CmsProcess)Class.forName(className).newInstance();
			} catch (Exception e) {
				throw new WSLCmsException(e);
			}
			
			wslProcessMap.put(action, process);
			request.getSession().getServletContext().setAttribute(wslProcessKey,wslProcessMap);
		}
		if(process==null){
			throw new WSLCmsException("action not find"+className);
		}
		process.setSessionFactory(this.sessionFactory);
	
		return process;
			
		
	}
	
	private List getModelList(){
//		this.sessionFactory=sessionFactory;
		
//		Map<String, ClassMetadata> map=this.sessionFactory.getAllClassMetadata();
		List listTable=new ArrayList();
		Iterator<String> it=entityMap.keySet().iterator();
		String key;
//		ClassMetadata cm;
		Class<?> mappedClass;
		
		while(it.hasNext()){
			key=it.next();
			mappedClass=entityMap.get(key);
			if(mappedClass.getAnnotation(TableWSL.class)==null){
				continue;
			}
			
			listTable.add(new ViewTitle(mappedClass));
			
		}
		return listTable;
	}



	@Override
	public CmsView cmsRun(HttpServletRequest request,
			HttpServletResponse response, ModelMap modelMap)
			throws WSLCmsException {
		
//		initBySessionFactory(request);
		
		//1 通过url解析，对象，行为，值
		String wslobj=request.getParameter("wslobj");
		String action=request.getParameter("wslact");
		
		if(action==null){
			action="index";
		}

		if(!this.authCheck(request)){
			action="login";
		}
		
	
		

		
			currentProcess=this.getProcess(request, action);
			currentProcess.process(request, response, modelMap, this.getEntityClass(request,wslobj));
			
			modelMap.put("wslobj", wslobj);
			modelMap.put("wslmodels", getModelList());
			modelMap.put("viewTitle", new ViewTitle(this.getEntityClass(request,wslobj)));
		
		
			
		return new CmsView(action);
		
	}
	
	/**
	 * 检查用户验证
	 * @return
	 */
	private boolean authCheck(HttpServletRequest request){
		
		if(request.getParameter("wslact")!=null&&
				(request.getParameter("wslact").equals("login")||request.getParameter("wslact").equals("login_do"))){
			return true;
		}
		
		if(ConfigWSL.getMessage("auth")!=null&&ConfigWSL.getMessage("auth").equals("1")){
			Object val=request.getSession().getAttribute(wslAuthKey);
			
			if(val==null){
				return false;
			}else{
				return true;
			}
			
		}
		
		
		return true;
	}
	
	
	
	public static final char UNDERLINE='_';
    public static String camelToUnderline(String param){
        if (param==null||"".equals(param.trim())){
            return "";
        }
        int len=param.length();
        StringBuilder sb=new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c=param.charAt(i);
            if (Character.isUpperCase(c)){
                sb.append(UNDERLINE);
                sb.append(Character.toLowerCase(c));
            }else{
                sb.append(c);
            }
        }
        return sb.toString();
    }
    public static String underlineToCamel(String param){
        if (param==null||"".equals(param.trim())){
            return "";
        }
        
        int len=param.length();
        StringBuilder sb=new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            char c=param.charAt(i);
            if (c==UNDERLINE){
               if (++i<len){
                   sb.append(Character.toUpperCase(param.charAt(i)));
               }
            }else{
                sb.append(c);
            }
        }
        return sb.toString();
    }
	
	
	
	

}
