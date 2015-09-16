package com.tansun.eam2.kpgl.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.kpgl.service.ICardCommonBS;

public class CardCommonBSImplTest {

	ICardCommonBS iCardCommonBS = null;
	
	public CardCommonBSImplTest(){
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");   
		iCardCommonBS = (ICardCommonBS)ctx.getBean("cardCommonBSImpl");
	}	

	@Test
	public void testCard2Body() {
		Cardinfo cardInfo = new Cardinfo();
		cardInfo.setAddtype("1");
		cardInfo.setAssetstate("0");
		LcCardtemp cardTemp = iCardCommonBS.card2Body(cardInfo);
		assertNotNull(cardTemp.getAddtype());
	}

	@Test
	public void testCompareCardVsBody() {
		Cardinfo cardInfo = new Cardinfo();
		cardInfo.setAddtype("1");
		cardInfo.setAssetstate("0");
		LcCardtemp cardTemp = new LcCardtemp();
		cardTemp.setAddtype("0");
		cardTemp.setAssetstate("1");
		iCardCommonBS.compareCardVsBody(cardTemp, cardInfo);
	}

	@Test
	public void testGetRzkm() {
		String kmbh = iCardCommonBS.getRzkm("94", "0");
		System.out.println("入账科目-----》" + kmbh);
	}
	
	@Test
	public void testMergeBody(){
		String[] ids = new String[]{"1","2"};
		String baseCardId = "1";
		String headId = "12";
		iCardCommonBS.mergeBody(ids, baseCardId, headId);
	}
	
	
	@Test
	public void testFindLcCardtempsBySheadId() {
		String headId = "12";
		List<LcCardtemp> list = iCardCommonBS.findLcCardtempsBySheadId(headId,"true");
		assertNotNull(list);
		List<LcCardtemp> list2 = iCardCommonBS.findLcCardtempsBySheadId(headId,"false");
		assertNotNull(list2);
	}
}
















