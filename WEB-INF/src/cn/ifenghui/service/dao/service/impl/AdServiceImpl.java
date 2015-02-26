package cn.ifenghui.service.dao.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.ifenghui.service.dao.obj.Ad;
import cn.ifenghui.service.dao.service.AdService;

import cn.ifenghui.service.util.Pag;


@Service("AdService")
public class AdServiceImpl extends BaseServiceImpl implements AdService{

	@Override
	public Ad getAd(int id) {
		if(this.checkSecuity(Ad.class,id)){
		return superdao.get(Ad.class, id);
		}return null;
	}

	@Override
	public List<Ad> getListAd(Ad ad,Pag page) {
	
		
		superdao.setPage(page);

		return superdao.getList(ad);
	}

	@Override
	public void updateAd(Ad ad) {
		if(this.checkSecuity(Ad.class, ad.getId())){
	
			superdao.update(ad);

		}
	}

	@Override
	public void deleteAd(int id) {
//		if(this.checkSecuity(Ad.class, id)){
			//删单页
//			String hql="delete from Page page where page.adId=:adId";
//			Map map=new HashMap();
//			map.put("adId", id);
//			superdao.updateByHql(hql, map);
			superdao.delete(Ad.class, id);
//		}
	}

	@Override
	public void saveAd(Ad ad) {

	
		
	
		int adid=superdao.insert(ad);
		
		
	}
	

	

	
}
