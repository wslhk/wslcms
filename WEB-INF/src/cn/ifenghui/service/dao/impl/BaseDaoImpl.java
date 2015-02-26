package cn.ifenghui.service.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.service.ServiceRegistryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Component;

import cn.ifenghui.service.dao.BaseDao;
import cn.ifenghui.service.util.FormatText;
import cn.ifenghui.service.util.Pag;


/**
 * 基础查询
 * 
 * dao实现
 * 
 * @author wsl
 *
 */
@Component("BaseDao")
public class BaseDaoImpl implements BaseDao{
	
//	HibernateTemplate hibernateTemplate;
	
	@Autowired
    @Qualifier("sessionFactory")
	SessionFactory sessionFactory;
	
	Transaction tx;
	
	Session session;

	ProjectionList proList;
	
	List<String> sum=null;
	List<String> count=null;
	List<String> group=null;
	List<String> max=null;
	List<String> min=null;
	List<Map<String,Object>> equals=null;//图,等于条件
	List<Map<String,Object>> notequals=null;//图,等于条件
	List<Map<String,Object>> gt=null;
	List<Map<String,Object>> ge=null;
	List<Map<String,Object>> lt=null;
	List<Map<String,Object>> le=null;
	List<Map<String,Object>> in=null;
	Pag page=null;
	Iterator<String> it;
	String key=null;
	List<String> fields=null;
	Map<String, Object> m;
	/**
	 * 排序方式标记
	 */
//	String desc=null;//排序方式标记
	/**
	 * 排序参照字段
	 */
	List<String> orderby=null;//排序参照字段
	/**
	 * 是否模糊查询
	 */
	Boolean like=false;
	
	/**
	 * 大小写
	 */
	Boolean ignoreCase=false;
	/**
	 * 结果数量,优先级底于page
	 */
	Integer maxresult=null;
	
	Integer rsfirst=null;
	
	/**
	 * 去掉重复的内容
	 */
	String distinct=null;
	
	/***
	 * 链接查询
	 */
	String join = null;

//	public HibernateTemplate getHibernateTemplate() {
//		return hibernateTemplate;
//	}
//
//	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
//		this.hibernateTemplate = hibernateTemplate;
//	}
	
	public Session getSession(){
//		Session session=sessionFactory.openSession();
		
		Session session = sessionFactory.getCurrentSession();
		
		
//		 Configuration config=new AnnotationConfiguration();
//		 config.configure();
//		 ServiceRegistryBuilder serviceRegistry = new ServiceRegistryBuilder();
//
//		 SessionFactory sessionFactory=config.buildSessionFactory(serviceRegistry.buildServiceRegistry());
//		 Session session=sessionFactory.getCurrentSession();
//		 session.beginTransaction();
		 
		 return session;
		 
//		return getHibernateTemplate().getSessionFactory().openSession();

	}
	
//	public void createSession(){
//		if(session==null||session.isOpen()==false){
//			session =getHibernateTemplate().getSessionFactory().openSession();
//			session.beginTransaction();
//		}
//	}
	
//	public void closeSession(){
//		if(session!=null&&session.isOpen()==true){
//			session.close();
//
//		}
//	}
	



	public int insert(Object obj) {
		Session session=this.getSession();
		try{
//			session.beginTransaction().begin();
			Serializable ss=session.save(obj);
			session.flush();
			
//		session.beginTransaction().commit();
		
		if(Integer.class.isAssignableFrom(ss.getClass())){
			return (Integer)ss;
		}else if(Long.class.isAssignableFrom(ss.getClass())){
			return (Integer)ss;
		}else{
			return 0;
		}
		}catch(Exception e){
			e.printStackTrace();
			return 2;
		}finally{
			session.close();
			session=null;
		}
	}
	
	@Override
	public <T extends Object> void update(T obj){
		Session session=null;
		try{
			
			session=this.getSession();

			Integer id=(Integer)obj.getClass().getMethod("getId", null).invoke(obj,null);
//获得数据库中的对象newobj 传入的对象obj
			@SuppressWarnings("unchecked")
			Class<T> classes=(Class<T>)obj.getClass();
			Object newobj =session.load(classes,id);

			FormatText.setValue(newobj, obj);
			
			session.update(newobj);
			session.flush();
			
			
		}catch(Exception e){e.printStackTrace();}finally{
			if(session!=null&&session.isConnected())
				session.close();
			
		}
	}
	
	@Override
	public <T extends Object> void update(T obj,Integer id){
		Session session=null;
		try{
			
			session=this.getSession();

//			int id=(Integer)obj.getClass().getMethod("getId", null).invoke(obj,null);
//获得数据库中的对象newobj 传入的对象obj
			Class<T> classes=(Class<T>)obj.getClass();
			Object newobj =session.load(classes,id);

			FormatText.setValue(newobj, obj);
			
			session.update(newobj);
			session.flush();
			
			
		}catch(Exception e){e.printStackTrace();}finally{
			if(session!=null&&session.isConnected())
				session.close();
			
		}
	}

	@Override
	public <T>T get(Class<T> classes,int id){
		Session session=null;
		try{
			session=this.getSession();
			return (T)session.get(classes,id);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			if(session!=null&&session.isOpen())
			session.close();
			session=null;
		}
	}
	
	@Override
	public <T>T get(Class<T> classes,long id){
		Session session=null;
		try{
			session=this.getSession();
			return (T)session.get(classes,id);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			if(session!=null&&session.isOpen())
			session.close();
			session=null;
		}
	}
	

	
	/**
	 * 获取列表公共
	 * @param obj
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T/* extends BaseBean*/>List<T> getList(T obj,Session session){
		
//		Session session=this.getSession();
		Example  example;
		Criteria cr;
		List<T> results=new ArrayList<T>();
		long totalCount;
		try{
			
		 example=Example.create(obj);
		 proList = Projections.projectionList();
		//this.getHibernateTemplate().initialize("lazy=\"false\"");
		if(like!=null&&like==true){
			example.enableLike(MatchMode.ANYWHERE);
	    }
		if(ignoreCase!=null&&ignoreCase==true){
			example.ignoreCase();
		}
//		session.beginTransaction()
		cr=session.createCriteria(obj.getClass()).add( example );
		cr.setCacheable(true);//允许二级缓存
		
		if(maxresult!=null){
			cr.setMaxResults(getMaxresult());
		}
		
		if(rsfirst!=null){
			cr.setFirstResult(rsfirst);
		}
		
		
		

	    
	    if(page!=null){

		    	proList.add(Projections.rowCount());
		    	
//		    	session.createCriteria(obj.getClass());
		    	totalCount = ((Long) session.createCriteria(obj.getClass()).add( example )
			    		.setProjection(proList)
			    		.uniqueResult());
		    	
    	
		    	page.setRsall(Integer.parseInt(totalCount+""));
		    	cr.setFirstResult(page.getRsfirst());
		    	cr.setMaxResults(page.getLimit());
		    	System.out.println(page.getRsall()+" first:"+page.getRsfirst()+" limit"+page.getLimit());
//		    	
//		    	proList=null;
//			}
	    	
		}
	    
	    
	    try{
//	    	System.out.println(obj.getClass().getName()+"=========="+session.connection().getCatalog());
//	    	this.orderby
	    	
	    	if(orderby!=null&&orderby.size()>0){
	    		String[] orderbyarr=null;
	    		for(int i=0;i<orderby.size();i++){
	    			orderbyarr=orderby.get(i).split(":");
	    			if(orderbyarr[1].toLowerCase().equals("desc")){
	    				cr.addOrder(Property.forName(orderbyarr[0]).desc());
	    			}else if(orderbyarr[1].toLowerCase().equals("asc")){
	    				cr.addOrder(Property.forName(orderbyarr[0]).asc());
	    			}
	    		}
	    	
	    	}

	    	
	    	proList = Projections.projectionList();
	    	 
	    	
	    	if(sum!=null&&sum.size()>0){
	    		
	    		for(int i=0;i<sum.size();i++){
	    			proList.add(Projections.sum(sum.get(i)));
	    			
	    		}
	    	
	    	}
	    	
	    	if(count!=null&&count.size()>0){
	    		
	    		for(int i=0;i<count.size();i++){
	    			proList.add(Projections.count(count.get(i)));
	    		}
	    	
	    	}
	    	if(group!=null&&group.size()>0){
	    		
	    		for(int i=0;i<group.size();i++){
	    			proList.add(Projections.groupProperty(group.get(i)));
	    		}
	    		
	    	}
	    	if(min!=null&&min.size()>0){
	    		
	    		for(int i=0;i<group.size();i++){
	    			proList.add(Projections.groupProperty(min.get(i)));
	    		}
	    		
	    	}
	    	if(min!=null&&min.size()>0){
	    		
	    		for(int i=0;i<group.size();i++){
	    			proList.add(Projections.groupProperty(min.get(i)));
	    		}
	    		
	    	}
	    	
	    	if(fields!=null&&fields.size()>0){
	    		
	    		for(int i=0;i<fields.size();i++){
	    			proList.add(Projections.property(fields.get(i)));
	    
	    		}
	    		
	    	}
	    	
	    	if(distinct!=null){
				
				proList.add(Projections.distinct(Projections.property(distinct)));
				//cr.setProjection(Projections.distinct(Projections.id()));
			}
	    	
	    	
	    	if(proList.getLength()>0){
	    		cr.setProjection(proList);
	    	}
	    	if(equals!=null){
	    		for(int i=0;i<equals.size();i++){
	    			m=equals.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.eq(key,m.get(key)));
		    			
		    		}
	    		}
	    	}
	    	
	    	if(gt!=null){
	    		for(int i=0;i<gt.size();i++){
	    			m=gt.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.gt(key,m.get(key)));
		    			
		    		}
	    		}
	    	}
	    	
	    	if(ge!=null){
	    		for(int i=0;i<ge.size();i++){
	    			m=ge.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.ge(key,m.get(key)));
		    			
		    		}
	    		}
	    	}
	    	
	    	if(lt!=null){
	    		for(int i=0;i<lt.size();i++){
	    			m=lt.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.lt(key,m.get(key)));
		    			
		    		}
	    		}
	    	}

	    	if(le!=null){
	    		for(int i=0;i<le.size();i++){
	    			m=le.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.le(key,m.get(key)));
		    			
		    		}
	    		}
	    	}
	    	
	    	if(in!=null){
	    		for(int i=0;i<in.size();i++){
	    			m=in.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    		
		    			cr.add(Restrictions.in(key,(Object[])m.get(key)));
		    		
		    		}
	    		}
	    	}
	    	
	    	if(notequals!=null){
	    		for(int i=0;i<notequals.size();i++){
	    			m=notequals.get(i);
	    			it=m.keySet().iterator();
	    			while(it.hasNext()){
		    			key=it.next();
		    			cr.add(Restrictions.ne(key,m.get(key)));
		    			
		    		}
	    		}
	    	}
	    	
	    	
	    	 
	    }catch(Exception e){
	    	e.printStackTrace();
	    }

		results = cr.list();
	
		return (List<T>)results;
		}catch(Exception e){
			e.printStackTrace();
		}finally{
//			if(session!=null){
//				session.clear(); 
//				session.close();
//			}
			
			
			obj=null;
			like=null;
			page=null;
			rsfirst=null;
			maxresult=null;
			ignoreCase=null;
			example=null;
			cr=null;
			sum=null;
			count=null;
			group=null;
			orderby=null;
			notequals=null;
//			desc=null;
			min=null;
			max=null;
			equals=null;
			it=null;
			gt=null;
			ge=null;
			lt=null;
			le=null;
			in=null;
			this.fields=null;
			distinct=null;
			key=null;
			in=null;
		
		}
		return (List<T>)results;
	}
	

	@Override
	public <T/* extends BaseBean*/> List getList(T obj) {
//		Session session=getSession();

		
//		this.getHibernateTemplate().getSessionFactory().
		try{
			
			return getList(obj,sessionFactory.getCurrentSession());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
//			if(session.isConnected())
//			session.close();
//			obj=null;
		}
		
	}
//	@Override
//	public <T extends BaseBean> List getList(Class<T> obj) {
//		return (T)getList(obj,session);
//	}


	
	public void delete(Serializable obj){
//		this.getList(obj);
		Session session=getSession();
		try{
			
			session.delete(obj);
			session.beginTransaction().commit();
			session.flush();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
			obj=null;
		}
	}
	
	
	public <T>void deleteAll(Class<T> classes,Integer[] ids){
		Session session=getSession();
		String idstr="";
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				if(i>0)idstr+=",";
				idstr+=ids[i];
				
			}
		}
		try{
			String hql=("DELETE FROM "+classes.getName().split("[.]")[classes.getName().split("[.]").length-1]+"" +
					" WHERE id in ("+idstr+")");
			session.createQuery(hql).executeUpdate();
			session.beginTransaction().commit();
			session.flush();
		}finally{
			session.close();
			session=null;
			classes=null;
		}
	}
	
	public <T>void deleteAll(Class<T> classes,String field,Integer[] ids){
		Session session=getSession();
		String idstr="";
		if(ids!=null){
			for(int i=0;i<ids.length;i++){
				if(i>0)idstr+=",";
				idstr+=ids[i];
				
			}
		}
		try{
			String hql=("DELETE FROM "+classes.getName().split("[.]")[classes.getName().split("[.]").length-1]+"" +
					" WHERE "+field+" in ("+idstr+")");
			session.createQuery(hql).executeUpdate();
			session.beginTransaction().commit();
			session.flush();
		}finally{
			session.close();
			session=null;
			classes=null;
		}
	}
	
	public <T>void delete(Class<T> classes,Integer id){
		delete(classes, id.longValue());
	}
	public <T>void delete(Class<T> classes,Long id){
		Session session=getSession();
		String idstr="";
	
		try{
			String hql=("DELETE FROM "+classes.getName().split("[.]")[classes.getName().split("[.]").length-1]+"" +
					" WHERE id = "+id+"");
			session.createQuery(hql).executeUpdate();
			session.beginTransaction().commit();
			session.flush();
		}finally{
			session.close();
			session=null;
			classes=null;
		}
	}

	
	public void deleteAll(Serializable obj){
		Session session=getSession();
		try{
			String hql=("DELETE FROM "+obj.getClass().getName().split("[.]")[obj.getClass().getName().split("[.]").length-1]);
			session.createQuery(hql).executeUpdate();
			session.beginTransaction().commit();
			session.flush();
		}finally{
			session.close();
			session=null;
			obj=null;
		}
	}
	
	
	public <T>List getByHql(String hql){
		return (List)this.getByHql(hql, null, null, null);
	}
	
	public List getByHql(String hql,Map map){
		return (List)this.getByHql(hql, map, null, null);
	}
	
	public List getByHql(String hql,Map map,Pag page){
		if(page!=null){
			return this.getByHql(hql, map, page.getRsfirst(), page.getLimit());
//			page.setRsall((Integer)obj[1]);
//		return (List)obj[0];
		}else{
			return this.getByHql(hql, map);
		}
	}
	
	@Override
	public int getByHqlCount(String hql,@SuppressWarnings("rawtypes") Map map) {
		@SuppressWarnings("rawtypes")
		List list=this.getByHql(hql,map);
		if(list==null||list.size()==0||list.get(0)==null){
			return 0;
		}
		return (Integer.parseInt(list.get(0)+""));
	}

	
	/**
	 * 如果传入分页信息,返回内容包含总条目数
	 * @param <T>
	 * @param hql
	 * @param map
	 * @param firstResult
	 * @param MaxResults
	 * @return
	 */
	public <T>List getByHql(String hql,Map<Integer,T> map,Integer firstResult,Integer MaxResults){
		
//		System.out.println("hql:"+hql);
		
		Session session=getSession();
		List result=new ArrayList();
		Object key=null;
		T value=null;
		try{
			Query query=session.createQuery(hql);
			query.setCacheable(true);
			if(firstResult!=null){
				query.setFirstResult(firstResult);
//				System.out.println("firstResult:"+firstResult);
			}
			if(MaxResults!=null){
				query.setMaxResults(MaxResults);
//				System.out.println("MaxResults:"+MaxResults);
			}
			
			
			if(map!=null){
//				System.out.println("map size:"+map.size());
				Set<Integer> keyset=map.keySet();
				Iterator<Integer> it=keyset.iterator();
				while(it.hasNext()){
					key=it.next();
					value=map.get(key);
					
					
					//query.setParameter(arg0, arg1)
					if(key.getClass()==String.class){
						if(Object[].class.isAssignableFrom(value.getClass())){
//							Object[].class.isAssignableFrom(Integer[].class)
							query.setParameterList((String)key, (Object[])value);//(key, (Date)value);
						}else{
							query.setParameter((String)key, value);
						}
					}else if(key.getClass()==Integer.class){
						
							query.setParameter((Integer)key, value);
						
					}
		
					
				}
			}
//			query.sets
			result= query.list();
		}catch(Exception e){
			System.out.println("key:"+key+" val:"+value);
			e.printStackTrace();
		}finally{
			session.close();
			session=null;
		}
		return result;
	}
	
	public void updateByHql(String hql){
		Session session=getSession();
		try{
			session.createQuery(hql).executeUpdate();
		
			session.beginTransaction().commit();
			session.flush();
		}finally{
			session.close();
			session=null;
		}
	}
	
	public <T>int updateByHql(String hql,Map<Integer,T> map){
		Session session=getSession();
		try{
			Query query=session.createQuery(hql);
			if(map!=null){
				System.out.println("map size:"+map.size());
				Set<Integer> keyset=map.keySet();
				Iterator<Integer> it=keyset.iterator();
				while(it.hasNext()){
					Object key=it.next();
					T value=map.get(key);
					
					if(String.class.isAssignableFrom(key.getClass())){
						try{
							if(Object[].class.isAssignableFrom(value.getClass())){
	//							Object[].class.isAssignableFrom(Integer[].class)
								query.setParameterList(""+key, (Object[])value);//(key, (Date)value);
							}else{
								query.setParameter(""+key, value);
							}
						}catch(Exception e){
							e.printStackTrace();
						}
					}else if(Integer.class.isAssignableFrom(key.getClass())){
						
							query.setParameter((Integer)key, value);
						
					}
					
					
				}
			}
			
			int index=query.executeUpdate();
		
			session.beginTransaction().commit();
			session.flush();
			return index;
		}finally{
			session.close();
			session=null;
		}
//		return -1;
	}
	
	public Pag getPage() {
		return page;
	}

	public void setPage(Pag page) {
		this.page = page;
	}

	


	public void setLike(Boolean like) {
		this.like = like;
	}

	public void setMaxresult(Integer maxresult) {
		this.maxresult = maxresult;
	}

	@Override
	public Long getCount(Serializable obj) {
		Session session=this.getSession();
		Criteria cr=null;
		Example  example=null;
		try{
		
			example=Example.create(obj);
		
		cr=session.createCriteria(obj.getClass()).add( example );
		proList = Projections.projectionList();
   	 
    	
    	if(sum!=null&&sum.size()>0){
    		
    		for(int i=0;i<sum.size();i++){
    			proList.add(Projections.sum(sum.get(i)));
    		}
    	
    	}
    	
    	if(count!=null&&count.size()>0){
    		
    		for(int i=0;i<count.size();i++){
    			proList.add(Projections.count(count.get(i)));
    		}
    	
    	}
    	if(group!=null&&group.size()>0){
    		
    		for(int i=0;i<group.size();i++){
    			proList.add(Projections.groupProperty(group.get(i)));
    		}
    		
    	}
    	if(min!=null&&min.size()>0){
    		
    		for(int i=0;i<group.size();i++){
    			proList.add(Projections.groupProperty(min.get(i)));
    		}
    		
    	}
    	if(min!=null&&min.size()>0){
    		
    		for(int i=0;i<group.size();i++){
    			proList.add(Projections.groupProperty(min.get(i)));
    		}
    		
    	}
    	
    	if(fields!=null&&fields.size()>0){
    		
    		for(int i=0;i<fields.size();i++){
    			proList.add(Projections.property(fields.get(i)));
    		}
    		
    	}
    	
    	proList.add(Projections.rowCount());
    	if(proList.getLength()>0){
    		cr.setProjection(proList);
    	}
    	if(equals!=null){
    		for(int i=0;i<equals.size();i++){
    			m=equals.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.eq(key,m.get(key)));
	    			
	    		}
    		}
    	}
    	
    	if(gt!=null){
    		for(int i=0;i<gt.size();i++){
    			m=gt.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.gt(key,m.get(key)));
	    			
	    		}
    		}
    	}
    	
    	if(ge!=null){
    		for(int i=0;i<ge.size();i++){
    			m=ge.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.ge(key,m.get(key)));
	    			
	    		}
    		}
    	}
    	
    	if(lt!=null){
    		for(int i=0;i<lt.size();i++){
    			m=lt.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.lt(key,m.get(key)));
	    			
	    		}
    		}
    	}

    	if(le!=null){
    		for(int i=0;i<le.size();i++){
    			m=le.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.le(key,m.get(key)));
	    			
	    		}
    		}
    	}
    	
    	if(in!=null){
    		for(int i=0;i<in.size();i++){
    			m=in.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.in(key,(Object[])m.get(key)));
	    			
	    		}
    		}
    	}
    	
    	if(notequals!=null){
    		for(int i=0;i<notequals.size();i++){
    			m=notequals.get(i);
    			it=m.keySet().iterator();
    			while(it.hasNext()){
	    			key=it.next();
	    			cr.add(Restrictions.ne(key,m.get(key)));
	    			
	    		}
    		}
    	}
    	
		long totalCount = (Long)cr
	    		.uniqueResult();
		return totalCount;
		}finally{
			if(session!=null)
				session.close();
				obj=null;
				like=null;
				page=null;
				rsfirst=null;
				maxresult=null;
				ignoreCase=null;
				example=null;
				cr=null;
				sum=null;
				count= null;
				group=null;
				orderby=null;
//				desc=null;
				min=null;
				max=null;
				equals=null;
				it=null;
				gt=null;
				ge=null;
				lt=null;
				le=null;
				in=null;
				this.fields=null;
				distinct=null;
			}
	}

	private Integer getMaxresult() {
		int result=maxresult.intValue()+0;
		maxresult=null;
		return result;
	}

	public void setRsfirst(Integer rsfirst) {
		this.rsfirst = rsfirst;
	}


	public void addSum(String sum) {
		if(this.sum==null){
			this.sum=new ArrayList<String>();
		}
		this.sum.add(sum);
	}
	
	public void addCount(String count) {
		if(this.count==null){
			this.count=new ArrayList<String>();
		}
		this.count.add(count);
	}
	
	public void addGroup(String group) {
		if(this.group==null){
			this.group=new ArrayList<String>();
		}
		this.group.add(group);
	}

	@Override
	public void addMax(String max) {
		if(this.max==null){
			this.max=new ArrayList<String>();
		}
		this.max.add(max);
		
	}

	@Override
	public void addMin(String min) {
		if(this.min==null){
			this.min=new ArrayList<String>();
		}
		this.min.add(min);
		
	}

	public void addEquals(String key,Object value){
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(equals==null){
			equals=new ArrayList<Map<String,Object>>();
		}
		equals.add(m);
	}
	
	public void addNotequals(String key,Object value){
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(notequals==null){
			notequals=new ArrayList<Map<String,Object>>();
		}
		notequals.add(m);
	}

	@Override
	public void addGe(String key, Object value) {
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(ge==null){
			ge=new ArrayList<Map<String,Object>>();
		}
		ge.add(m);
		
	}

	@Override
	public void addGt(String key, Object value) {
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(gt==null){
			gt=new ArrayList<Map<String,Object>>();
		}
		gt.add(m);
		
	}

	@Override
	public void addLe(String key, Object value) {
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(le==null){
			le=new ArrayList<Map<String,Object>>();
		}
		le.add(m);
		
	}

	@Override
	public void addLt(String key, Object value) {
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(lt==null){
			lt=new ArrayList<Map<String,Object>>();
		}
		lt.add(m);
		
	}
	
	@Override
	public void addIn(String key, Object[] value) {
		m=new HashMap<String, Object>();
		m.put(key, value);
		if(in==null){
			in=new ArrayList<Map<String,Object>>();
		}
		in.add(m);
		
	}
	
	@Override
	public void addOrderBy(String orderby) {
//		m=new HashMap<String, Object>();
//		m.put(key, order);
		if(this.orderby==null){
			this.orderby=new ArrayList<String>();
		}
		this.orderby.add(orderby);
		
	}

	public void setDistinct(String distinct) {
		this.distinct = distinct;
	}

	@Override
	public void addField(String field) {
		if(this.fields==null){
			this.fields=new ArrayList<String>();
		}
		this.fields.add(field);
		
	}

	@Override
	public void init() {
		
		if(session!=null)
			session.close();
//			obj=null;
			like=null;
			page=null;
			rsfirst=null;
			maxresult=null;
			ignoreCase=null;
//			example=null;
//			cr=null;
			sum=null;
			count= null;
			group=null;
			orderby=null;
//			desc=null;
			min=null;
			max=null;
			equals=null;
			it=null;
			gt=null;
			ge=null;
			lt=null;
			le=null;
			in=null;
			this.fields=null;
			distinct=null;
			page=null;
		
		
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public <T> void updateSimple(T obj) {
		Session session=null;
		try{
			
			session=this.getSession();

			session.update(obj);
			session.flush();
			
			
		}catch(Exception e){e.printStackTrace();}finally{
			if(session!=null&&session.isConnected())
				session.close();
			
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public <T> T get(Serializable obj) {
		Session session=null;
		try{
			session=this.getSession();
			return (T)session.get(obj.getClass(), obj);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}finally{
			if(session!=null&&session.isOpen())
			session.close();
			session=null;
		}
	}


	


}
