package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 属于的软件--主要用于支付代码的所属
 * @author slwei
 *
 */
public class Application {
	int id;//编号
	String name;//语言名字
	
//	public static Application APP_OFFPRINT=new Application(0,"单行本");
	public static Application APP_IOS=new Application(1,"综合版IOS");
//	public static Application APP_COMPLEX=new Application(2,"综合版Iphone");
//	public static Market LANGUAGE_JAPANESE=new Market(3,"日本語");
	
	public static List<Application> getApplications(){
		List<Application> list=new ArrayList<Application>();
//		list.add(LANGUAGE_CHINESE);
//		list.add(APP_OFFPRINT);
		list.add(APP_IOS);
		return list;
	}
	
	public static Application getApp(int id){
		for(Application app:getApplications()){
			if(app.getId()==id){
				return app;
			}
		}
		return null;
	}
	
	public Application(int id,String name){
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
	
	
}
