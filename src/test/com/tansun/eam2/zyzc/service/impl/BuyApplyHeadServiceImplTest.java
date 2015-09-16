package com.tansun.eam2.zyzc.service.impl;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zyzc.service.BuyApplyHeadService;

public class BuyApplyHeadServiceImplTest {

	BuyApplyHeadService buyApplyHeadServiceImpl = null;

	public BuyApplyHeadServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		buyApplyHeadServiceImpl = (BuyApplyHeadService) ctx
				.getBean("buyApplyHeadServiceImpl");

	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public final void testNewHead() {
		ZyShead zyShead = new ZyShead();
		buyApplyHeadServiceImpl.newHead(zyShead);
	}

	@Test
	public final void testSaveHead() {
		ZyShead zyShead =buyApplyHeadServiceImpl.getZySheadById("8a81895e2c5e688a012c5eaa3bbb0002") ;
		zyShead.setTitle("xxx");
		buyApplyHeadServiceImpl.saveHead(zyShead);

	}

}
