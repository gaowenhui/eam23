package com.tansun.rdp4j.common.model.orm;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.Paginator;

public class PublicDaoTest {
	
	
	PublicDao publicDao = null;
	
	public PublicDaoTest() {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");    
		publicDao = (PublicDao)ctx.getBean("publicDao");

	}

	@Test
	public final void testQueryByHQLWithPaginator() {
		Paginator paginator=new Paginator();
		String preparHQL="from PTDeptBO order by id ";
		PTDeptBO deptBO=new PTDeptBO();
		paginator.setCurrentPage(1);
		paginator.setPageSize(10);
		
		publicDao.queryByHQLWithPaginator(preparHQL, null, paginator);
		
	}
}
