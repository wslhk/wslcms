package cn.ifenghui.service.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
/**
 * 发送单条
 * @author slwei
 *
 */
public class PushWp {
	public static int pushToastNotifications(String uriString, String title, String content, String param,int count) throws IOException{
//	    if(content==null||content.equals("")){
//	    	content="English";
//	    }
//		if(1==1){
//			System.out.println("测试推送");
//			return 1;
//		}
		if(count==0){
			return 2;
		}
		//弹出消息
	    String toastMsg = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
	                "<wp:Notification xmlns:wp=\"WPNotification\">" +
	                "<wp:Toast>" +
	                "<wp:Text1>" + title + "</wp:Text1>" +
	                "<wp:Text2>" + content + "</wp:Text2>" +
	                "<wp:Param>"+ param +"</wp:Param>" +
	                "</wp:Toast>" +
	                "</wp:Notification>";  
	    //数字更新消息
	    String tileMessage = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" +
        "<wp:Notification xmlns:wp=\"WPNotification\">" +
            "<wp:Tile>" +
              "<wp:BackgroundImage>" + "" + "</wp:BackgroundImage>" +
              "<wp:Count>" + count + "</wp:Count>" +
              "<wp:Title>" + "" + "</wp:Title>" +
              "<wp:BackBackgroundImage>" +"" + "</wp:BackBackgroundImage>" +
              "<wp:BackTitle>" + "" + "</wp:BackTitle>" +
              "<wp:BackContent>" + "" + "</wp:BackContent>" +
           "</wp:Tile> " +
        "</wp:Notification>";
	    int wpcode=0;
//	    wpcode=PushWp.post(uriString, toastMsg,1);
//	    System.out.println("wpcode:"+wpcode);
	    wpcode=PushWp.post(uriString, tileMessage,2);
	    System.out.println("wpcode:"+wpcode);
	    return 1;
	    
//	    URL url = null;
//	    HttpURLConnection http = null;
//	    
//	    try{
//	      url = new URL(uriString);
//	      http = (HttpURLConnection)url.openConnection();
//	      http.setDoOutput(true);
//	      http.setRequestMethod("POST");
//	      http.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
//	      http.setRequestProperty("X-WindowsPhone-Target", "toast");
//	      http.setRequestProperty("X-NotificationClass", "2");
//	      http.setRequestProperty("Content-Length", "1024");
//	      http.getOutputStream().write(toastMsg.getBytes("utf-8"));
//	      // 刷新对象输出流，将任何字节都写入潜在的流中
//	      http.getOutputStream().flush();
//	      // 关闭输出流
//	      http.getOutputStream().close();     
//	      
//	      
//	      //////////////////
//	      String sCurrentLine = "";
//	      StringBuffer sTotalString = new StringBuffer();
//			
//	      InputStream l_urlStream = http.getInputStream();
//
//	      BufferedReader l_reader = new BufferedReader(new InputStreamReader(
//					l_urlStream));
//			while ((sCurrentLine = l_reader.readLine()) != null) {
//				sTotalString.append(sCurrentLine);// + "\r\n";
//
//			}
//			l_urlStream.close();
//	      System.out.println("push_wp:"+sTotalString);
//	    }
//	    catch(Exception e) {
//	      e.printStackTrace();
//	    }
//	    finally{
//	      if(http != null){
//	        http.disconnect();
//	      }
//	     
//	    }  
//	    
//	    return http.getResponseCode();              
	  }
	
	public static int post(String uriString,String toastMsg,int type){
		 URL url = null;
		    HttpURLConnection http = null;
		    
		    try{
		      url = new URL(uriString);
		      http = (HttpURLConnection)url.openConnection();
		      http.setDoOutput(true);
		      
		      http.setRequestMethod("POST");
		      byte[] notificationMessage = toastMsg.getBytes();
		      if(type==1){
		      http.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
		      http.setRequestProperty("X-WindowsPhone-Target", "toast");
		      http.setRequestProperty("X-NotificationClass", "2");
		      http.setRequestProperty("Content-Length", notificationMessage.length+"");
		      }else if(type==2){
	
		    	  
	                // Sets the web request content length.
		    	  http.setRequestProperty("Content-Length",notificationMessage.length+"");
		    	  http.setRequestProperty("Content-Type", "text/xml; charset=utf-8");
	                http.setRequestProperty("X-WindowsPhone-Target", "token");
	                http.setRequestProperty("X-NotificationClass", "1");
		      }
		      http.getOutputStream().write(toastMsg.getBytes("utf-8"));
		      // 刷新对象输出流，将任何字节都写入潜在的流中
		      http.getOutputStream().flush();
		      // 关闭输出流
		      http.getOutputStream().close();     
		      
		      
		      
		      
		      //////////////////
		      String sCurrentLine = "";
		      StringBuffer sTotalString = new StringBuffer();
				
		      InputStream l_urlStream = http.getInputStream();

		      BufferedReader l_reader = new BufferedReader(new InputStreamReader(
						l_urlStream));
				while ((sCurrentLine = l_reader.readLine()) != null) {
					sTotalString.append(sCurrentLine);// + "\r\n";

				}
				l_urlStream.close();
		      System.out.println("push_wp:"+sTotalString);
		      return http.getResponseCode(); 
		    }catch(Exception e) {
		      e.printStackTrace();
		    }
		    finally{
		      if(http != null){
		        http.disconnect();
		      }
		     
		    }  
		    
		    return -1;
	}
	
	
	public static void main(String[] args) {
	    // TODO Auto-generated method stub    
	    
//	    try {
//	      System.in.read();
//	    } catch (IOException e1) {
//	      // TODO Auto-generated catch block
//	      e1.printStackTrace();
//	    }
	    // 该uri是客户端运行并创建通道之后获得的  
	    String urls = "http://db3.notify.live.net/throttledthirdparty/01.00/AAHGO5Q4sO3ZQa1cBCWwx4X9AgAAAAADAQAAAAQUZm52OjIzOEQ2NDJDRkI5MEVFMEQ";
	    urls="http://db3.notify.live.net/throttledthirdparty/01.00/AAGlJJ0UO8ubSq9eQGGjO9rwAgAAAAADAQAAAAQUZm52OkJCMjg1QTg1QkZDMkUxREQ";
	    urls="http://db3.notify.live.net/throttledthirdparty/01.00/AAFU3R_SoDySSqP37ZRBG-OsAgAAAAADKwAAAAQUZm52OkJCNDJFRUVFQjBEMTk2NDA";
	    urls="http://db3.notify.live.net/throttledthirdparty/01.00/AAFU3R_SoDySSqP37ZRBG-OsAgAAAAADLAAAAAQUZm52OkJCNDJFRUVFQjBEMTk2NDA";
	   urls="http://db3.notify.live.net/throttledthirdparty/01.00/AAEWIqrxNVGqT7_3CJMyr7jjAgAAAAADAQAAAAQUZm52OkJCMjg1QTg1QkZDMkUxREQ";
	   urls="http://db3.notify.live.net/throttledthirdparty/01.00/AAENJJORoJ1RRYvKi9Ro0DG9AgAAAAADAQAAAAQUZm52OkJCMjg1QTg1QkZDMkUxREQ"; 
	   
	   String text1 = "测试22";
	    String text2 = "";
	    String param = "/NotificationPage.xaml?NavigatedFrom = ToastNotification&amp;uri=http://baike.baidu.com/";  // 推送负载中，& 要转换写为&amp;
	    param="/View/StartUpView.xaml";
	    try {
	      int code = pushToastNotifications(urls, text1, text2, param,1);
	      System.out.println("Response code : "+code);
	    } 
	    catch (IOException e) {
	      e.printStackTrace();
	    }catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
}
