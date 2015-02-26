package cn.ifenghui.service.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;

public class DistimoUtil {
	/*Public key:455accaf2453cbd33498e8cc243468be84ece93f
	 * Private key:76aebeff56a02e2160f268a3e39a47caa13952fa
	 * Max requests per minute:30
	 * Max requests per day:1000
	 * Access:Only data from VistaStory
	 * 
	 * */
	
	private String publicKey="455accaf2453cbd33498e8cc243468be84ece93f";
	private String privateKey="76aebeff56a02e2160f268a3e39a47caa13952fa";
	private String username="vistastory@126.com";
	private String password="vista688";
	
	public static void main(String[] args){
		DistimoUtil util=new DistimoUtil();
		
		try {
			System.out.println(util.getRevenues());
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
 public String  test() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/applinks";
	    String query            = "format=json";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
 }
 
 
 
 public String  getStore() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/filters/stores/events";
	    String query            = "format=json";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
 
 
 public String  getAppStore() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/filters/appstores/events";
	    String query            = "format=json";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
 
// //获得应用列表
// public String  getApplications() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
//	 
//
//	    // Returns assets in json format
//	    String api              = "https://analytics.distimo.com/api/v2/filters/appstores/events";
//	    String query            = "format=json";
//	     
//	    // Necessary variables
//	    String publicKey        = this.publicKey;
//	    String privateKey       = this.privateKey;
//	    String username         = this.username;
//	    String password         = this.password;
//	     
//	    // Identify application
//	    long time               = System.currentTimeMillis() / 1000;
//	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
//	    Mac mac                 = Mac.getInstance("HmacSHA1");
//	    mac.init(sks);
//	     
//	    String hash             = "";
//	     
//	    byte[] digest           = mac.doFinal((query + time).getBytes());
//	    for (byte b : digest) {
//	        hash                += String.format("%02x", b);
//	    }
//	     
//	    // Make the request
//	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
//	     
//	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
//	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
//	     
//	    InputStream is          = null;
//	     
//	    try {
//	        is                  = c.getInputStream();
//	    }
//	    catch (Exception e) {
//	        is                  = c.getErrorStream();
//	    }
//	     
//	    InputStreamReader isr   = new InputStreamReader(is);
//	    BufferedReader br       = new BufferedReader(isr);
//	    String result           = "";
//	    String line             = "";
//	     
//	    while ((line = br.readLine()) != null) {
//	        result += line + "\n";
//	    }
//return result;
//}
 
 
 ///////////////////////////////////国家
 
 
 
 
 
 public String  getCountries() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/filters/countries/rankings";
	    String query            = "format=json";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
 
 
 
 
 
 
 
 
 /////////////////////////////////下载次数
 public String  getDownloads(String countries,String appstores) throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	 
	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/downloads";
	    String query            = "format=json&interval=day&breakdown=date&from=thisyear";
	 
	    if(countries!=null&&countries.equals("")==false){
	    	query+="&countries="+countries;
	    }
	    
	    if(appstores!=null&&appstores.equals("")==false){
	    	query+="&appstores="+appstores;
	    }
	    
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
 
 
 public String  getDownloadsPng() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/downloads";
	    String query            = "format=png&interval=day&breakdown=date&from=thisyear";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
 
 
/////////////////////////////////收益金额
 public String  getRevenues() throws NoSuchAlgorithmException, InvalidKeyException, MalformedURLException, IOException{
	 

	    // Returns assets in json format
	    String api              = "https://analytics.distimo.com/api/v2/revenues";///api/v2/revenues?breakdown=date,country
	    String query            = "format=json&breakdown=date,country";//&from=2012-03-01";
	     
	    // Necessary variables
	    String publicKey        = this.publicKey;
	    String privateKey       = this.privateKey;
	    String username         = this.username;
	    String password         = this.password;
	     
	    // Identify application
	    long time               = System.currentTimeMillis() / 1000;
	    SecretKeySpec sks       = new SecretKeySpec(privateKey.getBytes(), "HmacSHA1");
	    Mac mac                 = Mac.getInstance("HmacSHA1");
	    mac.init(sks);
	     
	    String hash             = "";
	     
	    byte[] digest           = mac.doFinal((query + time).getBytes());
	    for (byte b : digest) {
	        hash                += String.format("%02x", b);
	    }
	     
	    // Make the request
	    String url              = api + "?" + query + "&apikey=" + publicKey + "&hash=" + hash + "&t=" + time;
	     
	    HttpURLConnection c     = (HttpURLConnection) new URL(url.trim()).openConnection();
	    c.setRequestProperty("Authorization", "Basic " + DatatypeConverter.printBase64Binary((username + ":" + password).getBytes()));
	     
	    InputStream is          = null;
	     
	    try {
	        is                  = c.getInputStream();
	    }
	    catch (Exception e) {
	        is                  = c.getErrorStream();
	    }
	     
	    InputStreamReader isr   = new InputStreamReader(is);
	    BufferedReader br       = new BufferedReader(isr);
	    String result           = "";
	    String line             = "";
	     
	    while ((line = br.readLine()) != null) {
	        result += line + "\n";
	    }
return result;
}
}
