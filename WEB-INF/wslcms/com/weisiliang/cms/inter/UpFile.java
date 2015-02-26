package com.weisiliang.cms.inter;

import java.io.File;


/**
 * upload file
 * @author wslhk
 *
 */
public class UpFile {

	File file;
	String savePath;
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
}
