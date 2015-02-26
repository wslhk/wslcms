package com.weisiliang.cms.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * cms控制的字段
 * @author wslhk
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.FIELD )
public @interface SelectTitleWSL{
	
	/**
	 * 关联属性名称
	 * @return
	 */
//	String columnName() default "";
	
//	String objId();
	  
}
