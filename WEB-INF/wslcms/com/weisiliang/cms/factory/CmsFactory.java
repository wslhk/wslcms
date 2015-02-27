package com.weisiliang.cms.factory;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.ModelMap;

import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.inter.FileUploadProcess;

public interface CmsFactory{
	
	/**
	 * 控制器中使用cmsRun代为处理数据
	 * @param request
	 * @param response
	 * @param modelMap
	 * @throws WSLCmsException
	 */
	public CmsView cmsRun(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) throws WSLCmsException;
	
	
	/**
	 * 设置自定义上传方法，会在本地上传完成后执行
	 * @param uploadProcess
	 */
	public void setFileUploadProcess(FileUploadProcess uploadProcess);

}
