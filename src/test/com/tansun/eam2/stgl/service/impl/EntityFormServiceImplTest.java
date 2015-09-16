package com.tansun.eam2.stgl.service.impl;

import static org.junit.Assert.fail;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.service.IEntityFormService;

public class EntityFormServiceImplTest {

	IEntityFormService entityFormServiceImpl =null;
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	public EntityFormServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		entityFormServiceImpl = (IEntityFormService) ctx
				.getBean("entityFormServiceImpl");

	}

	@Test
	public final void testDeleteStGlbt() {
		String str[]=new String[1];
		str[0]="8a81896a2c6eb68d012c6eb6ce2a0006";
		entityFormServiceImpl.deleteStGlbt(str);
	}

	@Test
	public final void testNewEntityFormStHead() {
		StHead head =new StHead();
		head.setBiaoti("标题");
		entityFormServiceImpl.newEntityForm(head);
	}

	@Test
	public final void testNewEntityFormStGlbt() {
		StGlbt body =new StGlbt();
		body.setId("123");
		body.setBysj("ss");
		body.setCldId("12345");
		body.setBysj("ss");
		body.setBysj("ss");
		entityFormServiceImpl.newEntityForm(body);
	}

	@Test
	public final void testViewEntityBody() {
		String bodyid="123";
		entityFormServiceImpl.viewEntityBody(bodyid);
		
	}

	@Test
	public final void testViewEntityHead() {
		String headid="123";
		entityFormServiceImpl.viewEntityBody(headid);
	}

}
