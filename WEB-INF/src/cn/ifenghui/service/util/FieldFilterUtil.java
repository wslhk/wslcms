package cn.ifenghui.service.util;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;


/**
 * 过滤输出需要的字段
 * @author wslhk
 *
 */
public class FieldFilterUtil {

//	public static void filterold(Bean bean,String fields){
//		if(fields==null){System.out.println("fields=null,"+FieldFilterUtil.class);return;}
//		Method[] methods=bean.getClass().getMethods();
//		String[] arrField=fields.split(",");
//		boolean flag=false;//没找到
////		Object obj_null=null;
//		String setMethodName;
//		for(int i=0;i<methods.length;i++){
//			//当前对象左右方法
////			System.out.println(methods[i].getName());
//			flag=false;
////			Field f=null;
//			for(int j=0;j<arrField.length;j++){
//				//传入的方法
//				setMethodName=FormatText.field2setMethod(arrField[j]);
//
//				if(methods[i].getName().equals(setMethodName)){
//					flag=true;//存在这个方法,不设置,需要保留
////					System.out.println(methods[i].getName()+"<<<保留");
//					break;
//				}
//
//
//				if(methods[i].getName().toLowerCase().endsWith("copy")){
//					flag=true;//存在这个方法,不设置,需要保留
////		
//					break;
//				}
//				
//				
//			}
//			
//			if(flag==false){
//				//不保留
//				try {
//					
//					
//					if(methods[i].getName().startsWith("set")){
////						System.out.println("set null-->"+methods[i].getName());
//						methods[i].invoke(bean, (Object)null);
//					}
//					
//				} catch (Exception e) {
//					
//					
//					System.out.println(methods[i].getName());
//					e.printStackTrace();
//				}
//			}
//		}
////		System.out.println(bean);
//	}
	
	/**
	 * 新版本测试
	 * @param bean
	 * @param fields
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void filter(Serializable bean,String fields){
		if(fields==null){System.out.println("fields=null,"+FieldFilterUtil.class);return;}
		Method[] methods=bean.getClass().getMethods();
		String[] arrField=fields.split(",");
		boolean flag=false;//没找到
//		Object obj_null=null;
//		String setMethodName;
		
		Map mapField=new HashMap();
		for(int j=0;j<arrField.length;j++){
			mapField.put(FormatText.field2setMethod(arrField[j]),arrField[j] );
		}
		for(int i=0;i<methods.length;i++){
			//当前对象左右方法
//			System.out.println(methods[i].getName());
			flag=false;
//			Field f=null;
//			for(int j=0;j<arrField.length;j++){
				//传入的方法
//				setMethodName=FormatText.field2setMethod(arrField[j]);

				if(mapField.get(methods[i].getName())!=null){
					flag=true;//存在这个方法,不设置,需要保留
//					System.out.println(methods[i].getName()+"<<<保留");
//					break;
				}


				if(methods[i].getName().toLowerCase().endsWith("copy")){
					flag=true;//存在这个方法,不设置,需要保留
//		
//					break;
				}
				
				
//			}
			
			if(flag==false){
				//不保留
				try {
					
					
					if(methods[i].getName().startsWith("set")){
//						System.out.println("set null-->"+methods[i].getName());
						methods[i].invoke(bean, (Object)null);
					}
					
				} catch (Exception e) {
					
					
					System.out.println(methods[i].getName());
					e.printStackTrace();
				}
			}
		}
//		System.out.println(bean);
	}
}
