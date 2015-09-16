package com.tansun.eam2.zccz.service.impl;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IDealToDoBS;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
@Service
public class DealToDoBSImpl extends CommonBSImpl implements IDealToDoBS {

	@Autowired
	private PublicDao dao;
	
	/**
	 * 查出所有处置项目，并用jqgrad展现
	 * @return
	 */
	public String findZCXMs(CzXmxxLsb lsb ){
		List volist = findCzxmByTerm1(lsb);
		String JSONstr = BodyListToJSON.getJSON(volist, 1, 1, 100000);
		return JSONstr;
	}

	/**
	 * 根据条件查到处置项目 CzXmxxLsbVO的list
	 * @param hyId
	 * @param zhuangtai
	 * @return
	 */
	public List findCzxmByTerm1(CzXmxxLsb lsbbo) {
		List list = findCzxmByTerm(lsbbo);
		CzXmxxLsb lsb = null;
		CzXmxxLsbVO lsbvo = null;
		List volist = new ArrayList(); 
		for (int i = 0; i < list.size(); i++) {
			lsb = (CzXmxxLsb) list.get(i);
			lsbvo = new CzXmxxLsbVO();
			BeanUtils.copyProperties(lsb, lsbvo);
			//查询审批委员
			List spwyList = this.findSpwyByLsbId(lsb.getId(),ZcczCommon.DEALTODO_SPWY);//查询审批委员
			StringBuffer name = new StringBuffer("");
			for(int j=0;j<spwyList.size();j++){
				CzXmSpwYj spwy = (CzXmSpwYj) spwyList.get(j);
				name.append(spwy.getSpwyxm());
				if(j != spwyList.size()-1){
					name.append(",");
				}
			}
			//查询汇报人
			CzCztzfaXx temp = (CzCztzfaXx)this.findById(CzCztzfaXx.class,lsb.getCldId());
			if(temp != null){
				lsbvo.setXmfsr(temp.getNgrxm());
			}
			lsbvo.setSpwy(name.toString());
			lsbvo.setZhuangtai(getZhuangtai(lsbvo.getZhuangtai()));
			volist.add(lsbvo);
		}
		return volist;
	}

	/**
	 * 根据条件查到处置项目 CzXmxxLsb的list
	 * @param hyId
	 * @param zhuangtai
	 * @return
	 */
	public List findCzxmByTerm(CzXmxxLsb lsb) {
		StringBuffer sql = new StringBuffer("")
			.append("from CzXmxxLsb x where ") 
			.append(" (x.zhuangtai = '"  + checkEmpty(lsb.getZhuangtai()) + "' or '" + checkEmpty(lsb.getZhuangtai()) + "' is null )") 
			.append(" and( x.hyId = '"   + checkEmpty(lsb.getHyId() )	  + "' or '" + checkEmpty(lsb.getHyId())      + "' is null )")
			.append(" and( x.fenlei = '" + checkEmpty(lsb.getFenlei())    + "' or '" + checkEmpty(lsb.getFenlei())    + "' is null )")
			.append(" order by x.pxxh asc ");
		List list = dao.find(sql.toString(), new Object[]{});
		return list;
	}

	private String checkEmpty(String str) {
		if(str==null||str.length()==0){
			return "";
		}else if("".equals(str)||"null".equals(str)||str==null){
			return "";
		}else{
			return str;
		}
	}

	/**
	 * 根据项目id查询主持人，或审批委员 
	 * @param id
	 * @return
	 */
	public List<CzXmSpwYj> findSpwyByLsbId(String id,String isZcrOrSpwy) {
		String sql = "from CzXmSpwYj x where x.sfwzcr = ? and x.xmId = ?";
		List<CzXmSpwYj> list = (List<CzXmSpwYj>)dao.find(sql, new Object[]{isZcrOrSpwy,id});
		return list;
	}
	
	/**
	 * 保存信息  
	 * @param id
	 * @return
	 */
	public void save(CommonBO commonBO) {
		dao.save(commonBO);
	}
	
	/**
	 * 更新信息 
	 * @param id
	 * @return
	 */
	public void update(CommonBO commonBO){
		dao.update(commonBO);
	}
	
	/**
	 * 删除信息 
	 * @param id
	 * @return
	 */
	public void delete(CommonBO commonBO){
		dao.delete(commonBO);
	}
	
	/**
	 * 处置项目关联到会议下
	 * @param id
	 * @param xmIds
	 */
	public void creatCzxm2Meeting(String id, String[] xmIds){
		if(xmIds.length>0){
			CzXmxxLsb lsb = null;
			for (int i = 0; i < xmIds.length; i++) {
				String xmId = xmIds[i];
				lsb = this.findCzXmxxLsbById(xmId);
				if(lsb!=null&&lsb.getId()!=null&&lsb.getId().length()>0){
					lsb.setHyId(id);//关联会议id
					//lsb.setPxxh(this.getMaxPxxhByHyId(id));//排序用
					dao.update(lsb);//更新项目信息临时表
				}
			}
		}
	}

	/**
	 * 项目加到会议下，得到最大的序号 返回最大的序号加1，为项目排序用
	 * @param id
	 * @return
	 */
	public Long getMaxPxxhByHyId(String id) {
		String sql = "SELECT MAX(T.PXXH) AS PXXH FROM CZ_XMXX_LSB T WHERE T.HY_ID = ?";
		Long l = 0l;
		List list = dao.queryForList(sql, new Object[]{id});
		if(list!=null&& list.size()>0){
			Map map =(Map) list.get(0);
			String pxxh = String.valueOf((map.get("PXXH")==null?"0":map.get("PXXH")));
			l = Long.valueOf(pxxh);
		}
		return l+1;
	}

	/**
	 * 根据id查询CzXmxxLsb处置项目信息临时表的数据
	 * @param xmId
	 */
	public CzXmxxLsb findCzXmxxLsbById(String xmId) {
		CzXmxxLsb lsb = null;
		String sql = "from CzXmxxLsb b where b.id = ?";
		lsb = (CzXmxxLsb) dao.findSingleResult(sql, new Object[]{xmId});
//		CzXmxxLsb returnObj = new CzXmxxLsb();
//		BeanUtils.copyProperties(returnObj, lsb);
		return lsb;
	}

	/**
	 * 在会议下 删除处置项目,实际是删除关联关系
	 * @return
	 */
	public void delCzxm2Meeting(String hyId, String[] xmIds) {
		if(xmIds!=null&&xmIds.length>0){
			for (int i = 0; i < xmIds.length; i++) {
				String xmId = xmIds[i];
				CzXmxxLsb lsb = this.findCzXmxxLsbById(xmId);
				lsb.setHyId(null);
				lsb.setZhuangtai(ZcczCommon.DEALTODO_XMZT_WSH);
				dao.update(lsb);//更新项目信息临时表
				this.deleteSpwyByXmId(xmId);//在会议下删除项目的同时，删除主持人和审批委员
			}
		}else if(xmIds == null){//传的为null时，是删除全部
//			String sql = "UPDATE CZ_XMXX_LSB T SET T.HY_ID = '' , T.ZHUANGTAI='"+ZcczCommon.DEALTODO_XMZT_WSH
//						+"' WHERE T.HY_ID ='"+hyId+"' ";
//			dao.getJdbcTemplate().update(sql);
			CzXmxxLsb lsb1= new CzXmxxLsb ();
			lsb1.setHyId(hyId);
			lsb1.setZhuangtai("");
			List list = this.findCzxmByTerm(lsb1);
			if(list!=null&&list.size()>0){
				for (int j = 0; j < list.size(); j++) {
					CzXmxxLsb lsb = (CzXmxxLsb) list.get(j);
					lsb.setHyId(null);
					lsb.setZhuangtai(ZcczCommon.DEALTODO_XMZT_WSH);
					dao.update(lsb);
					this.deleteSpwyByXmId(lsb.getId());//在会议下删除项目的同时，删除主持人和审批委员
				}
			}
		}
	}
	
	/**
	 * 根据角色，查询出审批委员，或者审批主持人的JSON
	 * @param role
	 * @return
	 */
	public String getZcrOrSpwyByRole(String role){
		StringBuffer sb = new StringBuffer("")
			.append(" SELECT A.TID,A.USERNAME ")
			.append(" FROM P_T_USER A, P_T_ROLE B, P_T_USER_L_ROLE C ")
			.append(" WHERE A.TID = C.USER_ID ")
			.append(" AND B.TID = C.ROLE_ID ")
			.append(" AND B.TID = ? ");
		List list = dao.queryForList(sb.toString(), new Object[]{role});
		List returnList = new ArrayList();
		CzXmxxLsbVO lsbvo = null;
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map)list.get(i);
				lsbvo = new CzXmxxLsbVO();
				lsbvo.setSpzcr(String.valueOf(map.get("USERNAME")));
				lsbvo.setSpzcrId(String.valueOf(map.get("TID")));
				lsbvo.setSpwy(String.valueOf(map.get("USERNAME")));
				lsbvo.setSpwyId(String.valueOf(map.get("TID")));
				returnList.add(lsbvo);
			}
		}
		String JSONstr = BodyListToJSON.getJSON(returnList, 1, 1, 100000);
		return JSONstr;
	}
	
	/**
	 * 修改处置项目的审批委员
	 * @return
	 */
	public void modigySpwy(String xmIds, String spwyIds,String spwys){
		if(xmIds.startsWith(",")){
			xmIds = xmIds.substring(1);
		}
		if(spwyIds.startsWith(",")){
			spwyIds = spwyIds.substring(1);
		}
		if(spwys.startsWith(",")){
			spwys = spwys.substring(1);
		}
		String[] xmIds1   = xmIds.split(",");
		String[] spwyIds1 = spwyIds.split(",");
		String[] spwys1	  = spwys.split(",");
		String xmId   = "";
		String spwyId = "";
		if(xmIds1!=null&&xmIds.length()>0){//如果项目id不为空，且长度大于0
			for (int i = 0; i < xmIds1.length; i++) {//循环取得每个xmId项目id
				xmId = xmIds1[i];
				if(xmId!=null&&xmId.length()>0){					//当xmId项目id有意义
					this.deleteSpwysByXmId(xmId);					//删除项目下的审批委员
					if(spwyIds!=null&&spwyIds.length()>0){			//如果审批委员ids不为空，且长度大于0
						CzXmSpwYj spwyj = null;
						for (int j = 0; j < spwyIds1.length; j++) {	//循环取得每个spwyId
							spwyId = spwyIds1[j];					
							if(spwyId!=null&&spwyId.length()>0){	//当spwyId有意义
								spwyj = new CzXmSpwYj();			//创建审批委员意见实体
								spwyj.setXmId(xmId);				//设置项目id
								spwyj.setSpwy(spwyId);				//设置spwyid审批委员id
								spwyj.setSpwyxm(spwys1[j]);			//设置spwyxm审批委员姓名
								spwyj.setSfwzcr(ZcczCommon.DEALTODO_SPWY);//设置为审批委员
								spwyj.setSftjspyj(ZcczCommon.DEALTODO_TJYJ_FOU);		//设置未提交意见默认
								spwyj.setTongyi(ZcczCommon.DEALTODO_BUTONGYI);			//不同意默认
								spwyj.setButongyi(ZcczCommon.DEALTODO_BUTONGYI);		//不同意默认
								dao.save(spwyj);					//保存
							}
						}
					}
				}
			}
		}
	}

	/**
	 * //删除项目下的审批委员和审批主持人
	 * @param xmId
	 */
	public void deleteSpwyByXmId(String xmId) {
		if(xmId!=null&&xmId.length()>0){
			String sql = "DELETE CZ_XM_SPW_YJ T WHERE T.XM_ID = '"+xmId+"'";
			dao.getJdbcTemplate().execute(sql);
		}
		
	}

	//修改审批委员的时候，不删除主持人。
	public void deleteSpwysByXmId(String xmId) {
		if(xmId!=null&&xmId.length()>0){
			String sql = "DELETE CZ_XM_SPW_YJ T WHERE T.XM_ID = '"+xmId+"' and T.SFWZCR = '" + ZcczCommon.DEALTODO_SPWY +"'";
			dao.getJdbcTemplate().execute(sql);
		}
		
	}
	
	/**
	 * 会议下项目的排序
	 * @return
	 */
	public String sortXm(String sortType, String hyId, String xmId){
		CzXmxxLsb lsb1 = new CzXmxxLsb();
		lsb1.setHyId(hyId);
		lsb1.setZhuangtai("");
		List  list = this.findCzxmByTerm(lsb1);
		String message ="";
		int position = 0;
		int marker = 0;
		int kk = 0;
		if(ZcczCommon.SORT_SYI.equals(sortType)){					//上移
			message = "已经是第一条，不能上移";
			position = 0;
			marker = 0;
		}else if (ZcczCommon.SORT_XYI.equals(sortType)){			//下移
			position = list.size()-1;
			message = "已经是最后一条，不能下移";
			marker = 0;
		}else if (ZcczCommon.SORT_ZDING.equals(sortType)){			//置顶
			position = 0;
			message = "已经是第一条，不能置顶";
		}else if (ZcczCommon.SORT_ZDI.equals(sortType)){			//置底
			position = list.size()-1;
			message = "已经是最后一条，不能置底";
		}
		CzXmxxLsb lsb     = null;
		CzXmxxLsb templsb = null;
		if(list!=null&& list.size()>0){
			Long pxxh 	  = 0l;	//要排序的项目的序号
			Long tempPxxh = 0l;	//临时序号
			for (int i = 0; i < list.size(); i++) {
				lsb = (CzXmxxLsb) list.get(i);
				if(xmId.equals(lsb.getId())){
					if(i==position){
						return message; //返回消息
					}
					pxxh = lsb.getPxxh();//这个就是要排序的项目序号
					marker = i;			 //标记，记录当前list里的位置
					break;				 //当找到list里的项目位置，跳出循环
				}
			}
			if(ZcczCommon.SORT_SYI.equals(sortType)){					//上移
				kk = marker-1;
				templsb = (CzXmxxLsb) list.get(kk); 	  //把被移动的项目信息得到     --选择移动的项目为”移动项目“，“被移动项目”为”移动项目“将移动到那个位置的项目
				tempPxxh = templsb.getPxxh();			  //将被移动项目的序号保存到临时序号
				templsb.setPxxh(pxxh);					  //将被移动项目的序号设置为”移动项目“的序号
				dao.update(templsb);					  //更新
				lsb.setPxxh(tempPxxh);					  //将移动项目的序号设置到成”被移动项目“序号
				dao.update(lsb);						  //更新 
			}else if (ZcczCommon.SORT_XYI.equals(sortType)){			//下移
				kk = marker+1;
				templsb = (CzXmxxLsb) list.get(kk); 	  //把被移动的项目信息得到     --选择移动的项目为”移动项目“，“被移动项目”为”移动项目“将移动到那个位置的项目
				tempPxxh = templsb.getPxxh();			  //将被移动项目的序号保存到临时序号
				templsb.setPxxh(pxxh);					  //将被移动项目的序号设置为”移动项目“的序号
				dao.update(templsb);					  //更新
				lsb.setPxxh(tempPxxh);					  //将移动项目的序号设置到成”被移动项目“序号
				dao.update(lsb);						  //更新 
			}else if (ZcczCommon.SORT_ZDING.equals(sortType)){			//置顶
				templsb = (CzXmxxLsb) list.get(kk); 	  //把被移动的项目信息得到     --选择移动的项目为”移动项目“，“被移动项目”为”移动项目“将移动到那个位置的项目
				tempPxxh = templsb.getPxxh();			  //将被移动项目的序号保存到临时序号
				lsb.setPxxh(tempPxxh-1);				  //将移动项目的序号设置到成”被移动项目“序号
				dao.update(lsb);						  //更新 
			}else if (ZcczCommon.SORT_ZDI.equals(sortType)){			//置底
				kk = list.size()-1;
				templsb = (CzXmxxLsb) list.get(kk); 	  //把被移动的项目信息得到     --选择移动的项目为”移动项目“，“被移动项目”为”移动项目“将移动到那个位置的项目
				tempPxxh = templsb.getPxxh();			  //将被移动项目的序号保存到临时序号
				lsb.setPxxh(tempPxxh+1);				  //将移动项目的序号设置到成”被移动项目“序号
				dao.update(lsb);						  //更新 
			}
			
		}
		return "";
	}

	/**
	 * 保存会议后更新项目的状态为上会,并在项目委员意见表插入主持人信息
	 * @param id
	 */
	public void updateXmZt(String id) {
		CzXmxxLsb lsb = new CzXmxxLsb();//查询条件
		lsb.setHyId(id);
		List list = this.findCzxmByTerm(lsb);
		
		if(list!=null&&list.size()>0){
			CzXmSpwYj spwyj = null;
			for (int i = 0; i < list.size(); i++) {
				CzXmxxLsb lsb2 = (CzXmxxLsb) list.get(i);
//				lsb2.setZhuangtai(ZcczCommon.DEALTODO_XMZT_SHZ);
//				dao.update(lsb2);
				
				this.deleteZcrByXmId(lsb2.getId());			//如果项目已上会，再次保存先删除主持人，然后再添加主持人信息
				
				spwyj = new CzXmSpwYj();
				spwyj.setSfwzcr(ZcczCommon.DEALTODO_ZCR);	//每个项目加入一条主持人信息
				spwyj.setSftjspyj(ZcczCommon.DEALTODO_TJYJ_FOU);//是否提交审批意见 默认否
				CzHyxx hyxx = this.findHyxxById(id);			//得到会议信息，
				spwyj.setSpwy(hyxx.getSpzcr());					//设置支持人id
				spwyj.setSpwyxm(hyxx.getZcrxm());				//设置主持人姓名
				spwyj.setTongyi(ZcczCommon.DEALTODO_BUTONGYI);	//默认同意为否
				spwyj.setButongyi(ZcczCommon.DEALTODO_BUTONGYI);//默认不同意为否
				spwyj.setXmId(lsb2.getId());					//设置项目id
				dao.save(spwyj);
			}
		}
	}

	/**
	 * 删除项目下的支持人
	 * @param id
	 */
	public void deleteZcrByXmId(String id) {
		String sql = "from CzXmSpwYj yj where yj.xmId = ? and yj.sfwzcr = ?";
		CzXmSpwYj yj = (CzXmSpwYj) dao.findSingleResult(sql, new String[]{id,ZcczCommon.DEALTODO_ZCR});
		if(yj!=null&&yj.getId()!=null){
			dao.delete(yj);
		}
	}

	/**
	 * 查询hyId的会议信息
	 * @param hyId
	 */
	public CzHyxx findHyxxById(String hyId) {
		String sql = "from CzHyxx x where x.id = ?";
		CzHyxx x = (CzHyxx) dao.findSingleResult(sql, new String[]{hyId});
//		CzHyxx returnObj = new CzHyxx();
//		BeanUtils.copyProperties(returnObj, x);
		return x;
	}
	
	/**
	 * 根据审批委员Id，会议id查询上会中项目JSON字串
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCzxmJSON4Sp(String spwyId, String hyId){
		List returnList = findCzxm4Sp(spwyId, hyId);
		String JSONstr = BodyListToJSON.getJSON(returnList, 1, 1, 100000);
		return JSONstr;
	}

	/**
	 * 根据审批委员Id，会议id查询上会中项目list
	 * @return
	 */
	public List findCzxm4Sp(String spwyId, String hyId) {
		CzHyxx hy = dao.findById(CzHyxx.class, hyId);
//		String zhuangtai = ZcczCommon.DEALTODO_XMZT_WYTJYJZ;
//		if(StringUtils.equals(spwyId, hy.getSpzcr())){
//			zhuangtai = ZcczCommon.DEALTODO_XMZT_ZCRTJYJZ;
//		}
		StringBuffer sql = new StringBuffer("")
			.append(" SELECT A.ID, A.CZXMMC,B.SFTJSPYJ FROM CZ_XMXX_LSB A, CZ_XM_SPW_YJ B WHERE A.ID = B.XM_ID  ")
			.append(" AND  A.HY_ID = ?  AND B.SPWY = ? ")
			//.append(" AND A.ZHUANGTAI = " + zhuangtai)
			.append(" ORDER BY A.PXXH ");
		List list = dao.queryForList(sql.toString(), new String[]{hyId,spwyId});
		List returnList = new ArrayList();
		if(list!=null&& list.size()>0){
			for (int j = 0; j < list.size(); j++) {
				Map map = (Map)list.get(j);
				CzXmxxLsbVO lsbvo = new CzXmxxLsbVO();
				lsbvo.setId(String.valueOf(map.get("id")));
				lsbvo.setCzxmmc(String.valueOf(map.get("czxmmc")));
				String sftjspyj = String.valueOf(map.get("sftjspyj"));
				if(ZcczCommon.DEALTODO_TJYJ_SHI.equals(sftjspyj)){
					lsbvo.setSftjspyj("是");
				}else if(ZcczCommon.DEALTODO_TJYJ_FOU.equals(sftjspyj)){
					lsbvo.setSftjspyj("否");
				}
				returnList.add(lsbvo);
			}
		}
		return returnList;
	}

	/**
	 * 根据会议id查询上会中项目上会意见情况
	 * @return
	 */
	public String findCzxmJSON4Shyj(String hyId) {
		StringBuffer sql = new StringBuffer()
			.append(" SELECT  A.ID,A.CZXMMC,A.ZHUANGTAI,B.ZCRXM ,C.SFTJSPYJ ")
			.append(" FROM CZ_XMXX_LSB A ,CZ_HYXX B,CZ_XM_SPW_YJ C ")
			.append(" WHERE A.HY_ID = B.ID AND A.ID = C.XM_ID ")
			.append(" AND C.SFWZCR = ? AND A.HY_ID = ? ")
			.append(" ORDER BY A.PXXH ");
		List list = dao.queryForList(sql.toString(), new Object[]{ZcczCommon.DEALTODO_ZCR,hyId});
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			CzXmxxLsbVO lsbvo = null;
			for (int i = 0; i < list.size(); i++) {
				lsbvo = new CzXmxxLsbVO();
				Map map = (Map) list.get(i);
				lsbvo.setId(String.valueOf(map.get("ID")));//项目id
				lsbvo.setCzxmmc(String.valueOf(map.get("CZXMMC")));//项目名称
				lsbvo.setSpzcr(String.valueOf(map.get("ZCRXM")));//设置主持人
				//lsbvo.setZhuangtai(String.valueOf(map.get("ZHUANGTAI")));
				String sftjspyj = String.valueOf(map.get("SFTJSPYJ"));//主持人是否提交审批意见
				if(ZcczCommon.DEALTODO_TJYJ_SHI.equals(sftjspyj)){
					lsbvo.setSftjspyj("是");
				}else if(ZcczCommon.DEALTODO_TJYJ_FOU.equals(sftjspyj)){
					lsbvo.setSftjspyj("否");
				}
				//根据项目id 得到审批委员，和未提交意见的审批委员
				List spwyList = this.findSpwyByLsbId(lsbvo.getId(), ZcczCommon.DEALTODO_SPWY);
				String spwyNames = "";//全部的审批委员名称
				String wspwyNames = "";//未审批的委员名称
				String wspwyIds = "";	//未审批的委员id
				boolean isWtjyiSpwy = true;//是否还有未提交意见委员标志 默认为true 没有未提交的委员
				if(spwyList!=null&& spwyList.size()>0){
					CzXmSpwYj spwyj =null;
					for (int j = 0; j < spwyList.size(); j++) {//取得项目下所有审批委员
						spwyj = (CzXmSpwYj) spwyList.get(j);
						spwyNames += spwyj.getSpwyxm();
						if(!(j == spwyList.size()-1)){
							spwyNames += ",";
						}
						if(ZcczCommon.DEALTODO_TJYJ_FOU.equals(spwyj.getSftjspyj())){//如果未提交审批意见，则累加未审批委员的名称和id
							isWtjyiSpwy = false;	//如果有未提交审批意见的委员，将标志置否
							wspwyNames = wspwyNames+(spwyj.getSpwyxm()+",");
							wspwyIds   = wspwyIds+ (spwyj.getId()+",");
						}
					}
					if(wspwyNames.endsWith(",")){
						wspwyNames = wspwyNames.substring(0,wspwyNames.length()-1);
					}
					if(wspwyIds.endsWith(",")){
						wspwyIds = wspwyIds.substring(0,wspwyIds.length()-1);
					}
				}
				lsbvo.setSpwys(spwyNames);		//设置审批委员名称们。
				lsbvo.setWtjyjwys(wspwyNames);	//设置未提交意见审批委员们名称
				lsbvo.setWtjyjwyIds(wspwyIds);	//设置未提交意见审批委员们id
				if(isWtjyiSpwy){
					lsbvo.setZhuangtai(ZcczCommon.SHZT_ZCRSP);
				}else{
					lsbvo.setZhuangtai(ZcczCommon.SHZT_WYTJYJZ);
				}
				returnList.add(lsbvo);
			}
		}
		String JSONstr = BodyListToJSON.getJSON(returnList, 1, 1, 100000);
		return JSONstr;
	}
	
	/**
	 * 组织会议，并关联选择的项目到会议下,并给每个项目配主持人
	 * @return
	 */
	public void saveHyxxAndZcr(CzHyxx hyxx){
		this.save(hyxx);
	}

	public List<CzXmxxLsb> getDsiposeXmList() {
		return (List<CzXmxxLsb>)dao.find("from CzXmxxLsb xm where xm.zhuangtai = '0' and xm.fenlei != '5'");
	}
	public List<CzXmxxLsb> getDsiposeXmList(CzXmxxLsb lsb) {
		StringBuffer hql = new StringBuffer("from CzXmxxLsb xm where xm.zhuangtai = '0' and xm.fenlei != '5'");
		if(lsb!=null){
			if(lsb.getSbrq()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sbrq = sdf.format(lsb.getSbrq());
				hql.append(" and ").append(" xm.sbrq = to_date('").append(sbrq).append("','yyyy-MM-dd')");
			}
			if(!lsb.getCzxmmc().trim().equals("")){
				hql.append(" and ").append(" xm.czxmmc like '%").append(lsb.getCzxmmc()).append("%'");
			}
			if(!lsb.getSlxh().trim().equals("")){
				hql.append(" and ").append(" xm.slxh = '").append(lsb.getSlxh()).append("'");
			}
			if(!lsb.getHbrxm().trim().equals("")){
				hql.append(" and ").append(" xm.hbrxm like '%").append(lsb.getHbrxm()).append("%'");
			}
		}
		return (List<CzXmxxLsb>)dao.find(hql.toString());
	}
	
	public List<CzXmxxLsb> getInvestmentXmList(CzXmxxLsb lsb) {
		StringBuffer hql = new StringBuffer("from CzXmxxLsb xm where xm.zhuangtai = '0' and xm.fenlei = '5'");
		if(lsb!=null){
			if(lsb.getSbrq()!=null){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String sbrq = sdf.format(lsb.getSbrq());
				hql.append(" and ").append(" xm.sbrq = to_date('").append(sbrq).append("','yyyy-MM-dd')");
			}
			if(!lsb.getCzxmmc().trim().equals("")){
				hql.append(" and ").append(" xm.czxmmc like '%").append(lsb.getCzxmmc()).append("%'");
			}
			if(!lsb.getSlxh().trim().equals("")){
				hql.append(" and ").append(" xm.slxh = '").append(lsb.getSlxh()).append("'");
			}
			if(!lsb.getHbrxm().trim().equals("")){
				hql.append(" and ").append(" xm.hbrxm like '%").append(lsb.getHbrxm()).append("%'");
			}
		}
		return (List<CzXmxxLsb>)dao.find(hql.toString());
	}
	
	private String getZhuangtai(String zhuangtai){
		if(StringUtils.equals("0", zhuangtai)){
			return "未上会";
		}else if(StringUtils.equals("1", zhuangtai)){
			return "上会中";
		}else if(StringUtils.equals("2", zhuangtai)){
			return "上会完毕";
		}else if(StringUtils.equals("3", zhuangtai)){
			return "委员提交意见中";
		}else if(StringUtils.equals("4", zhuangtai)){
			return "委员提交意见完毕";
		}else if(StringUtils.equals("5", zhuangtai)){
			return "主持人提交意见中";
		}else if(StringUtils.equals("6", zhuangtai)){
			return "意见汇总中";
		}else if(StringUtils.equals("7", zhuangtai)){
			return "意见汇总完毕";
		}
		return "";
	}
	public void setOrder(String strid, String sortid) {
			String sql = "update Cz_Xmxx_Lsb  set pxxh='" + sortid
					+ "' where id='" + strid + "' ";
			dao.getJdbcTemplate().execute(sql);
	}

	public List<CzXmSpwYj> getAllWtjSpwy(String hyId) {
		return (List<CzXmSpwYj>)dao.find("select yj from CzXmSpwYj yj, CzXmxxLsb xm where yj.xmId=xm.id and yj.sfwzcr='0' and yj.sftjspyj='0' and xm.hyId=?", new String[]{hyId});
	}

	public CzXmxxLsb findCzXmXxById(String id) {
		String sql = "from CzXmxxLsb x where x.id = ?";
		return (CzXmxxLsb) dao.findSingleResult(sql, new Object[]{id});
	}
	
	public List<CzXmxxLsb> findCzXmXxByHyid(String hyId){
		return (List<CzXmxxLsb>)dao.find("from CzXmxxLsb o where o.hyId=?", new String[]{hyId});
	}

	public String getCjtzHyxxCount(String hyId) {
		return String.valueOf(((BigDecimal)dao.queryForList("select count(*) resultCount from CZ_HYXX where HYLX='investment'", new String[]{}).get(0).get("resultCount")).intValue());
	}

	public List<CzXmxxLsbVO> getAllSpwy(String role) {
		StringBuffer sb = new StringBuffer("")
		.append(" SELECT A.TID,A.USERNAME ")
		.append(" FROM P_T_USER A, P_T_ROLE B, P_T_USER_L_ROLE C ")
		.append(" WHERE A.TID = C.USER_ID ")
		.append(" AND B.TID = C.ROLE_ID ")
		.append(" AND B.TID = ? ");
		List list = dao.queryForList(sb.toString(), new Object[]{role});
		List<CzXmxxLsbVO> returnList = new ArrayList();
		CzXmxxLsbVO lsbvo = null;
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map)list.get(i);
				lsbvo = new CzXmxxLsbVO();
				lsbvo.setSpzcr(String.valueOf(map.get("USERNAME")));
				lsbvo.setSpzcrId(String.valueOf(map.get("TID")));
				lsbvo.setSpwy(String.valueOf(map.get("USERNAME")));
				lsbvo.setSpwyId(String.valueOf(map.get("TID")));
				returnList.add(lsbvo);
			}
		}
		return returnList;
	}
	//根据代办id获得代办对象
	public PTTodo getPTTodoById(String todoId){
		String hql = "from PTTodo o where o.id = ?";
		List params = new ArrayList();
		PTTodo todo = null;
		if(todoId!=null){
			params.add(Long.parseLong(todoId));
			List list = dao.find(hql, params);
			if(list!=null && list.size() > 0){
				todo = (PTTodo)list.get(0);
			}
		}
		return todo;
	}
	public void updateHyZT(String[] xmIds){
		int count = xmIds.length;
		String sql  = "update cz_xmxx_lsb set zhuangtai ='1' where id =";
		for(int i = 0;i < count; i++){
//			CzXmxxLsb lsb = dao.
			dao.updateBySql(sql+"'"+xmIds[i]+"'");
		}

	}
}
