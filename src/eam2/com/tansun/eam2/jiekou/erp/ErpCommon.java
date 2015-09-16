package com.tansun.eam2.jiekou.erp;

public interface ErpCommon {

	//发送erp状态
	String SEND_ERP_CG = "0"; 			//发送成功
	String SEND_ERP_BCG = "1"; 			//未发送或者发送不成功
	String SEND_ERP_SHTG = "2"; 		//审核通过
	String SEND_ERP_SHBTG = "3"; 		//审核不通过
}
