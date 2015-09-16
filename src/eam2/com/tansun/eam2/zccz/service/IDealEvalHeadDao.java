package com.tansun.eam2.zccz.service;

import java.util.List;

import com.tansun.eam2.common.commonService.ICommonBS;
import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;

public interface IDealEvalHeadDao extends ICommonBS {

	public String saveHead(CzPgscZskwhCld head);
	
	public void updataHead(CzPgscZskwhCld head);
	
	public List<CzPgscJl> getMyScxmList(String cldId, String userId);//根据处理单,用户id取得项目中未提交的意见
	public List<CzPgscJl> getSubmitScxmList(String cldId);//根据处理单取得项目中已提交的意见
	public List<CzPgscJl> getScydList(String cldId, String xmId);//根据处理单、项目id取得要点
	public List<CzPgscJl> getScyjList(String cldId, String ydId);//根据处理单、要点id取得意见
	public List<CzPgscJl> getPgscListByCldId(String cldId);//根据处理单取得项目、要点、意见
	public List<CzPgscJl> getPgscListByCldIdUserId(String cldId, String userId);//根据处理单、用户Id取得项目、要点、意见
	public String findParentByChild(String childId); // 根据子节点查找父节点
	public String findValueById(String id);//根据id找value
	public void updateValueById(String id,String value);//根据id修改value
	public String getUserLX(String cldId,String userId);// 查找用户类型
	public String findRadioValue(String cldId,String userId); // 查找通过与否
	public Double findTjpc(String cldId, String tjrId); // 得到提交批次
	
	public String getStIdByCldId(String cldId);
}
