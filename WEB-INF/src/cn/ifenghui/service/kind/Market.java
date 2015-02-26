package cn.ifenghui.service.kind;

import java.util.ArrayList;
import java.util.List;

/**
 * 市场
 * @author slwei
 *
 */
public class Market {
	int id;//编号
	String name;//语言名字
	
	public static Market MARKET_APPSTORE=new Market(1,"苹果商店");
	public static Market MARKET_WINDOWSPHONE=new Market(2,"WINDOWSPHONE");
//	public static Market LANGUAGE_JAPANESE=new Market(3,"日本語");
	
	public static List<Market> getMarkets(){
		List<Market> list=new ArrayList<Market>();
//		list.add(LANGUAGE_CHINESE);
		list.add(MARKET_APPSTORE);
		list.add(MARKET_WINDOWSPHONE);
		return list;
	}
	
	public Market(int id,String name){
		this.id=id;
		this.name=name;
	}
}
