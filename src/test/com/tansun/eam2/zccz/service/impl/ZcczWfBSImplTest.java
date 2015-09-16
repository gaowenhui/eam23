package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public class ZcczWfBSImplTest {

	ZcczWfBS zcczWfBSImpl = null;

	public ZcczWfBSImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		zcczWfBSImpl = (ZcczWfBS) ctx.getBean("zcczWfBSImpl");

	}

	@Test
	public void testCopyItemInfo() {
		CzXmxxLsb czXmxxLsb = new CzXmxxLsb();
		zcczWfBSImpl.copyItemInfo(czXmxxLsb);
	}

	@Test
	public void testGetZcczLcIdInHy() {
		List<String> aaa = new ArrayList();
		aaa = zcczWfBSImpl.getZcczLcIdInHy("8a81894d2cba78cd012cba7caeb50003");
		System.out.println(aaa);
	}

	@Test
	public void testGetStztczStayazLcIdInHy() {
		List<String> aaa = new ArrayList();
		aaa = zcczWfBSImpl
				.getStztczStayazLcIdInHy("8a81894d2cba78cd012cba7caeb50003");
		System.out.println(aaa);
	}

	@Test
	public void testSendSpwySpdb() {

		String hyId;
		hyId="8a81894d2cba78cd012cba7caeb50003";
		PTUserBO currentUser =new PTUserBO() ;
		//currentUser.setTid();
		zcczWfBSImpl.sendSpwySpdb(hyId, currentUser);
		
	}

}
