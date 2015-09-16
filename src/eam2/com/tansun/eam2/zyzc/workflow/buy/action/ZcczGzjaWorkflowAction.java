package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IDealTrace1HeadBS;


public class ZcczGzjaWorkflowAction extends CommonWorkflowAction{
	@Autowired
	IDealTrace1HeadBS bs;
	
	public String saveDraft(){
			List list = bs.findCzXmListByCldId(headId);
			if(list!=null&&list.size()>0){
				CzXmXx xx = null;
				for (int i = 0; i < list.size(); i++) {
					xx = (CzXmXx) list.get(i);
					xx.setZhuangtai(ZcczCommon.PROJECT_TYPE_ZXZ);
					bs.update(xx);
				}
			}
		String result = super.saveDraft();
		return result;
	}
}
