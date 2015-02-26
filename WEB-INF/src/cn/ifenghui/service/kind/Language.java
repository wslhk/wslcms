package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 语言
 * @author slwei
 *
 */
public class Language {
	int id;//编号
	String name;//语言名字
	
	public static Language LANGUAGE_CHINESE=new Language(1,"中文");
	public static Language LANGUAGE_ENGLISH=new Language(2,"English");
	public static Language LANGUAGE_JAPANESE=new Language(3,"日本語");
	
	public static List<Language> getLanguages(){
		List<Language> list=new ArrayList<Language>();
		list.add(LANGUAGE_CHINESE);
		list.add(LANGUAGE_ENGLISH);
		list.add(LANGUAGE_JAPANESE);
		return list;
	}
	public static Language getLanguage(int language){
		for(Language lang: getLanguages()){
			if(lang.getId()==language){
				return lang;
			}
		}
		return null;
	}
	
	public Language(int id,String name){
		this.id=id;
		this.name=name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * 已选择,用于页面的输出
	 */
	private Boolean selected;

	public Boolean getSelected() {
		return selected;
	}

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}
	
	
}
