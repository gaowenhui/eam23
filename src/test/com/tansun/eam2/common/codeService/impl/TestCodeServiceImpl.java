package com.tansun.eam2.common.codeService.impl;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Code;

public class TestCodeServiceImpl {
	ICodeService ics = null;
	public TestCodeServiceImpl() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");    
		ics = (ICodeService)ctx.getBean("codeServiceImpl");
	}
	

	@Test
	public void testFindAllByCodeType() {
		List<Code> list = ics.findAllByCodeType("REPORT_FORM_TYPE");
		assertNotNull(list);
	}


	@Test
	public void testFindByCodeTypeAndCodeKey() {
		Code code = ics.findByCodeTypeAndCodeKey("REPORT_FORM_TYPE", "1");
		assertNotNull(code);
	}

	@Test
	public void testFindCodeById() {
		Code code = ics.findCodeById("3f3efba1-faee-4358-a07e-309532a6");
		assertNotNull(code);
	}


}
