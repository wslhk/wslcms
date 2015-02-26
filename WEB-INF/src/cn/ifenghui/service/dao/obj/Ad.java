package cn.ifenghui.service.dao.obj;

import java.util.ArrayList;
import java.util.List;




import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.annotation.TableWSL;
import com.weisiliang.cms.inter.ItemType;




/**
 * 广告
 * @author wsl
 *
 */
@TableWSL(title="广告",orderby="id")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
@Entity 
@Table(name = "tb_ad")
public class Ad {
//	private static int TYPE_AD_APPICON=1;//应用推荐
//	public static int TYPE_AD_LOADING=2;
//	public static int TYPE_AD_WALLPAPER=3;//壁纸推广位
	
//	public static int TARGET_URL=1;//链接url
//	public static int TARGET_ID=0;//链接id
	
	public Ad(){
		typeSelect=new ArrayList();
		SelectItem item=new SelectItem();
		item.setId(1);
		item.setName("test1");
		typeSelect.add(item);
		item=new SelectItem();
		item.setId(2);
		item.setName("test2");
		typeSelect.add(item);
		
		
	}

	@ColumnWSL(name="编号")
	@Id
	@GeneratedValue
	private Integer id;
	
	@ColumnWSL(name="类型",inputType=ItemType.SELECT,selectId="typeSelect",batchUpdate=true)
	private Integer type;
	
	@ColumnWSL(name="标题",inputType=ItemType.TEXTAREA)
	private String title;
	
	@ColumnWSL(name="图片",inputType=ItemType.FILEIMG)
	private String img;
	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY,targetEntity=Tag.class)
//	@JoinColumn(name="adId",insertable=true,updatable=true)
//	private Set<Tag> tags;
	
	@ColumnWSL(name="单选关联分类",inputType=ItemType.SELECT,targetEntity=Tag.class)
//	@JoinColumn(name = "tagId",insertable=false,updatable=false) 
//	@ManyToOne(targetEntity=Tag.class)  
	private Integer tagId;
	
	@ColumnWSL(name="只显示tag",inputType=ItemType.SHOW)
	@JoinColumn(name = "tagId",insertable=false,updatable=false) 
	@ManyToOne(targetEntity=Tag.class)  
	@NotFound(action=NotFoundAction.IGNORE)
	private Tag tag;
	
//	@ColumnWSL(name="单选关联分类",inputType=INPUT_TYPE.SELECT,targetEntity=Tag.class)
////	@JoinColumn(name = "tagId",insertable=false,updatable=false) 
////	@ManyToOne(targetEntity=Tag.class)  
//	private Integer tagId;
	
	

//	@SelectWSL(columnName="type")
	@Transient
	private List<SelectItem> typeSelect=null;
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

//	public Set<Tag> getTags() {
//		return tags;
//	}
//
//	public void setTags(Set<Tag> tags) {
//		this.tags = tags;
//	}

	public List<SelectItem> getTypeSelect() {
		return typeSelect;
	}

	public void setTypeSelect(List<SelectItem> typeSelect) {
		this.typeSelect = typeSelect;
	}

	public Integer getTagId() {
		return tagId;
	}

	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	


	

}
