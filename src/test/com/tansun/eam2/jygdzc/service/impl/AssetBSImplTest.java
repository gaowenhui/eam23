package com.tansun.eam2.jygdzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.AssetCardVO;
import com.tansun.eam2.jygdzc.vo.AssetFlowVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.rdp4j.common.util.Paginator;

public class AssetBSImplTest {

	public IAssetBS assetBSImpl;

	public AssetBSImplTest() {
		ApplicationContext ctx = new ClassPathXmlApplicationContext(
				"applicationContext.xml");
		assetBSImpl = (IAssetBS) ctx.getBean("assetBSImpl");

	}

	@Test
	public final void testGetAssetBodyVOById() {
		String CldId = "8a8189612c80e334012c80e429060002";

		List<AssetBodyVO> list = assetBSImpl.getAssetBodyVOById(CldId);

		System.out.println(list.size());

	}

	@Test
	public final void testGetCardAssetHistoryByZcId() {
	}

	@Test
	public final void testGetJyzcRiskByZcId() {
	}

	@Test
	public final void testGetJyzcSqsdfyXxByZcId() {
	}

	@Test
	public final void testGetJyzcXxLsbsByHeadId() {
	}

	@Test
	public final void testGetJyzcXxVOByCondition() {

		QueryBO jyXxq = new QueryBO();
		jyXxq.setZcbh("1");
		// jyXxq.setZcmc("12");

		Paginator paginator = new Paginator();
		paginator.setCurrentPage(1);
		List<JyzcXxVO> list = assetBSImpl.getJyzcXxVOByCondition(jyXxq,
				paginator);

		for (int i = 0; i < list.size(); i++) {
			JyzcXxVO jyzcXxVO = list.get(i);
			System.out.print("=xxxxxxxxxx==" + jyzcXxVO.getId());
			System.out.print(jyzcXxVO.getZcmc());
			System.out.println(jyzcXxVO.getZcbh());
		}

		System.out.print(list.size());

	}

	@Test
	public final void testJyzc2Body() {
		// assetBSImpl.jyzc2Body();
	}

	@Test
	public final void testGetRecordhistoryByzcId() {
//		List<Recordhistory> list = assetBSImpl
//				.getRecordhistoryByzcId("8a8189612c83894c012c838c81330005");
//		System.out.print(list.size());

	}

	@Test
	public final void testGetAssetCardVOByzcId() {

//		List<AssetCardVO> list = assetBSImpl
//				.getAssetCardVOByzcId("8a8189612c831707012c831d8b940004");
//		System.out.print(list.size());
//		for (int i = 0; i < list.size(); i++) {
//			AssetCardVO assetCardVO = list.get(i);
//			System.out.println(assetCardVO.getZcId());
//		}
	}

	@Test
	public final void testGetAssetFlowVOByzcId() {
		List<AssetFlowVO> list = new ArrayList();
		list = assetBSImpl.getAssetFlowVOByzcId("2");
		System.out.print(list.size());
		for (int i = 0; i < list.size(); i++) {
			System.out.println("" + list.get(i).getBianhao());
		}
	}
	
	@Test 
	public final void testGetJyzcXxByLsbZcid(){
		System.out.print(assetBSImpl.getJyzcXxByLsbZcid("1").getId());
	}
}
