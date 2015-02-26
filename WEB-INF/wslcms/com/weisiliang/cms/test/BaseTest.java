package com.weisiliang.cms.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;






import javax.servlet.http.HttpServletRequest;






import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;



@RunWith(SpringJUnit4ClassRunner.class)  //使用junit4进行测试
@ContextConfiguration 
(locations={"/spring*.xml","/applicationContext.xml"}) //加载配置文件
@TransactionConfiguration(transactionManager="transactionManager") 
@Transactional
public class BaseTest {
		
	@Autowired
	SessionFactory sessionFactory;
	
	HttpServletRequest mockRequest;
	
//	@Before
//	public void before(){
//
//		mockRequest = EasyMock.createMock(HttpServletRequest.class);
////		System.out.println("mockRequest:"+mockRequest);
//	}
//	

	
	
	
	@Test
	public void testFunction(){
		Map<String, A> map=new HashMap<String, A>();
//		List l=new ArrayList();
		map.put("1", new A());
		this.mm(map);
//		this.mm(l);
		System.out.println(((A)map.get("1")).str);
	}
	
	public void mm(Map<String, A> m){
		((A)m.get("1")).str="3333";
	}
	
	public void mm(List<Object> l){
		l.add(new Object());
	}
	
	class A{
		public String str="1";
	}
	

	@Test
	public void testEntityManager(){
		System.out.println(111);
		String[] names=this.sessionFactory.getStatistics().getEntityNames();
		
		
		
		for(String str:names){
			Object entity=this.sessionFactory.getClassMetadata(str).getMappedClass();
			System.out.println(entity);
		}
	
		
	}
	
//	@Test
//	public void testPase(){
//		Object object=Integer.class.cast("123");
//		Object object=Integer.p
//		System.out.println(object);
//	}
}
