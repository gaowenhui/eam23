package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.jygdzc.JygdzcCommon;
import com.tansun.eam2.jygdzc.service.IContractBS;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;

public class LiquidateWorkflowAction extends CommonWorkflowAction{
	@Autowired
	public IContractBS contractBSImpl;
	@Autowired
	IDeptUCC iDeptUCCimpl;
	public String todo(){
		IUser user=UserThreadLocal.get();
		String DLRmc=user.getUsername();
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            String DLRbmmc= dept.getRsvdStr1();
            request.setAttribute("DLRbmmc", DLRbmmc);
		}
		request.setAttribute("DLRmc", DLRmc);
		return super.todo();
	}
	public String endView(){
		IUser user=UserThreadLocal.get();
		String DLRmc=user.getUsername();
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            String DLRbmmc= dept.getRsvdStr1();
            request.setAttribute("DLRbmmc", DLRbmmc);
		}
		request.setAttribute("DLRmc", DLRmc);
		return super.endView();
	}
	public String did(){
		IUser user=UserThreadLocal.get();
		String DLRmc=user.getUsername();
		List<PTDeptBO> list=iDeptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            String DLRbmmc= dept.getRsvdStr1();
            request.setAttribute("DLRbmmc", DLRbmmc);
		}
		request.setAttribute("DLRmc", DLRmc);
		return super.did();
	}
	public String draftCommit(){
		String result = super.draftCommit();
		JjzcHtqsHead head = contractBSImpl.getJjzcHtqsHeadById(this.todo.getHeadId());
		head.setZhuangtai(JygdzcCommon.LIQUIDATE_SHENPIZHONG);
		head.setLcId(this.todo.getProcInstId());
		contractBSImpl.update(head);
		return result; 
	}
	public String saveDraft(){
		String result = super.saveDraft();
		if(StringUtils.equals("拟稿",this.taskName)){
			String headId = this.headId;
			//锁合同
			contractBSImpl.lockContrat4Liquidate(headId);
			
		}
		return result;
	}
}
