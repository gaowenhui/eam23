package com.tansun.eam2.kpgl.service.impl;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.DicAppAssetState;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.kpgl.KpglCommon;
import com.tansun.eam2.kpgl.service.ICardCommonBS;
import com.tansun.eam2.kpgl.service.ICardQueryBS;
import com.tansun.eam2.kpgl.vo.BodyListVO;
import com.tansun.eam2.kpgl.vo.CardListInfoVO;
import com.tansun.eam2.kpgl.vo.CardQueryVO;
import com.tansun.eam2.zyzc.vo.CardVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

/**
 * 
 * @author liubeibei
 * @date 2010-11-12 卡片查询
 */
@Service
public class CardQueryBSImpl implements ICardQueryBS {

	@Autowired
	private PublicDao publicDao;
	@Autowired
	private ICodeGenerator codeGenerator;
	@Autowired
	private ICardCommonBS bs;
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	public List<CardListInfoVO> queryforAsset(CardQueryVO queryVO, Paginator paginator){
		StringBuffer sql = new StringBuffer();
		List params = new ArrayList();
		sql.append("select * from Cardinfo o where o.state in('01','02')");
		//卡片编号
		if (queryVO.getCardcode() != null
				&& queryVO.getCardcode().trim().length() > 0) {
			params.add("%"+queryVO.getCardcode().trim()+"%");
			sql.append(" and o.cardcode like ? ");
		}
		// 卡片名称
		if (queryVO.getZcname() != null
				&& queryVO.getZcname().trim().length() > 0) {
			params.add("%"+ queryVO.getZcname().trim() +"%");
			sql.append(" and o.zcname like ? ");
		}
		// 卡片类型，卡片信息中对应parentid
		if (queryVO.getKplx() != null && queryVO.getKplx().trim().length() > 0) {
			params.add(queryVO.getKplx().trim());
			sql.append(" and o.parentid = ? ");
		}
		// 是否继承
		if (queryVO.getIfjc() != null && queryVO.getIfjc().trim().length() > 0) {
			params.add(queryVO.getIfjc().trim());
			sql.append(" and o.ifjc = ? ");
		}
		// 管理部门
		if (queryVO.getGlbm() != null && queryVO.getGlbm().trim().length() > 0) {
			params.add(queryVO.getGlbm().trim());
			sql.append(" and o.glbm = ? ");
		}
		// 使用部门
		if (queryVO.getUsepartment() != null
				&& queryVO.getUsepartment().trim().length() > 0) {
			params.add(queryVO.getUsepartment().trim());
			sql.append(" and o.usepartment = ? ");
		}
		// 入帐科目
		if (queryVO.getRzkm() != null && queryVO.getRzkm().trim().length() > 0) {
			params.add(queryVO.getRzkm().trim());
			sql.append(" and o.rzkm = ? ");
		}
		//是否自用
		if (queryVO.getSfzy() != null && queryVO.getSfzy().trim().length() > 0) {
			params.add(queryVO.getSfzy().trim());
			sql.append("and o.sfzy = ?");
		}
		// 一级分行
//		if (queryVO.getFirstbranch() != null
//				&& queryVO.getFirstbranch().trim().length() > 0) {
//			String[] nodeValues = queryVO.getFirstbranch().split(",");
//			sql.append(" and ( ");
//			for(int i=0;i<nodeValues.length;i++){
//				if(i==nodeValues.length-1){
//					sql.append(" o.firstbranch = '"+nodeValues[i]+"'  ");
//				}else{
//					sql.append(" o.firstbranch = '"+nodeValues[i]+"'  or  ");
//				}
//			}
//			sql += " ) ";
//		}
		sql.append("order by o.id asc");
		PageableList pageableList = this.publicDao.queryForList(sql.toString(), params, paginator);
		List queryList = pageableList.getResults();
		List<CardListInfoVO> resultList = new ArrayList<CardListInfoVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			CardListInfoVO tempVO = new CardListInfoVO();
			tempVO.setId(Long.parseLong(String.valueOf(tempBO.get("ID"))));
			tempVO.setState(StatetoString(String.valueOf(tempBO.get("STATE"))));
			tempVO.setCardcode((String) tempBO.get("CARDCODE"));
			tempVO.setZcname(String.valueOf(tempBO.get("ZCNAME")));
			tempVO.setSaveadsress(String.valueOf(tempBO.get("SAVEADSRESS")));
			tempVO.setKplx(String.valueOf(this.findCoteNameByCoteKey("CARD_TYPE",String.valueOf(tempBO.get("PARENTID")))));
			tempVO.setGlbm(findCateNameByNodeValue("department", String.valueOf(tempBO.get("GLBM"))));
			tempVO.setUsepartment(findCateNameByNodeValue("department",String.valueOf(tempBO.get("USEPARTMENT"))));
			tempVO.setFirstbranch(findCateNameByParentId("department","438",String.valueOf(tempBO.get("FIRSTBRANCH"))));
			resultList.add(tempVO);
		}
		return resultList;
	}
	public String StatetoString(String num){
		String state = "";
		if("01".equals(num)||"02".equals(num)){
			state="在役";
		}else if("03".equals(num)){
			state="退役";
		}
		return state;
	}
	/**
	 * 卡片查询，查询结果由List<CardListInfoVO>转化为json串
	 * 
	 * @param paginator分页器
	 * @param queryVO
	 *            查询VO,其中特殊条件
	 * @param startLRTime
	 *            录入时间（大于等于startLRTime 小于等于endLRTime）格式为MM/dd/yyyy
	 * @param endLRTime
	 *            录入时间（大于等于startLRTime 小于等于endLRTime）格式为MM/dd/yyyy
	 * @param startKSTime
	 *            开始使用时间（大于等于startKSTime，小于等于endKSTime)格式为MM/dd/yyyy
	 * @param endKSTime
	 *            开始使用时间（大于等于startKSTime，小于等于endKSTime)格式为MM/dd/yyyy
	 * @return 查询结果 {"total" : "total的值","page" : "page的值","records" :
	 *         "records的值","rows" : [{id: '卡片id的值',cardcode: '卡片编号的值',zcname:
	 *         '卡片名称的值',zcbh: '资产编号的值',zcmc: '资产名称的值',saveadsress:
	 *         '存放地点的值',usepartment: '使用部门的值',glbm:
	 *         '管理部门的值',fristbranch:'一级分行的值'},{...},{...}]}
	 *         其中total是一共多少页，page当前第几页，records一共多少条数据
	 */
	@SuppressWarnings("unchecked")
	public String query(CardQueryVO queryVO, Paginator paginator) {
		// 拼接查询语句
		String sql = " select distinct * from ( select distinct o.*, jyzc.zcmc, jyzc.zcbh from Cardinfo o left join Jyzc_Xx jyzc on o.zcid = jyzc.id where o.sfzy = '0'  union all select  a.*, zyzc.zcmc, zyzc.zcbh from Cardinfo a left  join Zy_Zc zyzc on a.zcid = zyzc.zc_Id where  a.sfzy = '1' ) o where 1=1  ";
		String conditionHql = this.prepareHql(queryVO);
		sql += conditionHql;
		List<Object> list = new ArrayList();//this.prepareParam(queryVO);
		
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql, list,
				paginator);
		List queryList = pageableList.getResults();
		List<CardListInfoVO> resultList = new ArrayList<CardListInfoVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			CardListInfoVO tempVO = new CardListInfoVO();
			tempVO.setId(Long.parseLong(String.valueOf(tempBO.get("ID"))));
			tempVO.setCardcode((String) tempBO.get("CARDCODE"));
			tempVO.setZcname(String.valueOf(tempBO.get("ZCNAME")));
			tempVO.setZcbh(String.valueOf(tempBO.get("ZCBH")));
			tempVO.setZcmc(String.valueOf(tempBO.get("ZCMC")));//ZCMC 无数据
			tempVO.setKplx(String.valueOf(this.findDicNameByDicPK("cardType",String.valueOf(tempBO.get("PARENTID")))));
			tempVO.setState(String.valueOf(this.getState(String.valueOf(tempBO.get("STATE")))));
			tempVO.setSaveadsress(String.valueOf(tempBO.get("SAVEADSRESS")));
			tempVO.setIfjc(String.valueOf("1".equals(tempBO.get("IFJC"))?"否":"是"));
			tempVO.setSfzy(String.valueOf("0".equals(tempBO.get("SFZY"))?"否":"是"));
			tempVO.setGlbm(findCateNameByNodeValue("department", String.valueOf(tempBO.get("GLBM"))));
			tempVO.setUsepartment(findCateNameByNodeValue("department",String.valueOf(tempBO.get("USEPARTMENT"))));
			tempVO.setFirstbranch(findCateNameByParentId("department","438",String.valueOf(tempBO.get("FIRSTBRANCH"))));
			resultList.add(tempVO);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}

	private String getState(String object) {
		if("01".equals(object)){
			return "正在使用";
		}else if("02".equals(object)){
			return "空闲状态";
		}else if("03".equals(object)){
			return "退役";
		}else return "";
	}

	// 拼接查询语句
	private String prepareHql(CardQueryVO queryVO) {
		String hql = "";
		// 卡片编号
		if (queryVO.getCardcode() != null
				&& queryVO.getCardcode().trim().length() > 0) {
			hql += " and o.cardcode like '%"+queryVO.getCardcode()+"%' ";
		}
		// 卡片名称
		if (queryVO.getZcname() != null
				&& queryVO.getZcname().trim().length() > 0) {
			hql += " and o.zcname like '%"+queryVO.getZcname()+"%' ";
		}
		// 卡片类型，卡片信息中对应parentid
		if (queryVO.getKplx() != null && queryVO.getKplx().trim().length() > 0) {
			hql += " and o.parentid = '"+queryVO.getKplx()+"' ";
		}
		// 是否继承
		if (queryVO.getIfjc() != null && queryVO.getIfjc().trim().length() > 0) {
			hql += " and o.ifjc = '"+queryVO.getIfjc()+"' ";
		}
		// 管理部门
		if (queryVO.getGlbm() != null && queryVO.getGlbm().trim().length() > 0) {
			hql += " and o.glbm = '"+queryVO.getGlbm()+"' ";
		}
		// 使用部门
		if (queryVO.getUsepartment() != null
				&& queryVO.getUsepartment().trim().length() > 0) {
			hql += " and o.usepartment = '"+queryVO.getUsepartment()+"' ";
		}
		// 入帐科目
		if (queryVO.getRzkm() != null && queryVO.getRzkm().trim().length() > 0) {
			hql += " and o.rzkm = '"+queryVO.getRzkm()+"' ";
		}
		// 卡片状态
		if (queryVO.getState() != null
				&& queryVO.getState().trim().length() > 0) {
			hql += " and o.state = '"+queryVO.getState()+"' ";
		}
		// 一级分行
		if (queryVO.getFirstbranch() != null
				&& queryVO.getFirstbranch().trim().length() > 0) {
			String[] nodeValues = queryVO.getFirstbranch().split(",");
			hql += " and ( ";
			for(int i=0;i<nodeValues.length;i++){
				if(i==nodeValues.length-1){
					hql += " o.firstbranch = '"+nodeValues[i]+"'  ";
				}else{
					hql += " o.firstbranch = '"+nodeValues[i]+"'  or  ";
				}
			}
			hql += " ) ";
		}
		// 资产编号
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			hql += " and (o.ZCID like '%"+queryVO.getZcbh()+"%' or o.zcbh like '%"+queryVO.getZcbh()+"%') ";
		}
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			hql += " and (o.ZCNAME like '%"+queryVO.getZcmc()+"%' or o.zcmc like '%"+queryVO.getZcmc()+"%') ";
		}
		// 从 录入时间 Date
		if (queryVO.getStartLRTime() != null
				&& queryVO.getStartLRTime().trim().length() > 0) {
			hql += " and o.lrrq >= '"+queryVO.getStartLRTime()+"' ";
		}
		// 到 录入时间 Date
		if (queryVO.getEndLRTime() != null
				&& queryVO.getEndLRTime().trim().length() > 0) {
			hql += " and o.lrrq <= '"+queryVO.getEndLRTime()+"' ";
		}
		// 从 启用时间 String
		if (queryVO.getStartQYTime() != null
				&& queryVO.getStartQYTime().trim().length() > 0) {
			hql += " and o.qydate >= '"+queryVO.getStartQYTime()+"' ";
		}
		// 到 启用时间 String
		if (queryVO.getEndQYTime() != null
				&& queryVO.getEndQYTime().trim().length() > 0) {
			hql += " and o.qydate <= '"+queryVO.getEndQYTime()+"' ";
		}
		// 录入人
		if (queryVO.getYxtlry() != null
				&& queryVO.getYxtlry().trim().length() > 0) {
			hql += " and o.yxtlry = '"+queryVO.getYxtlry()+"' ";
		}
		// 存放地点
		if (queryVO.getSaveadsress() != null
				&& queryVO.getSaveadsress().trim().length() > 0) {
			hql += " and o.saveadsress like '%"+queryVO.getSaveadsress()+"%' ";
		}
		// 是否自用
		if (queryVO.getSfzy() != null && queryVO.getSfzy().trim().length() > 0) {
			hql += " and o.sfzy = '"+queryVO.getSfzy()+"' ";
		}
		hql += " order by o.cardcode asc";
		return hql;
	}

	// 拼接查询语句
	private List<Object> prepareParam(CardQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 卡片编号
		if (queryVO.getCardcode() != null
				&& queryVO.getCardcode().trim().length() > 0) {
			list.add("%" + queryVO.getCardcode() + "%");
		}
		// 卡片名称
		if (queryVO.getZcname() != null
				&& queryVO.getZcname().trim().length() > 0) {
			list.add("%" + queryVO.getZcname() + "%");
		}
		// 卡片类型，卡片信息中对应parentid
		if (queryVO.getKplx() != null && queryVO.getKplx().trim().length() > 0) {
			list.add(queryVO.getKplx());
		}
		// 是否继承
		if (queryVO.getIfjc() != null && queryVO.getIfjc().trim().length() > 0) {
			list.add(queryVO.getIfjc());
		}
		// 管理部门
		if (queryVO.getGlbm() != null && queryVO.getGlbm().trim().length() > 0) {
			list.add(queryVO.getGlbm());
		}
		// 使用部门
		if (queryVO.getUsepartment() != null
				&& queryVO.getUsepartment().trim().length() > 0) {
			list.add(queryVO.getUsepartment());
		}
		// 入帐科目
		if (queryVO.getRzkm() != null && queryVO.getRzkm().trim().length() > 0) {
			// 根据入账科目查询出入账科目编号
			// 
			list.add(queryVO.getRzkm());
		}
		// 卡片状态
		if (queryVO.getState() != null
				&& queryVO.getState().trim().length() > 0) {
			list.add(queryVO.getState());
		}
		// 一级分行
//		if (queryVO.getFirstbranch() != null
//				&& queryVO.getFirstbranch().trim().length() > 0) {
//			String[] nodeValues = queryVO.getFirstbranch().split(",");
//			for(int i=0;i<nodeValues.length;i++){
//				list.add(nodeValues[i]);
//			}
//		}
		// 资产编号
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			list.add("%" + queryVO.getZcbh() + "%");
			list.add("%" + queryVO.getZcbh() + "%");
		}
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			list.add("%" + queryVO.getZcmc() + "%");
			list.add("%" + queryVO.getZcmc() + "%");
		}
		// 从 录入时间 Date
		if (queryVO.getStartLRTime() != null
				&& queryVO.getStartLRTime().trim().length() > 0) {
			list.add(queryVO.getStartLRTime());
		}
		// 到 录入时间 Date
		if (queryVO.getEndLRTime() != null
				&& queryVO.getEndLRTime().trim().length() > 0) {
			list.add(queryVO.getEndLRTime());
		}
		// 从 启用时间 String
		if (queryVO.getStartQYTime() != null
				&& queryVO.getStartQYTime().trim().length() > 0) {
			list.add(queryVO.getStartQYTime());
		}
		// 到 启用时间 String
		if (queryVO.getEndQYTime() != null
				&& queryVO.getEndQYTime().trim().length() > 0) {
			list.add(queryVO.getEndQYTime());
		}
		// 录入人
		if (queryVO.getYxtlry() != null
				&& queryVO.getYxtlry().trim().length() > 0) {
			list.add(queryVO.getYxtlry());
		}
		// 存放地点
		if (queryVO.getSaveadsress() != null
				&& queryVO.getSaveadsress().trim().length() > 0) {
			list.add("%" + queryVO.getSaveadsress() + "%");
		}
		// 是否自用
		if (queryVO.getSfzy() != null && queryVO.getSfzy().trim().length() > 0) {
			list.add(""+queryVO.getSfzy().trim()+"");
		}
		return list;
	}

	/**
	 * 根据nodeValue查询卡片类型id
	 * 
	 * @param nodeValue
	 * @return
	 */
	public Individualtree getColoNizeValue(String nodeValue) {
		String[] str = new String[1];
		str[0] = nodeValue;
		String hql = "from Individualtree where treetype = 'cardChangeWay' and categoryid = ? and leaf = '0'";
		return (Individualtree) publicDao.findSingleResult(hql, str);
	}

	/**
	 * 根据id 查询卡片类型
	 * 
	 * @param cateIds
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List getCardTypeList(String[] cateIds) {
		List cardTypeList = new ArrayList();
		for (int i = 0; i < cateIds.length; i++) {
			String hql = "from Individualtree i where i.categoryid = ?";
			Individualtree tree = new Individualtree();
			String str[] = new String[1];
			str[0] = cateIds[i];
			tree = (Individualtree) publicDao.findSingleResult(hql, str);
			cardTypeList.add(tree);
		}
		return cardTypeList;
	}

	/**
	 * 根据treeType和nodeValue查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByNodeValue(String treeType, String nodeValue) {
		String hql = "from Individualtree i where i.treetype = ? and i.nodevalue = ?";
		if (nodeValue != null && nodeValue.length() > 0) {
			String[] str = new String[2];
			str[0] = treeType;
			str[1] = nodeValue;
			Individualtree tree = new Individualtree();
			tree = (Individualtree) publicDao.findSingleResult(hql, str);
			String categoryname ="";
			if(tree!=null){
				categoryname = tree.getCategoryname();
			}
			
			return categoryname;
		} else {
			return "";
		}
	}
	
	/**
	 * 根据treeType和nodeValue和parentid查找cateName
	 * 
	 * @param treeType
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String treeType,String parentId,String nodeValue) {
		if(nodeValue==null||"null".equals(nodeValue.trim())){
			return "";
		}
		String sql = "select i.categoryname from individualtree i where i.treetype = '"+treeType+"' and " +
				"i.parentcategoryid = '"+parentId+"' and i.nodevalue = '"+nodeValue+"'";
		String categoryname = null;
		if (nodeValue != null && nodeValue.length() > 0) {
			categoryname = publicDao.getJdbcTemplate().queryForObject(sql, String.class);
			return categoryname;
		} else {
			return "";
		}
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
			String codeValue ="";
			if(tree!=null){
				codeValue = tree.getCodeValue();
			}
			return codeValue;
		} else {
			return "";
		}
	}
	
	/**
	 * 通过dicPK查找dicName
	 * @param dicType
	 * @param dicPK
	 * @return
	 */
	public String findDicNameByDicPK(String dicType,String dicPK){
		if(dicPK==null||dicType==null||"null".equals(dicPK.trim())){
			return "";
		}
		String hql = "from DicAppAssetState c where c.type = '"+dicType+"' and c.pkId = '"+Long.parseLong(dicPK)+"'";
		if (dicPK != null && dicPK.length() > 0) {
			DicAppAssetState tree = new DicAppAssetState();
			tree = (DicAppAssetState) publicDao.findSingleResult(hql,
					new ArrayList());
			String coteName = tree.getName();
			return coteName;
		} else {
			return "";
		}
	}
	
	/**
	 * @author Yanpeiling 2011-1-8
	 * 根据caSheadId（对应lc_cardtemp表中KPXZID的字段）和sbodid（对应zy_Sbody表中的Sbody_id）
	 * 到这两张表中查询出数据保存到VO中显示在界面上，sbodyId没有用了
	 * @param caSheadId
	 * @param sbodyId
	 * @return
	 */
	public List<CardVO> obtainBody4ZyKp(String caSheadId,String sbodyId){
		List<CardVO> CardVOList = new ArrayList<CardVO>();
//		String preparSQL = "select * from lc_cardtemp lc,zy_sbody zb where lc.kpxzid = ? and lc.zcid = zb.sbody_id and lc.zcid= ?";
		String preparSQL = "select * from lc_cardtemp lc,zy_sbody zb where lc.kpxzid = ? and lc.zcid = zb.sbody_id";
		List params = new ArrayList();
		params.add(caSheadId);
//		params.add(sbodyId);
		List<Map<String,Object>> tempList = publicDao.queryForList(preparSQL, params);
		if(tempList.size() > 0){
			for(int i = 0; i < tempList.size(); i++){
				CardVO cardVO = new CardVO();
				Map map = tempList.get(i);
				cardVO.setZcId(map.get("ZCID")!=null?(String)map.get("ZCID"):null);
				cardVO.setZcmc(map.get("ZCMC")!=null?(String)map.get("ZCMC"):null);
				cardVO.setZcbh(map.get("ZCBH")!=null?(String)map.get("ZCBH"):null);
				cardVO.setGg(map.get("GG")!=null?(String)map.get("GG"):null);
				cardVO.setCardmc(map.get("ZCNAME")!=null?(String)map.get("ZCNAME"):null);
				cardVO.setCardtype(map.get("PARENTID")!=null?findDicNameByDicPK("cardType", ((BigDecimal)map.get("PARENTID")).toString()):null);
				cardVO.setGlbm(map.get("GLBM")!=null?findCateNameByNodeValue("department", (String)map.get("GLBM")):null);
				cardVO.setSybm(map.get("USEPARTMENT")!=null?findCateNameByNodeValue("department",(String)map.get("USEPARTMENT")):null);
				CardVOList.add(cardVO);
			}
		}
		return CardVOList;
	}
	
	/**
	 * @author Yanpeiling 2011-1-8
	 * 根据caSheadId（对应lc_cardtemp表中KPXZID的字段）和sbodid（对应zy_Sbody表中的Sbody_id）
	 * 到这两张表中查询出数据保存到VO中显示在界面上
	 * @param caSheadId
	 * @param sbodyId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public LcCardtemp obtainLcCardtemp4ZyKp(String caSheadId,String sbodyId){
		String preparedHQL = "from LcCardtemp lc where lc.kpxzid = ? and lc.zcid = ?";
		List params = new ArrayList();
		params.add(Long.valueOf(caSheadId));
		params.add(sbodyId);
		List<LcCardtemp> tempList = (List<LcCardtemp>)publicDao.find(preparedHQL, params);
		if(tempList.size() > 0){
			return tempList.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 根据headId到ZyShead表中查找Ngbmyj(这个字段当作存储caSheadId使用)
	 * @param headId
	 * @return
	 */
	public String getcaSheadIdWithHeadId(String headId){
		String preparedHQL = "from ZyShead zh where zh.sheadId = ?";
		List params = new ArrayList();
		params.add(headId);
		ZyShead head = (ZyShead)publicDao.findSingleResult(preparedHQL, params);
		return head.getNgbmyj();
	}

	/**
	 * 根据headId查找卡片添加的表体内容 根据headId查询LC_CARDTEMP(卡片临时表)以下属性
	 * id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment， //
	 * 增加方式addtype，原币原值ybyz，折旧方法zjtype // 查出的结果存入List<BodyListVO>并转化为json串
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardAddBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "from LcCardtemp o where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			// id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment，
			// 增加方式addtype，原币原值ybyz，折旧方法zjtype
			LcCardtemp lcCardtemp = list.get(i);
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(lcCardtemp.getZcname());
			bodyListVO.setChangeway(findCateNameByNodeValue("cardChangeWay",
					lcCardtemp.getChangeway()));
			bodyListVO.setParentid(findDicNameByDicPK("cardType", lcCardtemp
					.getParentid().toString()));
			bodyListVO.setGlbm(findCateNameByNodeValue("department", lcCardtemp
					.getGlbm()));
			bodyListVO.setUsepartment(findCateNameByNodeValue("department",
					lcCardtemp.getUsepartment()));
			bodyListVO.setAddtype(findCateNameByNodeValue("addmethod",
					lcCardtemp.getAddtype()));
			bodyListVO.setYbyz(lcCardtemp.getYbyz());
			bodyListVO.setZjtype(findCoteNameByCoteKey(
					"CARD_DEPRECIATION_METHOD", lcCardtemp.getZjtype()));
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);

	}
	/**
	 * 根据headId查找卡片添加的表体内容 自用资产
	 * 
	 * @param headId
	 * @return
	 */
	public String findAddBody4ZyKp(String headId){
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "from LcCardtemp o where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			// id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment，
			// 增加方式addtype，原币原值ybyz，折旧方法zjtype
			LcCardtemp lcCardtemp = list.get(i);
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(String.valueOf(lcCardtemp.getZcname()));
			String zcid = lcCardtemp.getZcid();
			if(zcid==null){ 
				zcid = "";
			}else{
				bodyListVO.setZcId(zcid);
			}
			ZyZc zc = bs.findZyZcById(zcid);
			if(zc!=null){
				bodyListVO.setWpbh(zc.getZcbh());
				bodyListVO.setWpmc(zc.getZcmc());
				bodyListVO.setPpggxh(zc.getGg());
				bodyListVO.setFl(zc.getSjflmc());
			}
			bodyListVO.setParentid(findDicNameByDicPK("cardType", lcCardtemp.getParentid().toString()));
			bodyListVO.setGlbm(findCateNameByNodeValue("department", lcCardtemp.getGlbm()));
			bodyListVO.setUsepartment(findCateNameByNodeValue("department", lcCardtemp.getUsepartment()));
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}
	/**
	 * 根据headId查找卡片减少表体内容 // 根据headId查询LC_CARDTEMP(卡片临时表)以下属性
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardReduceBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "from LcCardtemp o where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			// id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment，
			// 增加方式addtype，原币原值ybyz，折旧方法zjtype
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment，
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(lcCardtemp.getZcname());
			bodyListVO.setParentid(findDicNameByDicPK("cardType", lcCardtemp
					.getParentid().toString()));
			bodyListVO.setChangeway(findCateNameByNodeValue("cardChangeWay",
					lcCardtemp.getChangeway()));
			bodyListVO.setGlbm(findCateNameByNodeValue("department", lcCardtemp
					.getGlbm()));
			bodyListVO.setUsepartment(findCateNameByNodeValue("department",
					lcCardtemp.getUsepartment()));
			// 减少方式dealmethod
			// 减少原因changereason
			bodyListVO.setDealmethod(findCateNameByNodeValue("reducemethod",
					lcCardtemp.getDealmethod()));
			bodyListVO.setChangereason(findCoteNameByCoteKey(
					"CARD_REDUCE_REASON", lcCardtemp.getChangereason()));
			bodyListVO.setYbyz(lcCardtemp.getYbyz());
			bodyListVO.setZjtype(lcCardtemp.getZjtype());
			resultList.add(bodyListVO);
		}
		// 查出的结果存入List<BodyListVO>并转化为json串
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片修改表体内容
	 * 根据headId联查LC_CARDTEMP(卡片临时表)和ZYZC(自用资产)或JYZC_XX(经营性固定资产) //
	 * id,卡片编号cardcode,卡片名称zcname,资产编号zcbh，管理部门glbm，使用部门usepartment，存放地点saveadsress; //
	 * 查出的结果存入List<BodyListVO>并转化为json串
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardModifyBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "from LcCardtemp o where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			BodyListVO bodyListVO = new BodyListVO();
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh，
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setZcname(lcCardtemp.getZcname());
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			// 管理部门glbm，使用部门usepartment，存放地点saveadsress;
			bodyListVO.setGlbm(findCateNameByNodeValue("department", lcCardtemp
					.getGlbm()));
			bodyListVO.setUsepartment(findCateNameByNodeValue("department",
					lcCardtemp.getUsepartment()));
			bodyListVO.setSaveadsress(lcCardtemp.getSaveadsress());
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片变动表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardChangeBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o  where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			BodyListVO bodyListVO = new BodyListVO();
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh，存放地点saveadsress,
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(lcCardtemp.getZcname());
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setUsepartment(findCateNameByNodeValue("department",
					lcCardtemp.getUsepartment()));
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			bodyListVO.setSaveadsress(lcCardtemp.getSaveadsress());
			// 变动前原值(before),变动后原值(after),变动方式(changeway).
			//bodyListVO.setBeforeyz(getBeforeyz(lcCardtemp.getCardinfoid()));// (beforebh)//变动前原值
			//bodyListVO.setAfteryz(getAfteryz(String.valueOf(lcCardtemp.getId())));
			//bodyListVO.setChangeway(lcCardtemp.getChangeway());
			//bodyListVO.setChangeyz(bodyListVO.getAfteryz()- bodyListVO.getBeforeyz());
			bodyListVO.setBeforeValue(this.getBeforeValue(lcCardtemp));
			bodyListVO.setAfterValue(this.getAfterValue(lcCardtemp));
			bodyListVO.setChangeway(this.getChangeway(lcCardtemp));
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	private String getChangeway(LcCardtemp temp) {
		String changeway = "";
		if(temp!=null){
			changeway = temp.getChangeway();
			Long cardType = temp.getParentid();
			String type = this.getType(cardType);
			String sql = "from Individualtree t where t.nodevalue = ? and t.treetype = 'cardChangeWay' and t.leaf = '0' and t.colonizevalue like '%"+ type +"%'";
			Individualtree tree = (Individualtree) this.publicDao.findSingleResult(sql, new Object[]{changeway});
			if(tree != null){
				changeway = tree.getCategoryname();
			}
			
		}
		return changeway;
	}

	private String getType(Long t) {
		String type = "";
		String cardType = String.valueOf(t);
		if("94".equals(cardType)){
			type = "256";
		}else if("95".equals(cardType)){
			type = "259";
		}else if("96".equals(cardType)){
			type = "260";
		}else if("97".equals(cardType)){
			type = "257";
		}else if("98".equals(cardType)){
			type = "261";
		}else if("1668".equals(cardType)){
			type = "1291";
		}else if("1669".equals(cardType)){
			type = "1292";
		}else if("1670".equals(cardType)){
			type = "1296";
		}else if("21628".equals(cardType)){
			type = "1551";
		}else if("21629".equals(cardType)){
			type = "1571";
		}else if("93".equals(cardType)){
			type = "258";
		}
		return type;
	}

	private String getAfterValue(LcCardtemp temp) {
		String value ="";
		if(temp!=null){
			String nodevalue = temp.getChangeway();
			if(nodevalue==null){
				return "";
			}
			if("1".equals(nodevalue.trim())||"2".equals(nodevalue.trim())){ //原币原值
				value = String.valueOf(temp.getYbyz());
			}else if("3".equals(nodevalue.trim())){							//管理部门
				value = temp.getGlbm();
				value = this.getIndividualtree("department",value);
			}else if("4".equals(nodevalue.trim())){							//使用部门
				value = temp.getUsepartment();
				value = this.getIndividualtree("department",value);
			}else if("5".equals(nodevalue.trim())){							//使用状况
				value = temp.getUsestatus();
				value = this.getIndividualtree("userStatus", value);
			}else if("6".equals(nodevalue.trim())){							//折旧类型
				value = temp.getZjtype();
				value = this.getDicAppAssetState("zjtype", value);
			}else if("7".equals(nodevalue.trim())){							//使用月限
				value = String.valueOf(temp.getSyyx());
			}else if("9".equals(nodevalue.trim())){							//净残值
				value = String.valueOf(temp.getJcz());
			}else if("10".equals(nodevalue.trim())){							//累计折旧
				value = String.valueOf(temp.getLjzj());
			}else if("11".equals(nodevalue.trim())){							//卡片类别，
				value = temp.getTypecode();
				value = this.getIndividualtree("assetType", value);
			}else if("12".equals(nodevalue.trim())){							//增加方式
				value = temp.getAddtype();
				value = this.getIndividualtree("addmethod", value);
			}else if("13".equals(nodevalue.trim())){							//折旧承担部门
				value = String.valueOf(temp.getZjcdbm());
				if("1".equals(value)){
					value = "使用部门";
				}else if("0".equals(value)){
					value = "管理部门";
				}else{
					value = "";
				}
			}else if("14".equals(nodevalue.trim())){							//使用人
				value = temp.getUsername();
			}
		}
		
		return value;
	}

	public String getIndividualtree(String treetype, String nodevalue) {
		String value = "";
		String sql = "from Individualtree t where t.treetype = ? and t.nodevalue = ?";
		List tree = this.publicDao.find(sql, new Object[]{treetype,nodevalue});
		if(tree!=null&&tree.size()>0){
			Individualtree tree1 = (Individualtree) tree.get(0);
			value = tree1.getCategoryname();
		}else{
			value = nodevalue;
		}
		return value;
	}
	
	public String getDicAppAssetState(String type, String nodevalue) {
		String value = "";
		String sql = "from DicAppAssetState t where t.type = '"+type+"' and t.code = ?";
		DicAppAssetState tree = (DicAppAssetState) this.publicDao.findSingleResult(sql, new Object[]{nodevalue});
		if(tree!=null){
			value = tree.getName();
		}
		return value;
	}

	private String getBeforeValue(LcCardtemp temp) {
		String value ="";
		if(temp!=null){
			String nodevalue = temp.getChangeway();
			if(nodevalue ==null){
				return "";
			}
			String cardId = temp.getCardinfoid();
			Cardinfo card = bs.findCardinfoByCardId(cardId);
			if("1".equals(nodevalue.trim())||"2".equals(nodevalue.trim())){ //原币原值
				value = String.valueOf(card.getYbyz());
			}else if("3".equals(nodevalue.trim())){							//管理部门
				value = card.getGlbm();
				value = this.getIndividualtree("department",value);
			}else if("4".equals(nodevalue.trim())){							//使用部门
				value = card.getUsepartment();
				value = this.getIndividualtree("department",value);
			}else if("5".equals(nodevalue.trim())){							//使用状况
				value = card.getUsestatus();
				value = this.getIndividualtree("userStatus", value);
			}else if("6".equals(nodevalue.trim())){							//折旧类型
				value = card.getZjtype();
				value = this.getDicAppAssetState("zjtype", value);
			}else if("7".equals(nodevalue.trim())){							//使用月限
				value = String.valueOf(card.getSyyx());
			}else if("9".equals(nodevalue.trim())){							//净残值
				value = String.valueOf(card.getJcz());
			}else if("10".equals(nodevalue.trim())){							//累计折旧
				value = String.valueOf(card.getLjzj());
			}else if("11".equals(nodevalue.trim())){							//卡片类别，
				value = card.getTypecode();
				value = this.getIndividualtree("assetType", value);
			}else if("12".equals(nodevalue.trim())){							//增加方式
				value = card.getAddtype();
				value = this.getIndividualtree("addmethod", value);
			}else if("13".equals(nodevalue.trim())){							//折旧承担部门
				value = String.valueOf(card.getZjcdbm());
				if("1".equals(value)){
					value = "使用部门";
				}else if("0".equals(value)){
					value = "管理部门";
				}else{
					value = "";
				}
			}else if("14".equals(nodevalue.trim())){							//使用人
				value = card.getUsername();
			}
		}
		
		return value;
		
	}

	/**
	 * 根据headId查找卡片减值表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardDevalueBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o  where o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			BodyListVO bodyListVO = new BodyListVO();
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh，存放地点saveadsress,
			// 本次计提前准备(before),本次计提后准备(after),本次计提(bcjt).
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setZcname(lcCardtemp.getZcname());
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			bodyListVO.setUsepartment(findCateNameByNodeValue("department",
					lcCardtemp.getUsepartment()));
			bodyListVO.setSaveadsress(lcCardtemp.getSaveadsress());
			// 本次计提前准备(before),本次计提后准备(after),本次计提(bcjt).
			bodyListVO.setBeforejt(getBeforejt(String.valueOf(lcCardtemp.getId())));
			bodyListVO.setAfterjt(getAfterjt(String.valueOf(lcCardtemp.getId())));
			bodyListVO.setBcjt(lcCardtemp.getBcjt());
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片调配表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findCardAllocateBody(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o , JyzcXx jyzcxx  where o.zcid=jyzcxx.id and o.kpxzid = ? order by o.id asc";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片编号cardcode,卡片名称zcname,调配前资产编号，调配前资产名称,调配后资产编号,调配后资产名称
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setZcname(lcCardtemp.getZcname());
			bodyListVO.setBeforebh(getBeforebh(String.valueOf(lcCardtemp
					.getCardinfoid())));// 调配前资产编号 //查询
			bodyListVO.setBeforemc(getBeforemc(String.valueOf(lcCardtemp
					.getCardinfoid())));// 调配前资产名称 //查询
			bodyListVO.setAfterbh(getAfterbh(lcCardtemp.getZcid())); // 调配后资产编号
																		// //查询
			bodyListVO.setAftermc(getAftermc(lcCardtemp.getZcid()));// 调配后资产名称
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片拆分之前表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findBeforeSplit(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o where o.boxid is  null and o.kpxzid = ? ";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			// id,卡片名称zcname,卡片类型parentid，管理部门glbm，使用部门usepartment，
			// 增加方式addtype，原币原值ybyz，折旧方法zjtype
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh,资产名称zcmc,
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(lcCardtemp.getZcname());// 卡片名称
			bodyListVO.setCardcode(lcCardtemp.getCardcode());// 卡片编号
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			// 原币原值ybyz,累计折旧ljzj。cardcode不为空
			bodyListVO.setYbyz(lcCardtemp.getYbyz());
			bodyListVO.setLjzj(lcCardtemp.getLjzj());// 累计折旧
			resultList.add(bodyListVO);
		}
		// 查出的结果存入List<BodyListVO>并转化为json串
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片拆分之后表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findAfterSplit(String headId) {
		List<BodyListVO> resultList = new ArrayList<BodyListVO>();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o where o.boxid is not null and o.kpxzid = ? ";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		DecimalFormat r=new DecimalFormat();  
		r.applyPattern("#0.00");//保留小数位数，不足会补零  
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片编号cardcode,卡片名称zcname,原值ybyz,所占比例，旧卡片编号oldcardid.
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setZcname(lcCardtemp.getZcname());// 卡片名称
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			lcCardtemp.getBoxid();
			LcCardtemp beforeBody = (LcCardtemp) publicDao.findById(
					LcCardtemp.class, Long.parseLong(lcCardtemp.getBoxid()));
			bodyListVO.setYbyz(lcCardtemp.getYbyz());
			bodyListVO
					.setSzbl(Double.valueOf(r.format((lcCardtemp.getYbyz() / beforeBody.getYbyz()) * 100)));// 所占比例
			bodyListVO.setOldcardid(lcCardtemp.getOldcode());
			resultList.add(bodyListVO);
		}
		// 查出的结果存入List<BodyListVO>并转化为json串
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片合并之前表体内容
	 * id,卡片编号cardcode,卡片名称zcname,资产编号zcbh,资产名称,原币原值ybyz,累计折旧ljzj。cardcode不为空
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findBeforeMerge(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o  where  o.boxid is   null and o.kpxzid = ? ";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh,资产名称,原币原值ybyz,累计折旧ljzj。cardcode不为空
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			bodyListVO.setZcname(lcCardtemp.getZcname());// 卡片名称
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			bodyListVO.setYbyz(lcCardtemp.getYbyz());
			bodyListVO.setOldcardid(lcCardtemp.getOldcardid());
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	/**
	 * 根据headId查找卡片合并之后表体内容
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String findAfterMerge(String headId) {
		List<BodyListVO> resultList = new ArrayList();
		List<LcCardtemp> list = new ArrayList();
		List params = new ArrayList();
		params.add(Long.parseLong(headId));
		String preparHQL = "";
		preparHQL = "select o from LcCardtemp o where o.boxid is not null and o.kpxzid = ?";
		list = (List<LcCardtemp>) publicDao.find(preparHQL, params);
		for (int i = 0; i < list.size(); i++) {
			LcCardtemp lcCardtemp = list.get(i);
			// id,卡片编号cardcode,卡片名称zcname,资产编号zcbh,资产名称,原币原值ybyz,累计折旧ljzj。
			// 查出的结果存入List<BodyListVO>并转化为json串
			BodyListVO bodyListVO = new BodyListVO();
			bodyListVO.setId(String.valueOf(lcCardtemp.getId()));
			bodyListVO.setCardcode(lcCardtemp.getCardcode());
			if ("1".equals(lcCardtemp.getSfzy())) {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), true));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), true));// 资产编号
			} else {
				bodyListVO.setZcmc(getZcmcByZcId(lcCardtemp.getZcid(), false));// 资产名称
				bodyListVO.setZcbh(getZcbhByZcId(lcCardtemp.getZcid(), false));// 资产编号
			}
			bodyListVO.setZcname(lcCardtemp.getZcname());
			bodyListVO.setYbyz(lcCardtemp.getYbyz());// 原币原值ybyz
			bodyListVO.setLjzj(lcCardtemp.getLjzj());// 累计折旧
			resultList.add(bodyListVO);
		}
		return BodyListToJSON.getJSON(resultList, 1, 1, 111111);
	}

	public String getJsonString(List<BodyListVO> resultList) {
		StringBuffer jsonSB = new StringBuffer();
		jsonSB.append("{");
		jsonSB.append("\"total\" : \"").append(10).append("\",");
		jsonSB.append("\"page\" : \"").append(1).append("\",");
		jsonSB.append("\"records\" : \"").append(resultList.size()).append(
				"\",");
		jsonSB.append("\"rows\" : [");
		JsonConfig jsonConfig = new JsonConfig();
		JSONObject jsonObject = null;
		for (Iterator i = resultList.iterator(); i.hasNext();) {
			BodyListVO bodyListVO = (BodyListVO) i.next();
			jsonObject = JSONObject.fromObject(bodyListVO, jsonConfig);
			jsonSB.append(jsonObject.toString());
			if (i.hasNext()) {
				jsonSB.append(",");
			}
		}
		jsonSB.append("]");
		jsonSB.append("}");
		return jsonSB.toString();
	}

	/**
	 * 是否是自用资产
	 * 
	 * @param headId
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public boolean isZyzcoo(String headId) {
		String strHQL = "from LcCardtemp o where o.kpxzid =? ";
		List params = new ArrayList();
		LcCardtemp lcCardtemp = new LcCardtemp();
		params.add(Long.parseLong(headId));
		lcCardtemp = (LcCardtemp) publicDao.findSingleResult(strHQL, params);
		if ("0".equals(lcCardtemp.getSfzy())) {
			return true;
		} else {
			return false;
		}
	}

	// 计算变动前值；
	public Double getBeforeyz(String cardinfoid) {// getBeforeyz
		String strHQL = "from Cardinfo c where c.id=?";
		List params = new ArrayList();
		Cardinfo card = new Cardinfo();
		params.add(Long.parseLong(cardinfoid));
		card = (Cardinfo) publicDao.findSingleResult(strHQL, params);
		return card.getYbyz();
	}

	// 计算变动后值
	public Double getAfteryz(String bodyId) {
		String strHQL = "from LcCardtemp c where c.id=?";
		List params = new ArrayList();
		LcCardtemp body = new LcCardtemp();
		params.add(Long.parseLong(bodyId));
		body = (LcCardtemp) publicDao.findSingleResult(strHQL, params);
		return body.getYbyz();
	}

	@SuppressWarnings("unchecked")
	public Double getBeforejt(String zcId) {
		List param = new ArrayList();
		param.add(zcId);
		Recordhistory recordhistory = new Recordhistory();
		recordhistory = (Recordhistory) publicDao.findSingleResult(
				"from Recordhistory his where his.zcId=?", param);// .getZcmc();
		if (recordhistory != null) {
			return new Double(recordhistory.getBefore());
		} else {
			return new Double("0");
		}
	}

	@SuppressWarnings("unchecked")
	public Double getAfterjt(String zcId) {
		List param = new ArrayList();
		param.add(zcId);
		Recordhistory recordhistory = new Recordhistory();
		recordhistory = (Recordhistory) publicDao.findSingleResult(
				"from Recordhistory his where his.zcId=?", param);// .getZcmc();
		if (recordhistory != null) {
			return new Double(recordhistory.getAfter());
		} else {
			return new Double("0");
		}
	}

	// String beforebh; // 调配前资产编号 //查询
	private String getBeforebh(String strCardInfoId) {
		Cardinfo cardinfo = new Cardinfo();
		JyzcXx jyzcXx = new JyzcXx();
		cardinfo = (Cardinfo) publicDao.findById(Cardinfo.class, Long
				.parseLong(strCardInfoId));// ("from Cardinfo card where
											// card.id = ? ",
											// param);//.getZcmc();
		jyzcXx = (JyzcXx) publicDao.findById(JyzcXx.class, cardinfo.getZcid()
				.toString());
		return jyzcXx.getZcbh();
	}

	// 调配前资产名称 //查询
	private String getBeforemc(String strCardInfoId) {
		Cardinfo cardinfo = new Cardinfo();
		JyzcXx jyzcXx = new JyzcXx();
		cardinfo = (Cardinfo) publicDao.findById(Cardinfo.class, Long
				.parseLong(strCardInfoId));// ("from Cardinfo card where
											// card.id = ? ",
											// param);//.getZcmc();
		jyzcXx = (JyzcXx) publicDao.findById(JyzcXx.class, cardinfo.getZcid()
				.toString());
		return jyzcXx.getZcmc();
	}

	// 调配后资产编号 //查询
	private String getAfterbh(String zcId) {
		JyzcXx jyzcXx = new JyzcXx();
		jyzcXx = (JyzcXx) publicDao.findById(JyzcXx.class, zcId==null?"":zcId);
		return jyzcXx.getZcbh();
	}

	// 调配后资产名称 //查询
	private String getAftermc(String zcId) {
		JyzcXx jyzcXx = new JyzcXx();
		jyzcXx = (JyzcXx) publicDao.findById(JyzcXx.class, zcId==null?"":zcId);
		return jyzcXx.getZcmc();
	}

	// 所占比例
	private Double getSzbl(String id) {

		return new Double("1");
	}

	// 资产名称
	private String getZcmcByZcId(String zcId, boolean isZyzc) {
		String Zcmc = "";
		try{
		if (isZyzc) {
			ZyZc zc = publicDao.findById(ZyZc.class, zcId==null?"":zcId);
			if(zc!=null){
				Zcmc = zc.getZcmc();
			}
		} else {
			JyzcXx zc = publicDao.findById(JyzcXx.class, zcId==null?"":zcId);
			if(zc!=null){
				Zcmc = zc.getZcmc();
			}
		}
		}catch (Exception e){
			e.printStackTrace();
		}
		return Zcmc;
	}

	// 资产编号
	private String getZcbhByZcId(String zcId, boolean isZyzc) {
		String Zcbh = "";
		if (isZyzc) {
			ZyZc zc = publicDao.findById(ZyZc.class, zcId==null?"":zcId);
			if(zc!=null){
				Zcbh = zc.getZcbh();
			}
		} else {
			JyzcXx zc = publicDao.findById(JyzcXx.class, zcId==null?"":zcId);
			if(zc!=null){
				Zcbh = zc.getZcbh();
			}
		}
		return Zcbh;
	}
	/**
	 * 生成编号
	 * @param headId
	 * @return
	 */
	public String queryCode(String headId){
		String code = "";
		CaShead head = bs.findCaSheadById(headId);
		if(head.getBianhao()==null ||head.getBianhao().trim().length()==0){
			String bdlx = head.getBdlx();
			String type = "";
			if (KpglCommon.KP_CZTYPE_CARDADD.equals(bdlx)) {
				type = "kpzj";
			} else if (KpglCommon.KP_CZTYPE_CARDREDUCE.equals(bdlx)) {
				type = "kpjs";
			} else if (KpglCommon.KP_CZTYPE_CARDDEVALUE.equals(bdlx)) {
				type = "kpjz";
			} else if (KpglCommon.KP_CZTYPE_CARDMERGE.equals(bdlx)) {
				type = "kphb";
			} else if (KpglCommon.KP_CZTYPE_CARDSPLIT.equals(bdlx)) {
				type = "kpcf";
			} else if (KpglCommon.KP_CZTYPE_CARDMODIFY.equals(bdlx)) {
				type = "kpxg";
			} else if (KpglCommon.KP_CZTYPE_CARDCHANGE.equals(bdlx)) {
				type = "kpbd";
			} else if (KpglCommon.KP_CZTYPE_CARDALLOCATE.equals(bdlx)) {
				type = "kptp";
			}
			code = codeGenerator.generateCurrentCode(type, String.valueOf(head.getNgbm()), head.getNgbmmc());
			head.setBianhao(code);
			this.publicDao.update(head);
		}else{
			code = head.getBianhao();
		}
		return code;
	}
	
	/**
	 * 查找一级分行
	 * 
	 * @return
	 */
	public List findFirstBranch() {
		String sql = "select i.categoryname,i.nodevalue from individualtree i where i.treetype = 'department'"
				+ " and i.parentcategoryid = '438'";
		List list = publicDao.queryForList(sql, new ArrayList());
		List<Individualtree> returnList = new ArrayList<Individualtree>();
		for (int i = 0; i < list.size(); i++) {
			Individualtree tree = new Individualtree();
			Map map = (Map) list.get(i);
			tree.setCategoryname(String.valueOf(map.get("categoryname")));
			tree.setNodevalue(String.valueOf(map.get("nodevalue")));
			returnList.add(tree);
		}
		return returnList;
	}
	public String findRecordhistorys(String cardId, Paginator paginator){
		List list = this.findRecordsBybodyId(cardId,paginator);
		String s = BodyListToJSON.getJSON(list, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return s;
	}
	public String findRecordhistorys1(String headId, String bodyId){
		List list = this.bs.findRecordsBybodyId(bodyId, headId);
		String s = BodyListToJSON.getJSON(list, 1, 1, 1000000000);
		return s;
	}
	/**
	 * 根据bodyId查找record记录
	 */
	public List findRecordsBybodyId(String bodyId, Paginator paginator){
		//String sql = "from Recordhistory re where re.zhuangTai ='2' and re.zcId = '"+bodyId+"' order by re.changedate desc";
		String sql = new StringBuffer()
		.append(" select a.id, a.after,a.before,a.changeperson,a.changedate ,c.changeway,c.changereason  ")
		.append(" from recordhistory a , cardinfo b,lc_Cardtemp c,ca_Shead d ")
		.append(" where b.cardcode = c.cardcode  ")
		.append(" and b.id = '"+bodyId+"' and a.zhuangtai ='2' ")
		.append(" and a.zc_id = to_char(c.id) ")
		.append(" and c.kpxzid = d.id ")
		.append(" and a.pk_id = to_char(d.id) order by a.changedate")
		.toString();
		List list = new ArrayList();
		List queryList =null;
		// 获得查询结果
		try{
		PageableList pageableList = this.publicDao.queryForList(sql,list ,paginator);
		queryList = pageableList.getResults();
		}catch(Exception e){
			e.printStackTrace();
		}
		if(queryList!=null&& queryList.size()>0){
			for (int i = 0; i <queryList.size(); i++) {
				BodyListVO vo = new BodyListVO();
				Map r = (Map) queryList.get(i);
				vo.setAfterValue(String.valueOf(r.get("after")));
				vo.setBeforeValue(String.valueOf(r.get("before")));
				vo.setBdrq(String.valueOf(r.get("changedate")));
				vo.setLrr(String.valueOf(r.get("changeperson")));
				vo.setChangeway(this.getIndividualtree("cardChangeWay", String.valueOf(r.get("changereason"))));
				vo.setChangereason(this.getDicAppAssetState1("CARD_REDUCE_REASON",String.valueOf(r.get("changeway"))));
				vo.setId(String.valueOf(r.get("id")));
				list.add(vo);
			}
		}
		return list;
	}
	
	public String findAsset(String cardId){
		String s = "";
		Cardinfo card  = this.bs.findCardinfoByCardId(cardId);
		String sfzy = card.getSfzy();
		String sql = "";
		if("1".equals(sfzy)){
			ZyZc zc = this.bs.findZyZcById(card.getZcid());
			List list = new ArrayList();
			if(zc!=null){
				BodyListVO vo = new BodyListVO();
				vo.setId(zc.getZcId());
				vo.setZcbh(zc.getZcbh());
				vo.setZcmc(zc.getZcmc());
				vo.setSaveadsress(card.getSaveadsress());
				vo.setUsepartment(this.getIndividualtree("department", card.getUsepartment()));
				vo.setZjtype("1");//自用资产
				list.add(vo);
			}
			s = BodyListToJSON.getJSON(list, 1, 1, 11);
		}else{
			JyzcXx xx = this.bs.findJyzcXxByZcId(card.getZcid());
			Cardinfo card1 = this.getMainCardByZcId(card.getZcid());
			BodyListVO vo = new BodyListVO();
			vo.setId(xx.getId());
			vo.setZcbh(xx.getZcbh());
			vo.setZcmc(xx.getZcmc());
			if(card1!=null){
				vo.setSaveadsress(card1.getSaveadsress());
				vo.setUsepartment(this.getIndividualtree("department", card1.getUsepartment()));
			}
			vo.setZjtype("0");//经营固定资产
			List list = new ArrayList();
			list.add(vo);
			s = BodyListToJSON.getJSON(list, 1, 1, 11);
		}
		
		return s;
	}
	
	public String getDicAppAssetState1(String type, String nodevalue) {
		String value = "";
		String sql = "from Code t where t.codeType = '"+type+"' and t.codeKey = ?";
		Code tree = (Code) this.publicDao.findSingleResult(sql, new Object[]{nodevalue});
		if(tree!=null){
			value = tree.getCodeValue();
		}
		return value;
	}
	public Cardinfo getMainCardByZcId(String ziId) {
		Cardinfo cardinfo = null;
		// 查询主卡片信息
		String hql = "select o from CardAssetHistory o where o.zczsbId = ? and o.dqgjzt = '0' and o.sfwzkp = '1'";
		Object[] params = new Object[] { ziId };
		List<CardAssetHistory> tempList = (List<CardAssetHistory>) publicDao
				.find(hql, params);
		if (tempList != null && tempList.size() > 0) {
			CardAssetHistory temp = tempList.get(0);
			cardinfo = this.publicDao.findById(Cardinfo.class, Long
					.valueOf(temp.getKpId()));
		}
		return cardinfo;
	}
	
	/**
	 * excel勾选导出
	 * 
	 * @param ids
	 * @return
	 */
	public String excelCheck(String ids){
		// 拼接查询语句
		String sql = " select distinct * from ( select distinct o.*, jyzc.zcmc, jyzc.zcbh from" +
				" Cardinfo o left join Jyzc_Xx jyzc on o.zcid = jyzc.id where o.sfzy = '0'  and o.id in ("+IdStrFormat.formatIds(ids)+")  union" +
				" all select  a.*, zyzc.zcmc, zyzc.zcbh from Cardinfo a left  join Zy_Zc zyzc on" +
				" a.zcid = zyzc.zc_Id where  a.sfzy = '1'  and a.id in ("+IdStrFormat.formatIds(ids)+")) o where 1=1";
		List queryList = this.publicDao.queryForList(sql, new ArrayList());
		List<CardListInfoVO> resultList = new ArrayList<CardListInfoVO>();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map tempBO = (Map) queryList.get(i);
			CardListInfoVO tempVO = new CardListInfoVO();
			tempVO.setId(Long.parseLong(String.valueOf(tempBO.get("ID"))));
			tempVO.setCardcode((String) tempBO.get("CARDCODE"));
			tempVO.setZcname(String.valueOf(tempBO.get("ZCNAME")));
			tempVO.setZcbh(String.valueOf(tempBO.get("ZCBH")));
			tempVO.setZcmc(String.valueOf(tempBO.get("ZCMC")));//ZCMC 无数据
			tempVO.setKplx(String.valueOf(this.findDicNameByDicPK("cardType",String.valueOf(tempBO.get("PARENTID")))));
			tempVO.setState(String.valueOf(this.getState(String.valueOf(tempBO.get("STATE")))));
			tempVO.setSaveadsress(String.valueOf(tempBO.get("SAVEADSRESS")));
			tempVO.setIfjc(String.valueOf("1".equals(tempBO.get("IFJC"))?"否":"是"));
			tempVO.setSfzy(String.valueOf("0".equals(tempBO.get("SFZY"))?"否":"是"));
			tempVO.setGlbm(findCateNameByNodeValue("department", String.valueOf(tempBO.get("GLBM"))));
			tempVO.setUsepartment(findCateNameByNodeValue("department",String.valueOf(tempBO.get("USEPARTMENT"))));
			tempVO.setFirstbranch(findCateNameByParentId("department","438",String.valueOf(tempBO.get("FIRSTBRANCH"))));
			resultList.add(tempVO);
		}
		String json = BodyListToJSON.getJSON(resultList,1,1,100000);
		return json;
	}
	
}