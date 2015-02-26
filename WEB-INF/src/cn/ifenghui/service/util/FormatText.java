package cn.ifenghui.service.util;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class FormatText {
	
	public static void main(String[] args){
		try {
			System.out.println(new String("\u7528\u6237\u5c1a\u672a\u6fc0\u6d3b\uff01".getBytes("utf-8")));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		System.out.println(FormatText.field2getMethod("aa_aa_cc"));
	}
	
	private static String v_email="^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$";
	
	/**
	 * 将aa_aa_cc转成 AaAaCc格式
	 * @param field
	 * @return
	 */
	public static String field2FieldName(String field){
		//当前对象,过滤fields
//		String[] arrField=fields.split(",");
//		for(int i=0;i<field.length;i++){
			//取得_位置
//			int index=0;
		String result=field;
			while(result.indexOf("_")!=-1){
			int index=result.indexOf("_");
			System.out.println(index);
			result=result.substring(0,index)+
			result.substring(index+1,index+2).toUpperCase()+
			result.substring(index+2,result.length());
			
			
			}
			
			//首字母大写
//			result=result.substring(0,1).toUpperCase()+result.substring(1,result.length());
			return result;
//		}
	}
	
	/**
	 * 将aa_aa_cc转成 getAaAaCc格式
	 * @param field
	 * @return
	 */
	public static String field2getMethod(String field){
		//当前对象,过滤fields
//		String[] arrField=fields.split(",");
//		for(int i=0;i<field.length;i++){
			//取得_位置
//			int index=0;
		String result=field;
			while(result.indexOf("_")!=-1){
			int index=result.indexOf("_");
			System.out.println(index);
			result=result.substring(0,index)+
			result.substring(index+1,index+2).toUpperCase()+
			result.substring(index+2,result.length());
			
			
			}
			
			//首字母大写
			result=result.substring(0,1).toUpperCase()+result.substring(1,result.length());
			return "get"+result;
//		}
	}
	
	public static String field2setMethod(String field){
		if(field.trim().equals("")){
			return null;
		}
		//当前对象,过滤fields
//		String[] arrField=fields.split(",");
//		for(int i=0;i<field.length;i++){
			//取得_位置
//			int index=0;
		String result=field;
			while(result.indexOf("_")!=-1){
			int index=result.indexOf("_");
//			System.out.println(index);
			result=result.substring(0,index)+
			result.substring(index+1,index+2).toUpperCase()+
			result.substring(index+2,result.length());
			
			
			}
			
			//首字母大写
			
			result=result.substring(0,1).toUpperCase()+result.substring(1,result.length());
			return "set"+result;
//		}
	}
	
	public static boolean checkEmail(String email){
		Pattern pattern = Pattern.compile(v_email);

		Matcher matcher = pattern.matcher(email);

		return matcher.matches();
	}
	
	/**
	 * yyyy-MM-dd HH:mm
	 * @param currentTime
	 * @return
	 */
	 @SuppressWarnings("null")
	public static String getStringDate(Date currentTime) {
		 if(currentTime!=null){
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  String dateString = formatter.format(currentTime);
		  return dateString;
		 }
		 return null;
		} 
	 
	 public static Date getDateString(String currentTime) {
		 if(currentTime!=null){
		  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  try {
			return formatter.parse(currentTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		  String dateString = formatter.format(currentTime);

		 }
		 return null;
		} 
	 
	/**
	 * 返回后缀名
	 * @param filename
	 * @return
	 */
	public static String getExt(String filename){
		if(filename.indexOf(".")==-1)
			return "";
		
		return filename.split("[.]")[filename.split("[.]").length-1];
	}
	
	/**
	 * 通过时间获得目录
	 * 保存图片的时候,图片是=按照 yyyy/mm/dd/ 来存储的
	 * 功能是把图片的时间转换成相应的目录
	 * @param date
	 * @return
	 */
	public static String getPathFromDate(Date date){
		Calendar ca=Calendar.getInstance();
		if(date==null)return null;
		ca.setTime(date);
		return ca.get(Calendar.YEAR)+"/"+(ca.get(Calendar.MONTH)+1)+"/"+ca.get(Calendar.DAY_OF_MONTH)+"/";
	}
	
	/**
	 * 返回文件名去除后缀名
	 * @param filename
	 * @return
	 */
	public static String getFileName(String filename){
		String ext=getExt(filename);
		
		return filename.replace("."+ext,"");
	}
	
	/**
	 * md5
	 * @param plainText
	 * @return
	 */
	public static String Md5(String plainText) {
		StringBuffer buf = new StringBuffer(""); 
		if(plainText!=null){
		  try {
		   MessageDigest md = MessageDigest.getInstance("MD5");

		   md.update(plainText.getBytes());
		   byte b[] = md.digest();

		   int i;
		   
		   for (int offset = 0; offset < b.length; offset++) {
		    i = b[offset];
		    if(i<0) i+= 256;
		    if(i<16)
		     buf.append("0");
		    buf.append(Integer.toHexString(i));
		   }
		   //System.out.println("result: " + buf.toString());
		   
		  } catch (NoSuchAlgorithmException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		}
		  return buf.toString();
	}
	
	public static void setMarge(Serializable srcobj,Serializable updateobj){
		Field[] fields= srcobj.getClass().getDeclaredFields();
		Field[] fieldsupdate= updateobj.getClass().getDeclaredFields();
		Method methodget;
		Method methodset;
		String fieldname;
		String methodgetname;
		String methodsetname;
		Object value=null;
		try {
			
			for(int i=0;i<fields.length;i++){
				for(int j=0;j<fieldsupdate.length;j++){
					if(fields[i].getName().equals(fieldsupdate[j].getName())){
						fieldname=fields[i].getName();
						methodgetname="get"
							+fieldname.substring(0, 1).toUpperCase()
							+fieldname.substring(1, fieldname.length());
						methodsetname="set"
							+fieldname.substring(0, 1).toUpperCase()
							+fieldname.substring(1, fieldname.length());
						
//						System.out.println(fields[j].getName()+"-->"+fields[j].getModifiers());
						
						try {
							methodget=updateobj.getClass().getMethod(methodgetname, null);
							
							
							//如果不包含get方法,不操作
							if(methodget==null){break;}						
							
							value=methodget.invoke(updateobj, null);
							methodset=srcobj.getClass().getMethod(methodsetname, fields[i].getType());
							
							//如果不包含set方法,不操作
							if(methodset==null){break;}	
							
							if(value!=null){
								methodset.invoke(srcobj, value);
							}
						} catch (SecurityException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (NoSuchMethodException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch(InvocationTargetException e){
							e.printStackTrace();
						}
						break;
					}
				}

			}
			
		} catch (IllegalArgumentException e) {

			e.printStackTrace();
		} catch (IllegalAccessException e) {

			e.printStackTrace();
		} finally{
			fields= null;
			fieldsupdate= null;
			methodget= null;
			methodset= null;
			fieldname= null;
			methodgetname= null;
			methodsetname= null;
			value= null;
		}
		
		
		
	}
	
	/**
	 * 用于输出接口的时候,接口内容为空的内容的填充
	 * 设置不为空的内容
	 * 通过变量名称获得set get方法,传递数据
	 * 
	 * 如果update中内容存在,复制到src中
	 * @param srcobj 数据库中的对象
	 * @param updateobj 传递的需要更新的数据
	 */
	public static<T> void setValue(T srcobj,T updateobj){
		Field[] fields= srcobj.getClass().getDeclaredFields();
		Field[] fieldsupdate= updateobj.getClass().getDeclaredFields();
		Method methodget;
		Method methodset;
		String fieldname;
		String methodgetname;
		String methodsetname;
		Object value=null;
		
		Method[] methods=srcobj.getClass().getMethods();
		Method[] methodsupdate=updateobj.getClass().getMethods();
		
//		for(int i=0;i<methods.length;i++){
//			System.out.println(">>"+methods[i].getName());
//		}
		
		try {
			
			for(int i=0;i<methods.length;i++){
				methodset=methods[i];
				methodsetname=methodset.getName();
				
				if(methodsetname.startsWith("set")){
					//获得get
					methodgetname=methodsetname.replaceFirst("set","get");
					
					try {
						methodget=updateobj.getClass().getMethod(methodgetname, null);
						value=methodget.invoke(updateobj, null);
						if(value!=null)
						methodset.invoke(srcobj, value);
//						System.out.println(methodsetname+">>"+srcobj+"-->"+value);
					}  catch(NoSuchMethodException e){
						System.out.println("良性错误:"+ methodgetname+" "+e.getMessage());
						//e.printStackTrace();
					}  catch (Exception e) {
						e.printStackTrace();
						methodget=null;
					}
				}
				
			

			}
			
		} catch (IllegalArgumentException e) {

			e.printStackTrace();
		} finally{
			fields= null;
			fieldsupdate= null;
			methodget= null;
			methodset= null;
			fieldname= null;
			methodgetname= null;
			methodsetname= null;
			value= null;
		}
		
		
		
	}
	
/**
 * 列表中内容填充
 * 如果从update的对象中获得内容不为null复制到src
 * @param listsrcobj
 * @param listupdateobj
 */
	public void setValue(List listsrcobj,List listupdateobj){
		if(listsrcobj!=null&&listupdateobj!=null){
			if(listsrcobj.size()==listupdateobj.size()){
				for(int i=0;i<listupdateobj.size();i++){
					this.setValue((Serializable)listsrcobj.get(i), (Serializable)listupdateobj.get(i));
				}
			}
		}
	}
	
	/**
	 * 将数据库中的字符串转换成html
	 * wordpress接口适合用
	 * @param str
	 * @return
	 */
	public static String getHtmlFormWordpressDataBase(String str){
		if(str==null)return null;
		//多个\n\r转成1个
		while(str.indexOf("\r\n\r\n")!=-1){
			str=str.replace("\r\n\r\n", "\r\n");
		}
		
		str=str.replace("\r\n","</p><p style=\"text-align:left;\">");
		str="<p style=\"text-align:left;\">"+str+"</p>";
		return str;	
	}
	
	
	/**
	 * 转换成int
	 * @param value
	 * @return
	 */
	public static Integer getInteger(String value){
		try{
			return Integer.valueOf(value);
		}catch(Exception e){
			return null;
		}
	}
	/**
	 * 把 1,2,3这样的字符串转换成数组
	 * @param str
	 * @return
	 */
	public static Integer[] getIntArr(String str){
		String[] chapters=str.split(",");
		Integer[] chapterids=new Integer[chapters.length];
		for(int i=0;i<chapters.length;i++){
			try{
			chapterids[i]=Integer.parseInt(chapters[i]);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return chapterids;
	}
	
	public static String[] getStringArr(String str){
		if(str==null){
			return new String[0];
		}
		String[] chapters=str.split(",");
		String[] chapterids=new String[chapters.length];
		for(int i=0;i<chapters.length;i++){
			try{
			chapterids[i]=chapters[i];
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return chapterids;
	}
	
	public static List getListArr(String str){
		String[] chapters=str.split(",");
		List chapterids=new ArrayList();
		for(int i=0;i<chapters.length;i++){
			try{
				chapterids.add(Integer.parseInt(chapters[i]));
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return chapterids;
	}
	
	public static Integer[] getIntArrFromList(List list){
		if(list==null||list.size()==0){return new Integer[0];}
		Integer[] result =new Integer[list.size()];
		
		Integer id;
		for(int i=0;i<list.size();i++){
			try {
				if(Integer.class.isAssignableFrom(list.get(i).getClass())){
					id=(Integer)list.get(i);
				}else{
					id=(Integer)list.get(i).getClass().getMethod("getId", null).invoke(list.get(i), null);
				}
				result[i]=id;
			} catch (Exception e) {
		
				e.printStackTrace();
			}
			
		}
	
		return result;
	}
	
	public static Integer[] getIntArrFromList(List list,String value){
		if(list==null||list.size()==0){return new Integer[0];}
		Integer[] result =new Integer[list.size()];
		
		Integer id;
		for(int i=0;i<list.size();i++){
			try {
				id=(Integer)list.get(i).getClass().getMethod("get"+value.substring(0,1).toUpperCase()+value.substring(1,value.length()), null).invoke(list.get(i), null);
				result[i]=id;
			} catch (Exception e) {
		
				e.printStackTrace();
			}
			
		}
	
		return result;
	}
	
	/**
	 * 把 1,2,3这样的字符串转换成数组
	 * @param str
	 * @param length 只获得前length条的数据
	 * @return
	 */
	public static Integer[] getIntArr(String str,Integer length){
		String[] chapters=str.split(",");
		Integer[] chapterids=new Integer[chapters.length];
		if(chapters.length<length){
			length=chapters.length;
		}
		for(int i=0;i<length;i++){
			try{
			chapterids[i]=Integer.parseInt(chapters[i]);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return chapterids;
	}
	
	/**
	 * 过滤html字符，比如尖括号什么的
	 * @param html
	 * @return
	 */
	public static String getFilterHtmlCode(String html){
		if(html==null){
			return null;
		}
		
		String result=html.replace("<", "&lt;");
		result=result.replace(">", "&gt;");
		result=result.replace("\"", "&quot;");
		
		return result;
	}
	
	/**
	 * 返回2进制转10进制,用于数据与操作
	 * @param str 1,2,3
	 * @return
	 */
	public static long getBitAndFromString(String str){
		Integer[] arr=FormatText.getIntArr(str);
		long result=0;
		for(Integer no:arr){
			long cat=(long)Math.pow(2, (no));
			result+=cat;
		}
		return result;
	}
}
