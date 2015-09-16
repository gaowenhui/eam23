package com.panding.webservice;
import java.sql.SQLException;

import java.sql.SQLException;

import cn.cbhb.rpending.common.vo.RPendingVo;

public interface IPandingInterfaceWebservice {
	String putPandingInfo(RPendingVo vo);

	String changePangdingStatus(RPendingVo vo);

	String putOaPandingInfo(
			// 操作类型
			String optType,
			// 待办对应的应用系统编号
			String psCode,
			// 待办编码
			String pCode,
			// 待办标题
			String pTitle,
			// 待办时间
			String pDate,
			// 待办发起人标示
			String pOraniger,
			// 待办负责人标示
			String pPrincipal,
			// 待办信息URL
			String pURL,
			// 待办状态
			String pStatus,
			//待办类别
			String Ptype
			// 当前待办阶段
			//String pStage,
			// 待办紧急程度
			//String pLevel,
			// Md5加密信息
			//String MD5Info,
			// 备注
			//String pNote
			) throws SQLException;

	String changeOaPangdingStatus(
			//操作类型
			String optType,
			//待办对应的应用系统编号
			String psCode,
			//待办编码
			String pCode,
			//待办类别
			String Ptype
			//Md5加密信息
			//String MD5Info,
			// 备注
			//String pNote
			);
}
