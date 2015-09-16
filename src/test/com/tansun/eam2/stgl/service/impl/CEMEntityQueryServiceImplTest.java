package com.tansun.eam2.stgl.service.impl;

import static org.junit.Assert.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.stgl.service.ICEMEntityQueryService;
import com.tansun.eam2.stgl.vo.StaffQueryVO;

public class CEMEntityQueryServiceImplTest {

	ICEMEntityQueryService CEMEntityQueryServiceImpl = null;

	public CEMEntityQueryServiceImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		CEMEntityQueryServiceImpl = (ICEMEntityQueryService) ctx
				.getBean("CEMEntityQueryServiceImpl");

	}

	@Test
	public void testQueryAsset() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryStaff() {
		StaffQueryVO staffQueryVO = new StaffQueryVO();
		List list = new ArrayList();
//		list = CEMEntityQueryServiceImpl.queryStaff(staffQueryVO);
//		System.out.print(list.size());
	}

	@Test
	public void testGetPublicDao() {
		fail("Not yet implemented");
	}

	@Test
	public void testSetPublicDao() {
		fail("Not yet implemented");
	}

}
