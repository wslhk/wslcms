package cn.ifenghui.service.action;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;




/**
 * 管理页的登录
 * @author wsl
 *
 */
@Controller
public class LoginAction extends BaseAction{


	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
		super();
	}


	/**
	 * 管理员管理
	 * @param request
	 * @param response
	 * @param modelMap
	 * @param r
	 * @param p
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/admin/login.action", method = RequestMethod.GET)   
    public String manager(HttpServletRequest request, HttpServletResponse response,     
            ModelMap modelMap) throws Exception {
	
		
		
		return "admin/login";

    }
	

}

