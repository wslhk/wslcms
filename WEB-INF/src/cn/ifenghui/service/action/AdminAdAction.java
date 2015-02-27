package cn.ifenghui.service.action;


import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;










import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.factory.CmsFactory;
import com.weisiliang.cms.factory.CmsFactoryImpl;
import com.weisiliang.cms.factory.CmsView;
import com.weisiliang.cms.factory.ConfigWSL;
import com.weisiliang.cms.inter.FileUploadProcess;
import com.weisiliang.cms.upload.AliyunOSS;
import com.weisiliang.cms.view.ViewList;

import cn.ifenghui.service.dao.obj.Ad;
import cn.ifenghui.service.dao.service.AdService;
import cn.ifenghui.service.kind.Config;
import cn.ifenghui.service.kind.Platform;
import cn.ifenghui.service.util.FormatText;
import cn.ifenghui.service.util.Pag;




/**
 * 杂志管理
 * @author wsl
 *
 */
@Controller
public class AdminAdAction extends BaseAction{
	@Autowired
	@Qualifier("AdService")
	AdService adService;

	@Autowired
	SessionFactory sessionFactory;
	
	/**
	 * Constructor of the object.
	 */
	public AdminAdAction() {
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
	@RequestMapping(value = "/admin/ad.action", method = RequestMethod.GET)   
    public void ad(HttpServletRequest request, HttpServletResponse response,     
            ModelMap modelMap,Ad ad) throws Exception {


		if(ad==null){ad=new Ad();}
		Pag page=new Pag(request);
		page.setPagelength(Config.getMessageInt("pagelength"));


		List<Ad> listad=this.adService.getListAd(ad, page);
		
		modelMap.put("platforms", Platform.getPlatforms());
//		Ad.setPathToListV2(listad, request.getContextPath(), Config.getMessage("img.path.ad"),config.getAdAppImg());
		
		modelMap.put("ad", ad);
		modelMap.put("listad", listad);
		modelMap.put("page", page);
		System.out.println("ok");
//		return "admin/ad";

    }
	
//	@Autowired
//	CmsFactory fac;
	
	@RequestMapping(value = "/admin/test.action")   
  public String test(HttpServletRequest request, HttpServletResponse response,     
          ModelMap modelMap) throws Exception {
		
		CmsFactory fac=new CmsFactoryImpl(this.sessionFactory);
		
		//分布式文件存储-阿里云oss 例子
		FileUploadProcess uploadProcess=new AliyunOSS(); 
		fac.setFileUploadProcess(uploadProcess);
		
		CmsView viewPath=fac.cmsRun(request, response, modelMap);
		return viewPath.getViewName();
  }

	
}

