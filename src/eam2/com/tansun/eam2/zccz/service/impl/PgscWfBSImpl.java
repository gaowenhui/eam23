package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IPgscWfBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Repository
public class PgscWfBSImpl extends CommonBSImpl implements IPgscWfBS {
	
	private PublicDao dao;

	@Autowired
	public void setDao(PublicDao dao) {
		this.dao = dao;
	}

	/**
	 * 拷贝意见到知识库（其中序号生成规则为：pid下最大的序号加一）
	 * 1、查询所有的项目xm、对应的知识库意见yj并比较意见内容
	 * 		不一样：新建项目（注意序号生成）、要点、意见并更新xm,yd,yj的oldId为新生成知识库id
	 * 		一样：
	 * 			2、查询项目下的要点、对应的知识库并比较意见内容
	 * 				不一样：新建要点（pid为知识库意见对应的项目id）、新建意见并更新yd,yj的oldId为新生成知识库id
	 * 				一样  ：
	 * 					3、查询要点下的意见、对应的知识库并比较意见内容
	 * 						不一样：新建知识库意见（pid为原知识库对应的要点id）并更新yj的oldId为新生成知识库id
	 * 						一样：啥也不做！
	 * @param cldId
	 */	
	public void copyYjToZSK(String cldId,String currentUserId) {
		//查询所有结论(当前登录人,的未提交的所有项目(pid='0'))
		List<CzPgscJl> xmList = (List<CzPgscJl>)dao.find("from CzPgscJl o where o.beizhu='0' and o.pid='0' and o.tjyjr=? and o.cldId=? and  o.scbz='0'", new String[]{currentUserId,cldId});
		for(CzPgscJl xm : xmList){
			//查询户对应的知识库对象
			CzSczsk xmZsk = new CzSczsk();
			if(StringUtils.isNotEmpty(xm.getOldId()))
				xmZsk = dao.findById(CzSczsk.class, xm.getOldId());
			if(StringUtils.equals(xm.getValue(), xmZsk.getValue())){
				//如果项目没有改变,取得项目下所有的评估审查要点
				List<CzPgscJl> ydList = (List<CzPgscJl>)dao.find("from CzPgscJl o where o.beizhu='0' and o.pid=? and o.tjyjr=? and o.cldId=? and o.scbz='0'", new String[]{xm.getId(),currentUserId,cldId});
				for(CzPgscJl yd : ydList){
					//查询要点对应的知识库对象
					CzSczsk ydZsk = new CzSczsk();
					if(StringUtils.isNotEmpty(yd.getOldId()))
						ydZsk = dao.findById(CzSczsk.class, yd.getOldId());
					if(StringUtils.equals(yd.getValue(),ydZsk.getValue())){
						//如果要点没有改变,取得要点下的所有评估审查意见
						List<CzPgscJl> yjList = (List<CzPgscJl>)dao.find("from CzPgscJl o where o.beizhu='0' and o.pid=? and o.tjyjr=? and o.cldId=? and o.scbz='0'", new String[]{yd.getId(),currentUserId,cldId});
						for(CzPgscJl yj : yjList){
							//查询意见对应的知识库对象
							CzSczsk yjZsk = new CzSczsk();
							if(StringUtils.isNotEmpty(yj.getOldId()))
								yjZsk = dao.findById(CzSczsk.class, yj.getOldId());
							if(!StringUtils.equals(yj.getValue(), yjZsk.getValue())){
								//如果意见被更改,新建意见
								this.createYj(yd, yj);
							}
						}
					}else{
						//如果要点被更改
						this.createYd(xm, yd);
					}
				}
			}else{
				//如果项目有改动新建项目
				this.createXm(xm);
			}
		}
	}

	public void updateScpgJlxzGc(String cldId, String userId) {
		// TODO Auto-generated method stub

	}

	public void updateScpgJlxzTh(String cldId, String userId) {
		// TODO Auto-generated method stub

	}

	public void updateScpgJlxzZz(String cldId, String userId) {
		// TODO Auto-generated method stub

	}
	
	//如果项目信息有改动,新建审查知识库项目
	private void createXm(CzPgscJl xm){
		List<CzSczsk> zskXmList = (List<CzSczsk>)dao.find("from CzSczsk o where o.pid='0' and o.value=? and  o.scbz='0'",new String[]{xm.getValue()});
		if(zskXmList!=null&&zskXmList.size()>0){
			return ;
		}else{
			CzSczsk newXm = new CzSczsk();
			newXm.setCode("0");
			newXm.setPid("0");
			newXm.setScbz("0");
			newXm.setValue(xm.getValue());
			//保存新建的项目
			String newOldId = (String)dao.save(newXm);
			//根性评估审查的xm对应的知识库要点id
			xm.setOldId(newOldId);
			dao.update(xm);
			List<CzPgscJl> ydList = (List<CzPgscJl>)dao.find("from CzPgscJl o where o.pid=? and  o.scbz='0'",new String[]{xm.getId()});
			for(CzPgscJl yd : ydList){
				createYd(xm, yd);
			}
		}
	}
	
	//如果要点信息有改动,新建审查知识库要点
	private void createYd(CzPgscJl xm,CzPgscJl yd){
		String newOldId ="";
		List<CzSczsk> zskydList = (List<CzSczsk>)dao.find("from CzSczsk o where o.pid=? and o.value=? and  o.scbz='0'",new String[]{xm.getOldId(),yd.getValue()});
		if(zskydList!=null&&zskydList.size()>0){
			CzSczsk oldYd = zskydList.get(0);
			newOldId = oldYd.getId();
		}else{
			CzSczsk newYd = new CzSczsk();
			newYd.setCode(getZskCode(xm.getOldId()));
			newYd.setPid(xm.getOldId());
			newYd.setScbz("0");
			newYd.setValue(yd.getValue());
			//保存新建的要点
			newOldId = (String)dao.save(newYd);
		}
		//根性评估审查的yd对应的知识库要点id
		yd.setOldId(newOldId);
		dao.update(yd);
		List<CzPgscJl> yjList = (List<CzPgscJl>)dao.find("from CzPgscJl o where o.pid=? and  o.scbz='0'",new String[]{yd.getId()});
		for(CzPgscJl yj : yjList){
			createYj(yd, yj);
		}
	}
	
	//如果意见有改动,新建审查知识库意见
	private void createYj(CzPgscJl yd,CzPgscJl yj){
		List<CzSczsk> zskydList = (List<CzSczsk>)dao.find("from CzSczsk o where o.pid=? and o.value=? and  o.scbz='0'",new String[]{yd.getOldId(),yj.getValue()});
		if(zskydList!=null&&zskydList.size()>0){
			return ;
		}else{
			CzSczsk newYj = new CzSczsk();
			newYj.setCode(getZskCode(yd.getOldId()));
			newYj.setPid(yd.getOldId());
			newYj.setScbz("0");
			newYj.setValue(yj.getValue());
			String newOldId = (String)dao.save(newYj);
			yj.setOldId(newOldId);
			dao.update(yj);
		}
	}
	
	private String getZskCode(String pid){
		if(StringUtils.isNotEmpty(pid)){
			List<Map<String,Object>> codeMapList = dao.queryForList("select nvl(max(to_number(code)),'0') maxCode from cz_sczsk where pid=?",new String[]{pid});
			for(Map<String,Object> codeMap : codeMapList){
				BigDecimal maxCode = (BigDecimal)codeMap.get("maxCode");
				return String.valueOf(maxCode.intValue() + 1);
			}
		}
		return "0";
	}

	//评估审查次数加一
	public void pgscCsj1(String cldId) {
		CzPgscZskwhCld cld = dao.findById(CzPgscZskwhCld.class, cldId);
		cld.setLssccs((cld.getLssccs()==null?0L:cld.getLssccs()) + 1);
		dao.update(cld);
	}

	//修改评估审查结论已提交
	public void setPgscjlYtj(String cldId, String currentUserId) {
		dao.updateBySql("update CZ_PGSC_JL set BEIZHU='1' where CLD_ID=? and TJYJR=?", new String[]{cldId, currentUserId});
	}

	//克隆处理单
	public void cloneCld(String cldId) throws IllegalAccessException, InvocationTargetException {
		CzPgscZskwhCld cld = dao.findById(CzPgscZskwhCld.class, cldId);
		CzPgscZskwhCld newCld = new CzPgscZskwhCld();
		BeanUtils.copyProperties(newCld, cld);
		cld.setId(null);
		cld.setCldzt(ZcczCommon.FORM_BE_RETURN);
		dao.save(cld);
//		newCld.
	}
	
	//克隆处理单意见(包括办理单意见)
//	private void cloneCldYj(String cldId){
//		
//	}

	//cldId为最后一次的head_id
	public String getAllHeadIdById(String cldId) {
		StringBuffer sb = new StringBuffer();
		while(StringUtils.isNotEmpty(cldId)){
			String sql = "select t.SCSCCLD_ID scsccldId from cz_pgsc_zskwh_cld t where t.ID = ?";
			List<Map<String,Object>> cldMap = dao.queryForList(sql, new Object[]{cldId});
			if(cldMap != null && cldMap.size() > 0){
				Map<String,Object> temp = cldMap.get(0);
				cldId = (String)temp.get("scsccldId");
				sb.append(cldId).append(",");
			}else{
				if(sb.length() > 0){
					sb.substring(sb.length() - 1);
				}
				cldId = null;
			}
		}
		return sb.toString();
	}

	//cldId为最后一次的head_id
	public String getPreHeadIdById(String cldId) {
		String sql = "select t.SCSCCLD_ID scsccldId from cz_pgsc_zskwh_cld t where t.ID = ?";
		List<Map<String,Object>> cldMap = dao.queryForList(sql, new Object[]{cldId});
		if(cldMap != null && cldMap.size() > 0){
			Map<String,Object> temp = cldMap.get(0);
			cldId = (String)temp.get("scsccldId");
			return cldId;
		}else{
			return null;
		}
	}
}
