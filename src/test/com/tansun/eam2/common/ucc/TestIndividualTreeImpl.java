package com.tansun.eam2.common.ucc;

import java.util.List;

import junit.framework.TestCase;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.Individualtree;

public class TestIndividualTreeImpl extends TestCase {
	IIndividualTree iit;
	public TestIndividualTreeImpl(String name) {
		super(name);
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");    
		iit = (IIndividualTree)ctx.getBean("iTreeUcc");
	}

	public void testFindByTreeType() {
		Individualtree tree = iit.findByTreeType("department");
		List<Individualtree> notes = tree.getIndividualtrees();
		System.out.println(notes.size());
		assertNotNull(tree);
		assertNotNull(notes);
	}
	
	public void testFindByTreeTypeArray() {
		List<Individualtree> list = iit.findByTreeTypeArray(new String[]{"department"});
		assertNotNull(list);
		assertTrue(list.size() > 0);
	}

}
