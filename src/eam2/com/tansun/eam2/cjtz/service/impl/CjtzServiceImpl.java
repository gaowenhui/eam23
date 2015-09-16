package com.tansun.eam2.cjtz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICjtzService;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;

@Service
public class CjtzServiceImpl extends CommonBSImpl implements ICjtzService {
	@Autowired
	private PublicDao dao;
	
	public String findXmxxByZc(String zcId, String zclb){
		String sql = "select  t.ID ,t.XMLSB,t.BIANHAO,t.CZXMMC,t.ZHUANGTAI, t.FENLEI  ,c.C_TZYWLX,c.NGBMMC,c.NGRXM " +
						" from cz_xm_xx t , cz_zc_xx b,cz_cztzfa_xx c  where  t.cld_id = b.cld_id and t.cld_id = c.id and "
						+" b.zclb = ? and " +
						this.checkZclb(zclb)
						+" = ? and t.fenlei = '5' order by t.id ";
		List list = this.dao.queryForList(sql, new Object[]{zclb,zcId});
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			DealQueryVo returnvo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				returnvo = new DealQueryVo();
				returnvo.setXmId(String.valueOf(map.get("ID")));
				returnvo.setBh(String.valueOf(map.get("BIANHAO")));
				returnvo.setCzxmmc(String.valueOf(map.get("CZXMMC")));
				returnvo.setNgbmmc(String.valueOf(map.get("NGBMMC")));
				returnvo.setNgrmc(String.valueOf(map.get("NGRXM")));
				String ywlx = String.valueOf(map.get("C_TZYWLX"));//业务类型
				Code code = (Code)dao.findSingleResult("from Code code where code.codeKey=? and code.codeType='INVESTMENT_TYPE'", new String[]{ywlx});
				if(code!=null){
					ywlx=code.getCodeValue();
				}
				returnvo.setYwlx(ywlx);
				String xmzt = String.valueOf(map.get("ZHUANGTAI"));//设置状态
				//设置项目状态
				this.setXmzt(returnvo, xmzt);
				returnList.add(returnvo);
			}
		}
		String JSONstr = BodyListToJSON.getJSON(returnList, 1, 1,1111111111);
		return JSONstr;
	}

	private String checkZclb(String zclb) {
		String returnV="";
		if(ZcczCommon.MANAGE_FIXED_ASSEET.equals(zclb)
				||ZcczCommon.DEALING_ASSET.equals(zclb)
				||ZcczCommon.ENTRUST_ASSET.equals(zclb)){
			returnV = " b.azcid  ";
		}else if(ZcczCommon.ENTITY_ASSET.equals(zclb)
				||ZcczCommon.LOAN_PLEDGE.equals(zclb)
				||ZcczCommon.ENTITY.equals(zclb)){
			returnV = " b.bfsxxid  ";
		}else{
			returnV = " b.fzq_id ";
		}
		return returnV;
	}
	
	//设置项目状态
	private void setXmzt(DealQueryVo returnvo, String xmzt) {
		if(ZcczCommon.PROJECT_TYPE_WZX.equals(xmzt)){
			returnvo.setXmzt(ZcczCommon.PROJECT_TYPE_WZX_ZH);
		}else if(ZcczCommon.PROJECT_TYPE_ZXZ.equals(xmzt)){
			returnvo.setXmzt(ZcczCommon.PROJECT_TYPE_ZXZ_ZH);
		}else if(ZcczCommon.PROJECT_TYPE_YJA.equals(xmzt)){
			returnvo.setXmzt(ZcczCommon.PROJECT_TYPE_YJA_ZH);
		}
	}
}
