package com.tansun.eam2.cjtz.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICzCztzfaXxService;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.service.IContractBS;
import com.tansun.eam2.jygdzc.vo.AssetCardVO;
import com.tansun.eam2.jygdzc.vo.JygdzcRcglVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Service
public class CzCztzfaXxServiceImpl extends CommonBSImpl implements ICzCztzfaXxService {

	@Autowired
	private PublicDao dao;
	@Autowired
	private IContractBS bs;
	@Autowired
	private IAssetBS assetbs;
	public CzCztzfaXx getCzCztzfaXxById(String id) {
		return (CzCztzfaXx) dao.findSingleResult("from CzCztzfaXx x where x.id = ?", new Object[]{id});
	}

	public void saveOrUpdateCzCztzfaXx(CzCztzfaXx czCztzfaXx) {
	}

	
	public void save (CommonBO bo){
		dao.save(bo);
	}
	
	public void update(CommonBO bo){
		dao.update(bo);
	}
	
	public void delete(CommonBO bo){
		dao.delete(bo);
	}
	
	/**
	 * 保存表体,根据表头id 选择资产ids
	 * 
	 * @return
	 */
	public void saveBody(String zcIds, String headId){
		List list = new ArrayList();
		if(zcIds!=null&&zcIds.length()>0){
			if(zcIds.startsWith(",")){
				zcIds.substring(1);
			}
			String[]zcids = zcIds.split(",");
			for (int i = 0; i < zcids.length; i++) {
				JyzcXx xx = this.getJyZcXxById(zcids[i]);
				List cardVOList = assetbs.getAssetCardVOByzcId(xx.getId(),new Paginator());// 根据信息表的id查到主卡片信息
				String zcbh = "";
				String zcmc = "";
				double yz = 0.0;
				String zkpbh = "";
				String zkpmc = "";
				String ysynx = "";
				String sksynx = "";
				String glbm = "";
				String sybm = "";
				AssetCardVO cardvo = null;
				if (cardVOList.size() > 0) {
					cardvo = (AssetCardVO) cardVOList.get(0);
					yz += cardvo.getYz(); // 原值
					if ("1".equals(cardvo.getSfwzkp().trim())) {
						zkpbh = cardvo.getCardcode(); // 主卡片编号
						zkpmc = cardvo.getZcname(); // 主卡片名称
						String synx = cardvo.getSynx();
						Date ksdate = cardvo.getKsdate();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
						int jinnian = Integer.parseInt(sdf.format(new Date()));// 今年
						int kadate1 = Integer.parseInt(sdf.format(ksdate)); // 开始使用年
						int ksynx = Integer.parseInt(synx); // 可使用年限
						ysynx = String.valueOf(jinnian - kadate1); // 已使用年限
						sksynx = String.valueOf(ksynx - (jinnian - kadate1)); // 尚可使用年限
						glbm = cardvo.getGlbm();
						sybm = cardvo.getUsepartment();
					}
				}
				CzZcXx czZcXx = new CzZcXx();
				zcbh = xx.getZcbh();
				zcmc = xx.getZcmc();
				czZcXx.setAzcid(xx.getId());
				czZcXx.setAcZcdq(assetbs.findCoteNameByCoteKey("PROVIENCE", xx.getCZcdq()));
				czZcXx.setAzcbh(zcbh);
				czZcXx.setAzcmc(zcmc);
				czZcXx.setAzkpbh(zkpbh);
				czZcXx.setAzkpmc(zkpmc);
				czZcXx.setCldId(headId);
				czZcXx.setAysynx(ysynx);
				czZcXx.setAsksynx(sksynx);
				czZcXx.setAzcglbm(glbm);
				czZcXx.setAzcglbmmc(this.getIndividualtreeByNodeValue(glbm));
				czZcXx.setAzcsybm(sybm);
				czZcXx.setAzcsybmmc(this.getIndividualtreeByNodeValue(sybm));
				dao.save(czZcXx);
			}
		}
	}
	
	/**
	 * 得到固定资产的列表
	 * @return
	 */
	public String getGdzcList(String headId){
		String sql = "from CzZcXx x where x.cldId = ?";
		List list = this.dao.find(sql, new Object[]{headId});
		String returnStr = "";
		returnStr = BodyListToJSON.getJSON(list, 1, 1, 100000);
		return returnStr;
	}
	
	/**
	 * 根据id查询资产信息
	 * @param id
	 * @return
	 */
	public JyzcXx getJyZcXxById(String id){
		String sql = "from JyzcXx x where x.id=?";
		return (JyzcXx) this.dao.findSingleResult(sql, new Object[]{id});
	}
	
	/**
	 * 根据资产ID 找到相应的费用信息
	 * 
	 * @param zcId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getJyzcSqsdfyXxByZcId(String zcId,String cldId) {
		if(zcId.startsWith(",")){
			zcId = zcId.substring(1);
		}
		String hql = "from JyzcSqsdfyXx fy where fy.zcId = ? and fy.cldId = ?";
		List resultList = this.dao.find(hql, new Object[] { zcId ,cldId});
		return resultList;
	}
	
	/**
	 * 选择资产后转换为处置资产信息
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxByZcId(String zcIds){
		JyzcXx zc = this.getJyZcXxById(zcIds);
		CzZcXx cz = new CzZcXx();
		cz.setAzcid(zc.getId());
		cz.setAzcbh(zc.getZcbh());
		cz.setAzcmc(zc.getZcmc());
		cz.setAcJyfl(zc.getCJyfl());
		cz.setAcZczc(zc.getCZczc());
		cz.setAcZcdq(zc.getCZcdq());
		cz.setAcYt(zc.getCYt());
		List cardVOList = assetbs.getAssetCardVOByzcId(zc.getId(),new Paginator());// 根据信息表的id查到主卡片信息
		AssetCardVO cardvo = null;
		if (cardVOList.size() > 0) {
			cardvo = (AssetCardVO) cardVOList.get(0);
			if ("1".equals(cardvo.getSfwzkp().trim())) {
				//cz.setZcglbm(cardvo.getGlbm());
				cz.setAzcglbm(cardvo.getGlbm());
				//cz.setZcsybm(cardvo.getUsepartment());
				cz.setAzcsybm(cardvo.getUsepartment());
				//cz.setZcglbmmc(this.getIndividualtreeByNodeValue(cardvo.getGlbm()));
				cz.setAzcglbmmc(this.getIndividualtreeByNodeValue(cardvo.getGlbm()));
				//cz.setZcsybmmc(this.getIndividualtreeByNodeValue(cardvo.getUsepartment()));
				cz.setAzcsybmmc(this.getIndividualtreeByNodeValue(cardvo.getUsepartment()));
			}
		}
		return cz;
	}
	
	public String getIndividualtreeByNodeValue(String value) {
		String sql = "SELECT T.CATEGORYNAME FROM INDIVIDUALTREE T WHERE T.TREETYPE='department'AND  T.NODEVALUE=?";
		List list = this.dao.queryForList(sql, new Object[] { value });
		String s = "";
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			s = (String) map.get("categoryname");
		}
		return s;
	}
	
	/**
	 * 处置承继投资添加，及申请审定费用表添加
	 * 
	 * @return
	 */
	public void addFy(String headId, CzZcXx czZcXx, String[] xmmcs,
			String[] sqjes, String[] sdjes){
		if(czZcXx.getId()!=null&&!"".equals(czZcXx.getId())){
			this.update(czZcXx);
			this.deleteJyzcSqsdfyXxByZcId(czZcXx.getId(),headId);
		}else{
			czZcXx.setCldId(headId);
			this.save(czZcXx);
		}
		double sqje = 0.0;
		double sdje = 0.0;
		if (xmmcs != null && xmmcs.length > 0) {
			for (int i = 0; i < xmmcs.length; i++) {
				JyzcSqsdfyXx jyzcSqsdfyXx = new JyzcSqsdfyXx();
				jyzcSqsdfyXx.setXmmc(xmmcs[i]);
				String sqje1 = sqjes[i].trim();
				String sdje1 = sdjes[i].trim();
				jyzcSqsdfyXx.setSqje(Double.parseDouble(sqje1.length() > 0 ? sqje1 : "0"));
				jyzcSqsdfyXx.setSdje(Double.parseDouble(sdje1.length() > 0 ? sdje1 : "0"));
				jyzcSqsdfyXx.setZcId(czZcXx.getId());
				jyzcSqsdfyXx.setCldId(headId);// 处理单id
				jyzcSqsdfyXx.setSpzt("0");
				this.save(jyzcSqsdfyXx);
				sqje +=jyzcSqsdfyXx.getSqje();
				sdje +=jyzcSqsdfyXx.getSdje();
			}
		}
		czZcXx.setAsqje(sqje);
		czZcXx.setAsdje(sdje);
		this.update(czZcXx);
	}
	
	/**
	 * 先删除已添加的申请审定信息明细
	 * @param id 
	 * lantianbo
	 */
	public void deleteJyzcSqsdfyXxByZcId(String id,String headId) {
		String sql = "delete from jyzc_sqsdfy_xx t where t.zc_id = '" + id+ "' and t.CLD_ID = '"+headId+"'";
		dao.getJdbcTemplate().execute(sql);

	}
	

	/**
	 * 根据id删除body
	 * @param zcIds
	 */
	public void deleteBody(String zcIds,String headId){
		if(zcIds!=null&&zcIds.length()>0){
			if(zcIds.startsWith(",")){
				zcIds.substring(1);
			}
			String []zcids = zcIds.split(",");
			StringBuffer sb = new StringBuffer("");
			sb.append(" in ( ");
			for(int i=0;i<zcids.length;i++){
				if(i==zcids.length-1){
					sb.append("'"+zcids[i]+"')");
				}else{
					sb.append("'"+zcids[i]+"',");
				}
			}
			String delSql1 = "DELETE FROM CZ_ZC_XX A WHERE A.ID "+sb.toString();
			String delSql2 = "DELETE FROM jyzc_sqsdfy_xx A WHERE A.zc_ID "+sb.toString();
			this.dao.getJdbcTemplate().execute(delSql1);
			this.dao.getJdbcTemplate().execute(delSql2);
		}
	}
	
	/**
	 * 修改body
	 * @param zcIds
	 * @return
	 */
	public CzZcXx getCzZcXxById(String zcIds){
		if(zcIds.startsWith(",")){
			zcIds = zcIds.substring(1);
		}
		String sql = "from CzZcXx x where x.id = ?";
		return (CzZcXx) dao.findSingleResult(sql, new Object[]{zcIds});
	}
	
	/**
	 * 保存租赁表体
	 * @param czZcXx
	 * @param headId
	 */
	public void saveBody(CzZcXx czZcXx, String headId){
		czZcXx.setCldId(headId);
		if(czZcXx.getId()!=null&&!"".equals(czZcXx.getId())){
			dao.update(czZcXx);
		}else{
			dao.save(czZcXx);
		}
	}
	
	/**
	 * 实体承继投资审批，即业务类型为实体的审批单
	 * @param czCztzfaXx
	 * @param czstcztz
	 */
	public void updateSt(CzCztzfaXx czCztzfaXx, CzStcztz czstcztz){
		czstcztz.setCzxmmc(czCztzfaXx.getCztzxmmc());
		czstcztz.setBianhao(czCztzfaXx.getBianhao());
		czstcztz.setJhcd(czCztzfaXx.getJhcd());
		czstcztz.setNgrq(czCztzfaXx.getNgrq());
		czstcztz.setNgbm(czCztzfaXx.getNgbm());
		czstcztz.setNgbmmc(czCztzfaXx.getNgbmmc());
		czstcztz.setNgr(czCztzfaXx.getNgr());
		czstcztz.setNgrxm(czCztzfaXx.getNgrxm());
		czstcztz.setLxdh(czCztzfaXx.getLxdh());
		czstcztz.setTzywlx(czCztzfaXx.getCTzywlx());
		czstcztz.setCzsbfs(czCztzfaXx.getCzsbfs());
		czstcztz.setBeizhu(czCztzfaXx.getBeizhu());
		czstcztz.setHqbm(czCztzfaXx.getHqbm());
		czstcztz.setHqbmid(czCztzfaXx.getHqbmid());
		if(czstcztz.getId()!=null&&!"".equals(czstcztz.getId())){
			this.update(czstcztz);
		}else{
			this.save(czstcztz);
		}
	}
	
	/**
	 * 根据id查询实体信息
	 * @param headId
	 * @return
	 */
	public CzStcztz getCzStcztzById(String headId){
		String sql  = "from CzStcztz z where z.id = ?";
		return (CzStcztz) this.dao.findSingleResult(sql, new String[]{headId});
	}
}
