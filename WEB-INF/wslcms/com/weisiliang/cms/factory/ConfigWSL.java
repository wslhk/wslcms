package com.weisiliang.cms.factory;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;


public class ConfigWSL {
	public static Properties props = null;

//	public static void main(String[] args){
//		
//	}
	
	
	/**
	 * 获得config内容
	 * @param name
	 * @return
	 */
	public static String getMessage(String name){
		
		if(props==null){initProperties();}
//		String value=props.getProperty(name);
//		if(value==null){
//			System.out.println(value+" wlscms config not find:"+name);
//			
////				System.out.println(Thread.currentThread().getContextClassLoader().getResource("configwsl.properties"));
//			
//		}
		
		
		
		return props.getProperty(name);
	}
	
	public static int getMessageInt(String name){
		int result=0;
		try{
			result=Integer.parseInt(getMessage(name));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static float getMessageFloat(String name){
		float result=0;
		try{
			result=Float.parseFloat(getMessage(name));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static long getMessageLong(String name){
		long result=0;
		try{
			result=Long.parseLong(getMessage(name));
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public static void initProperties(){
			 try {
				 InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("configwsl.properties");
				 ConfigWSL.props=new Properties();
				 ConfigWSL.props.load(is);
				//System.out.println("Config.props.size:::"+Config.props.size());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public static Properties getProps() {
		if(props==null){
			ConfigWSL.initProperties();
			}
		return props;
	}
	
	public static boolean isLinux(){
		if   ( "\\ ".equals(File.separator))   {
            //   is   WINDOWS
			return false;
    }   else   if   ( "/ ".equals(File.separator))   {
            //   is   LINUX
    	return true;
    } 
		return true;
	}
}
