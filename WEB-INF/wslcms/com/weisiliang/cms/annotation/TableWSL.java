package com.weisiliang.cms.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义注解
 * 使用在对象头位置，用于判断cms对次对象生效
 * @author wslhk
 *
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE )
public @interface TableWSL {
//	boolean
	
	//排序条件,默认主键逆序，无主键时不排序
	String orderby();
	
	//页长,默认10条
	int pagesize() default 10;
	
	String title() default "";
	
	
}
