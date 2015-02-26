package cn.ifenghui.service.util;

import java.io.BufferedReader;

import java.io.File;

import java.io.FileOutputStream;

import java.io.DataInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;


import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * 接口使用的网络工具
 * 原生post 和get
 * @author slwei
 *
 */
public class WebUtil {
	public static StringBuffer get(String uri,Map map,Map header) throws IOException {
		
		StringBuffer sb = new StringBuffer();
		BufferedReader bin=null;
		InputStream in=null;
		URL url=null;
		URLConnection connection=null;
		Iterator it;
		String key;
		Object valobj;
		String val;
		try{
		if(map!=null){
			it=map.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				valobj=map.get(key);
				if(valobj==null)continue;
				val="";
				if(Date.class.isAssignableFrom(valobj.getClass())){
					val=FormatText.getStringDate((Date)valobj);
				}else{
					val=valobj.toString();
				}

				
				//val urlcode 编码
				val=URLEncoder.encode(val, "utf-8");
				
				if(sb.length()==0)
					sb.append(key+"="+val);
				else
					sb.append("&"+key+"="+val);
			}
		}
		if(sb.length()>0){
			if(uri.indexOf("?")!=-1){
				uri+="&"+sb;
			}else{
				uri+="?"+sb;
			}
		}
	
		url = new URL(uri);
		
		
		connection = url.openConnection();
		connection.setDoOutput(true);
		//设置header数据
		if(header!=null){
			it=header.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				connection.setRequestProperty(key, (String)header.get(key));
			}
		}
//		OutputStreamWriter out = new OutputStreamWriter(connection
//				.getOutputStream(), "UTF-8");
		
		in = connection.getInputStream();
		
	
		
		bin = new BufferedReader(new InputStreamReader(in, "UTF-8"));
		String s=null;
		sb=new StringBuffer();
		while((s=bin.readLine())!=null){
			sb.append(s);
		}
		bin.close();
		in.close();
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			
				try {
					if(bin!=null){
						bin.close();
						bin=null;
					}
					if(in!=null){
						in.close();
						in=null;
					}
					connection=null;
					url=null;
					it=null;
					key=null;
					valobj=null;
					val=null;
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		return (sb);
	}
	
	public static StringBuffer post(String uri,Map map,Map header) throws IOException {
		// URL url = new URL("http://localhost:9000/wbsc/spi/visitorvisit.do");
		URL url = new URL(uri);
		String sCurrentLine=null;
		StringBuffer sTotalString=null;
		BufferedReader l_reader=null;
		InputStream l_urlStream=null;
		URLConnection connection = url.openConnection();
		/**
		 * 然后把连接设为输出模式。URLConnection通常作为输入来使用，比如下载一个Web页。
		 * 通过把URLConnection设为输出，你可以把数据向你个Web页传送。下面是如何做：
		 */
		connection.setDoOutput(true);
		OutputStreamWriter out=null;
		Iterator it=null;
		String key=null;
		StringBuffer sb=null;
try{		
		//设置header数据
		if(header!=null){
			it=header.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				connection.setRequestProperty(key, (String)header.get(key));
			}
		}
		/**
		 * 最后，为了得到OutputStream，简单起见，把它约束在Writer并且放入POST信息中，例如： ...
		 */
		out = new OutputStreamWriter(connection
				.getOutputStream(), "UTF-8");
		sb = new StringBuffer();
//		sb.append("aa:bb");
		
//		sb.append("<VisitorVisitRequest>");
//		sb.append("<product>dyj</product>");
//		sb.append("<service>2</service>");
//		sb.append("<platform>monitor</platform>");
//		sb.append("<version>10.20</version>");
//		sb.append("<manufacturer>monitor</manufacturer>");
//		sb.append("<model>monitor</model>");
//		sb.append("<realmodel>monitor</realmodel>");
//		sb.append("<uid></uid>");
//		// sb.append("<userid>10658</userid>");
//		sb.append("<userid></userid>");
//		sb.append("<msisdn>15813706285</msisdn>");
//		sb.append("<channel>?dyj_android_102286_1337_1_72_1</channel>");
//		sb.append("</VisitorVisitRequest>");
//		
//		sb.append("&a=123&b=中文");
		if(map!=null){
			it=map.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				Object valobj=map.get(key);
				if(valobj==null)continue;
				StringBuffer val=new StringBuffer("");
				
				if(valobj.getClass().isAssignableFrom(Date.class)){
					val=new StringBuffer(FormatText.getStringDate((Date)map.get(key)));
				}if(valobj.getClass().isAssignableFrom(File.class)){

					
				}else{
					val=new StringBuffer((String)(map.get(key)+""));
				}
				
				if(sb.length()==0)
					sb.append(key+"="+val);
				else
					sb.append("&"+key+"="+val);
			}
		}
	System.out.println(">>>>>"+sb);
		out.write(sb.toString());
		
		//out.append(c)
		out.flush();
		out.close();
		/**
		 * 这样就可以发送一个看起来象这样的POST： POST /jobsearch/jobsearch.cgi HTTP 1.0 ACCEPT:
		 * text/plain Content-type: application/x-www-form-urlencoded
		 * Content-length: 99 username=bob password=someword
		 */
		// 一旦发送成功，用以下方法就可以得到服务器的回应：
		
		sCurrentLine = "";
		sTotalString = new StringBuffer();
		
		l_urlStream = connection.getInputStream();

		l_reader = new BufferedReader(new InputStreamReader(
				l_urlStream));
		while ((sCurrentLine = l_reader.readLine()) != null) {
			sTotalString.append(sCurrentLine);// + "\r\n";

		}
		l_urlStream.close();
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(l_urlStream!=null){l_urlStream.close();}
	if(l_reader!=null){l_reader.close();}
	sCurrentLine=null;
//	if(out!=null){out.flush();out.close();out=null;}
	it=null;
	sb=null;
}
		return (sTotalString);
	}

	public static int downLoad(String fileurl,String filename){
	URL url;
	OutputStream os;
	File outFile;
	InputStream is;
	int size=0;
	try {
		url = new URL(fileurl);
		outFile = new File(filename);
		if(outFile.getParentFile().exists()==false){
			outFile.getParentFile().mkdirs();
		}
		os = new FileOutputStream(outFile);
		is = url.openStream();
		byte[] buff = new byte[1024];
		while(true) {
			int readed = is.read(buff);
			if(readed == -1) {
				break;
			}
			byte[] temp = new byte[readed];
			System.arraycopy(buff, 0, temp, 0, readed);
			os.write(temp);
			size+=readed;
		}
		is.close(); 
        os.close();
	} catch (Exception e) {
		
		e.printStackTrace();
	}
	
	return size;
	
}
	
	
	
	public static void outWrite(OutputStream out,String str){
		
			outWrite(out,str.getBytes());
	}
	
	public static void outWrite(OutputStream out,byte[] bytes){
		try {
			out.write(bytes);
			System.out.print(""+new String(bytes,"utf-8"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 检查文件中是否包含文件
	 * @param map
	 * @return
	 */
	public static boolean hasFile(Map map){
		if(map!=null){
			Iterator it=map.keySet().iterator();
			while(it.hasNext()){
				String key=(String)it.next();
				Object valobj=map.get(key);
				if(valobj==null)continue;
				StringBuffer val=new StringBuffer("");
				
				if(valobj.getClass().isAssignableFrom(Date.class)){
					val=new StringBuffer(FormatText.getStringDate((Date)map.get(key)));
				}if(valobj.getClass().isAssignableFrom(File.class)){
					return true;
				}
			}
		}
		return false;
	}
	
	public static void main(String[] args) throws IOException {

		Map map=new HashMap();
		map.put("body","ffff");
		map.put("v","2.0");
		map.put("comic_id","1276");
		map.put("platform_id","1");
		map.put("method","package.submit");
		map.put("format","json");
		map.put("code","100101200");
		map.put("files", new File("E:\\b\\1276.zip"));

		StringBuffer sb=WebUtil.post("http://localhost:8080/mobilecms/interface.action", map,null);
		System.out.println(sb.toString()+"<<<");
//		upload();
	}
	
	
	
	
	
	public static StringBuffer postFile(String uri,Map map,Map header) throws IOException {
		// URL url = new URL("http://localhost:9000/wbsc/spi/visitorvisit.do");
		URL url = new URL(uri);
		String sCurrentLine=null;
		StringBuffer sTotalString=null;
		BufferedReader l_reader=null;
		InputStream l_urlStream=null;
//		HttpURLConnection a; 
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
	
		/**
		 * 然后把连接设为输出模式。URLConnection通常作为输入来使用，比如下载一个Web页。
		 * 通过把URLConnection设为输出，你可以把数据向你个Web页传送。下面是如何做：
		 */
//		connection.setDoOutput(true);
		connection.setDoOutput(true);

		connection.setDoInput(true);

		connection.setUseCaches(false);

		connection.setRequestMethod("POST");

		connection.setRequestProperty("connection", "Keep-Alive");
		
		OutputStreamWriter out=null;
		OutputStream ot=null;
		Iterator it=null;
		DataInputStream in;
		String key=null;
		StringBuffer sb=null;
try{		
		//设置header数据
		if(header!=null){
			it=header.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				connection.setRequestProperty(key, (String)header.get(key));
			}
		}
		/**
		 * 最后，为了得到OutputStream，简单起见，把它约束在Writer并且放入POST信息中，例如： ...
		 */
//		out = new OutputStreamWriter(connection
//				.getOutputStream(), "UTF-8");
		ot=connection.getOutputStream();
		sb = new StringBuffer();

		if(map!=null){
			it=map.keySet().iterator();
			while(it.hasNext()){
				key=(String)it.next();
				Object valobj=map.get(key);
				if(valobj==null)continue;
				StringBuffer val=new StringBuffer("");
				String BOUNDARY = "---------"+new Date().getTime();
				if(valobj.getClass().isAssignableFrom(Date.class)){
					val=new StringBuffer(FormatText.getStringDate((Date)map.get(key)));
				}if(valobj.getClass().isAssignableFrom(File.class)){
					/////////////////////
					
					
					//文件开始
					sb.append("--");

					sb.append(BOUNDARY);

					sb.append("\r\n");

					sb.append("Content-Disposition: form-data;name=\""+key+"\";filename=\""+ ((File)valobj).getName() + "\"\r\n");

					sb.append("Content-Type:application/octet-stream\r\n\r\n");

					byte[] data = sb.toString().getBytes();
					ot.write(data);
//					out.w.write(data);
//
					in = new DataInputStream(new FileInputStream(((File)valobj)));

					int bytes = 0;

					byte[] bufferOut = new byte[1024];

					while ((bytes = in.read(bufferOut)) != -1) {
						
						ot.write(bufferOut, 0, bytes);
					}
					in.close();;
					//out.flush();out.close();
					
				}else{
//					DataOutputStream dos = new DataOutputStream(request.getOutputStream());
					ot.write(("-----------------------------"+BOUNDARY).getBytes());//这是每个要被发送数据间的间隔
					ot.write((" Content-Disposition: form-data; name="+key+"").getBytes());
					ot.write((valobj+"").getBytes());
					ot.write((" -----------------------------"+BOUNDARY).getBytes());
					
					
					
//					val=new StringBuffer((String)(map.get(key)+""));
				}
				
//				if(sb.length()==0)
//					sb.append(key+"="+valobj);
//				else
//					sb.append("&"+key+"="+valobj);
			}
		}
	System.out.println(">>>>>"+sb);
//		out.write(sb.toString());
		
		//out.append(c)
		ot.flush();
		ot.close();
		/**
		 * 这样就可以发送一个看起来象这样的POST： POST /jobsearch/jobsearch.cgi HTTP 1.0 ACCEPT:
		 * text/plain Content-type: application/x-www-form-urlencoded
		 * Content-length: 99 username=bob password=someword
		 */
		// 一旦发送成功，用以下方法就可以得到服务器的回应：

		sCurrentLine = "";
		sTotalString = new StringBuffer();
		
		l_urlStream = ((URLConnection)connection).getInputStream();

		l_reader = new BufferedReader(new InputStreamReader(
				l_urlStream));
		while ((sCurrentLine = l_reader.readLine()) != null) {
			sTotalString.append(sCurrentLine);// + "\r\n";

		}
		l_urlStream.close();
}catch(Exception e){
	e.printStackTrace();
}finally{
	if(l_urlStream!=null){l_urlStream.close();}
	if(l_reader!=null){l_reader.close();}
	sCurrentLine=null;
//	if(out!=null){out.flush();out.close();out=null;}
	it=null;
	sb=null;
}
		return (sTotalString);
	}
	
	
	
}




