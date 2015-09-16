package com.tansun.eam2.zyzc.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.zyzc.service.ZCBookQueryService;

import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;

public class ZCBookQueryServiceImplTest {
	
	ZCBookQueryService zCBookQueryServiceImpl = null;

	public ZCBookQueryServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		zCBookQueryServiceImpl = (ZCBookQueryService) ctx
				.getBean("zCBookQueryServiceImpl");
	}

	@Test
	public final void testQuery() {
		QueryPurchaseVo queryPurVo = new QueryPurchaseVo();
		queryPurVo.setBxjg("xxx");
	//	zCBookQueryServiceImpl.query(queryPurVo);
	}

}
