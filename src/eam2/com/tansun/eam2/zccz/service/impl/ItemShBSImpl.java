package com.tansun.eam2.zccz.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IItemShBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.vo.CommonBO;
@Service
public class ItemShBSImpl extends CommonBSImpl implements IItemShBS{

	@Autowired
	private PublicDao publicDao;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public List<CzZcXx> findCzzcByCldId(String cldId) {
		return null;
	}
	public void updateCzXmxxLsbById(String id){
		publicDao.updateBySql("update cz_xmxx_lsb set zhuangtai = '7' where ID=? ", new String[]{id});
		}
	public CzCztzfaXx findFaxxById(String id, String fenlei) {
		CzCztzfaXx czCztzfaXx = null;
		if(ZcczCommon.ITEM_FOR_ENTITY.equals(fenlei) || ZcczCommon.ITEM_FOR_ENTITY_PERSON.equals(fenlei)){
			czCztzfaXx = (CzCztzfaXx)this.findById(CzCztzfaXx.class,id);
		}
		if(ZcczCommon.ITEM_FOR_FIXED_ASSET.equals(fenlei) || ZcczCommon.ITEM_FOR_LOAN_PLEDGE_ASSET.equals(fenlei) || ZcczCommon.ITEM_FOR_ENTITY_ASSET.equals(fenlei)){
			
		}
		return czCztzfaXx;
	}

	@SuppressWarnings("unchecked")
	public List<CzXmSpwYj> findYjByItemId(String id) {
		String hql = "from CzXmSpwYj o where o.xmId = ?";
		Object[] params = new Object[]{id};
		return (List<CzXmSpwYj>)this.publicDao.find(hql, params);
	}
	
	/**
	 * 根据处理单id在处置投资项目信息临时表CZ_XMXX_LSB中查询出主键id
	 * 找不到,返回null.
	 * @param cldId
	 * @return
	 */
	public String findItemIdByCldId(String cldId){
		String hsql = "from CzXmxxLsb where cldId=?";
		List argList = new ArrayList();
		argList.add(cldId);
		CzXmxxLsb m = (CzXmxxLsb)this.publicDao.findSingleResult(hsql, argList);
		if(m!=null){
			return m.getId();
		}else{
			return null;
		}
		
	}

	public CommonBO getHeadByIdAndFeilei(String cldId, String feilei) {
		if(StringUtils.equals("4", feilei) || StringUtils.equals("3", feilei)){
			return publicDao.findById(CzStcztz.class, cldId);
		}else{
			return publicDao.findById(CzCztzfaXx.class, cldId);
		}
	}

	public void deleteYjByItemId(String itemId) {
		publicDao.updateBySql("delete from CZ_XM_SPW_YJ where XM_ID=? and SFWZCR='0'", new String[]{itemId});
	}

	public int getTzwyCount() {
		StringBuffer sb = new StringBuffer();
		sb.append("	select count(*) wynum from P_T_USER u ");
		sb.append("  left join");
		sb.append("  P_T_USER_L_ROLE ur on u.tid=ur.user_id");
		sb.append("  left join");
		sb.append("  P_T_ROLE r on ur.role_id=r.tid");
		sb.append(" where r.tid=? or r.tid=?");
		List<Map<String,Object>> resultList = publicDao.queryForList(sb.toString(), new String[]{"139","140"});
		return ((BigDecimal)resultList.get(0).get("wynum")).intValue();
	}
	
}
