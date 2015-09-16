package com.tansun.eam2.kpgl.service.impl;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.kpgl.service.ICardQueryBS;
import com.tansun.eam2.kpgl.vo.CardQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

public class CardQueryBSImplTest {

	ICardQueryBS iCardQueryBS = null;
	
	public CardQueryBSImplTest(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");   
		iCardQueryBS = (ICardQueryBS)ctx.getBean("cardQueryBSImpl");
	}	
	
	@Test
	public void testQuery() {
		//查询条件
		CardQueryVO cardQueryVO = new CardQueryVO();
		cardQueryVO.setCardcode("000000");
		Paginator paginator = new Paginator();
		paginator.setCurrentPage(1);
		paginator.setCurrentStart(0);
		String json = iCardQueryBS.query(cardQueryVO, paginator);
		System.out.println("json---->"+json);
		assertNotNull(json);
	}

}
