package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 平台
 * @author slwei
 *
 */
public class Platform {
	int id;//编号
	String name;//语言名字
	
	public static Platform PLATFORM_IOS=new Platform(1,"IOS");
	public static Platform PLATFORM_WP7=new Platform(2,"WP7");
	public static Platform PLATFORM_WP8=new Platform(4,"WP8");
	
	public static List<Platform> getPlatforms(){
		List<Platform> list=new ArrayList<Platform>();
		list.add(PLATFORM_IOS);
		list.add(PLATFORM_WP7);
		list.add(PLATFORM_WP8);
		return list;
	}
	
	public Platform(int id,String name){
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
