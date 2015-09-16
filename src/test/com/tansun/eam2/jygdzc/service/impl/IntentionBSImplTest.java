package com.tansun.eam2.jygdzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;
import com.tansun.eam2.jygdzc.service.IIntentionBS;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

public class IntentionBSImplTest extends CommonBSImpl {

	IIntentionBS iIntentionBS;

	public IntentionBSImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		iIntentionBS = (IIntentionBS) ctx.getBean("intentionBSImpl");
	}

	@Test
	public void testgetJyzlViewVOByCondition() {
		Paginator paginator = new Paginator();
		paginator.setCurrentPage(1);
		paginator.setPageSize(10);

		JyzlQueryVO jyzlQueryVO = new JyzlQueryVO();
		jyzlQueryVO.setZcbh("1");

		List list = new ArrayList();
		list = iIntentionBS.getJyzlViewVOByCondition(jyzlQueryVO, paginator);
		if (list != null) {
			System.out.println(list.size());
		} else {
			System.out.println("==========");
		}
	}

	@Test
	public void testgetRecordhistoryBypkId() {
//		System.out.print(iIntentionBS.getRecordhistoryBypkId("4", null).size());
	}

	@Test
	public void testcompareZlXxVsZlXxLsb() {
		// JyzcJyzlXx jyzlXx = iIntentionBS("");
		// JyzcJyzlLsb jyzlLsb = null;
		// iIntentionBS.compareZlXxVsZlXxLsb(jyzlXx, jyzlLsb);
	}
}
