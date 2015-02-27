package com.weisiliang.cms.process;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Id;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.SessionFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;








import com.weisiliang.cms.annotation.ColumnWSL;
import com.weisiliang.cms.exception.WSLCmsException;
import com.weisiliang.cms.factory.ConfigWSL;
import com.weisiliang.cms.inter.FileUploadProcess;
import com.weisiliang.cms.inter.ItemType;
import com.weisiliang.cms.inter.UpFile;
import com.weisiliang.cms.view.ViewTitle;

public class CmsProcessBase implements CmsProcess{
	List<ViewTitle> listTable=new ArrayList<ViewTitle>();;
	Map<String,String> configwsl=new HashMap<String,String>();
	
	
	
	public CmsProcessBase(){
		Set<?> set=ConfigWSL.getProps().keySet();
		Iterator<?> iter=set.iterator();
		String key=null;
		String val=null;
		while (iter.hasNext()){
			key=(String)iter.next();
			val=(String)ConfigWSL.getProps().get(key);
			configwsl.put(key, val);
		}
		
		
	}
	
//	@Autowired
	SessionFactory sessionFactory=null;
	
	FileUploadProcess fileUploadProcess=null;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory=sessionFactory;
		
//		Map<String, ClassMetadata> map=this.sessionFactory.getAllClassMetadata();
//		Iterator<String> it=map.keySet().iterator();
//		
//		
//		String key;
//		ClassMetadata cm;
//		Class<?> mappedClass;
//		
//		while(it.hasNext()){
//			key=it.next();
//			cm=map.get(key);
//			mappedClass=cm.getMappedClass();
//			if(mappedClass.getAnnotation(TableWSL.class)==null){
//				continue;
//			}
//			
//			listTable.add(new TableObj(mappedClass));
//			
//		}
	}
	
	/**
	 * 获得主键id
	 * @return
	 */
	public Serializable getObjId(Object obj){
	
		for (Field field:obj.getClass().getDeclaredFields()){
			if(field.getAnnotation(Id.class)!=null){
				try {
					field.setAccessible(true);
					return (Serializable)field.get(obj);
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public Field getObjIdField(Class<?> objclass){
		
		for (Field field:objclass.getDeclaredFields()){
			if(field.getAnnotation(Id.class)!=null){
				try {
					field.setAccessible(true);
					return field;
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	/**
	 * 字符串强制类型转换
	 * @param objclass
	 * @param str
	 * @return
	 * @throws WSLCmsException 
	 */
	public Serializable parseSer(Class<?> objclass,String str) throws WSLCmsException{
		if(str==null){
			return null;
		}
		if(objclass==String.class){
			return str;
		}else if(objclass==Integer.class){
			return Integer.parseInt(str);
		}else if(objclass==Boolean.class){
			return Boolean.parseBoolean(str);
		}else{
			throw new WSLCmsException("can not parse class:"+objclass+" value:"+str);
		}
	}
	
	/**
	 * 通过request获得编辑对象
	 * 这个对象类型通过class获得，
	 * 提交的参数会填充到clas中
	 * @param request
	 * @param clas
	 * @return
	 */
	public Object getObjFromRequest(HttpServletRequest request,Class<? extends Object> clas){
			
			Object obj=null;
			try {
			obj=clas.newInstance();
			Field[] fields=obj.getClass().getDeclaredFields();
			
			String val=null;
			ColumnWSL column=null;
			for(Field f:fields){
				f.setAccessible(true);
				val=null;
				column=f.getAnnotation(ColumnWSL.class);
				
				if(column==null){
					continue;
				}
				UpFile[] files;
				
				
				String[] args=request.getParameterValues(f.getName());
				if(args!=null){
					for(String str:args){
	//					 sb. append(ary[i]);
						if(val==null){
							val=str;
						}else{
							val+=","+str;
						}
					}
				}
				if(val==null){
					continue;
				}
				
			
					
				if(column.inputType()==ItemType.FILE||column.inputType()==ItemType.FILEIMG){
//					List<MultipartFile> ms=this.getMultipartFiles(request, f.getName());
					
					files=this.upload(request, "_"+f.getName(), ConfigWSL.getMessage("file_path"));
					if(files!=null&&files[0]!=null){
						f.set(obj, files[0].getSavePath());
//						return obj;
						continue;
					}
				}else if(String.class.isAssignableFrom(f.getType())){
					f.set(obj, val);
				}else if(Integer.class.isAssignableFrom(f.getType())){
					try{
						if(val.split(",")[0].equals("")==false)
						f.set(obj, Integer.parseInt(val.split(",")[0]));
					}catch(NumberFormatException e){
						f.set(obj, null);
						e.printStackTrace();
					}
				}else if(List.class.isAssignableFrom(f.getType())){
				
					f.set(obj, val.toString());
				}else if(Date.class.isAssignableFrom(f.getType())){
					
					if(column.defaultData()==ColumnWSL.DefaultData.DATE_NOW){
						f.set(obj, new Date());
					}else{
						f.set(obj, parseDate(val));
					}
				}else{
					f.set(obj, val);
				}
				
					
					
				
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return obj;
			
		}
	
	private Date parseDate(String strDate){
		if(strDate==null){
			return null;
		}
		
		 SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date time=null;
		try {
			time = formatter.parse(strDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		formatter=null;
		
		return time;
	}
/**
 * 通过request获得查询对象，对象类型通过class获得，
 * 这个对象用于列表筛选
 * 
 * @param request
 * @param clas
 * @return
 */
public Object getSearchObjFromRequest(HttpServletRequest request,Class<? extends Object> clas){
		
		Object obj=null;
		try {
		obj=clas.newInstance();
		Field[] fields=obj.getClass().getDeclaredFields();
		
		String val=null;
		for(Field f:fields){
			f.setAccessible(true);
			val=request.getParameter(f.getName());
			if(val!=null&&!val.isEmpty()){
				if(String.class.isAssignableFrom(f.getType())){
					f.set(obj, val);
				}else if(Integer.class.isAssignableFrom(f.getType())){
					f.set(obj, Integer.parseInt(val));
				}
					
				
				
			}
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return obj;
		
	}





/**
 * 文件上传
 * @param request
 * @param FieldName
 * @return
 */
public MultipartFile getMultipartFile(HttpServletRequest request,String FieldName){
	//如果表单类型不是文件上穿类型,返回null
	if(MultipartHttpServletRequest.class.isAssignableFrom(request.getClass())==false){
		return null;
	}
	MultipartHttpServletRequest mul = (MultipartHttpServletRequest) request;  
    List<MultipartFile> files = mul.getFiles(FieldName);
    	if(files.size()==0){
    		return null;
    	}
    return files.get(0);
}

/**
 * 多文件上传
 * @param request
 * @param FieldName
 * @return
 */
public List<MultipartFile> getMultipartFiles(HttpServletRequest request,String FieldName){
	//如果表单类型不是文件上穿类型,返回null
	if(MultipartHttpServletRequest.class.isAssignableFrom(request.getClass())==false){
		return null;
	}
	
	MultipartHttpServletRequest mul = (MultipartHttpServletRequest) request; 

    List<MultipartFile> files = mul.getFiles(FieldName);
    return files;
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
public UpFile[] upload(HttpServletRequest request,String FieldName,String basePath) throws Exception{
	UpFile[] files=null;
	UpFile f;
	
	MultipartHttpServletRequest mul = (MultipartHttpServletRequest) request; 

    List<MultipartFile> mfiles = mul.getFiles(FieldName);
	
//	if(filethumb!=null&&filethumb.length>0){
//		files=new File[filethumb.length];
    files=new UpFile[mfiles.size()];
    
    int i=0;
		for(MultipartFile file:mfiles){
			 f=upload(request, file,basePath);
			 
			 files[i]=f;
			i++;
		}
		
//	}
		
	
	return files;
}
/**
* 内容上传
* @throws IOException 
*/
public UpFile upload(HttpServletRequest request,@RequestParam() MultipartFile filethumb,String basePath) throws IOException{
	
if (filethumb.isEmpty()) {
	return null;
}
byte[] bytes;
//filethumb.
    bytes = filethumb.getBytes();
//    if(date==null)
//   date=new Date();
   String savepath="";
   String realpath=request.getSession().getServletContext().getRealPath("/");
   
   if(basePath!=null&&basePath.startsWith("/")){

	   realpath=basePath;
   }else if(basePath!=null&&basePath.indexOf(":")!=-1){

	   realpath=basePath;
   }else{
	   realpath+="/"+basePath;
   }
    
//  String filename;//=FormatText.getFileName(filethumb.getOriginalFilename())+"."+FormatText.getExt(filethumb.getOriginalFilename());
   Date date=new Date();
  
  String outPath=this.getPathFromDate(date)+""+date.getTime()+"."+this.getExt(filethumb.getOriginalFilename());
   savepath=realpath+File.separator+outPath;
  
   File f=new File(savepath);
//   int i=1;
   
//    f=new File(savepath);
    if(f.getParentFile().exists()==false){
    	f.getParentFile().mkdirs();
    }
   
    FileOutputStream fos = new FileOutputStream(savepath); // 上传到写死的上传路径
    fos.write(bytes);  //写入文件
    fos.close();

    //clear
    bytes=null;
    fos=null;
    f=new File(savepath);
    UpFile upFile=new UpFile();
    upFile.setFile(f);
    upFile.setSavePath(outPath);
    
    if(fileUploadProcess!=null){
		fileUploadProcess.uploadFile(upFile);
	}
	
    return upFile;
    
  
}


/**
 * remove file
 * @param request
 * @param basePath
 * @param fileDataPath
 * @throws IOException
 */
public void remove(HttpServletRequest request,String basePath,String fileDataPath) throws IOException{
	
	String realpath=request.getSession().getServletContext().getRealPath("/");
	   
	   if(basePath!=null&&basePath.startsWith("/")){

		   realpath=basePath;
	   }else if(basePath!=null&&basePath.indexOf(":")!=-1){

		   realpath=basePath;
	   }else{
		   realpath+="/"+basePath;
	   }
	   
	

  String savepath=realpath+File.separator+fileDataPath;
  
   File f=new File(savepath);

   f.delete();
   f=null;
   realpath=null;
   savepath=null;
   
   if(this.fileUploadProcess!=null){
	   UpFile uf=new UpFile();
	   uf.setFile(f);
	   uf.setSavePath(fileDataPath);
	   fileUploadProcess.removeFile(uf);
   }
  
}


/**
 * 返回后缀名
 * @param filename
 * @return
 */
public String getExt(String filename){
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
public String getPathFromDate(Date date){
	Calendar ca=Calendar.getInstance();
	if(date==null)return null;
	ca.setTime(date);
	return ca.get(Calendar.YEAR)
			+"/"+(ca.get(Calendar.MONTH)+1)
			+"/"+ca.get(Calendar.DAY_OF_MONTH)
			+"/";
}

public List<ViewTitle> getListTable() {
	return listTable;
}

public void setListTable(List<ViewTitle> listTable) {
	this.listTable = listTable;
}

@Override
public void process(HttpServletRequest request, HttpServletResponse response,
		ModelMap modelMap, Class<Object> classobj) throws WSLCmsException {
	// TODO Auto-generated method stub
	
}

@Override
public void setFileUploadProcess(FileUploadProcess fileUploadProcess) {
	this.fileUploadProcess= fileUploadProcess;
	
}





}
