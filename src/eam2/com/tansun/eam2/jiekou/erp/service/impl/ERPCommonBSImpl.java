package com.tansun.eam2.jiekou.erp.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.service.IERPCommonBS;
import com.tansun.eam2.kpgl.KpglCommon;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.eam2.zyzc.service.ZCQueryBS;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.rdp4j.common.model.orm.PublicDao;
@Service
public class ERPCommonBSImpl implements IERPCommonBS {
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonBS cardCommonBSImpl;
	@Autowired
	private ZCQueryBS zcquerybs;
	/**
	 * 根据表单id 生成台账 统一的方法入口
	 * @param headId
	 * @return
	 */
	public String book4CardById(String headId){
		String result = "";
		
		try{
			if(headId!=null && headId.length()>0){
				CaShead head = cardCommonBSImpl.findCaSheadById(headId);
				String bdlx = head.getBdlx();
				boolean isNewORUpdate = this.isCardNewORUpdate(bdlx);//根据表单类型判断是否增加或者更新card信息
				if(isNewORUpdate){ //如果是新增、拆分、合并卡片，则生成新卡片信息
					result = this.creatBook4Card(head);
				}else {				//如果是减少、减值、修改、变动、调配，则更新卡片信息
					result = this.updateBook4Card(head);
				}
				
				head.setIsrejected("04");//生成台账成功
				cardCommonBSImpl.update(head);
				result = "办结成功";
			}
		}catch(Exception e){
			result = "办结失败";
		}
		return result;
	}
	
	/**
	 * 根据表单 生成card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String creatBook4Card(CaShead head){
		String result = "";
		String bdlx = head.getBdlx();
		String headId = String.valueOf(head.getId());
		String sfzy = head.getZykpxz();
		List list = cardCommonBSImpl.findLcCardtempsBySheadId(headId); 	//得到表单下所有表体信息
		for(int i=0;i<list.size();i++){
			LcCardtemp body = (LcCardtemp) list.get(i);
			this.creatBook4Card(body,bdlx,sfzy);//生成card信息方法
		}
		return result;
	}
	//生成card信息方法
	private void creatBook4Card(LcCardtemp body, String bdlx, String sfzy) {
		Cardinfo card = new Cardinfo();
		if(KpglCommon.KP_CZTYPE_CARDADD.equals(bdlx)){				//新增
			BeanUtils.copyProperties(body,card,new String[]{"id"});
			if("1".equals(sfzy)){
				ZyZc zc = zcquerybs.getZyzcByZcId(body.getZcid());
				if(zc!=null){
					zc.setKpbh(body.getCardcode());
					zc.setSfsckp("是");
					dao.update(zc);
				}
				dao.save(card);
			}else{
				newCardAssetHistory(card);
			}
		}else if(KpglCommon.KP_CZTYPE_CARDMERGE.equals(bdlx)){		//合并
			if(body.getBoxid()!=null && body.getBoxid().length()>0){			//合并后卡片的id等于cardinfoId，以此判断是否为合并后卡片
				BeanUtils.copyProperties(body,card,new String[]{"id"});
				newCardAssetHistory(card);
			}else{
				String cardId = body.getCardinfoid();
				card = cardCommonBSImpl.findCardinfoByCardId(cardId);
				//设置卡片状态为退役
				card.setState("03");
				//设置卡片的减少原因为0212合并减少
				card.setChangereason(body.getChangeway());
				dao.update(card);
			}
		}else if(KpglCommon.KP_CZTYPE_CARDSPLIT.equals(bdlx)){		//拆分
			if(body.getBoxid()!=null && body.getBoxid().length()>0){//拆分的卡片boxid为空，以此判断是否为拆分后卡片
				BeanUtils.copyProperties(body,card,new String[]{"id"});
				newCardAssetHistory(card);
			}else {
				String cardId = body.getCardinfoid();
				card = cardCommonBSImpl.findCardinfoByCardId(cardId);
				//设置卡片状态为退役
				card.setState("03");
				//设置卡片的减少原因为0213拆分减少
				card.setChangereason("0213");
				dao.update(card);
			}
		}
	}

	private void newCardAssetHistory(Cardinfo card) {
		CardAssetHistory cah = new CardAssetHistory();
//		Cardinfo card1 = cardCommonBSImpl.findCardinfoByCardCode(card.getCardcode());
			dao.save(card);
			cah.setKpId(String.valueOf(card.getId()));
			cah.setGjksrq(new Date());
			cah.setSpzt("1");
			cah.setSfwzkp("0");
			cah.setZczsbId(card.getZcid());
			cah.setDqgjzt("0");
			dao.save(cah);
	}

	/**
	 * 根据表单，更新card信息
	 * @param headId
	 * @param bdlx
	 * @return
	 */
	public String updateBook4Card(CaShead head){
		String result = "";
		String bdlx = head.getBdlx();
		String headId = String.valueOf(head.getId());
		List list = cardCommonBSImpl.findLcCardtempsBySheadId(headId); 	//得到表单下所有表体信息
		for(int i=0;i<list.size();i++){
			LcCardtemp body = (LcCardtemp) list.get(i);
			this.updateBook4Card(body,bdlx,headId);//更新card信息方法
		}
		return result;
	}

	//更新card信息方法
	private void updateBook4Card(LcCardtemp body,String bdlx,String headId) {
		String cardcode = body.getCardcode();
		String hql = "from Cardinfo t where t.cardcode = ?";
		Cardinfo card = (Cardinfo) dao.findSingleResult(hql, new Object[]{cardcode});
		if(KpglCommon.KP_CZTYPE_CARDALLOCATE.equals(bdlx)){			//调配
			String oldZcId = card.getZcid();
			String cardId = String.valueOf(card.getId());
			CardAssetHistory cah = this.getCardAssetHistory(oldZcId,cardId);
			if(cah !=null){
				cah.setDqgjzt("1");
				cah.setGjjsrq(new Date());
				cah.setSpzt("2");
				dao.update(cah);
			}
			CardAssetHistory cah1 = new CardAssetHistory();
			cah1.setKpId(cardId);
			cah1.setGjksrq(new Date());
			cah1.setSpzt("2");
			cah1.setZczsbId(body.getZcid());
			dao.save(cah1);
			card.setZcid(body.getZcid());//资产id
			
		}else if(KpglCommon.KP_CZTYPE_CARDCHANGE.equals(bdlx)){		//变动
			this.change4Book(body, card);
		}else if(KpglCommon.KP_CZTYPE_CARDDEVALUE.equals(bdlx)){	//减值
			card.setJzzb(body.getJzzb());//减值准备
			card.setJevalue(body.getJevalue());//净额
		}else if(KpglCommon.KP_CZTYPE_CARDMODIFY.equals(bdlx)){		//修改
			//List recordList = cardCommonBSImpl.findRecordsBybodyId(String.valueOf(body.getId()),headId);
			BeanUtils.copyProperties(body,card,new String[]{"id"});
		}else if(KpglCommon.KP_CZTYPE_CARDREDUCE.equals(bdlx)){		//减少
			card.setState("03");//设置卡片状态为退役
			card.setDealmethod(body.getDealmethod());//减少方式
			card.setChangereason(body.getChangereason());//减少原因
		}
		dao.update(card);
	}

	private CardAssetHistory getCardAssetHistory(String oldZcId, String cardId) {
		String sql = "from CardAssetHistory t where t.zczsbId=? and t.kpId=? and t.dqgjzt = '0'";
		CardAssetHistory cah = (CardAssetHistory) dao.findSingleResult(sql, new Object[]{oldZcId,cardId});
		return cah;
	}

	/**
	 * 变动处理单的生成台账
	 * @param body
	 * @param card
	 */
	private void change4Book(LcCardtemp body, Cardinfo card) {
		String nodevalue = body.getChangeway();
		if(KpglCommon.CHANGE_WAY_YZZJ.equals(nodevalue.trim())||
				KpglCommon.CHANGE_WAY_YZJS.equals(nodevalue.trim())){ 							//原币原值
			card.setYbyz(body.getYbyz());//原币原值
			card.setJvalue(body.getJvalue());//净值
			card.setJevalue(body.getJevalue());//净额
		}else if(KpglCommon.CHANGE_WAY_GLBM.equals(nodevalue.trim())){							//管理部门
			card.setGlbm(body.getGlbm());
		}else if(KpglCommon.CHANGE_WAY_SYBM.equals(nodevalue.trim())){							//使用部门
			card.setUsepartment(body.getUsepartment());
		}else if(KpglCommon.CHANGE_WAY_SYZK.equals(nodevalue.trim())){							//使用状况
			card.setUsestatus(body.getUsestatus());
		}else if(KpglCommon.CHANGE_WAY_ZJLX.equals(nodevalue.trim())){							//折旧类型
			card.setZjtype(body.getZjtype());
		}else if(KpglCommon.CHANGE_WAY_SYYX.equals(nodevalue.trim())){							//使用月限
			card.setSynx(body.getSynx());//使用年限
			card.setSyyx(body.getSyyx());//使用月限
		}else if(KpglCommon.CHANGE_WAY_JCZ.equals(nodevalue.trim())){							//净残值
			card.setJcz(body.getJcz());//净残值
			card.setJczl(body.getJczl());//净残值率
		}else if(KpglCommon.CHANGE_WAY_LJZJ.equals(nodevalue.trim())){							//累计折旧
			card.setLjzj(body.getLjzj());//累计折旧
			card.setJvalue(body.getJvalue());//净值
			card.setJevalue(body.getJevalue());//净额
		}else if(KpglCommon.CHANGE_WAY_KPLB.equals(nodevalue.trim())){							//卡片类别，
			card.setTypecode(body.getTypecode());//类别编码
			card.setChildid(body.getChildid());//类别编码
		}else if(KpglCommon.CHANGE_WAY_ZJFS.equals(nodevalue.trim())){							//增加方式
			card.setAddtype(body.getAddtype());
		}else if(KpglCommon.CHANGE_WAY_ZJCDBM.equals(nodevalue.trim())){							//折旧承担部门
			card.setZjcdbm(body.getZjcdbm());
		}else if(KpglCommon.CHANGE_WAY_SYR.equals(nodevalue.trim())){							//使用人
			card.setUsername(body.getUsername());
		}
	}

	/**
	 * 判断处理单类型
	 * @param bdlx
	 * @return
	 */
	private boolean isCardNewORUpdate(String bdlx) {
		if( KpglCommon.KP_CZTYPE_CARDADD.equals(bdlx)||
			KpglCommon.KP_CZTYPE_CARDMERGE.equals(bdlx)||
			KpglCommon.KP_CZTYPE_CARDSPLIT.equals(bdlx)){
			return true;//如果是卡片新增、合并、拆分，则返回true
		}else{
			return false;//否则，是卡片减少、减值、修改、变动、调配，返回false；
		}
	}

}
