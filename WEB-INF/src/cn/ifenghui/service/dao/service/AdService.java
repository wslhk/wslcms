package cn.ifenghui.service.dao.service;


import java.util.List;

import cn.ifenghui.service.dao.obj.Ad;
import cn.ifenghui.service.util.Pag;

public interface AdService  {


	
	public Ad getAd(int id);

	public List<Ad> getListAd(Ad ad,Pag page);
	
	public void updateAd(Ad ad);
	
	public void deleteAd(int id);
	
	public void saveAd(Ad ad);

}
