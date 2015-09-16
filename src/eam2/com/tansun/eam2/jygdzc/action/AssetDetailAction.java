package com.tansun.eam2.jygdzc.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * ZCDetailAction用来实现对经营性固定资产的信息的查询功能和选取功能
 * @author lihuan
 *
 */
public class AssetDetailAction extends CommonAction {
  
	private String assetId;
	public JyzcXx jyzcXx;
	public String headId;
	@Autowired
	public IAssetUCC assetUCCImpl;
	/**
	 * 给定一个资产编号，以页面形式显示资产的基本信息等内容 
	 * 从资产表里取数据
	 * @return
	 */
	public String view(){
       //step1:根据传入的zcid来检索数据库的对应数据
		//根据HeadId
		jyzcXx=assetUCCImpl.getJyzcXxById(headId);
		//找到这条数据下的风险信息 ---卡片信息
		//准备数据
		//查到这条数据的风险信息  --卡片信息
		
		
		
		
		
		//step2:结束工作，转到相关页面 AssetQuery.jsp
		return "view";
	}
	public String getAssetId() {
		return assetId;
	}
	public void setAssetId(String assetId) {
		this.assetId = assetId;
	}
	
	
	
}
