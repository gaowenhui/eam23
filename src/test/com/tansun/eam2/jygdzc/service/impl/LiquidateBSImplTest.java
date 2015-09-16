package com.tansun.eam2.jygdzc.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.jygdzc.service.ILiquidateBS;
import com.tansun.rdp4j.common.util.Paginator;

public class LiquidateBSImplTest {

	ILiquidateBS liquidateBSImpl;

	public LiquidateBSImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		liquidateBSImpl = (ILiquidateBS) ctx.getBean("liquidateBSImpl");
	}

	@Test
	public void testGetBodyListByHeadId() {
		Paginator paginator = new Paginator();

		paginator.setCurrentPage(1);
		paginator.setPageCount(10);
		String headid = "1";

		System.out.print(liquidateBSImpl.getBodyListByHeadId(headid, paginator).size());
	}

}
