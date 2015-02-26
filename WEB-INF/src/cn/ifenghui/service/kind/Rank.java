package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 价格
 * @author slwei
 *
 */
public class Rank {
	int id;//编号
	String name;//中国价格
	String intro;
//	float priceUs;//美国价格
	
	public static Rank RANK_0=new Rank(0,"未分级","未分级");
	public static Rank RANK_4=new Rank(4,"4+","无限制");
	public static Rank RANK_9=new Rank(9,"9+","轻微暴力成人恐怖暗示");
	public static Rank RANK_12=new Rank(12,"12+","偶尔有污秽词语,频繁的幻想暴力,偶尔的性暗示,赌博");
	public static Rank RANK_17=new Rank(17,"17+","频繁激烈的,幻想,酒精,烟草,毒品,色情");
//	public static Rank PRICE_6=new Rank(1,6,1.99f);
//	public static Rank PRICE_12=new Rank(2,12,2.99f);
//	public static Rank PRICE_18=new Rank(3,18,3.99f);
	
//	enum PRICE_TYPE{PRICE_FREE=new Price(),PRICE_6,PRICE_8};
	
	public static List<Rank> getRanks(){
		List<Rank> list=new ArrayList<Rank>();
		list.add(RANK_0);
		list.add(RANK_4);
		list.add(RANK_9);
		list.add(RANK_12);
		list.add(RANK_17);
//		list.add(PRICE_6);
//		list.add(PRICE_12);
//		list.add(PRICE_18);
		return list;
	}
	public static Rank getRank(Integer priceid){
		if(priceid==null){return RANK_0;}
		for(Rank lang: getRanks()){
			if(lang.getId()==priceid){
				return lang;
			}
		}
		return RANK_0;
	}
	
	public Rank(int id,String name,String intro){
		this.id=id;
		this.name=name;
		this.intro=intro;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	
	/**
	 * 已选择,用于页面的输出
	 */
	private Boolean selected;

	public Boolean getSelected() {
		return selected;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public void setSelected(Boolean selected) {
		this.selected = selected;
	}

	
}
