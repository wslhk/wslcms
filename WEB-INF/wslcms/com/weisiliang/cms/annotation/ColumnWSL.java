package com.weisiliang.cms.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.weisiliang.cms.inter.ItemType;


/**
 * cms控制的字段
 * @author wslhk
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD )
public @interface ColumnWSL{
	
	  public enum ORDERBY {
	        ASC,DESC,NONE;
	   }
	  
	  public enum DefaultData {
	       NORMAL,
		  DATE_NOW,	//new Date()
	        STRING_NOT_NULL;//""
	   }
//	  static public enum INPUT_TYPE{
//		  TEXT,FILE,SELECT,CHECKBOX,RADIO,TEXTAREA,SHOW
//	  }


	//排序条件，用于列表排序
	  ORDERBY orderby() default ORDERBY.NONE;
	  
	  //用于文字标题
	  String name() default "";
	  
	  //用于生成查询条件
	  boolean findable() default false;
	  

	  
	  //单选状态，可以用于快速选择
//	  String[] radioItems() default {"通过","未通过"};
	  
	  //展示类型
	  ItemType inputType() default ItemType.TEXT;
	  
	  //listid，关联外键，或者列表
	  String selectId() default "";
	  
	  //外键资源类型
	  Class<?> targetEntity() default Object.class ;
	  
	  //是否允许批量修改
	  boolean batchUpdate() default false;
	  
	  DefaultData defaultData() default DefaultData.NORMAL;

	  
}
