package cn.ifenghui.service.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;



import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;
import org.springframework.web.servlet.view.InternalResourceViewResolver;


import cn.ifenghui.service.util.FormatText;


@Controller
public class BaseAction {
//	public ConfigInterface config=new AdminConfig();
	 byte[] bytes;
	 FileOutputStream fos;
	
//	 CommonsMultipartResolver
	/**
	 * 管理错误页 
	 */
	static String PAGE_ERROR_ADMIN="admin/error";//
	
	String errmsg=null;
	
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}



	@Autowired 
	InternalResourceViewResolver viewResolver;
	
	
	
//	@Autowired
//	CommonsMultipartResolver multipartResolver;
	
	
	
	
	
	public BaseAction(){
		
	}

	
	@InitBinder
	protected void initBinder(HttpServletRequest request,
		       ServletRequestDataBinder binder)throws Exception {     
//		NumberFormat number=NumberFormat.getInstance();
//		number.parse("##############.##");
		              binder.registerCustomEditor(Integer.class, null,new CustomNumberEditor(Integer.class, null, true));
		              binder.registerCustomEditor(Long.class, null,new CustomNumberEditor(Long.class, null, true));
		              binder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
		              binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		              binder.registerCustomEditor(Date.class, new CustomDateEditor( new SimpleDateFormat("yyyy-MM-dd"), true));
		              //		              binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, number, true));
		              //SimpleDateFormat dateFormat = new SimpleDateFormat(getText("date.format", request.getLocale()));
		             // dateFormat.setLenient(false);
		             // binder.registerCustomEditor(Date.class, null,new CustomDateEditor(dateFormat, true));
		       }
	

	
	public static long now=0;
	/**
	 * 用于测试程序执行速度,key为打印的标记
	 * @param key
	 */
	public void ms(String key){
		
		long now2=new Date().getTime();
		System.out.println("Ms:"+(now2-now)+" "+key);
		now=now2;
		
	}
	public InternalResourceViewResolver getViewResolver() {
		return viewResolver;
	}
	public void setViewResolver(InternalResourceViewResolver viewResolver) {
		this.viewResolver = viewResolver;
	}
	
	/**
	 * 批量上传文件
	 * @param request
	 * @param filethumb
	 * @param path
	 * @param date
	 * @return
	 * @throws Exception 
	 */
	public File[] upload(HttpServletRequest request,@RequestParam() MultipartFile[] filethumb,String path,Date date) throws Exception{
		File[] files=null;
		File f;
		if(filethumb!=null&&filethumb.length>0){
			files=new File[filethumb.length];
			
			for(int i=0;i<filethumb.length;i++){
				 f=this.upload(request, filethumb[i], path, date);
				 
				 files[i]=f;
				
			}
			
		}
		
		return files;
	}
/**
 * 内容上传
 * @throws IOException 
 */
	public File upload(HttpServletRequest request,@RequestParam() MultipartFile filethumb,String path,Date date) throws IOException{
		
	if (filethumb.isEmpty()) {
		return null;
	}

//	filethumb.
        bytes = filethumb.getBytes();
        if(date==null)
       date=new Date();
       String savepath="";
       String realpath=request.getSession().getServletContext().getRealPath("/");
        
      String filename;//=FormatText.getFileName(filethumb.getOriginalFilename())+"."+FormatText.getExt(filethumb.getOriginalFilename());
       
      //中文编码
//      if(Config.isLinux()){
//    	  filename=URLEncoder.encode(filename,"utf-8");
      long ctime=System.currentTimeMillis();
    	  filename=ctime+"."+FormatText.getExt(filethumb.getOriginalFilename());
//      }
      
       savepath=realpath+""+path+FormatText.getPathFromDate(date)+"/";
       
       File f=new File(savepath+filename);
       int i=1;
       while(f.exists()){
    	   //如果文件存在,自动重命名
    	   filename=ctime+""+i+"."+FormatText.getExt(filethumb.getOriginalFilename());

    	   i++;
    	   f=new File(savepath+filename);
    	   
       }
       
        f=new File(savepath);
        if(f.exists()==false){
        	f.mkdirs();
        }
       
        fos = new FileOutputStream(savepath+filename); // 上传到写死的上传路径
        fos.write(bytes);  //写入文件
        fos.close();

        //clear
        bytes=null;
        fos=null;
        f=new File(savepath+filename);
        
        
        //图片压缩
//        try {
//			this.toThumb(f,request);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
		
		
        return f;
        
      
	}
	
	
//	public void toThumb(File file,HttpServletRequest request) throws Exception{
//		List<Thumb> listhumb=this.thumbAdminService.getAllThumb();
//		this.toThumb(file, request, listhumb);
//		
//	}
//	/**
//	 * 图片压缩
//	 * @param request
//	 * @param filethumb
//	 * @param path
//	 * @param date
//	 * @throws MagickException 
//	 * @throws IOException 
//	 */
//	@SuppressWarnings("unchecked")
//	public void toThumb(File file,HttpServletRequest request,List<Thumb> listhumb) throws Exception{
//		
//		/*
//		 * 读取原始文件
//		 * 搜索数据库查询需要的缩略图格式
//		 * 按照缩略图格式压缩缩略图
//		 * thumb/src/20x20/12341234.jpg
//		 */
//		
//		
//		
//		//通过listthumb 看哪个是哪个目录的
//		
//		@SuppressWarnings("rawtypes")
//		Map map=new HashMap();
//		String key;
//		for(Thumb cthumb:listhumb){
//			
//			if((cthumb.getWidth()==null)||cthumb.getHeight()==null||cthumb.getKey()==null){
//				continue;
//			}
//			key=ThumbKey.getType(cthumb.getKey())+"_"+cthumb.getWidth()+"_"+cthumb.getHeight()+"_"+cthumb.getIsCut();
//			
//			
//			if(map.get(key)==null){
//				map.put(key, cthumb);
//			}
//		}
//		
//		//压缩
//		/*
//		 * ImgMagic.createThumbnail(f.getAbsolutePath(), thumbfile.getAbsolutePath(), w, h,(c==1)?true:false);
//					
//					if(c!=null&&c==1){
//						ImgMagic.cutImg(thumbfile.getAbsolutePath(), thumbfile.getAbsolutePath(), w, h, 0, 0);
//		 */
//		
//		@SuppressWarnings("rawtypes")
//		Iterator it=map.keySet().iterator();
//		while(it.hasNext()){
//			String mapkey=(String)it.next();
//			Thumb value=(Thumb)map.get(mapkey);
//			String newname=FileNameUtil.getThumbPath(file, value,request.getSession().getServletContext().getRealPath("/"));
//			
//			if(mapkey.startsWith(FileNameUtil.getTypeFromFile(file))==false){
//				continue;
//			}
//			
//			ImgMagic.createThumbnail(file.getAbsolutePath(), newname, value.getWidth(), value.getHeight(),value.getIsCut());
//			if(value.getIsCut()){
//				ImgMagic.cutImg(newname, newname, value.getWidth(), value.getHeight(), 0, 0);
//			}
//			
//		}
//		
//		//复制源文件
//		String newname=FileNameUtil.getThumbPath(file, null, request.getSession().getServletContext().getRealPath("/"));
//		ImgMagic.createThumbnail(file.getAbsolutePath(), newname, 2000, 4000,false);
//	}
//	

	
}
