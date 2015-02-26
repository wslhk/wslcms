package cn.ifenghui.service.dao.obj;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 商品标签 
 * @author slwei
 *
 */
@SuppressWarnings("serial")
@Entity 
@Table(name = "tb_tag_product_link")
public class TagProductLink  implements java.io.Serializable{
	@Id
	Integer tagId;
	@Id
	Integer productId;
	
	
	public Integer getTagId() {
		return tagId;
	}
	public void setTagId(Integer tagId) {
		this.tagId = tagId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	
}
