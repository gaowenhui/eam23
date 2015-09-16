package com.tansun.eam2.ssgl;

public interface SsglCommon {
	// 诉讼阶段 1：一审 2：二审 3：执行 4：再审
	String SS_SSJD_1 = "1"; // 一审
	String SS_SSJD_2 = "2"; // 二审
	String SS_SSJD_3 = "3";// 执行
	String SS_SSJD_4 = "4"; // 再审

	// 结案状态 0: 结案 1:未结案
	String SS_JAZT_0 = "0";
	String SS_JAZT_1 = "1";

	// 诉讼类型 0:起诉 1:被诉
	String SS_SSLX_QS = "0";
	String SS_SSLX_BS = "1";

	//涉案资产类别  1： 固定资产类 2：实体类  3：委托贷款类 4：债券类 5：债权类 6：其他
	
	
	
	String SS_SAZCLB_GDZC ="1";
	String SS_SAZCLB_STL ="2";
	String SS_SAZCLB_WTDK ="3";
	String SS_SAZCLB_ZQ1 ="4";
	String SS_SAZCLB_ZQ2 ="5";
	String SS_SAZCLB_OTHER ="6";

	

	

}
