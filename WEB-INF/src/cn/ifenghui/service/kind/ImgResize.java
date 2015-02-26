package cn.ifenghui.service.kind;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.List;

/**
 * 图片自定义尺寸
 * @author slwei
 *
 */
public class ImgResize implements Serializable{
	
	String id;
	int width;
	int height;
	int isCut;
	Size size;
	String srcPath="";//文件链接
//	String thumbPath="";//缩略图地址,如果是原文件则存欲原文件地址
//	String url;//访问链接
	
	public static enum Size{
		SPECIAL_FANG_BIG
		,SPECIAL_FANG_SMALL
		,SPECIAL_CHANG_SMALL
		,SPECIAL_BANNER_PAD
		,SPECIAL_BANNER_PHONE
		,COMIC_LIST_COVER
		,PRODUCT_LIST_COVER
		,PRODUCT_COVER_PAD
		,PRODUCT_COVER_PHONE
		,PUBLISHER_LIST_LOGO
		,PREVIEW_S_PHONE
		,PREVIEW_B_PHONE
		,PREVIEW_S_PAD
		,PREVIEW_B_PAD
		,SERIES_SAME_COVER
		};
	
//	int id;//编号
//	String name;//中国价格
////	float priceUs;//美国价格
//	boolean hasSpcial;//是否含有专题
	
//	public static ImgResize SPECIAL_FEATURED=new ImgResize(1,"特别推荐",true);
//	public static ImgResize SPECIAL_MORE=new ImgResize(2,"more-根多专题",true);
//	public static Special PRICE_6=new Special(1,6,1.99f);
//	public static Special PRICE_12=new Special(2,12,2.99f);
//	public static Special PRICE_18=new Special(3,18,3.99f);
	
//	enum PRICE_TYPE{PRICE_FREE=new Price(),PRICE_6,PRICE_8};
	
//	public static List<ImgResize> getViews(){
//		List<ImgResize> list=new ArrayList<ImgResize>();
//		list.add(SPECIAL_FEATURED);
//		list.add(SPECIAL_MORE);
////		list.add(PRICE_6);
////		list.add(PRICE_12);
////		list.add(PRICE_18);
//		return list;
//	}
//	
//	/**
//	 * 返回包含special的专题列表
//	 * @return
//	 */
//	public static List<ImgResize> getViewsHasSpecial(){
//		List<ImgResize> list=new ArrayList<ImgResize>();
//		for(ImgResize view :getViews()){
//			if(view.hasSpcial==true)
//				list.add(view);
//		}
//		
//		return list;
//	}
	/**
	 * 通过size获得尺寸类型
	 */
	public static ImgResize getImgResizeAtSize(Size size){
		switch(size){
		case SPECIAL_FANG_BIG:
			return new ImgResize("1",956,802,1
					,Config.getMessage("img.path.special"),size);
			
		case SPECIAL_FANG_SMALL:
			return new ImgResize("2",456,382,1
					,Config.getMessage("img.path.special"),size);
			
		case SPECIAL_CHANG_SMALL:
			return new ImgResize("3",592,300,1
					,Config.getMessage("img.path.special"),size);
			
		case SPECIAL_BANNER_PAD:
			return new ImgResize("4",2048,600,1
					,Config.getMessage("img.path.special"),size);
			
		case SPECIAL_BANNER_PHONE:
			return new ImgResize("5",1024,300,1
					,Config.getMessage("img.path.special"),size);
		case COMIC_LIST_COVER:
			return new ImgResize("6",592,300,1
					,Config.getMessage("img.path.comic"),size);
		case PRODUCT_LIST_COVER:
			return new ImgResize("7",592,300,1
					,Config.getMessage("img.path.comic"),size);
		
		case PUBLISHER_LIST_LOGO:
			return new ImgResize("8",300,300,1
					,Config.getMessage("img.path.comic"),size);
		case PRODUCT_COVER_PHONE:
			return new ImgResize("9",288,437,1
					,Config.getMessage("img.path.comic"),size);
		case PRODUCT_COVER_PAD:
			return new ImgResize("a",392,594,1
					,Config.getMessage("img.path.comic"),size);
			
			
			/*
			 * PREVIEW_S_PHONE
		,PREVIEW_B_PHONE
		,PREIVEW_S_PAD
		,PREVIEW_B_PAD
			 * */
		case PREVIEW_S_PHONE:
			return new ImgResize("b",216,332,1
					,Config.getMessage("img.path.comic"),size);
		case PREVIEW_B_PHONE:
			return new ImgResize("c",252,386,1
					,Config.getMessage("img.path.comic"),size);
			
		case PREVIEW_S_PAD:

			return new ImgResize("d",142,218,1
					,Config.getMessage("img.path.comic"),size);
		case PREVIEW_B_PAD:
			return new ImgResize("e",592,910,1
					,Config.getMessage("img.path.comic"),size);
			
		case SERIES_SAME_COVER:
			return new ImgResize("f",196,297,1
					,Config.getMessage("img.path.comic"),size);
			
		default:
			return null;
		}
	}
	
	public static ImgResize getImgResizeAtId(String id){
		for(Size size:Size.values()){
			if( getImgResizeAtSize(size).id.equals(id)){
				return getImgResizeAtSize(size);
			}
		}
		
			return null;
	
	}
	
	public static String getUrl(Size size,String filename){
		ImgResize imgSize=getImgResizeAtSize(size);
		if(imgSize==null){
			return null;
		}else if(imgSize.width==0||imgSize.height==0){
			//原始图片地址
			return Config.getMessage("img.interface")+ imgSize.srcPath+filename;
		}else{
			//压缩图片地址
			return Config.getMessage("img.interface")+"/f/"+imgSize.id+"/"+filename;
//			return Config.getMessage("img.interface")+"/f/"+imgSize.id+"/"+imgSize.width+"/"+imgSize.height+"/"+imgSize.isCut+"/"+filename;
		}
		
	}
	
	public static String getUrlSrc(Size size,String filename){
		ImgResize imgSize=getImgResizeAtSize(size);
		
			//原始图片地址
			return Config.getMessage("img.interface")+ imgSize.srcPath+filename;
		
		
	}

	public static void setUrl2List(List list,Size size,String fieldName){
		for(int i=0;i<list.size();i++){
			setUrl2Obj(list.get(i), size,fieldName);
			
		}
	}
	
	public static void setUrl2Obj(Object object,Size size,String fieldName){
		String imgVal;
		
			try {
				Method getm=object.getClass().getMethod("get"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1,fieldName.length()), null);
				Method setm=object.getClass().getMethod("set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1,fieldName.length()), String.class);
				
				imgVal=(String)getm.invoke(object, null);
				setm.invoke(object, ImgResize.getUrl(size, imgVal));
				
			
			} catch (Exception e) {
		
				e.printStackTrace();
			}
			
		
	}
	
	public ImgResize(String id,int w,int h,int c,String srcPath,Size size){
		this.id=id;
		this.width=w;
		this.height=h;
		this.isCut=c;
		
		this.srcPath=srcPath;
		this.size=size;
//		this.thumbPath=thumbPath;
//		this.url=url;
	}

	public String getId() {
		return id;
	}

	public int getWidth() {
		return width;
	}

	public int getHeight() {
		return height;
	}

	public int getIsCut() {
		return isCut;
	}

	public Size getSize() {
		return size;
	}

	public String getSrcPath() {
		return srcPath;
	}

	
	
}
