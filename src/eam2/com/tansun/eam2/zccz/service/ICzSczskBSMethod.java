package com.tansun.eam2.zccz.service;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.commonService.ICommonBS;

public interface ICzSczskBSMethod extends ICommonBS {

	/**
	 * 更新一个项目中安置的人员的状态
	 * 0：未安置1：安置审批中2：安置执行中 3:已安置
	 */
	public void uadatePersonStatuInCld(String cldId, String statu);
	
	/**
	 * 合规审查次数加一
	 * head对象CzStcztz
	 */
	public void heguishenchaChishuAdd1(String cldId);
	
	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表
	 * 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * @param hyId
	 * @return Map<"处理单id",List<"审批委员Id">>
	 */
	public Map<String,List<String>> getAllShenpiWeiyuan(String hyId);
	
	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表
	 * 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 如果说有的审批委员都已经提交审批意见(字段SFTJSPYJ)return true;否则return false
	 * @param hyId
	 * @return
	 */
	public boolean isAllXmSubmit(String hyId);
	
	/**
	 * 返回一个会议内的所有项目的处理单id和意见汇总人id
	 * 表CZ_XMXX_LSB
	 * @param hyId
	 * @return	Map<处理单id,意见汇总人id>
	 */
	public Map<String,String> getAllcldIdInHy(String hyId);
}
