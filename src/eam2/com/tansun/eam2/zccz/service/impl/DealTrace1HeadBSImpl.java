package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmjaBody;
import com.tansun.eam2.common.model.orm.bo.CzXmjaHead;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.IAssetDealBodyBS;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.eam2.zccz.service.IDealToDoBS;
import com.tansun.eam2.zccz.service.IDealTrace1HeadBS;
import com.tansun.eam2.zccz.service.IStatisticQueryBS;
import com.tansun.eam2.zccz.vo.DealQueryVo;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.eam2.common.model.orm.bo.Code;
@Service
public class DealTrace1HeadBSImpl extends CommonBSImpl implements IDealTrace1HeadBS {
	@Autowired
	private PublicDao dao;
	@Autowired
	private IDealToDoBS dealToDoBS;
	@Autowired
	private IStatisticQueryBS queryBS;
	@Autowired
	private IAssetDealWfBS assetDealWfBS;
	@Autowired
	private CzStcztzWfBS czStcztzWfBS;
	@Autowired
	private IAssetDealBodyBS assetDealBodyBSImpl;
	/**
	 * 查询列表json字符串
	 * @return
	 */
	public String getQueryJSONStr(DealQueryVo vo,Paginator paginator){
		StringBuffer sql = new StringBuffer("");
		boolean isGDZCCZ = true;//是处置项目下的固定资产处置，根据查询条件的业务类型判断
		boolean isALL	 = false;//是所有的项目 ，包括固定和实体
		boolean isCzxmOrTzxm = false;//是处置项目还是投资项目，true为处置，false为投资
		if(ZcczCommon.DEAL_XMLX_CZ.equals( vo.getXmlx())){//处置项目
			isCzxmOrTzxm = true;
			if(ZcczCommon.DISPOSE_TYPE_GDZCCZ.equals(vo.getYwlx())){	//是固定资产处置，则标识为true
				isGDZCCZ = true;
			}else if(ZcczCommon.DISPOSE_TYPE_STZTCZ.equals(vo.getYwlx())||//是实体处置的都标识为false;
					 ZcczCommon.DISPOSE_TYPE_STRYCZ.equals(vo.getYwlx())){
				isGDZCCZ = false;
			}else{							//默认情况是所有固定资产处置，为true
				isALL = true;
			}
		}else {//投资项目 如果是投资项目，则都是从CZ_STCZTZ这个表取
			isCzxmOrTzxm = false;
			isGDZCCZ = false;
			isALL	 = false;
		}	
		sql .append(" SELECT A.ID ,A.XMLSB,A.BIANHAO,A.CZXMMC,A.ZHUANGTAI, ")
			.append(" A.FENLEI "+(isCzxmOrTzxm?"":(",B.TZYWLX ")))
			.append(" FROM CZ_XM_XX A " +(isALL?"":(isGDZCCZ?" ,CZ_CZTZFA_XX B ":" ,CZ_STCZTZ B "+("".equals(checkEmpty(vo.getZcszwz()))?"":",CODE C "))))//标识为true 则查询处置相关表，否则查询实体相关表
			.append(isALL?" WHERE 1=1 ":" WHERE  A.CLD_ID = B.ID "+(isGDZCCZ?"":("".equals(checkEmpty(vo.getZcszwz()))?"":" AND B.STSCSF = C.CODE_KEY AND C.CODE_TYPE = 'PROVIENCE'")))
			.append(" AND (A.BIANHAO LIKE '%" +checkEmpty(vo.getBh())    +"%' OR '"	+checkEmpty(vo.getBh())		+"' IS NULL) ")
			.append(" AND (A.CZXMMC  LIKE '%" +checkEmpty(vo.getCzxmmc())+"%' OR '"	+checkEmpty(vo.getCzxmmc())	+"' IS NULL) ")
			.append(" AND (A.ZHUANGTAI  =  '" +checkEmpty(vo.getXmzt())  +"'  OR '"	+checkEmpty(vo.getXmzt())	+"' IS NULL) ")
			//.append(isALL?"":(" AND (B.C_CZFS     =  '" +checkEmpty(vo.getCzfs())  +"'  OR '"	+checkEmpty(vo.getCzfs())	+"' IS NULL) "))
			.append(isALL?"":(" AND ("+(isGDZCCZ?" B.ZCSZWZ":("".equals(checkEmpty(vo.getZcszwz()))?"b.id ":"C.CODE_VALUE")) + " LIKE '%" +checkEmpty(vo.getZcszwz())+"%' OR '"	+checkEmpty(vo.getZcszwz())	+"' IS NULL) "))
			.append(isALL?"":(" AND (B.NGBMMC  LIKE '%" +checkEmpty(vo.getNgbmmc())+"%' OR '"	+checkEmpty(vo.getNgbmmc())	+"' IS NULL) "))
			.append(isALL?"":(" AND (B.NGRXM   LIKE '%" +checkEmpty(vo.getNgrmc()) +"%' OR '"	+checkEmpty(vo.getNgrmc())	+"' IS NULL) "));
		
		
		if(isCzxmOrTzxm){
			//sql.append(isALL?"":(" AND (B.C_CZFS     =  '" +checkEmpty(vo.getCzfs())  +"'  OR '"	+checkEmpty(vo.getCzfs())	+"' IS NULL) "));
			if(!isALL){
				if(isGDZCCZ){
					sql	.append(" AND (A.FENLEI like '%"  + ZcczCommon.ITEM_FOR_FIXED_ASSET 		+"%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_ENTITY_ASSET		+",%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_ZYZC				+"%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_DEALING_ASSET		+"%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_ENTRUST_ASSET		+"%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_STOCK				+"%'")
						.append(" OR  A.FENLEI like '%"   + ZcczCommon.ITEM_FOR_ENTRUST_DEBT		+",%'")
						.append(" OR  A.FENLEI like '%"	  + ZcczCommon.ITEM_FOR_LOAN_PLEDGE_ASSET 	+"%')");
				}else if(ZcczCommon.DISPOSE_TYPE_STZTCZ.equals(vo.getYwlx())){//是实体处置的都标识为false;
					sql	.append(" AND (A.FENLEI = '"  + ZcczCommon.ITEM_FOR_ENTITY 	+"')");
				}else if(ZcczCommon.DISPOSE_TYPE_STRYCZ.equals(vo.getYwlx())) {
					sql	.append(" AND (A.FENLEI = '"  + ZcczCommon.ITEM_FOR_ENTITY_PERSON 			+"')");
				}
			}else{
				sql	.append(" AND (A.FENLEI != '"  + ZcczCommon.ITEM_FOR_INVESTMENT 		+"')");
			}
		}else{
			sql.append(isALL?"":(" AND (B.TZYWLX     =  '" +checkEmpty(vo.getYwlx())  +"'  OR '"	+checkEmpty(vo.getYwlx())	+"' IS NULL) "));
			sql.append(" AND (A.FENLEI = '"  + ZcczCommon.ITEM_FOR_INVESTMENT 	+"')");
		}
		sql.append(" ORDER BY A.ID ");
		PageableList pageableList = dao.queryForList(sql.toString(), new ArrayList(),paginator);
		List list = pageableList.getResults();
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			DealQueryVo returnvo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				returnvo = new DealQueryVo();
				returnvo.setXmId(String.valueOf(map.get("ID")));
				returnvo.setBh(String.valueOf(map.get("BIANHAO")));
				returnvo.setCzxmmc(String.valueOf(map.get("CZXMMC")));
				returnvo.setYwlx(this.checkFenlei(String.valueOf(map.get("FENLEI"))));
				String xmzt = String.valueOf(map.get("ZHUANGTAI"));//设置状态
				//设置项目状态
				this.setXmzt(returnvo, xmzt);
				//根据处置方式得到项目的其他属性，处置方式中文名，资产所在位置，拟稿部门名称，拟稿人
				this.getCzfsByYwlx(returnvo,isCzxmOrTzxm);
				//设置主持人
				String zcr = this.getSpwyOrZcrByLsbId(String.valueOf(map.get("XMLSB")), ZcczCommon.DEALTODO_ZCR);
				//设置委员
				String spwys = this.getSpwyOrZcrByLsbId(String.valueOf(map.get("XMLSB")), ZcczCommon.DEALTODO_SPWY);
				if(StringUtils.isNotEmpty(spwys)){
					spwys = spwys.replaceAll(",null,", ",");
					spwys = spwys.substring(0, spwys.length()-1);
				}
				if(zcr!=null&&zcr.endsWith(",")){
					zcr = zcr.substring(0, zcr.length()-1);
				}
				returnvo.setZcr(zcr);
				returnvo.setSpwys(spwys);
				returnList.add(returnvo);
			}
		}
		
		String JSONstr = BodyListToJSON.getJSON(returnList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return JSONstr;
	}

	private String checkFenlei(String fenlei) {
		//处置项目分类 			
		String ret = "";
		if((ZcczCommon.ITEM_FOR_FIXED_ASSET+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_ENTITY_ASSET+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_LOAN_PLEDGE_ASSET+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_ENTITY+",").indexOf(fenlei)>=0){
			ret = "实体整体处置";
		}else if((ZcczCommon.ITEM_FOR_ENTITY_PERSON+",").indexOf(fenlei)>=0){
			ret = "实体人员安置";
		}else if((ZcczCommon.ITEM_FOR_INVESTMENT+",").indexOf(fenlei)>=0){
			ret = "承继投资处置";
		}else if((ZcczCommon.ITEM_FOR_ZYZC+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_DEALING_ASSET+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_ENTRUST_ASSET+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_STOCK+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}else if((ZcczCommon.ITEM_FOR_ENTRUST_DEBT+",").indexOf(fenlei)>=0){
			ret = "通用资产处置";
		}
		return ret;
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
	
	/**
	 * 根据xmId项目id//根据处置方式得到项目的其他属性，处置方式中文名，资产所在位置，拟稿部门名称，拟稿人
	 * @param string
	 * @return
	 */
	public DealQueryVo getCzfsByYwlx(DealQueryVo returnvo,boolean isCzxmOrTzxm) {
		String sql ="from CzXmXx t where t.id = ?";
		CzXmXx xx = (CzXmXx) dao.findSingleResult(sql, new Object[]{returnvo.getXmId()});
		String czfs = "";
		String codeType = "";// 从code表中取什么类型
		String ngrmc = "";
		String ngbmmc = "";
		String zcszwz = "";
		String cldId = "";
		String czsx = "";
		String kpsfjs = "";
		String sfqszczrxy = "";
		String yjczhsje = "";
		String yjczfy = "";
		String ywlx = returnvo.getYwlx();
		String sfqbja = "否";
		double [] dd = queryBS.statisticCost(xx.getId());
		double ddd = 0.0;
		for(int i=0;i<dd.length;i++){
			ddd +=dd[i];
		}
		returnvo.setSjczfy(String.valueOf(ddd));
		returnvo.setSjczsr(String.valueOf(queryBS.statisticIncome(xx.getId())));
		if(xx!=null){
			String fenlei = xx.getFenlei();
			cldId = xx.getCldId();
			CzXmjaBody body = this.findCzXmjaBodyByXmIdAndCldId(xx.getId(), xx.getJacldId());
			if(body!=null){
				kpsfjs = body.getKpsfjs();
				if("1".equals(kpsfjs)){
					kpsfjs = "是";
				}else if("0".equals(kpsfjs)){
					kpsfjs = "否";
				}else {
					kpsfjs = "";
				}
				sfqszczrxy = body.getSfqsxy();
				if("1".equals(sfqszczrxy)){
					sfqszczrxy = "是";
				}else if("0".equals(sfqszczrxy)){
					sfqszczrxy = "否";
				}else {
					sfqszczrxy = "";
				}
				sfqbja = "1".equals(body.getSfqbja())?"是":"否";
			}
			if(ZcczCommon.ITEM_FOR_FIXED_ASSET.equals(fenlei)||	//判断项目是什么分类，然后根据分类确定是从哪个表取，1，0，2，5分类取code表的ASSET_DISPOSE_METHOD
				ZcczCommon.ITEM_FOR_ENTITY_ASSET.equals(fenlei)||
				ZcczCommon.ITEM_FOR_LOAN_PLEDGE_ASSET.equals(fenlei)
				){
				
				codeType = "ASSET_DISPOSE_METHOD";
				String czsql = "from CzCztzfaXx x where x.id = ?";//如果是处置投资的，从处置投资表里取得拟稿人，拟稿部门，所在位置
				CzCztzfaXx czxx = (CzCztzfaXx) dao.findSingleResult(czsql, new Object[]{cldId});
				if(czxx!=null){
					ngrmc = czxx.getNgrxm();
					ngbmmc = czxx.getNgbmmc();
					zcszwz = czxx.getZcszwz();
					czfs = czxx.getCCzfs();
					czsx = xx.getCzsx();
					yjczhsje = String.valueOf(czxx.getYjczhsje());
					yjczfy = String.valueOf(czxx.getYjczfy());
					if(!isCzxmOrTzxm){
						ywlx = String.valueOf(czxx.getCTzywlx());//业务类型
						Code code = (Code)dao.findSingleResult("from Code code where code.codeKey=? and code.codeType='INVESTMENT_TYPE'", new String[]{ywlx});
						if(code!=null){
							ywlx=code.getCodeValue();
						}
					}
					
				}
			}else {												//其他为3，4取code表的ENTITY_DISPOSE_METHOD
				codeType = "ENTITY_DISPOSE_METHOD";
				String czsql = "from CzStcztz x where x.id = ?";   //如果是实体处置的，从实体表里取得拟稿人，拟稿部门，所在位置
				CzStcztz stxx = (CzStcztz) dao.findSingleResult(czsql, new Object[]{cldId});
				if(stxx!=null){
					ngrmc = stxx.getNgrxm();
					ngbmmc = stxx.getNgbmmc();
					zcszwz = stxx.getStscsf();
					czfs = stxx.getCCzfs();
					czsx = xx.getCzsx();
					yjczhsje = String.valueOf(stxx.getAzfy());
				}
			}
			String sql1 = "SELECT T.CODE_VALUE FROM CODE T WHERE T.CODE_TYPE = ? AND T.CODE_KEY = ? ";//得到处置方式
			List list = dao.queryForList(sql1, new Object[]{codeType,czfs});//将处置方式编码转换为中文
			if(list !=null && list.size()>0){
				Map map = (Map)list.get(0);
				czfs = String.valueOf(map.get("code_value"));
			}
		}	
		returnvo.setNgbmmc(ngbmmc);
		returnvo.setNgrmc(ngrmc);
		if(StringUtils.isNotEmpty(zcszwz)){
			Code code = (Code)dao.findSingleResult("from Code code where code.codeKey=? and code.codeType='PROVIENCE'", new String[]{zcszwz});
			if(code != null)
				zcszwz = code.getCodeValue();
		}
		returnvo.setZcszwz(zcszwz);
		returnvo.setCzfs(czfs);
		returnvo.setCzsx(czsx);
		returnvo.setKpsfjs(kpsfjs);
		returnvo.setSfqszczrxy(sfqszczrxy);
		returnvo.setYjczfy(yjczfy);
		returnvo.setYjczhsje(yjczhsje);
		returnvo.setYwlx(ywlx);
		returnvo.setSfqbja(sfqbja);
		return returnvo;
	}

	public String getSpwyOrZcrByLsbId(String lsbId,String type){
		List zcrList = dealToDoBS.findSpwyByLsbId(lsbId,type);//根据临时表id查出名称
		String names = "";
		if(zcrList!=null&&zcrList.size()>0){
			CzXmSpwYj yj = null;
			for(int m=0;m<zcrList.size();m++){
				yj = (CzXmSpwYj) zcrList.get(m);
				names = names+yj.getSpwyxm()+",";
			}
			if(names.endsWith(",")){
				names.substring(0, names.length()-1);
			}
		}
		return names;
	}
	/**
	 * 查询处置资产项目信息临时表
	 * @param xmId
	 * @return
	 */
	public CzXmxxLsb findCzXmXxLSBById(String xmId){
		String sql = "from CzXmxxLsb x where x.id = ?";
		return (CzXmxxLsb) dao.findSingleResult(sql, new Object[]{xmId});
	}
	/**
	 * 查询处置资产项目信息
	 * @param xmId
	 * @return
	 */
	public CzXmXx findCzXmXxById(String xmId){
		String sql = "from CzXmXx x where x.id = ?";
		return (CzXmXx) dao.findSingleResult(sql, new Object[]{xmId});
	}
	
	/**
	 * 处理单列表json字符串
	 * @return
	 */
	public String findCzXmByCldId(String headId){
		String JSONStr = "";
		List list = this.findCzXmListByCldId(headId);
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			CzXmXx xx = null;
			DealQueryVo vo = null;
			for (int i = 0; i < list.size(); i++) {
				xx = (CzXmXx) list.get(i);
				vo = new DealQueryVo();
				vo.setBh(xx.getBianhao());
				vo.setXmId(xx.getId());
				vo.setCzxmmc(xx.getCzxmmc());
				vo.setXmzt(xx.getZhuangtai());
//				this.setXmzt(vo,xx.getZhuangtai());
//				String zcr = this.getSpwyOrZcrByLsbId(xx.getXmlsb(), ZcczCommon.DEALTODO_ROLE_ZCR);
//				String spwys = this.getSpwyOrZcrByLsbId(xx.getXmlsb(), ZcczCommon.DEALTODO_SPWY);
//				vo.setZcr(zcr);
//				vo.setSpwys(spwys);
				vo = this.getCzfsByYwlx(vo,false);
				this.setXmzt(vo, vo.getXmzt());
				returnList.add(vo);
			}
		}
		String JSONstr = BodyListToJSON.getJSON(returnList, 1, 1, 11111);
		return JSONstr;
	}
	
	/**
	 * 处理单列表list
	 * @return
	 */
	public List findCzXmListByCldId(String headId) {
		String sql = "from CzXmXx x where x.jacldId = ?";
		List list = dao.find(sql, new Object[]{headId});
		return list;
	}

	/**
	 * 删除处置项目，实际是取消项目与结案处理单的关联
	 * @param cldId
	 * @param xmIds
	 */
	public void deleteCzxm(String cldId, String[] xmIds){
		if(xmIds!=null&&xmIds.length>0){
			for (int i = 0; i < xmIds.length; i++) {
				String xmId = xmIds[i];
				CzXmXx xx = this.findCzXmXxById(xmId);
				if(xx!=null){
					xx.setJacldId(null);
					xx.setZhuangtai(ZcczCommon.PROJECT_TYPE_WZX);
					dao.update(xx);//更新项目信息临时表
					List list = this.findCzZcXxByCldId(xx.getCldId());
					if(list!=null&&list.size()>0){
						for(int j=0;j<list.size();j++){
							CzZcXx czzcxx = (CzZcXx) list.get(j);
							czzcxx.setSfczwb("0");
							dao.update(czzcxx);
						}
					}
				}
			}
		}
	}
	
	/**
	 * 关联处理单和项目 modify by lantianbo
	 * @return
	 */
	public void saveXm2Cld(String headId, String[] xmIds){
		if(xmIds!=null&&xmIds.length>0){
			CzXmjaBody body = null;
			for (int i = 0; i < xmIds.length; i++) {
				String xmId = xmIds[i];
				CzXmXx xx = this.findCzXmXxById(xmId);
				CzXmjaHead head = this.queryCzXmjaHeadById(headId);
				if(xx!=null){
					xx.setJacldId(headId);
					dao.update(xx);//更新项目信息临时表
					body = this.findCzXmjaBodyByXmIdAndCldId(xx.getId(), head.getId());
					if(body==null){
						body = new CzXmjaBody();
						body.setCldId(head.getId());
						body.setXmId(xx.getId());
						body.setSpzt("0");
						body.setSqrq(head.getNgrq());
						this.save(body);
					}else{
						body.setCldId(head.getId());
						body.setXmId(xx.getId());
						body.setSpzt("0");
						body.setSqrq(head.getNgrq());
						this.update(body);
					}
				}
			}
		}
	}
	/**
	 * 转换各种空为“”
	 * @param bh
	 * @return
	 */
	private String checkEmpty(String bh) {
		String str = "";
		if(bh==null){
			str = "";
		}else if("".equals(bh)||"null".equals(bh)||bh.trim().length()==0){
			str = "";
		}else{
			str = String.valueOf(bh);
		}
		return str;
	}

	@SuppressWarnings("unchecked")
	public List<CzZcXx> findAssetListByIdAndZclb(String cldId, String zclb) {
		String hql = "from CzZcXx o where o.cldId = ? and o.zclb = ?";
		Object[] params = new Object[]{cldId,zclb};
		List<CzZcXx> list = (List<CzZcXx>)dao.find(hql, params);
		return list;
	}
	
	/**
	 * 根据id查询处置项目结案表头
	 * @param headId
	 * @return
	 */
	public CzXmjaHead getCzXmjaHeadById(String headId){
		String sql = "from CzXmjaHead t where t.id = ?";
		return (CzXmjaHead) this.dao.findSingleResult(sql, new Object[]{headId});
	}
	public CzXmjaHead queryCzXmjaHeadById(String headId){
		String sql = "from CzXmjaHead t where t.id = ?";
		return (CzXmjaHead) this.dao.findSingleResult(sql, new Object[]{headId});
	}
	/**
	 * 更新项目结案body表
	 * @param body
	 * @param type
	 */
	public void update(CzXmjaBody body, String type){
		if("1".equals(type)){//1代表的是卡片是否减少修改，和是否签署协议修改
			CzXmjaBody body1 = this.findCzXmjaBodyByXmIdAndCldId(body.getXmId(),body.getCldId());
			body1.setSfqsxy(body.getSfqsxy());
			body1.setKpsfjs(body.getKpsfjs());
			this.update(body1);
		}
	}

	/**
	 * 根据处理单id 和xmId查找body信息
	 * @param xmId
	 * @param cldId
	 * @return
	 */
	public CzXmjaBody findCzXmjaBodyByXmIdAndCldId(String xmId, String cldId) {
		String sql = "from CzXmjaBody b where b.xmId = ? and b.cldId = ?";
		CzXmjaBody body = (CzXmjaBody) this.dao.findSingleResult(sql, new Object[]{xmId,cldId});
		return body;
	}

	public List<CzFysrMx> getCzFysrMxListByXmId(String xmId) {
//		return (List<CzFysrMx>)dao.find("from CzFysrMx o where o.xmId=?", new String[]{xmId});
		String hql = "from CzFysrMx o where o.xmId = '"+xmId+"' and o.jieduan = 'chuzhihuikuan'";
		return (List<CzFysrMx>)dao.find(hql);
	}
	
	/**
	 * 流程办结  add by lantianbo 2010-1-8
	 * @return
	 */
	public String banjie(String headId){
		String result = "";
		try{
			List list = findCzXmjaBodyByCldId(headId);
			if(list!=null&&list.size()>0){
				CzXmjaBody xx = null;
				for (int i = 0; i < list.size(); i++) {
					xx = (CzXmjaBody) list.get(i);
					String xmId = xx.getXmId();
					String sfqbja = xx.getSfqbja();
					CzXmXx x = this.findCzXmXxById(xmId);
					x.setZhuangtai(ZcczCommon.PROJECT_TYPE_YJA);
					dao.update(x);
					if("1".equals(sfqbja)){//是全部结案
						this.update(xmId,"06","jyzc_xx","c_zczc"," = '1' ","azcid"); //06是已处置
						this.update(xmId,"06","st_fsxx","JTDZT='06',d.PZCZT='06',d.MSBZT='06',d.LJTGJZT='06' ,d.KFWZT='06',d.FAZZT"," = '1' ","BFSXXID"); //06是已处置
						this.update(xmId,"06","zy_zc","ZCZT"," = '1' ","ZYZCID"); //06是已处置
					}else{
						this.update(xmId,"05","jyzc_xx","c_zczc"," != '1' ","azcid");//05是待处置
						this.update(xmId,"05","st_fsxx","JTDZT='05',d.PZCZT='05',d.MSBZT='05',d.LJTGJZT='05' ,d.KFWZT='05',d.FAZZT"," != '1' ","BFSXXID");//05是待处置
						this.update(xmId,"05","zy_zc","ZCZT"," != '1' ","ZYZCID");//05是待处置
					}
//					List list1 = this.findCzZcXxByCldId(x.getCldId());
//					String cldId = xx.getCldId();
					
//					if("4".equals(fenlei)){
//						czStcztzWfBS.uadatePersonStatuToYazInCld(cldId);
//					}
//					if(!"3".equals(fenlei)&&!"4".equals(fenlei)&&!"5".equals(fenlei)&&!"9".equals(fenlei)){
//						assetDealWfBS.modifyTablesZCZT(cldId, "06");
//					}
				}
			}
			result = "办结成功！";
		}catch (Exception e){
			result = "办结失败！";
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 
	 * @param xmId   项目id
	 * @param zhuangtai 需要更改的状态值
	 * @param biaoming		更改的表名
	 * @param zhuangtaiming 状态列的字段名
	 * @param sfqbja		是否全部结案
	 * @param ziduanming	zc的id
	 */
	private void update(String xmId, String zhuangtai, String biaoming,
			String zhuangtaiming, String sfczwb,String ziduanming) {
		String sql = " update "+biaoming+" d set d."+zhuangtaiming+" = '"+zhuangtai+"' where exists "+
					" (select c.id from cz_zc_xx t, cz_xm_xx b,JYZC_XX c  "+
					" where t.cld_id = b.cld_id and b.id = '"+xmId+"' "+ 
					" and t."+ziduanming+" = c.id and t.sfczwb "+sfczwb+" )";
		dao.getJdbcTemplate().execute(sql);
	}

	public List<CzZcXx> findCzZcXxByCldId(String cldId) {
		String hql = "select o from CzZcXx o where o.cldId = ?";
		Object[] params = new Object[]{cldId};
		List<CzZcXx> list = (List<CzZcXx>)this.dao.find(hql, params);
		return list;
	}
	/**
	 * 根据处理单id 和xmId查找body信息
	 * @param xmId
	 * @param cldId
	 * @return
	 */
	public List findCzXmjaBodyByCldId(String cldId) {
		String sql = "from CzXmjaBody b where b.cldId = ?";
		List body =  this.dao.find(sql, new Object[]{cldId});
		return body;
	}
	
	/**
	 * 全部结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quanbujiean(String headId, String xmIds){
		String result = "";
		try{
			if(xmIds!=null&&xmIds.length()>0){
				if(xmIds.startsWith(",")){
					xmIds = xmIds.substring(1,xmIds.length()-1);
				}
				String []xmids = xmIds.split(",");
				for(int i=0;i<xmids.length;i++){
					CzXmjaBody body = this.findCzXmjaBodyByXmIdAndCldId(xmids[i], headId);
					body.setSfqbja("1");//设置项目为全部结案
					dao.update(body);
					CzXmXx x = this.findCzXmXxById(xmids[i]);
					List zcxxs = findAssetListByIdAndZclb1(x.getCldId());
					for(int j = 0; j<zcxxs.size();j++){
						CzZcXx zc = (CzZcXx) zcxxs.get(j);
						zc.setSfczwb("1");//设置资产为处置完毕
						dao.update(zc);
					}
				}
			}
			result = "设置成功！";
		}catch (Exception e){
			result = "设置失败，请联系管理员！";
			e.printStackTrace();
		}
		return result;
	}
	
	public List<CzZcXx> findAssetListByIdAndZclb1(String cldId) {
		String hql = "from CzZcXx o where o.cldId = ?";
		Object[] params = new Object[]{cldId};
		List<CzZcXx> list = (List<CzZcXx>)dao.find(hql, params);
		return list;
	}
	/**
	 * 部分结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String bufenjiean(String headId, String xmIds,String zcIds,String zclb){
		String result = "";
		try{
			if(zcIds!=null&& zcIds.length()>0){
				if(zcIds.startsWith(",")){
					zcIds = zcIds.substring(1, zcIds.length()-1);
				}
				String []zcids=zcIds.split(",");
				if(zcids!=null&&zcids.length>0){
					for(int j =0;j<zcids.length;j++){
						CzZcXx zc = (CzZcXx) dao.findSingleResult("from CzZcXx x where x.id = ?", new Object[]{zcids[j]});
						zc.setSfczwb("1");//设置资产为处置完毕
						dao.update(zc);
					}
				}
			}
			CzXmjaBody body = this.findCzXmjaBodyByXmIdAndCldId(xmIds, headId);//这里的xmIds只有一个
			CzXmXx czXmXx = this.findCzXmXxById(xmIds);
			List list =null;
			list  = dao.find("from CzZcXx x where x.cldId=? and x.sfczwb!='1'", new String[]{czXmXx.getCldId()});
			if(list!=null&&list.size()>0){
				body.setSfqbja("0");//设置项目为部分结案
			}else{
				body.setSfqbja("1");//设置项目为全部结案
			}
			dao.update(body);
			result = "设置成功！";
		}catch (Exception e){
			result = "设置失败，请联系管理员！";
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 部分结案
	 * @param headId
	 * @param xmIds
	 * @return
	 */
	public String quxiaojiean(String headId, String xmIds,String zcIds,String zclb){
		String result = "";
		try{
			if(zcIds!=null&& zcIds.length()>0){
				if(zcIds.startsWith(",")){
					zcIds = zcIds.substring(1, zcIds.length()-1);
				}
				String []zcids=zcIds.split(",");
				if(zcids!=null&&zcids.length>0){
					for(int j =0;j<zcids.length;j++){
						CzZcXx zc = (CzZcXx) dao.findSingleResult("from CzZcXx x where x.id = ?", new Object[]{zcids[j]});
						zc.setSfczwb("0");//设置资产为处置未完毕
						dao.update(zc);
					}
				}
			}
			CzXmjaBody body = this.findCzXmjaBodyByXmIdAndCldId(xmIds, headId);//这里的xmIds只有一个
			body.setSfqbja("0");//设置项目为部分结案
			dao.update(body);
			result = "设置成功！";
		}catch (Exception e){
			result = "设置失败，请联系管理员！";
			e.printStackTrace();
		}
		return result;
	}
	public CzXmxxLsb findCzXmxxLsbByCldId(String cldId){
		String hql = "select o from CzXmxxLsb o where o.cldId = ?";
		List list = dao.find(hql, new Object[]{cldId});
		if(list != null && list.size() > 0){
			return (CzXmxxLsb)list.get(0);
		}else{
			return null;
		}
	}

	public String look_oa(String itemId) {
		String	sql = "select o.url url from common_eam_2_oa o where o.headId = (select x.hy_id from cz_xmxx_lsb x where x.id =?)";
		String url = "";
		List<Map<String,Object>> list = dao.queryForList(sql, new Object[]{itemId});
		if(list != null && list.size() > 0){
			Map<String,Object> map = (Map<String,Object>)list.get(0);
			url = (String)map.get("url");
		}
		return url;
	}

	public String findCzXmxxIdByLsbId(String cldId) {
		String hql = "select o from CzXmXx o where o.xmlsb = ?";
		List list = dao.find(hql, new Object[]{cldId});
		if(list != null && list.size() > 0){
			CzXmXx xmXx = (CzXmXx)list.get(0);
			return xmXx.getId();
		} else{
			return null;
		}
	}
}
