package com.tansun.eam2.zccz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ZcczCommonImpl implements ZcczCommon {
	
	//公开拍卖环节
	public static List getGKPMList(){
		List getGKPMList = new ArrayList();
		getGKPMList.add(0, "disposeGkpmCgpmjg");
		getGKPMList.add(1, "disposeGkpmPmgg");
		getGKPMList.add(2, "disposeGkpmXcpm");
		getGKPMList.add(3, "disposeGkpmGh");
		getGKPMList.add(4, "disposeGkpmHkhs");
		return getGKPMList;
	}
	
	//交易所挂牌环节
	public static List getJYSGPList(){
		List getGKPMList = new ArrayList();
		getGKPMList.add(0, "disposeJysgpCgzjjg");
		getGKPMList.add(1, "disposeJysgpGpjd");
		getGKPMList.add(2, "disposeJysgpGh");
		getGKPMList.add(3, "disposeJysgpHkhs");
		return getGKPMList;
	}
	
	//协议转让
	public static List getXYZRList(){
		List getXYZRList = new ArrayList();
		getXYZRList.add(0, "disposeXyzrQdzrxy");
		getXYZRList.add(1, "disposeXyzrHkhs");
		return getXYZRList;
	}
	
	//拆迁
	public static List getCQList(){
		List getCQList = new ArrayList();
		getCQList.add(0, "disposeCqChild");
		return getCQList;
	}
	
	//拆迁
	public static List getZXQKList(){
		List getCQList = new ArrayList();
		getCQList.add(0, "disposeZxqkChild");
		return getCQList;
	}
	
	//破产注销
	public static List getPCZXList(){
		List getPCZXList = new ArrayList();
		getPCZXList.add(0, "disposePczxPcfyxx");
		getPCZXList.add(1, "disposePczxQs");
		getPCZXList.add(2, "disposePczxScqk");
		getPCZXList.add(3, "disposePczxJxyyzz");
		return getPCZXList;
	}
	
	//清算注销
	public static List getQSZXList(){
		List getPCZXList = new ArrayList();
		getPCZXList.add(0, "disposeQszxQs");
		getPCZXList.add(1, "disposeQszxScqk");
		getPCZXList.add(2, "disposeQszxJxyyzz");
		return getPCZXList;
	}
	
	//股权转让
	public static List getGQZRList(){
		List getGQZRList = new ArrayList();
		getGQZRList.add(0, "disposeGqzrQsxy");
		getGQZRList.add(1, "disposeGqzrHkhs");
		getGQZRList.add(2, "disposeGqzrGqbg");
		return getGQZRList;
	}
	
	//实体人员安置
	public static List getSTRYAZList(){
		List getSTRYAZList = new ArrayList();
		getSTRYAZList.add(0, "disposeStryazPqls");
		getSTRYAZList.add(1, "disposeStryazAzgg");
		getSTRYAZList.add(2, "disposeStryazFyzf");
		getSTRYAZList.add(3, "disposeStryazJcldht");
		return getSTRYAZList;
	}
}
