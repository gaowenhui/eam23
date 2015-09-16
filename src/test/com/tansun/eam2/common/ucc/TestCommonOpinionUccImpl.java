package com.tansun.eam2.common.ucc;

import static org.junit.Assert.*;
import static org.junit.Assert.fail;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

public class TestCommonOpinionUccImpl {
	private ICommonOpinionUcc ucc;
	
	public TestCommonOpinionUccImpl() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");    
		ucc = (ICommonOpinionUcc)ctx.getBean("commonOpinionUcc");
	}
	

	@Test
	public void testSaveOrUpdateOpinion() {
		PTCommonOpinionBO cobo =  new PTCommonOpinionBO();
		cobo.setBdid(UUID.randomUUID().toString());
		cobo.setYjlx(new Integer(CommonGlobal.OPINION_YJLX_NORMAL));
		cobo.setYjylx(new Integer(CommonGlobal.OPINION_YJYLX_DRAFT_DEPT));
		cobo.setTjr("11");
		cobo.setTjrq(new Date());
		cobo.setYjbm(1001);
		cobo.setYjnr("拟稿部门意见");
		cobo.setBdbh("表单编号");
		ucc.saveOrUpdateOpinion(cobo);
		assertNotNull(cobo.id);
	}

	
	@Test
	public void testQuery4View() {
		List<PTCommonOpinionBO>  list = ucc.query4View("9365ecf8-52b0-47e5-bbce-c2333e3c831e", new Integer(CommonGlobal.OPINION_YJYLX_DRAFT_DEPT));
		assertTrue(list.size() == 1);
	}

	public void testQueryBybdid() {
	}

}
