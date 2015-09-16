package com.tansun.eam2.common.util;

import com.tansun.eam2.common.workflow.counterSign.service.ETCounterSignBS;

public final class CounterSignStatus {
	public static boolean getStatus(String biaodanid){
		String counter = ((ETCounterSignBS)SpringContextHelper.getBean(ETCounterSignBS.class)).findCounter(biaodanid);
		return (counter != null && counter.length() > 0 && Integer.parseInt(counter) > 0);
	}
}
