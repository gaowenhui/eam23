package com.tansun.eam2.cjtz.service;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;

public interface ICjtzService extends ICommonBS {

	public String findXmxxByZc(String zcId, String zclb);

}
