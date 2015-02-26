package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 拍板类型,针对不同拍板返回不同格式内容
 * 目前只有pad,phone两种数据格式
 * @author slwei
 *
 */
public class Layout {
	int id;//编号
	String name;//语言名字
	
//	public static Application APP_OFFPRINT=new Application(0,"单行本");
	public static Layout LAYOUT_PAD=new Layout(0,"pad");
	public static Layout LAYOUT_PHONE=new Layout(1,"phone");
//	public static Application APP_COMPLEX=new Application(2,"综合版Iphone");
//	public static Market LANGUAGE_JAPANESE=new Market(3,"日本語");
	
	public static List<Layout> getLayouts(){
		List<Layout> list=new ArrayList<Layout>();
//		list.add(LANGUAGE_CHINESE);
//		list.add(APP_OFFPRINT);
		list.add(LAYOUT_PAD);
		list.add(LAYOUT_PHONE);
		return list;
	}
	
	public static Layout getLayout(int id){
		for(Layout app:getLayouts()){
			if(app.getId()==id){
				return app;
			}
		}
		return null;
	}
	
	public Layout(int id,String name){
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
