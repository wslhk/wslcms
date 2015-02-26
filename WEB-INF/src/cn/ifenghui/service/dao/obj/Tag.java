package cn.ifenghui.service.dao.obj;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.SelectIdWSL;
import com.weisiliang.cms.annotation.SelectTitleWSL;
import com.weisiliang.cms.annotation.TableWSL;

/**
 * 商品标签 
 * @author slwei
 *
 */
@TableWSL(title="标签",orderby="id")
@SuppressWarnings("serial")
@Entity
@Table(name = "tb_tag")
public class Tag  implements java.io.Serializable{
	@Id
	@GeneratedValue
	@ColumnWSL(name="编号")
	@SelectIdWSL
	Integer id;
	
	@SelectTitleWSL
	@ColumnWSL(name="名称")
	String tag;

	@Column(name = "adId")
	Integer adId;
	
//@JoinColumn(name = "adId",insertable=true,updatable=true) 
//@ManyToOne(targetEntity=Ad.class)  
//Ad ad;
//	
//	@ColumnWSL(name="ads")
	@JoinColumn(name = "tagId",insertable=false,updatable=false) 
	@OneToMany(targetEntity=Ad.class)  
	List<Ad> ads;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Integer getAdId() {
		return adId;
	}
	public void setAdId(Integer adId) {
		this.adId = adId;
	}
	
	
	
	
//	public Ad getAd() {
//		return ad;
//	}
//	public void setAd(Ad ad) {
//		this.ad = ad;
//	}
	
	public String toString(){
		return this.tag;
	}
	public List<Ad> getAds() {
		return ads;
	}
	public void setAds(List<Ad> ads) {
		this.ads = ads;
	}
	
	
}
