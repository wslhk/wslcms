package cn.ifenghui.com.service.action.test;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.metadata.ClassMetadata;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.orm.hibernate4.SessionHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;









import cn.ifenghui.service.dao.SuperDao;
import cn.ifenghui.service.dao.obj.Ad;
import cn.ifenghui.service.dao.obj.Tag;
import cn.ifenghui.service.dao.service.AdService;

@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration 
(locations={"/spring*.xml","/applicationContext.xml"}) //加载配置文件
@TransactionConfiguration(transactionManager="transactionManager") 
@Transactional
public class TestAd {
	@Resource  //自动注入,默认按名称
	private AdService adService;
	
	@Autowired
	@Qualifier("SuperDao")
	SuperDao superdao;
	
	@Autowired
    private SessionFactory sessionFactory;
	
	private Session session;
	
//	 @Before
//	    public void openSession()  throws Exception {
//		 try{
////		 session=SessionFactoryUtils.openSession(sessionFactory);
////	        session.setFlushMode(FlushMode.MANUAL);
////	        TransactionSynchronizationManager.b
////	        TransactionSynchronizationManager.bindResource(sessionFactory,new SessionHolder(session));
//		 }catch(Exception e){
//			 e.printStackTrace();
//		 }
//	    }
	 
//	    @After
//	    public void closeSession()  throws Exception {
////	        TransactionSynchronizationManager.unbindResource(sessionFactory);
////	        SessionFactoryUtils.closeSession(session);
//	    }
	    
	@Test
	public void testad(){
		adService.getListAd(new Ad(), null);
		System.out.println("success");
	}
	
//	@Test
//	public void testad2(){
//		try{
//			System.out.println(sessionFactory+"<<");
////			superdao.set
//			superdao.setSessionFactory(sessionFactory);
//			List<Ad> ads=superdao.getList(new Ad());
//			for (Ad ad : ads) {
//				System.out.println(ad.getTitle()+ad.getTags().size());
//			}
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		System.out.println("success");
//	}
	
//	@Test
//	public void testsave(){
//		try{
//			Ad ad=new Ad();
//			ad.setId(2);
//			
//			Tag tag=new Tag();
//			tag.setTag("xxx1");
//			
//			Set tags=new HashSet();
//			tags.add(tag);
//			tag.setAdId(2);
//			
//			ad.setTags(tags);
//			
//			superdao.getSession().saveOrUpdate(ad);
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		System.out.println("success");
//	}
	
	@Test
	public void testdel(){
		try{
			
		
			Ad ad=new Ad();
//			ad.setId(2);
//			superdao.getSession().getSessionFactory().getCurrentSession().flush();
			
			Session session=superdao.getSession();
			
			
			ad=(Ad)session.get(Ad.class, 2);

			session.flush();

			Transaction tx1 = session.getTransaction();

			session.delete("cn.ifenghui.service.dao.obj.Ad",ad);;

			tx1.commit();
			
//			t.commit();
			
			
//			ad=(Ad)superdao.getSession().get(Ad.class, 2);
//			System.out.println(ad.getTags().size());

			
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("success");
	}
	
	
	
//	@Test
//	public void testUpdate(){
//		try{
//			
//		
//			Ad ad=new Ad();
//			ad.setId(2);
//			
//			Session session=superdao.getSession().getSessionFactory().openSession();
//			
//			Transaction tx1 = session.beginTransaction();
//			ad=(Ad)session.get(Ad.class, 2);
//			Iterator it=ad.getTags().iterator();
//			Tag tag=(Tag)it.next();
//			tag.setTag("oooooo");
////			ad.gett
//			session.update(ad);
//
//			tx1.commit();
//			
////			t.commit();
//			
//			
//			ad=(Ad)superdao.getSession().get(Ad.class, 2);
//			System.out.println(ad.getTags().size());
//
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		System.out.println("success");
//	}
	
	@Test
	public void test4(){
		Map<String,ClassMetadata> map=this.sessionFactory.getAllClassMetadata();
		System.out.println(map);
	}
}
