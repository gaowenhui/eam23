package com.tansun.eam2.zyzc.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchQueryBS;

public class BatchQueryBSimplTest {

	BatchQueryBS batchQueryBSimpl = null;

	public BatchQueryBSimplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		batchQueryBSimpl = (BatchQueryBS) ctx.getBean("batchQueryBSimpl");
	}

	@Test
	public final void testQueryWithCondition() {
		com.tansun.eam2.common.model.orm.bo.ZyPdxx Pdxx = new ZyPdxx();
		Pdxx.setPdpc("2");
		System.out.println(batchQueryBSimpl.queryWithCondition(Pdxx).size());
	}

}
