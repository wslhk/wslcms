package cn.ifenghui.service.util;

import java.io.File;
import java.io.InputStream;
import java.util.Properties;


public class Config {
	public static Properties props = new Properties();

//	public static void main(String[] args){
//		
//	}
	
	
	/**
	 * 获得config内容
	 * @param name
	 * @return
	 */
	public static String getMessage(String name){
		
		if(props.size()==0){initProperties();}
		String value=props.getProperty(name);
		if(value==null){
			System.out.println(value+"<<<<<<<"+name);
			
				System.out.println(Thread.currentThread().getContextClassLoader().getResource("config.properties"));
			
		}
		for(int i=0;i<3;i++){
			if(value.indexOf("$[")!=-1){
				value=value.split("\\$\\[")[1];
				if(value.indexOf("]")!=-1){
					String key=value.split("]")[0];
						if(Config.getMessage(key)!=null){
							return props.getProperty(name).replace("$["+key+"]", Config.getMessage(key));
						}
				}else{
					break;
				}
			}else{
				break;
			}
		}
		
		
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
				 InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties");
				
				 Config.props.load(is);
				//System.out.println("Config.props.size:::"+Config.props.size());
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public static Properties getProps() {
		if(props==null){Config.initProperties();}
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
