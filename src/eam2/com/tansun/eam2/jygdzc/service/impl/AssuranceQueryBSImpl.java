package com.tansun.eam2.jygdzc.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.util.IdStrFormat;
import com.tansun.eam2.jygdzc.service.IAssuranceQueryBS;
import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 投保申请查询
 * 
 * @author 陈煜霄
 * @date 2010-12-15
 */
@Service
public class AssuranceQueryBSImpl implements IAssuranceQueryBS {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 投保申请查询	
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String queryAssurance(AssuranceQueryVO queryVO, Paginator paginator) {
		List<AssuranceQueryVO> resultList = new ArrayList<AssuranceQueryVO>();
		try{
//		String sql = "select a.id,a.biaoti,a.bianhao,d.zcbh,d.zcmc,d.c_zcdq,f.cardcode,f.zcname,"
//				+ "f.firstbranch , d.clph from jyzc_jyzl_head a,jjzc_gctb_xx b,JJZC_TBGC_XX c,jyzc_xx d,CARD_ASSET_HISTORY e,"
//				+ "CARDINFO f where a.id = b.CLD_ID and b.ID = c.GCTB_ID(+) and c.ZC_ID = d.ID(+) and d.Id = e.zczsb_id(+)"
//				+ "  and e.sfwzkp='1' and e.KP_ID = f.ID(+)  and a.cld_zt='2' ";
	
		StringBuffer sql = new StringBuffer("select");
		sql.append(" a.id,a.biaoti,a.bianhao, ");
		sql.append(" d.zcbh,d.zcmc,d.c_zcdq,d.clph, ");
		sql.append(" f.cardcode,f.zcname,f.firstbranch , ");
		sql.append(" e.sfwzkp from ");
		sql.append(" jyzc_jyzl_head a left join jjzc_gctb_xx b on a.id = b.CLD_ID ");
		sql.append("  join JJZC_TBGC_XX c on b.ID = c.GCTB_ID ");
		sql.append("  join jyzc_xx d on c.ZC_ID = d.ID ");
		sql.append("  join CARD_ASSET_HISTORY e on d.Id = e.zczsb_id ");
		sql.append("  left join CARDINFO f on e.KP_ID = f.ID ");
		sql.append("  where a.cld_zt='2' and e.sfwzkp='1' ");
		String conditionHql = this.prepareHql(queryVO);
		sql.append(conditionHql);
		List<Object> list = this.prepareParam(queryVO);
		// 获得查询结果
		PageableList pageableList = this.publicDao.queryForList(sql.toString(), list,
				paginator);
		List queryList = pageableList.getResults();
		// 进行属性拷贝
		for (int i = 0; i < queryList.size(); i++) {
			Map map = (Map) queryList.get(i);
			AssuranceQueryVO ass = new AssuranceQueryVO();
			ass.setId(checkString(map.get("id")));// id
			ass.setBianhao(checkString(map.get("bianhao"))); // 编号
			ass.setBiaoti(checkString(map.get("biaoti"))); // 标题
			ass.setClph(checkString(map.get("clph"))); // 车辆牌号
			ass.setZcbh(checkString(map.get("zcbh"))); // 资产编号
			ass.setZcmc(checkString(map.get("zcmc")));// 资产名称
			ass.setCzcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("c_zcdq")))));//地区
			//ass.setCzcdq(findCateNameByParentId(checkString(map.get("c_zcdq"))));// 地区
			ass.setCardcode(checkString(map.get("cardcode")));// 卡片编号
			ass.setZcname(checkString(map.get("zcname")));// 卡片名称
			ass.setFirstbranch(findCateNameByParentId(checkString(map.get("firstbranch"))));// 一级分行
			resultList.add(ass);
		}
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public List<AssuranceQueryVO> queryAssurance(String ids) {
		
		    List<AssuranceQueryVO> resultList = new ArrayList<AssuranceQueryVO>();
			StringBuffer sql = new StringBuffer("select");
			sql.append(" a.id,a.biaoti,a.bianhao, ");
			sql.append(" d.zcbh,d.zcmc,d.c_zcdq,d.clph, ");
			sql.append(" f.cardcode,f.zcname,f.firstbranch , ");
			sql.append(" e.sfwzkp from ");
			sql.append(" jyzc_jyzl_head a left join jjzc_gctb_xx b on a.id = b.CLD_ID ");
			sql.append("  join JJZC_TBGC_XX c on b.ID = c.GCTB_ID ");
			sql.append("  join jyzc_xx d on c.ZC_ID = d.ID ");
			sql.append("  join CARD_ASSET_HISTORY e on d.Id = e.zczsb_id ");
			sql.append("  left join CARDINFO f on e.KP_ID = f.ID ");
			sql.append("  where a.cld_zt='2' and e.sfwzkp='1' and  d.zcbh IN ("+IdStrFormat.formatIds(ids)+")");
			List params = new ArrayList();
			List list=publicDao.queryForList(sql.toString(),params);
			// 进行属性拷贝
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				AssuranceQueryVO ass = new AssuranceQueryVO();
				ass.setId(checkString(map.get("id")));// id
				ass.setBianhao(checkString(map.get("bianhao"))); // 编号
				ass.setBiaoti(checkString(map.get("biaoti"))); // 标题
				ass.setClph(checkString(map.get("clph"))); // 车辆牌号
				ass.setZcbh(checkString(map.get("zcbh"))); // 资产编号
				ass.setZcmc(checkString(map.get("zcmc")));// 资产名称
				ass.setCzcdq(checkString(findCoteNameByCoteKey("PROVIENCE",String.valueOf(map.get("c_zcdq")))));//地区
				//ass.setCzcdq(findCateNameByParentId(checkString(map.get("c_zcdq"))));// 地区
				ass.setCardcode(checkString(map.get("cardcode")));// 卡片编号
				ass.setZcname(checkString(map.get("zcname")));// 卡片名称
				ass.setFirstbranch(findCateNameByParentId(checkString(map.get("firstbranch"))));// 一级分行
				resultList.add(ass);
			}
			
			return resultList;
		}
	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private String prepareHql(AssuranceQueryVO queryVO) {
		String hql = "";
		// 编号
		if (queryVO.getBianhao() != null
				&& queryVO.getBianhao().trim().length() > 0) {
			hql += " and a.bianhao like ? ";
		}
		// 标题
		if (queryVO.getBiaoti() != null
				&& queryVO.getBiaoti().trim().length() > 0) {
			hql += " and a.biaoti like ? ";
		}
		//车辆牌号
		if (queryVO.getClph() != null && queryVO.getClph().trim().length() > 0) {
			hql += " and d.clph like ? ";
		}
		// 资产编号
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			hql += " and d.zcbh like ? ";
		}
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			hql += " and d.zcmc like ? ";
		}
		// 地区
		if (queryVO.getCzcdq() != null
				&& queryVO.getCzcdq().trim().length() > 0) {
			hql += " and d.c_zcdq = ? ";
		}
		// 卡片编号
		if (queryVO.getCardcode() != null
				&& queryVO.getCardcode().trim().length() > 0) {
			hql += " and f.cardcode like ? ";
		}
		// 卡片名称
		if (queryVO.getZcname() != null
				&& queryVO.getZcname().trim().length() > 0) {
			hql += " and f.zcname like ? ";
		}
		// 一级分行
		if (queryVO.getFirstbranch() != null
				&& queryVO.getFirstbranch().trim().length() > 0) {
			hql += " and f.firstbranch = ? ";
		}

		hql += " order by a.id asc ";
		return hql;
	}

	/**
	 * 拼接查询语句
	 * 
	 * @param queryVO
	 * @return
	 */
	private List<Object> prepareParam(AssuranceQueryVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 编号
		if (queryVO.getBianhao() != null
				&& queryVO.getBianhao().trim().length() > 0) {
			list.add("%" + queryVO.getBianhao() + "%");
		}
		// 标题
		if (queryVO.getBiaoti() != null
				&& queryVO.getBiaoti().trim().length() > 0) {
			list.add("%" + queryVO.getBiaoti() + "%");
		}
		 //车辆牌号
		if (queryVO.getClph() != null && queryVO.getClph().trim().length() > 0) {
			list.add("%" + queryVO.getClph() + "%");
		}
		// 资产编号
		if (queryVO.getZcbh() != null && queryVO.getZcbh().trim().length() > 0) {
			list.add("%" + queryVO.getZcbh() + "%");
		}
		// 资产名称
		if (queryVO.getZcmc() != null && queryVO.getZcmc().trim().length() > 0) {
			list.add("%" + queryVO.getZcmc() + "%");
		}
		// 地区
		if (queryVO.getCzcdq() != null
				&& queryVO.getCzcdq().trim().length() > 0) {
			list.add("" + queryVO.getCzcdq() + "");
		}
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
		// 一级分行
		if (queryVO.getFirstbranch() != null
				&& queryVO.getFirstbranch().trim().length() > 0) {
			list.add("" + queryVO.getFirstbranch() + "");
		}
		return list;
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
	 * 查找一级分行
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String nodeValue) {
		String sql = "select i.categoryname from individualtree i where i.treetype = 'department' and " +
				"i.parentcategoryid = '438' and i.nodevalue = '"+nodeValue+"'";
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
}
