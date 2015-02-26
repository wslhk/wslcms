package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 价格
 * @author slwei
 *
 */
public class Price {
	int id;//编号
	float priceCn;//中国价格
	float priceUs;//美国价格
	
	
	public static Price PRICE_FREE=new Price(0,0,0);
	public static Price PRICE_6=new Price(1,6,1.99f);
	public static Price PRICE_12=new Price(2,12,2.99f);
	public static Price PRICE_18=new Price(3,18,3.99f);
	
//	enum PRICE_TYPE{PRICE_FREE=new Price(),PRICE_6,PRICE_8};
	
	public static List<Price> getPrices(){
		List<Price> list=new ArrayList<Price>();
		list.add(PRICE_FREE);
		list.add(PRICE_6);
		list.add(PRICE_12);
		list.add(PRICE_18);
		return list;
	}
	public static Price getPrice(int priceid){
		for(Price lang: getPrices()){
			if(lang.getId()==priceid){
				return lang;
			}
		}
		return null;
	}
	
	public Price(int id,float priceCn,float priceUs){
		this.id=id;
		this.priceCn=priceCn;
		this.priceUs=priceUs;
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

	public void setSelected(Boolean selected) {
		this.selected = selected;
	}
	public float getPriceCn() {
		return priceCn;
	}
	public void setPriceCn(float priceCn) {
		this.priceCn = priceCn;
	}
	public float getPriceUs() {
		return priceUs;
	}
	public void setPriceUs(float priceUs) {
		this.priceUs = priceUs;
	}
	
	
}
