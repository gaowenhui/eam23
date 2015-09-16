package com.tansun.eam2.ssgl.service.impl;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.service.ISsglBS;

public class SsglBSImplTest {

	ISsglBS ssglBSImpl = null;

	public SsglBSImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		ssglBSImpl = (ISsglBS) ctx.getBean("ssglBSImpl");
	}

	@Test
	public void testSave() {
		SsBaseinfo ssBaseinfo = new SsBaseinfo();
		SsProc ssproc = new SsProc();
		ssproc = ssglBSImpl.getSsprocById2("8a81896a2cb6f99a012cb6fb47fe0007",
				"3");// (paginator, ssBaseinfoQueryVO);//(ssBaseinfo);
		System.out.print(ssproc.getId());
	}
}
