package com.tansun.eam2.jygdzc.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.JjzcGctbXx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtJdzj;
import com.tansun.eam2.common.model.orm.bo.JjzcTbgcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlHead;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcZlBgmx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.jygdzc.service.IIntentionBS;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.JyzlLedgerVO;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.eam2.jygdzc.vo.JyzlXxBodyVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Service
public class IntentionBSImpl extends CommonBSImpl implements IIntentionBS {
	@Autowired
	public PublicDao publicDao;

	/**
	 * 保存新增卡片表头
	 * 
	 * @param caShead
	 */
	public void save(CommonBO object) {
		publicDao.save(object);
	}

	/**
	 * 更新新增卡片表头
	 * 
	 * @param caShead
	 */
	public void update(CommonBO object) {
		publicDao.update(object);
	}

	/**
	 * 删除表体
	 * 
	 * @param caShead
	 */
	public void delete(CommonBO object) {
		publicDao.delete(object);
	}

	/**
	 * 根据HeadId 查找到所有的值
	 * 
	 * @param caShead
	 */
	public List<JyzcJyzlLsb> getJyzcJyzlLsbByHeadId(String cldId) {
		Object[] str = new Object[] { cldId };
		return (List<JyzcJyzlLsb>) publicDao.find(
				"from JyzcJyzlLsb t where t.cldId = ?", str);
	}

	public JyzcJyzlHead getJyzcJyzlHeadByHeadId(String id) {
		String[] str = new String[] { id };
		return (JyzcJyzlHead) publicDao.find(
				"from JyzcJyzlHead t where t.id = ?", str);
	}

	/**
	 * 根据表头ID 查出相应表体信息
	 * 
	 * @param id
	 * @return
	 */
	public List<JyzlXxBodyVO> getJyzlBodyVOByHeadId(String id, Paginator paginator) {
		List<JyzlXxBodyVO> result = new ArrayList();
		List params = new ArrayList();
		List<JyzcJyzlLsb> resultList = new ArrayList();
		params.add(id);
		String preparSQL = "";
		preparSQL = "from  JyzcJyzlLsb o where o.cldId = ?  order by cldId desc ";
		resultList = (List<JyzcJyzlLsb>) publicDao.queryByHQLWithPaginator(
				preparSQL, params, paginator).getResults();
		if (resultList == null || resultList.size() == 0) {
			return result;
		} else {
			for (int i = 0; i < resultList.size(); i++) {
				JyzlXxBodyVO jyzlBodyVO = new JyzlXxBodyVO();
				JyzcJyzlLsb jyzcJyzlLsb = resultList.get(i);
				BeanUtils.copyProperties(jyzcJyzlLsb, jyzlBodyVO);
				jyzlBodyVO.setId(jyzcJyzlLsb.getId());
				String zcId = jyzcJyzlLsb.getZcId();
				List<JyzcXx> zcxx = new ArrayList();
				List param = new ArrayList();
				param.add(zcId);
				zcxx = (List<JyzcXx>) publicDao.find(
						"from JyzcXx j where j.id = ? ", param);
				if (zcxx.size() != 0) {
					jyzlBodyVO.setZcbh(zcxx.get(0).getZcbh());
					jyzlBodyVO.setZcmc(zcxx.get(0).getZcmc());
					jyzlBodyVO.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(String.valueOf(zcxx.get(0).getCZclx())))));
				}
				result.add(jyzlBodyVO);
			}
			return result;
		}
	}

	/**
	 * 根据查询条件 查出相应租赁信息
	 * 
	 * @param jyzlQueryVO
	 * @return
	 */
	public List<JyzlViewVO> getJyzlViewVOByCondition(JyzlQueryVO jyzlQueryVO,
			Paginator paginator) {

		if (jyzlQueryVO == null || paginator == null) {
			return null;
		} else {
			List params = new ArrayList();
			StringBuffer sql=new StringBuffer();
			
			sql.append("select distinct a.id ,a.bianhao , a.biaoti , a.ywlx ,b.ZLQSRQ , b.ZLDQRQ, b.CZR , b.YXZJZJE ,c.zcbh , c.C_ZCDQ ,c.zcmc , c.c_zclx from Jyzc_Jyzl_Head a ,Jyzc_Jyzl_Xx b ,Jyzc_Xx c where  biaoti is not null and a.cld_zt='2' and a.id=b.cld_Id(+) and b.zc_Id=c.id(+) ");
			
			if (jyzlQueryVO.getBiaoti() != null && jyzlQueryVO.getBiaoti().trim().length() > 0) {
				params.add("%" + jyzlQueryVO.getBiaoti() + "%");
				sql.append(" and a.biaoti like ? ");
			}
			// 编号
			if (jyzlQueryVO.getBianhao() != null &&  jyzlQueryVO.getBianhao().trim().length() > 0) {
				params.add("%" + jyzlQueryVO.getBianhao() + "%");
				sql.append(" and a.bianhao like ? ");
			}
			// 资产编号
			if (jyzlQueryVO.getZcbh() != null && jyzlQueryVO.getZcbh().trim().length() > 0) {
				params.add("%" + jyzlQueryVO.getZcbh() + "%");
				sql.append(" and c.zcbh like ? ");
			}
			// 资产名称
			if (jyzlQueryVO.getZcmc() != null && jyzlQueryVO.getZcmc().trim().length() > 0) {
				params.add("%" + jyzlQueryVO.getZcmc() + "%");
				sql.append(" and c.zcmc like ? ");
			}
			// 资产类型
			 if (jyzlQueryVO.getCZclx() != null
			 && jyzlQueryVO.getCZclx().trim().length() > 0) {
				 params.add(jyzlQueryVO.getCZclx());
				 sql.append("and c.C_Zclx = ? ");
			 }
			 //业务类型
			if (jyzlQueryVO.getYwlx() != null && jyzlQueryVO.getYwlx().trim().length() > 0) {
				params.add(jyzlQueryVO.getYwlx());
				sql.append(" and a.ywlx = ? ");
			}

			// 租赁起始时间
			if (jyzlQueryVO.getBegintime1() != null ) {
				params.add(jyzlQueryVO.getBegintime1());
				sql.append(" and b.zlqsrq >= ? ");
			}
			if (jyzlQueryVO.getBegintime2() != null ) {
				params.add(jyzlQueryVO.getBegintime2());
				sql.append(" and b.zlqsrq < ? ");
			}
			// 租赁到期时间
			if (jyzlQueryVO.getEndtime1() != null) {
				params.add(jyzlQueryVO.getEndtime1());
				sql.append(" and b.zldqrq >= ? ");
			}
			if (jyzlQueryVO.getEndtime2() != null) {
				params.add(jyzlQueryVO.getEndtime2());
				sql.append(" and b.zldqrq < ? ");
			}
			//二级委托代理机构
			if(jyzlQueryVO.getccrwtjg()!=null){
				params.add(jyzlQueryVO.getccrwtjg());
				sql.append(" and c.c_erwtjg = ? ");
			}
			//一级委托代理机构
			if(jyzlQueryVO.getcyjwtjg()!=null){
				params.add(jyzlQueryVO.getcyjwtjg());
				sql.append(" and c.c_yjwtjg = ? ");
			}
			// 承租人
			// if (jyzlQueryVO.getCzr() != null
			// && jyzlQueryVO.getCzr().trim().length() > 0) {
			// params.add(jyzlQueryVO.getCzr());
			// stringbuffer.append("and b.czr = ? ");
			// }
			sql.append(" order by a.id");
			PageableList pageableList =  this.publicDao.queryForList(sql.toString(), params,paginator);
			List queryList = pageableList.getResults();
			List<JyzlViewVO> resultList = new ArrayList();
			
			for (int i = 0; i < queryList.size(); i++) {
				
				Map map= (Map) queryList.get(i);
				
				JyzlViewVO jyzlViewVO = new JyzlViewVO();
				jyzlViewVO.setId(String.valueOf(map.get("id")));
				jyzlViewVO.setBiaoti(String.valueOf(map.get("biaoti")));
				jyzlViewVO.setBianhao(String.valueOf(map.get("bianhao")));
				jyzlViewVO.setYwlx(String.valueOf(this.findYwlxByCodeKey(String.valueOf(map.get("ywlx")))));
				jyzlViewVO.setZcbh(String.valueOf(map.get("zcbh")));
				jyzlViewVO.setZcmc(String.valueOf(map.get("zcmc")));
				jyzlViewVO.setCZclx(String.valueOf(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(map.get("C_ZCLX")))));
				jyzlViewVO.setDq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("C_ZCDQ")))));//地区
				//jyzlViewVO.setDq(String.valueOf(map.get("")));
				//jyzlViewVO.setZlzt(String.valueOf(map.get("zlzt")));
					
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					if(map.get("ZLQSRQ")!=null){
						jyzlViewVO.setZlqsrq(sdf.parse(String.valueOf(map.get("ZLQSRQ"))));
					}
					if(map.get("ZLDQRQ")!=null){
						jyzlViewVO.setZldqrq(sdf.parse(String.valueOf(map.get("ZLDQRQ"))));
					}
					if(map.get("YXZJZJE") != null && !"".equals(map.get("YXZJZJE"))){
						BigDecimal bd = (BigDecimal)map.get("YXZJZJE");
						jyzlViewVO.setYxzjzje(bd.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue());
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				jyzlViewVO.setCzr(String.valueOf(checkString(map.get("czr"))));
				resultList.add(jyzlViewVO);
			}

			return resultList;
		}
	}
	public List<JyzlViewVO> getJyzlViewVOByCondition(String idStr) {
		List<JyzlViewVO> resultList = new ArrayList<JyzlViewVO>();
		StringBuffer sql=new StringBuffer();
		sql.append("select distinct a.id ,a.bianhao , a.biaoti , a.ywlx ,b.ZLQSRQ , b.ZLDQRQ, b.CZR , b.YXZJZJE ,c.zcbh , c.C_ZCDQ ,c.zcmc , c.c_zclx from Jyzc_Jyzl_Head a ,Jyzc_Jyzl_Xx b ,Jyzc_Xx c where  biaoti is not null and a.cld_zt='2' and a.id=b.cld_Id(+) and b.zc_Id=c.id(+) and a.id in ("+IdStrFormat.formatIds(idStr)+") ");
		
		List params = new ArrayList();
		List list=publicDao.queryForList(sql.toString(),params);
		
		for (int i = 0; i < list.size(); i++) {
			Map map= (Map) list.get(i);
			JyzlViewVO jyzlViewVO = new JyzlViewVO();
			jyzlViewVO.setId(String.valueOf(map.get("id")));
			jyzlViewVO.setBiaoti(String.valueOf(map.get("biaoti")));
			jyzlViewVO.setBianhao(String.valueOf(map.get("bianhao")));
			jyzlViewVO.setYwlx(String.valueOf(this.findYwlxByCodeKey(String.valueOf(map.get("ywlx")))));
			jyzlViewVO.setZcbh(String.valueOf(map.get("zcbh")));
			jyzlViewVO.setZcmc(String.valueOf(map.get("zcmc")));
			jyzlViewVO.setCZclx(String.valueOf(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(map.get("C_ZCLX")))));
			jyzlViewVO.setDq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("C_ZCDQ")))));//地区
			//jyzlViewVO.setDq(String.valueOf(map.get("")));
			//jyzlViewVO.setZlzt(String.valueOf(map.get("zlzt")));
			//jyzlViewVo.setYxzjzje(String.valueOf(map.get("yxzjzje")));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				if(map.get("ZLQSRQ")!=null){
					jyzlViewVO.setZlqsrq(sdf.parse(String.valueOf(map.get("ZLQSRQ"))));
				}
				if(map.get("ZLDQRQ")!=null){
					jyzlViewVO.setZldqrq(sdf.parse(String.valueOf(map.get("ZLDQRQ"))));
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
			jyzlViewVO.setCzr(String.valueOf(checkString(map.get("czr"))));
			resultList.add(jyzlViewVO);
		}
		return resultList;
	}
	/**
	 * 根据资产ID 查询出一条JyzcXxVO 数据
	 * 
	 * @param zcId
	 * @return
	 */

	public JyzcXxVO getJyzcXxVOByzcId(String zcId) {
		List list = new ArrayList();
		List params = new ArrayList();
		JyzcXxVO jyzcXxVO = new JyzcXxVO();
		JyzcXx jyzcXx = new JyzcXx();
		params.add(zcId);
		String preparedHQL = "from JyzcXx where id= ? ";
		list = publicDao.find(preparedHQL, params);
		if (list.size() == 0) {
			return null;
		} else {
			jyzcXx = (JyzcXx) list.get(0);
			BeanUtils.copyProperties(jyzcXx, jyzcXxVO);
			jyzcXxVO.setId(jyzcXx.getId());
			jyzcXxVO.setCZczc(findCoteNameByCoteKey("ASSET_STATUS",String.valueOf(jyzcXx.getCZczc())));//资产状态
			//jyzcXxVO.setCJyfl(checkString(String.valueOf(jyzcXxVO.getCJyfl())));//经营分类
			jyzcXxVO.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(jyzcXxVO.getCJyfl()))));//经营分类
			jyzcXxVO.setCZcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(jyzcXxVO.getCZcdq()))));//地区
			jyzcXxVO.setCYt(checkString(findCoteNameByCoteKey("ASSET_USE",String.valueOf(jyzcXxVO.getCYt()))));//用途
			jyzcXxVO.setCardinfo(publicDao);
			jyzcXxVO.setYzmj(publicDao);
			if(jyzcXxVO.getCardinfo()!=null){
				jyzcXxVO.setGlbm(publicDao, jyzcXxVO.getCardinfo().getGlbm());
				jyzcXxVO.setSybm(publicDao, jyzcXxVO.getCardinfo().getUsepartment());
			}
			return jyzcXxVO;
		}
	}

	/**
	 * 根据经营租赁ID查出租赁变更明细信息
	 * 
	 * @param zlId
	 * @return
	 */
	public List<JyzcZlBgmx> getJyzcZlBgmxByzlId(String zlId, String zlXxId) {

		List<JyzcZlBgmx> resultlist = new ArrayList();
		List params = new ArrayList();
		params.add(zlId);
		params.add(zlXxId);
		resultlist = (List<JyzcZlBgmx>) publicDao.find(
				"from JyzcZlBgmx o where o.jyzlId = ?  and o.zcId =? ", params);
		if (resultlist.size() == 0) {
			return resultlist;
		} else {
			return resultlist;
		}
	}
	/**
	 * 根据经营租赁ID查出租赁临时表信息
	 * 
	 * @param zlId
	 * @return
	 */
	public List<JyzcJyzlLsb> getJyzcJyzlLsbByhtId(String htId, String cldId) {
		List<JyzcJyzlLsb> resultlist = new ArrayList();
		List params = new ArrayList();
		params.add(htId);
		params.add(cldId);
		resultlist = (List<JyzcJyzlLsb>) publicDao.find(
				"from JyzcJyzlLsb o where o.htId = ?  and o.cldId =? ", params);
		if (resultlist.size() == 0) {
			return resultlist;
		} else {
			return resultlist;
		}
	}
	/**
	 * 根据租赁表ID 查询出相应的资产ID
	 * 
	 * @param zlId
	 * @return
	 */

	public String getZcIdByzlId(String zlId) {
		JyzcJyzlLsb jyzcJyzlLsb = new JyzcJyzlLsb();
		jyzcJyzlLsb = (JyzcJyzlLsb) publicDao.findById(JyzcJyzlLsb.class, zlId);
		return jyzcJyzlLsb.getZcId();
	}

	public List<JyzcJyzlXx> getJyzcJyzlXxByzcId(String zcId) {

		List<JyzcJyzlXx> resultlist = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		resultlist = (List<JyzcJyzlXx>) publicDao.find(
				"from JyzcJyzlXx where zcId=?", params);
		return resultlist;
	}

	public JyzcJyzlLsb jyzc2Body(JyzcJyzlXx jyzcJyzlXx) {
		JyzcJyzlLsb jyzcJyzlLsb = new JyzcJyzlLsb();
		BeanUtils.copyProperties(jyzcJyzlXx, jyzcJyzlLsb);
		jyzcJyzlLsb.setId("");
		return jyzcJyzlLsb;
	}

	/*
	 * 
	 * 比对租赁表和租赁临时表不同 并将其记录到RECORDHISTORY中
	 * 
	 */
	@SuppressWarnings("unchecked")
	public void compareZlXxVsZlXxLsb(JyzcJyzlXx jyzlXx, JyzcJyzlLsb jyzlLsb) {

		Map<String, Object> lsbMap = null;
		Map<String, Object> xxbMap = null;
		try {
			lsbMap = org.apache.commons.beanutils.BeanUtils.describe(jyzlLsb); // 临时信息
			xxbMap = org.apache.commons.beanutils.BeanUtils.describe(jyzlXx); // 信息表
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		Set<String> keySet = xxbMap.keySet();
		Iterator ite = keySet.iterator();
		while (ite.hasNext()) {
			String property = (String) ite.next();
			if ("id".equals(property) || "class".equals(property)||"lrrq".equals(property)||"cldId".equals(property)||"bgsm".equals(property)) {
				continue;
			}
			Object valueAfter = lsbMap.get(property);
			Object valueBefore = xxbMap.get(property);
			if("zlqsrq".equals(property)){
				if(jyzlXx.getZlqsrq() != null){
					valueBefore = DateUtils.formatDate(jyzlXx.getZlqsrq(),"yyyy-MM-dd");
				}
				if(jyzlLsb.getZlqsrq() != null){
					valueAfter = DateUtils.formatDate(jyzlLsb.getZlqsrq(),"yyyy-MM-dd");
				}
			}
			if("zldqrq".equals(property)){
				if(jyzlXx.getZldqrq() != null){
					valueBefore = DateUtils.formatDate(jyzlXx.getZldqrq(),"yyyy-MM-dd");
				}
				if(jyzlLsb.getZlqsrq() != null){
					valueAfter = DateUtils.formatDate(jyzlLsb.getZldqrq(),"yyyy-MM-dd");
				}
			}
			if(allToString(String.valueOf(valueAfter)).equals(allToString(String.valueOf(valueBefore)))){
				continue;
			}else if((valueAfter == null && valueBefore != null) || (valueAfter != null && !valueAfter.equals(valueBefore))){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlXx.getId().toString());// 变动记录的ID，临时表的主键
				record.setName(this.checkString(this.switchString(property)));// 改变的列名
				if("CJbhsf".equals(property)){
					record.setBefore(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(valueAfter))));	
				}else if("CEjjbh".equals(property)){
					record.setBefore(checkString(findCateNameByParentId("department","438",String.valueOf(valueBefore))));
					record.setAfter(checkString(findCateNameByParentId("department","438",String.valueOf(valueAfter))));	
				}else {
					record.setBefore(valueBefore==null?"":valueBefore.toString());
					record.setAfter(valueAfter==null?"":valueAfter.toString());//改变后值
				}
				if(record.getAfter().equals(record.getBefore())){
					continue;
				}else{
					// 查询head对象，获得拟稿人，拟稿日期
					JyzcJyzlHead head = this.findHeadById(jyzlLsb.getCldId()
							.toString());
					if (head != null) {
						record.setChangedate(head.getNgrq());// 变动的日期
						record.setChangeperson(head.getNgrmc());// 变动记录人
						record.setWfCode(head.getLcId());// 流程
						record.setPkId(head.getId().toString());
					}
					record.setZhuangTai("0");// 设置审批状态为0：未审批
					if (valueAfter != null) {
						publicDao.saveOrUpdateAttach(record);// 保存变动信息到
					}
				}
			}
		}
	}
	/**
	 * 修改后的租赁变更比对方法
	 * @param jyzlLsb
	 */
	public void compareZlXxVsHTXx(JyzcJyzlLsb jyzlLsb){
		
		if(jyzlLsb!=null) {
			JyzcJyzlHead head = this.findHeadById(jyzlLsb.getCldId().toString());
			if(!(jyzlLsb.getHtjydx()==null?"":jyzlLsb.getHtjydx()).equals(jyzlLsb.getJydx())){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlLsb.getId().toString());// 变动记录的ID，临时表的主键
				record.setName("交易对象");// 改变的列名
				record.setBefore(jyzlLsb.getJydx()==null?"":jyzlLsb.getJydx().toString().equals("1")?"建行":jyzlLsb.getJydx().toString().equals("2")?"非建行":"");//改变前值
				record.setAfter(jyzlLsb.getHtjydx()==null?"":jyzlLsb.getHtjydx().toString().equals("1")?"建行":jyzlLsb.getHtjydx().toString().equals("2")?"非建行":"");//改变后值
				record.setChangedate(head.getNgrq());// 变动的日期
				record.setChangeperson(head.getNgrmc());// 变动记录人
				record.setWfCode(head.getLcId()==null?"":head.getLcId());// 流程
				record.setPkId(head.getId().toString());
				publicDao.saveOrUpdateAttach(record);
				record.setZhuangTai("0");// 设置审批状态为0：未审批
			}
			if(!(jyzlLsb.getHtczr()==null?"":jyzlLsb.getHtczr()).equals(jyzlLsb.getCzr())){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlLsb.getId().toString());// 变动记录的ID，临时表的主键
				record.setName("资产承租人");// 改变的列名
				record.setAfter(jyzlLsb.getCzr().toString());//改变后值
				record.setChangedate(head.getNgrq());// 变动的日期
				record.setChangeperson(head.getNgrmc());// 变动记录人
				record.setWfCode(head.getLcId());// 流程
				record.setPkId(head.getId().toString());
				publicDao.saveOrUpdateAttach(record);
				record.setZhuangTai("0");// 设置审批状态为0：未审批
			}
			if(!(jyzlLsb.getHtqsrq()==null?"":jyzlLsb.getHtqsrq()).equals(jyzlLsb.getZlqsrq())){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlLsb.getId().toString());// 变动记录的ID，临时表的主键
				record.setName("合同起始日期");// 改变的列名
				record.setAfter(DateUtils.formatDate(jyzlLsb.getZlqsrq(),"yyyy-MM-dd"));//改变后值
				record.setChangedate(head.getNgrq());// 变动的日期
				record.setChangeperson(head.getNgrmc());// 变动记录人
				record.setWfCode(head.getLcId());// 流程
				record.setPkId(head.getId().toString());
				publicDao.saveOrUpdateAttach(record);
				record.setZhuangTai("0");// 设置审批状态为0：未审批
			}
			if(!(jyzlLsb.getHtdqrq()==null?"":jyzlLsb.getHtdqrq()).equals(jyzlLsb.getZldqrq())){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlLsb.getId().toString());// 变动记录的ID，临时表的主键
				record.setName("合同到期日期");// 改变的列名
				record.setAfter(DateUtils.formatDate(jyzlLsb.getZldqrq(),"yyyy-MM-dd"));//改变后值
				record.setChangedate(head.getNgrq());// 变动的日期
				record.setChangeperson(head.getNgrmc());// 变动记录人
				record.setWfCode(head.getLcId());// 流程
				record.setPkId(head.getId().toString());
				publicDao.saveOrUpdateAttach(record);
				record.setZhuangTai("0");// 设置审批状态为0：未审批
			}
			if(!(jyzlLsb.getHtzlyt()==null?"":jyzlLsb.getHtzlyt()).equals(jyzlLsb.getCzyt())){
				Recordhistory record = new Recordhistory();
				record.setBiaoming("jyzc_jyzl_xx");// 变动的表名
				record.setZcId(jyzlLsb.getId().toString());// 变动记录的ID，临时表的主键
				record.setName("租赁用途");// 改变的列名
				record.setAfter(jyzlLsb.getCzyt().toString());//改变后值
				record.setChangedate(head.getNgrq());// 变动的日期
				record.setChangeperson(head.getNgrmc());// 变动记录人
				record.setWfCode(head.getLcId());// 流程
				record.setPkId(head.getId().toString());
				publicDao.saveOrUpdateAttach(record);
				record.setZhuangTai("0");// 设置审批状态为0：未审批
			}
		}
	}
	/**
	 * 对比时做转换
	 * @param str
	 * @return
	 */
	public String allToString(String str){
		if(str==null){
			return "";
		}
		if(str.trim().equals("")||str.trim().equals("null")
				||str.trim().equals("0")||str.trim().equals("0.0")){
			return "";
		}else{
			return str.trim();
		}
	}
	@SuppressWarnings("unchecked")
	public String switchString(String orig){
		HashMap hashMap=new HashMap();
		hashMap.put( "cldId","处理单ID");           
		hashMap.put( "zcId","资产ID");          
		hashMap.put( "jydx","交易对象");         
		hashMap.put( "CJbhsf","经办行省份");      
		hashMap.put( "CEjjbh","二级经办行");     
		hashMap.put( "zlqsrq","租赁起始日期");  
		hashMap.put( "zldqrq","租赁到期日期");    
		hashMap.put( "czr","资产承租人");     
		hashMap.put( "yxzlmj","意向租赁面积");     
		hashMap.put( "yxzjzje"," 意向租金总金额");
		hashMap.put( "czyt","出租用途");   
		hashMap.put( "yxzq","意向租期");         
		hashMap.put( "zlsm","租赁说明");        
		hashMap.put( "bgsm","变更说明");        
		hashMap.put( "tzrq","退租日期");       
		hashMap.put( "tzyy","退租原因");          
		hashMap.put( "tzblsm","退租办理说明");   
		hashMap.put( "lrrq","录入日期 ");
		return (String) hashMap.get(orig);
		
	} 
	/**
	 * 根据treeType和nodeValue和parentid查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String treeType,String parentId,String nodeValue) {
		String sql = "select i.categoryname from individualtree i where i.treetype = '"+treeType+"' and " +
				"i.parentcategoryid = '"+parentId+"' and i.nodevalue = '"+nodeValue+"'";
		String categoryname = "";
		if (nodeValue != null && nodeValue.length() > 0) {
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if(list.size()>0){
				Map map = (Map)list.get(0);
				categoryname = (String)map.get("categoryname");
			}
		}
		return categoryname;
	}
	/**
	 * 根据处理单ID 取出变动记录
	 * 
	 * @param pkId
	 * @return
	 */
	public List<Recordhistory> getRecordhistoryBypkId(String pkId, String zlXxId, Paginator paginator) {
		List<Recordhistory> resultList = new ArrayList();
		String preparedHQL = "from Recordhistory o  where o.pkId = ? and o.zcId = ? order by o.id";
		List params = new ArrayList();
		params.add(pkId);
		params.add(zlXxId);
		PageableList pageableList = publicDao.queryByHQLWithPaginator(preparedHQL, params, paginator);
		resultList = (List<Recordhistory>) pageableList.getResults();
	//	resultList = (List<Recordhistory>) publicDao.find(preparedHQL, params);
		return resultList;
	}

	/**
	 * 根据ID查询新增卡片表头信息
	 * 
	 * @param id
	 */
	public JyzcJyzlHead findHeadById(String id) {
		List params = new ArrayList();
		params.add(id);
		return (JyzcJyzlHead) publicDao.findSingleResult(
				"from JyzcJyzlHead o where o.id = ?", params);
	}

	public List<JyzcZlBgmx> getJyzcZlBgmxByzlId(String zlId) {
		List params = new ArrayList();
		params.add(zlId);
		List<JyzcZlBgmx> resultList = new ArrayList();
		resultList = (List<JyzcZlBgmx>) publicDao.find(
				"from JyzcZlBgmx where id = ? ", params);
		return resultList;
	}

	public List<JjzcGctbXx> getJjzcGctbXxBycldId(String cldId) {
		List params = new ArrayList();
		params.add(cldId);
		List<JjzcGctbXx> resultList = new ArrayList();
		
		resultList = (List<JjzcGctbXx>) publicDao.find(
				"from JjzcGctbXx  xx where xx.cldId = ? ", params);
		
		return resultList;
	}

	public List<AssetBodyVO> getJyzcXxBytbId(String tbId,String tblb) {
		List params = new ArrayList();
		params.add(tbId);
		params.add(tblb);
		List<AssetBodyVO> resultList = new ArrayList();
		List list = new ArrayList();
		list = (List<JjzcTbgcXx>) publicDao.find(
				"select zcId from JjzcTbgcXx  xx where xx.gctbId = ? and xx.tblb = ? ", params);
		if(list.size()>0&&list!=null)
			for(int i=0;i<list.size();i++){
				List param = new ArrayList();
				param.add(list.get(i));
				List<JyzcXx> zcXx = new ArrayList();
				zcXx = (List<JyzcXx>) publicDao.find("from JyzcXx zcXx where zcXx.id = ?", param);
				if(zcXx!=null&&zcXx.size()>0){
					AssetBodyVO assetBodyVO = new AssetBodyVO();
					BeanUtils.copyProperties(zcXx.get(0), assetBodyVO);
					assetBodyVO.setCZclx(checkString(this.findCoteNameByCoteKey("ASSET_TYPE",checkString(String.valueOf(assetBodyVO.getCZclx())))));//资产类型
					assetBodyVO.setCJyfl(checkString(String.valueOf(assetBodyVO.getCJyfl())));//经营分类
					//vo.setCJyfl(checkString(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",String.valueOf(map.get("C_JYFL")))));//经营分类
					//vo.setCZczc(checkString(map.get("c_zczc")));//资产状态
					assetBodyVO.setCZczc(checkString(this.findCoteNameByCoteKey("ASSET_STATUS",checkString(String.valueOf(assetBodyVO.getCZczc())))));//资产状态
					resultList.add(assetBodyVO);
				}	
					
			}
		return resultList;
	}

	public List<JjzcTbgcXx> getJjzcTbgcXxBycldId(String cldId) {
		List params = new ArrayList();
		params.add(cldId);
		List<JjzcTbgcXx> resultList = new ArrayList();
		
		resultList = (List<JjzcTbgcXx>) publicDao.find(
				"from JjzcTbgcXx  xx where xx.cldId = ? ", params);
		
		return resultList;
	}

	public JjzcTbgcXx getJjzcTbgcXxBytbIdAndzcId(String tbId,
			String zcId) {
		List params = new ArrayList();
		params.add(tbId);
		params.add(zcId);
		List<JjzcTbgcXx> resultList = new ArrayList();
		
		resultList = (List<JjzcTbgcXx>) publicDao.find(
				"from JjzcTbgcXx  xx where xx.gctbId = ? and xx.zcId =? ", params);
		if(resultList.size()>0){
			return resultList.get(0);
		}else{
			return null;
		}
	}
	/**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	/**
	 * 通过codeKey查找codename
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String coteType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = coteType;
			str[1] = codeKey;
			com.tansun.eam2.common.model.orm.bo.Code tree = new com.tansun.eam2.common.model.orm.bo.Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if(tree!=null&&!"".equals(tree)){
				String codeValue = tree.getCodeValue();
				return codeValue;
			}else{
				return "";
			}
		} else {
			return "";
		}
	}

	/**
	 * 根据资产ID 查询JJZC_HT_BX 中 该资产ID 对应数据（可能多条）中 合同开始日期为1年之内（一条）的 SFHJ 列 的值 
	 * @return SFHJ 值 
	 */
	public double getSfhjByzcId(String zcId) {
		String strsql="select sum(SFHJ) sfhj from JJZC_HT_BX "
			+"Where ZCID=? And SPZT=? And (SYXKSRQ>=? OR JQXKSRQ>=?)";
		List params = new ArrayList();
		params.add(zcId); //资产id参数
		params.add("2"); //审批结束
		
		java.util.Date datearg = DateUtils.dateYearAdd(new java.util.Date(), -1); //往前推一年
		params.add(datearg);
		params.add(datearg);
		
		List datalist = this.publicDao.queryForList(strsql, params);
		if(datalist !=null && datalist.size()>0){
			Map m = (Map)datalist.get(0);
			if(m.get("sfhj")!=null){
				String svalue = m.get("sfhj").toString() ; //得到税费合计
				try{
					double dvalue = Double.parseDouble(svalue); 
					return dvalue;
				}catch(Exception e){
					return 0;
				}
			}
		}
		return 0;	//无数据的情况，返回0
	}
	/**
	 * 根据资产ID 查询该资产挂接的卡片中 卡片类型为房屋及建筑物 和在建工程的 卡片  取出 卡片的原币原值 做累加 返回累加值
	 * @return
	 */
	public double getYbyzByzcId(String zcId) {
		//目前的CARD_ASSET_HISTORY实际上没有保存历史记录,因此暂不考虑历史数据的影响问题
		//等到此表修改以后,再考虑历史数据的问题,否则查询不出
		String strsql=" select sum(YBYZ) YBYZ from CARDINFO "
			+" Where id  in (Select kp_id from CARD_ASSET_HISTORY "
			+" Where ZCZSB_ID=? ) "
			+" And( (PARENTID  in('94','105','108','116','123'))or(PARENTID ='98' and TYPECODE ='0602'))  and STATE !='03'";//94代表房屋建筑物 '105','108','116','123'为其子类
		List params = new ArrayList();
		params.add(zcId); //资产id参数
		//params.add("94"); //94代表房屋建筑物
		List datalist = this.publicDao.queryForList(strsql, params);
		if(datalist !=null && datalist.size()>0){
			Map m = (Map)datalist.get(0);
			if(m.get("YBYZ")!=null){
				String svalue = m.get("YBYZ").toString() ; //得到税费合计
				try{
					double dvalue = Double.parseDouble(svalue); 
					return dvalue;
				}catch(Exception e){
					return 0;
				}
			}
		}
		return 0;	//无数据的情况，返回0
	}
/**
 * 在建工程
 */
	public double getZjgcYbyzByzcId(String zcId) {
		//目前的CARD_ASSET_HISTORY实际上没有保存历史记录,因此暂不考虑历史数据的影响问题
		//等到此表修改以后,再考虑历史数据的问题,否则查询不出
		String strsql=" select sum(YBYZ) YBYZ from CARDINFO  Where id  in (Select kp_id from CARD_ASSET_HISTORY  Where ZCZSB_ID=? )  And PARENTID=?";
		List params = new ArrayList();
		params.add(zcId); //资产id参数
		params.add("96"); //96代表在建工程
		
		List datalist = this.publicDao.queryForList(strsql, params);
		if(datalist !=null && datalist.size()>0){
			Map m = (Map)datalist.get(0);
			if(m.get("YBYZ")!=null){
				String svalue = m.get("YBYZ").toString() ; //得到税费合计
				try{
					double dvalue = Double.parseDouble(svalue); 
					return dvalue;
				}catch(Exception e){
					return 0;
				}
			}
		}
		return 0;	//无数据的情况，返回0
	}
	/**
	 * 通过传值 查出 业务类型
	 * @param a
	 * @return
	 */
	public String findYwlxByCodeKey(String a){
		String value1 = "";
		if("0".equals(a.trim())){
			value1 = "出租";
		}else if("1".equals(a.trim())){
			value1 = "变更";
		}else if("2".equals(a.trim())){
			value1 = "退租";
		}
		return value1;
	}

	public List getZcIdByTbIdAndTblb(String tbId, String tblb) {
		List params = new ArrayList();
		List<JjzcTbgcXx> list =  new ArrayList();
		List resultList = new ArrayList();
		params.add(tbId);
		params.add(tblb);
		String hql="from JjzcTbgcXx  xx where xx.gctbId = ? and xx.tblb =? ";
		list = (List<JjzcTbgcXx>) publicDao.find(hql, params);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				String zcId = list.get(i).getZcId().toString();
				resultList.add(zcId);
			}
		}
		return resultList;
	}
	@SuppressWarnings("unchecked")
	public String createBookBycldId(String cldId) {
		if(cldId!=null&&!"".equals(cldId)){
			JyzcJyzlHead jyzcJyzlHead = new JyzcJyzlHead();	
			jyzcJyzlHead =(JyzcJyzlHead) this.findById(JyzcJyzlHead.class, cldId);
			jyzcJyzlHead.setCldZt("2");
			this.update(jyzcJyzlHead);
			String ywlx = jyzcJyzlHead.getYwlx();
			if(jyzcJyzlHead!=null){
				String sheettype = jyzcJyzlHead.getSheettype();
				if("tenancy".equals(sheettype)||"agentTenancy".equals(sheettype)){
					if("0".equals(ywlx)){
						List<JyzcJyzlLsb> tenancyList = new ArrayList();
						tenancyList = this.getJyzcJyzlLsbByHeadId(cldId);
						if(tenancyList!=null&&tenancyList.size()>0){
							for(int i=0;i<tenancyList.size();i++){
								JyzcJyzlLsb jyzcJyzlLsb =new JyzcJyzlLsb();
								jyzcJyzlLsb = tenancyList.get(i);
								JyzcJyzlXx jyzcJyzlXx =new JyzcJyzlXx();
								BeanUtils.copyProperties(jyzcJyzlLsb,jyzcJyzlXx);
								jyzcJyzlXx.setLrrq(jyzcJyzlHead.getNgrq());
								jyzcJyzlXx.setBgsm("");
								this.save(jyzcJyzlXx);
								jyzcJyzlLsb.setSpzt("2");
								this.save(jyzcJyzlLsb);
							}
						}
					}else if("1".equals(ywlx)){
						List<JyzcJyzlLsb> tenancyList = new ArrayList();
						tenancyList = this.getJyzcJyzlLsbByHeadId(cldId);
						if(tenancyList!=null&&tenancyList.size()>0){
							for(int i=0;i<tenancyList.size();i++){
								JyzcJyzlLsb jyzcJyzlLsb =new JyzcJyzlLsb();
								jyzcJyzlLsb = tenancyList.get(i);
							//	JyzcJyzlXx jyzcJyzlXx =new JyzcJyzlXx();
							//	jyzcJyzlXx = (JyzcJyzlXx) this.findById(JyzcJyzlXx.class, jyzcJyzlLsb.getJyzlId());
								//String zczlId =  jyzcJyzlXx.getId();
								//BeanUtils.copyProperties(jyzcJyzlLsb,jyzcJyzlXx);
								//jyzcJyzlXx.setBgsm("");
								//jyzcJyzlXx.setId(zczlId);
								//this.update(jyzcJyzlXx);
								jyzcJyzlLsb.setSpzt("2");
								this.save(jyzcJyzlLsb);
								List<Recordhistory> changeList =null;
								changeList = this.getRecordhistoryBypkId(cldId,jyzcJyzlLsb.getId(),new Paginator());
								for(int y=0;y<changeList.size();y++){
									Recordhistory recordhistory= new Recordhistory();
									recordhistory = changeList.get(y);
									recordhistory.setZhuangTai("2");
									this.save(recordhistory);
								}
							}
						}
					}else{
						List<JyzcJyzlLsb> tenancyList = new ArrayList();
						tenancyList = this.getJyzcJyzlLsbByHeadId(cldId);
						if(tenancyList!=null&&tenancyList.size()>0){
							for(int i=0;i<tenancyList.size();i++){
								JyzcJyzlLsb jyzcJyzlLsb =new JyzcJyzlLsb();
								jyzcJyzlLsb = tenancyList.get(i);
								JyzcJyzlXx jyzcJyzlXx =new JyzcJyzlXx();
								//jyzcJyzlXx = (JyzcJyzlXx) this.findById(JyzcJyzlXx.class, jyzcJyzlLsb.getJyzlId());
								//String zczlId =  jyzcJyzlXx.getId();
								BeanUtils.copyProperties(jyzcJyzlLsb,jyzcJyzlXx);
								jyzcJyzlXx.setId(null);
								jyzcJyzlXx.setBgsm("");
								this.save(jyzcJyzlXx);
								jyzcJyzlLsb.setSpzt("2");
								this.save(jyzcJyzlLsb);
							}
						}
					}
				}else if("assurance".equals(sheettype)){
					List<JjzcTbgcXx> jjzcTbgcXxList = this.getJjzcTbgcXxBycldId(cldId);
					List<JjzcGctbXx>  jjzcGctbXxList = this.getJjzcGctbXxBycldId(cldId);
					if(jjzcGctbXxList!=null&&jjzcGctbXxList.size()>0){
						if(jjzcGctbXxList.size()>0){
							JjzcGctbXx  jjzcGctbXx = jjzcGctbXxList.get(0);
								if(jjzcGctbXx!=null){
									jjzcGctbXx.setSpzt("2");
									this.update(jjzcGctbXx);
								}
						}
					}
					if(jjzcTbgcXxList!=null&&jjzcTbgcXxList.size()>0){
						for(int i=0;i<jjzcTbgcXxList.size();i++){
							JjzcTbgcXx jjzcTbgcXx =new JjzcTbgcXx();
							jjzcTbgcXx = jjzcTbgcXxList.get(i);
							jjzcTbgcXx.setSpzt("2");
							this.update(jjzcTbgcXx);
						}
					}
				}
			}
		}
		return "办结成功";
	}

	public List<JyzlLedgerVO> getJyzlLedgerVOByCondition(JyzlLedgerVO jyzlLedgerVO, Paginator paginator) {
//		if (jyzlLedgerVO == null || paginator == null) {
//			return null;
//		} else {
			if(paginator == null){
				paginator = new Paginator();
			}
			List params = new ArrayList();
			StringBuffer sql=new StringBuffer();
			
			sql.append("select t.id as htid ,t.zcid as zcId, z.ejdq,z.zcmc,z.c_jyfl,z.zcbh,t.lrr,t.czr,t.czsl,t.htqsrq,t.htdqrq,t.zlyt,t.jsfs,a.ysws,a.sszj,t.jydx from jjzc_ht_zlwg t, jyzc_xx z,");
			if(jyzlLedgerVO.getKpbh()!=null && !"".equals(jyzlLedgerVO.getKpbh()) && jyzlLedgerVO.getKpbh().trim().length()>0){
				sql.append(" card_asset_history h, cardinfo c,");
			}
			sql.append("( select t.id,sum(nvl(q.yszj,0) - nvl(q.sszj,0)) as ysws, sum(nvl(q.sszj,0)) as sszj from jjzc_ht_zlwg t, jyzc_htqs_body q where t.id = q.ht_id(+)  group by t.id ) a ");
			if(jyzlLedgerVO.getKpbh()!=null && !"".equals(jyzlLedgerVO.getKpbh()) && jyzlLedgerVO.getKpbh().trim().length()>0){
				sql.append("where t.zcid = z.id(+) and t.id = a.id(+) and z.id =h.zczsb_id and h.kp_id=c.id and h.spzt = '2' and c.cardcode like ?");
				params.add("%" + jyzlLedgerVO.getKpbh() + "%");
			}else{ 
				sql.append("where t.zcid = z.id(+) and t.id = a.id(+) ");
			}
			
			if(jyzlLedgerVO.getYjfh()!=null && !"".equals(jyzlLedgerVO.getYjfh()) && jyzlLedgerVO.getYjfh().trim().length()>0){
				sql.append(" and z.ejdq=?");
				params.add(jyzlLedgerVO.getYjfh());
			}
			if(jyzlLedgerVO.getZcbh()!=null && !"".equals(jyzlLedgerVO.getZcbh()) && jyzlLedgerVO.getZcbh().trim().length()>0){
				sql.append(" and z.zcbh like ?");
				params.add("%" + jyzlLedgerVO.getZcbh()+ "%");
			}
			if(jyzlLedgerVO.getZcmc()!=null && !"".equals(jyzlLedgerVO.getZcmc()) && jyzlLedgerVO.getZcmc().trim().length()>0){
				sql.append(" and z.zcmc like ? ");
				params.add("%" + jyzlLedgerVO.getZcmc() + "%");
			}
			if(jyzlLedgerVO.getJyfl()!=null && !"".equals(jyzlLedgerVO.getJyfl()) && jyzlLedgerVO.getJyfl().trim().length()>0){
				sql.append(" and z.c_jyfl=?");
				params.add(jyzlLedgerVO.getJyfl());
			}
			if(jyzlLedgerVO.getCzr()!=null && !"".equals(jyzlLedgerVO.getCzr()) && jyzlLedgerVO.getCzr().trim().length()>0){
				sql.append(" and t.czr like ?");
				params.add("%" + jyzlLedgerVO.getCzr()+ "%");
			}
			if(jyzlLedgerVO.getJydx()!=null && !"".equals(jyzlLedgerVO.getJydx()) && jyzlLedgerVO.getJydx().trim().length()>0){
				sql.append(" and t.jydx=?");
				params.add(jyzlLedgerVO.getJydx());
			}
			// 合同起始时间
			if (jyzlLedgerVO.getBegintime1() != null ) {
				params.add(jyzlLedgerVO.getBegintime1());
				sql.append(" and t.htqsrq >= ? ");
			}
			if (jyzlLedgerVO.getBegintime2() != null ) {
				params.add(jyzlLedgerVO.getBegintime2());
				sql.append(" and t.htqsrq < ? ");
			}
			// 合同到期时间
			if (jyzlLedgerVO.getEndtime1() != null) {
				params.add(jyzlLedgerVO.getEndtime1());
				sql.append(" and t.htdqrq >= ? ");
			}
			if (jyzlLedgerVO.getEndtime2() != null) {
				params.add(jyzlLedgerVO.getEndtime2());
				sql.append(" and t.htdqrq < ? ");
			}
//			if(jyzlLedgerVO.getSfzxwb()!=null && !"".equals(jyzlLedgerVO.getSfzxwb()) && jyzlLedgerVO.getSfzxwb().trim().length()>0){
//				sql.append(" and t.jydx=?");
//				params.add(jyzlLedgerVO.getSfzxwb());
//			}
			if(jyzlLedgerVO.getGlr()!=null && !"".equals(jyzlLedgerVO.getGlr()) && jyzlLedgerVO.getGlr().trim().length()>0){
				sql.append(" and t.lrr=?");
				params.add(jyzlLedgerVO.getGlr());
			}
			sql.append(" order by t.id");
			PageableList pageableList =  this.publicDao.queryForList(sql.toString(), params,paginator);
			List queryList = pageableList.getResults();
			List<JyzlLedgerVO> resultList = new ArrayList();
			
			for (int i = 0; i < queryList.size(); i++) {
				
				Map map= (Map) queryList.get(i);
				
				JyzlLedgerVO jyzlLedger = new JyzlLedgerVO();
				String zcId = String.valueOf(map.get("zcId"));
				String htId = String.valueOf(map.get("htid"));
				String cardinfo = findcardInfoByzcID(zcId);
				String card[] =  cardinfo.split(",");
				if(card!=null&&card.length>0){
					jyzlLedger.setKpbh(card[0]);
					if(card.length==2){
						jyzlLedger.setCfdd(card[1]);
						jyzlLedger.setZlmjscwz(card[1]);
					}
				}
				jyzlLedger.setId(String.valueOf(map.get("htid")));
				jyzlLedger.setYjfh(checkString(findCateNameByParentId("department","438",String.valueOf(String.valueOf(map.get("ejdq"))))));
				jyzlLedger.setZcbh(String.valueOf(map.get("zcbh")));
				jyzlLedger.setZcmc(String.valueOf(map.get("zcmc")));
				String ybyzAndjzmj[] = this.getYbyzandJzmj(zcId).split(",");
				
				if(ybyzAndjzmj!=null&&ybyzAndjzmj.length>0){
					jyzlLedger.setYbyz(ybyzAndjzmj[0]);
					jyzlLedger.setZlmjyz(ybyzAndjzmj[0]);
					if(ybyzAndjzmj.length==2){
						jyzlLedger.setJzmj(ybyzAndjzmj[1]);
					}
				}
				jyzlLedger.setCzr(String.valueOf(checkString(map.get("czr"))));
//				jyzlLedger.setZlmjyz(String.valueOf(map.get("ybyz")));
//				jyzlLedger.setZlmjscwz(String.valueOf(map.get("ybyz")));
				
				jyzlLedger.setCzsl(String.valueOf(map.get("czsl")));
				jyzlLedger.setJyfl(String.valueOf(this.findCoteNameByCoteKey("ASSET_MANAGE_TYPE",checkString(map.get("c_jyfl")))));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					if(map.get("htqsrq")!=null){
						jyzlLedger.setHtqsrq(sdf.parse(String.valueOf(map.get("htqsrq"))));
					}
					if(map.get("htdqrq")!=null){
						jyzlLedger.setHtdqrq(sdf.parse(String.valueOf(map.get("htdqrq"))));
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
				jyzlLedger.setZlyt(String.valueOf(map.get("zlyt")));
				String jz = this.findjdzjByhtId(htId);
				String jzxx[] = jz.split(",");
				if(jzxx!=null&&jzxx.length>0){
					jyzlLedger.setYzj(jzxx[0]==null?"":jzxx[0]);
					String czsl = String.valueOf(map.get("czsl"));
					if(jzxx[0]!=null&&!"".equals(jzxx[0])&&czsl!=null&&!"".equals(czsl)){
						BigDecimal   b   =   new   BigDecimal(Double.valueOf(jzxx[0])/Double.valueOf(czsl)); 
						double   f1   =   b.setScale(2,   BigDecimal.ROUND_HALF_UP).doubleValue(); 
						jyzlLedger.setYsfbz(String.valueOf(f1));
					}
					if(jzxx.length==2){
						jyzlLedger.setNzjjg(jzxx[1]==null?"":jzxx[1]);
					}
				}
				jyzlLedger.setJsfs(switchJsfs(String.valueOf(map.get("jsfs"))));
				jyzlLedger.setYswsje(String.valueOf(map.get("ysws")));
				jyzlLedger.setBnssje(this.findbnsyByhtId(htId));
				jyzlLedger.setSszje(String.valueOf(map.get("sszj")));
				try {
					if(map.get("htdqrq") != null){
						if(sdf.parse(String.valueOf(map.get("htdqrq"))).getTime() > new Date().getTime()){
							jyzlLedger.setSfzxwb("否");
						}else{
							jyzlLedger.setSfzxwb("是");
						}
					}else{
						jyzlLedger.setSfzxwb("合同无到期日期");
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
//				
				jyzlLedger.setJydx(switchJydx(String.valueOf(map.get("jydx"))));
				jyzlLedger.setGlr(String.valueOf(map.get("lrr")));
				resultList.add(jyzlLedger);
			}

			return resultList;
	}
	private String findcardInfoByzcID(String zcId){
		String result = "";
		StringBuffer sql=new StringBuffer();
		sql.append("select c.cardcode ,c.saveadsress from jyzc_xx z,card_asset_history h,cardinfo c where z.id =h.zczsb_id and h.kp_id=c.id and  h.sfwzkp='1' and z.id=?");
		List list =  this.publicDao.queryForList(sql.toString(), new String[]{zcId});
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				Map map= (Map) list.get(i);
				String cardcode = String.valueOf(map.get("cardcode"));
				String saveadsress = String.valueOf(map.get("saveadsress"));
				result = cardcode + "," + saveadsress;
			}
		}
		return result;
		
	}
	private String findjdzjByhtId(String htId){
		String yzj = "";
		Double nzj =new Double(0);
		String result ="";
		List list = new ArrayList();
		StringBuffer hql=new StringBuffer();
		hql.append(" from JjzcHtJdzj h where h.htId = ?");
		list =  this.publicDao.find(hql.toString(), new String[]{htId});
		Date date = new Date();
		Date endYear = new Date(date.getYear(),11,31,23,59,59);
		Date starYear = new Date(date.getYear(),0,1,0,0,0);
		for(int i=0 ; i<list.size();i++){
			JjzcHtJdzj jjzcHtJdzj = (JjzcHtJdzj) list.get(i);
			if(jjzcHtJdzj.getKsrq()!=null&&jjzcHtJdzj.getJsrq()!=null&&jjzcHtJdzj.getKsrq().getTime()<=date.getTime()&&jjzcHtJdzj.getJsrq().getTime()>=date.getTime()){
				yzj = jjzcHtJdzj.getYzj().toString();
			}
			if(jjzcHtJdzj.getYzj()!=null&&!"".equals(jjzcHtJdzj.getYzj())){
				if(starYear.after(jjzcHtJdzj.getKsrq())||starYear.getTime()==jjzcHtJdzj.getKsrq().getTime()){
					if(starYear.after(jjzcHtJdzj.getJsrq())){
						
					}else if(endYear.before(jjzcHtJdzj.getJsrq())||endYear.getTime()==jjzcHtJdzj.getJsrq().getTime()){
						nzj += jjzcHtJdzj.getYzj()*12;
					}else if(endYear.after(jjzcHtJdzj.getJsrq())){
						nzj += ((jjzcHtJdzj.getJsrq().getTime()-starYear.getTime())/(24*60*60*1000))*jjzcHtJdzj.getYzj()/30;
					}
				}else if(starYear.before(jjzcHtJdzj.getKsrq())){
					if(endYear.before(jjzcHtJdzj.getKsrq())){
						
					}else if(endYear.before(jjzcHtJdzj.getJsrq())){
						nzj += ((endYear.getTime()-jjzcHtJdzj.getKsrq().getTime())/(24*60*60*1000))*jjzcHtJdzj.getYzj()/30;
					}else if(endYear.after(jjzcHtJdzj.getJsrq())){
						nzj += ((jjzcHtJdzj.getJsrq().getTime()-jjzcHtJdzj.getKsrq().getTime())/(24*60*60*1000))*jjzcHtJdzj.getYzj()/30;
					}
				}
			}
		}
		if(nzj.equals(new Double(0))){
			result = yzj+",";
		}else{
			BigDecimal ee = new BigDecimal(nzj);
			result = yzj+","+ee.setScale(2, BigDecimal.ROUND_HALF_UP).toPlainString();
		}
		return result;
		
	}
	private String findbnsyByhtId(String htId){
		Double bnss =new Double(0);
		List list = new ArrayList();
		List params = new ArrayList();
		String sszj ="";
		StringBuffer hql=new StringBuffer();
		hql.append("select distinct h from JjzcHtqsHead j, JyzcHtqsBody h ,BizBackConfirmBody y ,BizBackConfirmHead b,BizBackCashInfo c where j.id =h.cldId and   h.htId = ? and j.qspc =y.qsPc and y.headid = b.id and b.cashid = c.id and b.sfzzhk='是' and to_char(c.dzrq,'yyyy')=? ");
		params.add(htId);
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String end= sdf.format(date);
		String year = end.substring(0, 4);
		params.add(year);
		list =  this.publicDao.find(hql.toString(), params);
		for(int i =0;i<list.size();i++){
			JyzcHtqsBody htqs = (JyzcHtqsBody) list.get(0);
			if(htqs.getSszj()!=null){
				bnss +=htqs.getSszj();
			}
		}
		BigDecimal bg = new BigDecimal(bnss);
		sszj = bg.setScale(2,BigDecimal.ROUND_HALF_UP).toPlainString();
		return sszj;
		
	}
	//转换结算方式
	public String switchJsfs(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "月付";
		}else if("2".equals(key)){
			returnStr = "季付";
		}else if("3".equals(key)){
			returnStr = "年付";
		}else if("4".equals(key)){
			returnStr = "其他";
		}
		return returnStr;
	} 
	//转换结算方式
	public String switchJydx(String key){
		String returnStr = "";
		if("1".equals(key)){
			returnStr = "建行";
		}else if("2".equals(key)){
			returnStr = "非建行";
		}
		return returnStr;
	} 
	//根据卡片编号查询资产
	private List findzcIdBykpbh(String kpbh){
		List param = new ArrayList();
		List  list = new ArrayList();
		List result = new ArrayList();
		param.add("%" + kpbh + "%");
		StringBuffer hql=new StringBuffer();
		hql.append(" from Cardinfo t where t.cardcode like ?");
		result =  this.publicDao.find(hql.toString(), param);
		for(int i=0 ;i<result.size();i++){
			Cardinfo carinfo = (Cardinfo) result.get(i);
			if(carinfo.getZcid()!=null){
				list.add(carinfo.getZcid());
			}
		}
		return list;
		
	}
	@SuppressWarnings("unchecked")
	public String getYbyzandJzmj(String id) {
		List<Cardinfo> cardinfoList;
		String hql = "select o.kpId from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0'   and o.spzt = '2'";
		String KPHQL = "from Cardinfo t where t.id=? ";
		Object[] params = new Object[] { id };
		List pkIdList = publicDao.find(hql, params);
		Double ybyz = new Double(0);
		Double jzmj = new Double(0);
		if (pkIdList != null) {
			for (int i = 0; i < pkIdList.size(); i++) {
				Long  pkId =  Long.valueOf(pkIdList.get(i).toString()) ;
				List param = new ArrayList();
				param.add(pkId);
				Cardinfo cardinfo  = (Cardinfo) publicDao.findSingleResult(KPHQL, param);
				if(cardinfo!=null){
					if(cardinfo.getYbyz()!=null){
						ybyz += cardinfo.getYbyz();
					}
					if(cardinfo.getJzmj()!=null){
						jzmj += Double.valueOf(cardinfo.getJzmj());
					}
				}
			}
			BigDecimal b = new BigDecimal(ybyz);
			BigDecimal c = new BigDecimal(jzmj);
			return  b.setScale(2,   BigDecimal.ROUND_HALF_UP).toPlainString()+","+c.setScale(2,   BigDecimal.ROUND_HALF_UP).toPlainString();
		} else {
			return "";
		}

	}

}
