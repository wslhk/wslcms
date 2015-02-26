package cn.ifenghui.service.dao.obj;

import com.weisiliang.cms.annotation.SelectIdWSL;
import com.weisiliang.cms.annotation.SelectTitleWSL;

public class SelectItem {
	
	@SelectIdWSL
	Integer id;
	
	@SelectTitleWSL
	String name;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
