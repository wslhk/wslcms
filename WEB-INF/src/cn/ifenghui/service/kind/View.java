package cn.ifenghui.service.kind;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 视图
 * @author slwei
 *
 */
public class View implements Serializable{
	int id;//编号
	String name;//中国价格
//	float priceUs;//美国价格
	boolean hasSpcial;//是否含有专题
	
	public static View SPECIAL_FEATURED=new View(1,"特别推荐",true);
	public static View SPECIAL_MORE=new View(2,"more-根多专题",true);
//	public static Special PRICE_6=new Special(1,6,1.99f);
//	public static Special PRICE_12=new Special(2,12,2.99f);
//	public static Special PRICE_18=new Special(3,18,3.99f);
	
//	enum PRICE_TYPE{PRICE_FREE=new Price(),PRICE_6,PRICE_8};
	
	public static List<View> getViews(){
		List<View> list=new ArrayList<View>();
		list.add(SPECIAL_FEATURED);
		list.add(SPECIAL_MORE);
//		list.add(PRICE_6);
//		list.add(PRICE_12);
//		list.add(PRICE_18);
		return list;
	}
	
	/**
	 * 返回包含special的专题列表
	 * @return
	 */
	public static List<View> getViewsHasSpecial(){
		List<View> list=new ArrayList<View>();
		for(View view :getViews()){
			if(view.hasSpcial==true)
				list.add(view);
		}
		
		return list;
	}


	
	public View(int id,String name,boolean hasSpcial){
		this.id=id;
		this.name=name;
		this.hasSpcial=hasSpcial;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
//	/**
//	 * 已选择,用于页面的输出
//	 */
//	private Boolean selected;
//
//	public Boolean getSelected() {
//		return selected;
//	}
//
//	public void setSelected(Boolean selected) {
//		this.selected = selected;
//	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
