package com.tansun.eam2.zyzc.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchAddBS;

public class BatchAddBSimplTest {

	BatchAddBS batchAddBSimpl = null;

	public BatchAddBSimplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		batchAddBSimpl = (BatchAddBS) ctx.getBean("batchAddBSimpl");
	}

	@Test
	public void testCreateZyPdxxByZcId() {
		//
		ZyPdxx zyPdxx = new ZyPdxx();
		zyPdxx = batchAddBSimpl.createZyPdxxByZcId("1");
		System.out.println(zyPdxx.getZcbh());
		// batchAddBSimpl.saveZyPdxx(batchAddBSimpl.createZyPdxxByZcId("1"));
	}

	@Test
	public void testSaveZyPdxx() {

	}

}
