package com.tansun.eam2.jygdzc;

public interface JygdzcCommon {

	//卡片挂接状态
	String CURRENT_ASSET_CARD_CONN = "0";         //0：挂接中    
	String CURRENT_ASSET_CARD_NOT_CONN = "1";         //1：已迁移    
	
	//清算合同类型
	String CONTRACT_WGHT = "1";				//委管合同
	String CONTRACT_ZLHT = "2";				//租赁合同
	String CONTRACT_CXHT = "3";				//车险合同
	String CONTRACT_FCXHT = "4";			//非车险合同
	
	//交易对象
	String LIQUIDATE_JIANHANG 	 = "1";				//建行
	String LIQUIDATE_FEIJIANHANG = "2";				//非建行
	
	//清算审核状态
	String LIQUIDATE_SHENPIZHONG = "1";		//审批中
	String LIQUIDATE_YISHENPI    = "2";		//已审批
	
	//合同审批单业务类型
	String CONTRACT_CLD_XZ = "0";				//新增
	String CONTRACT_CLD_BD = "1";				//变动
	String CONTRACT_CLD_ZZ = "2";				//终止
	
	//合同审核状态
	String CONTRACT_SPZT_WSP = "0";		//未审批
	String CONTRACT_SPZT_SPZ = "1";		//审批中
	String CONTRACT_SPZT_YSP = "2";		//已审批
	
	//合同是否提前终止
	String CONTRACT_ZZ_YES = "1";		//提前终止
	String CONTRACT_ZZ_NO = "0";		//未提前终止
	
	//合同状态
	String CONTRACT_ZT_ZXZ  = "1";		//执行中
	String CONTRACT_ZT_WZX  = "2";		//待执行
	String CONTRACT_ZT_ZXWB = "3";		//执行完毕
	
	//资产权属
	String ZCQS_OWING = "1";            //自有
	String ZCQS_ENTRUST = "2";          //受托
}
