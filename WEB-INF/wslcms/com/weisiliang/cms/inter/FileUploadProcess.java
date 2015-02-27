package com.weisiliang.cms.inter;

public interface FileUploadProcess {
	
	/**
	 * 上传完成后执行
	 * 
	 *  你可以上传到分布式服务器，如阿里云，然后删除掉本地图片
	 * @param upFile
	 */
	public void uploadFile(UpFile upFile);
	
	/**
	 * 本地图片删除后执行
	 * @param upFile
	 */
	public void removeFile(UpFile upFile);
	
}
