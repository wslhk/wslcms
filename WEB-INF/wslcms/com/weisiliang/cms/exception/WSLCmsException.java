package com.weisiliang.cms.exception;

public class WSLCmsException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public WSLCmsException() {

	}
	public WSLCmsException(String msg){
//		Exception("");
		super(msg);
	}
	
	public WSLCmsException(Exception e){
//		Exception("");
		super(e);
	}
}
