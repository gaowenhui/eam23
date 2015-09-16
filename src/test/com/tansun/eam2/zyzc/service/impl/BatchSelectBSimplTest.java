package com.tansun.eam2.zyzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.BatchSelectBS;

public class BatchSelectBSimplTest extends TestCase {

	BatchSelectBS batchSelectBSimpl = null;

	public BatchSelectBSimplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		batchSelectBSimpl = (BatchSelectBS) ctx.getBean("batchSelectBSimpl");
	}

	@Test
	public final void testSubPageQueryWithCondition() {
		ZyPdxx zyPdxx = new ZyPdxx();
		List<ZyPdxx> list = new ArrayList();

		list = batchSelectBSimpl.subPageQueryWithCondition(zyPdxx);
		for (int i = 0; i < list.size(); i++) {
			ZyPdxx zyPdxxtemp = list.get(i);
			System.out.print("xxxxxx" + zyPdxxtemp.getZcbh());

		}

	}

}
