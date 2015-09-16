package com.tansun.eam2.zyzc.workflow.buy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;


public class ZltbWorkflowAction extends CommonWorkflowAction{
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
}
