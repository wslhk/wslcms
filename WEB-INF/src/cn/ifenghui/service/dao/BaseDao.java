package cn.ifenghui.service.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import cn.ifenghui.service.util.Pag;



/**
 * 基础查询
 * 
 * base
 * 
 * @author wsl
 *
 */
public interface BaseDao {
	
	public void init();
	
//	public HibernateTemplate getHibernateTemplate();
//	
//	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) ;

	public Session getSession();
	
	
	
	
	public int insert(Object obj);
	
	public <T> void update(T obj);
	
	/**原生的更新*/
	public <T> void updateSimple(T obj);
	
	public <T> void update(T obj,Integer id);
	
	public <T/* extends BaseBean*/>List<T> getList(T obj);
	
	public <T>T get(Class<T> classes,int id);
	public <T>T get(Class<T> classes,long id);
	public <T>T get(Serializable obj);
	
	public void delete(Serializable obj);
	
	public <T>void deleteAll(Class<T> classes,Integer[] ids);
	
	/**
	 * 删除全部内容
	 * @param <T>
	 * @param classes 类名
	 * @param field 字段名
	 * @param ids 内容id
	 */
	public <T>void deleteAll(Class<T> classes,String field,Integer[] ids);
	
	public <T>void delete(Class<T> classes,Integer id);
	
	public <T>void delete(Class<T> classes,Long id);
	
	
	public Long getCount(Serializable obj);
	
	/**
	 * 
	 * @param <T>
	 * @param hql
	 * @param map
	 * @param firstResult 数据起始位置
	 * @param MaxResults 需要条目书
	 * @return
	 */
	public <T>List getByHql(String hql,Map<Integer,T> map,Integer firstResult,Integer MaxResults);

	public <T>List getByHql(String hql);
	
	/**
	 * 通过hql获得数量
	 * @param hql
	 * @return
	 */
	public int getByHqlCount(String hql,Map map);
	
	public List getByHql(String hql,Map map);
	
	public List getByHql(String hql,Map map,Pag page);
	
	public void updateByHql(String hql);
	
	public <T>int updateByHql(String hql,Map<Integer,T> map);
	
	
	
	
	public Pag getPage();

	public void setPage(Pag page);
	/**
	 * 设置排序方式
	 * @param orderby
	 * @param desc
	 */
	public void addOrderBy(String orderby);
	/**
	 * 设置是否模糊查询
	 * @param like
	 */
	public void setLike(Boolean like);
	
	public void setMaxresult(Integer maxresult);
	
	public void setRsfirst(Integer rsfirst);
	
	public void addSum(String sum);
	public void addCount(String count);
	
	public void addGroup(String group);
	public void addMax(String max);
	public void addMin(String min);
	/**
	 * 增加字段
	 * @param key
	 * @param value
	 */
	public void addField(String field);
	
	public void addEquals(String key,Object value);
	public void addNotequals(String key,Object value);
	/**
	 * 小于
	 * @param key
	 * @param value
	 */
	public void addLt(String key,Object value);
	/**
	 * 大于
	 * @param key
	 * @param value
	 */
	public void addGt(String key,Object value);
	/**
	 * 小于等于
	 * @param key
	 * @param value
	 */
	public void addLe(String key,Object value);
	/**
	 * 大于等于
	 * @param key
	 * @param value
	 */
	public void addGe(String key,Object value);
	
	
	
	/**
	 * 多查询条件
	 * @param key
	 * @param value
	 */
	public void addIn(String key,Object[] value);
	
	
	


	public void setSessionFactory(SessionFactory sessionFactory);
	
}
