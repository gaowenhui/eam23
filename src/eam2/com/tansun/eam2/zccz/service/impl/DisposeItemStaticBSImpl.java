package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.zccz.service.IDisposeItemStaticBS;
import com.tansun.eam2.zccz.service.IStatisticQueryBS;
import com.tansun.eam2.zccz.vo.DisposeItemStaticVO;
import com.tansun.eam2.zccz.vo.EntityDisposeVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 统计查询
 * 
 * @author 陈煜霄
 * @date 2010-12-31
 */
@Service
public class DisposeItemStaticBSImpl implements IDisposeItemStaticBS {

	@Autowired
	private IStatisticQueryBS statisticQueryBSImpl;
	@Autowired
	private ICodeService codeBSImpl;
	@Autowired
	private PublicDao publicDao;

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String query(Paginator paginator, DisposeItemStaticVO queryVO) {
		String leibie = queryVO.getChuzhileibie();
		String json = "";
		if ("1".equals(leibie)) {
			//通用资产处置
			List fa = this.queryFA(paginator, queryVO);
			json = BodyListToJSON.getJSON(fa, paginator.getPageCount(),
					paginator.getCurrentPage(), paginator.getCount());
		} else if ("0".equals(leibie)) {
			//实体整体处置
			List st = this.queryST(paginator, queryVO);
			json = BodyListToJSON.getJSON(st, paginator.getPageCount(),
					paginator.getCurrentPage(), paginator.getCount());
		} else if("2".equals(leibie)) {
			//实体人员安置
			List ryazList = this.queryRy(paginator, queryVO);
			json = BodyListToJSON.getJSON(ryazList, paginator.getPageCount(),
					paginator.getCurrentPage(), paginator.getCount());
		}
		return json;
	}
	
	//实体人员安置查询
	public List queryRy(Paginator paginator, DisposeItemStaticVO queryVO) {
		String sql = "select x.ID,x.CZXMMC,x.SPJL,x.sbrq,x.slxh,x.ZHUANGTAI,x.HY_ID,s.BIANHAO,s.C_CZFS,"
				+ "s.NGBMMC,s.NGRXM,h.hycs from cz_xmxx_lsb x,cz_stcztz s,cz_hyxx h where x.cld_id = s.id "
				+ "and h.id = x.hy_id and x.fenlei = 4 ";
		String conditionHql = this.prepareHqlST(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParamST(queryVO);
		PageableList pageList = publicDao.queryForList(sql, list, paginator);
		List resultList = pageList.getResults();
		List<EntityDisposeVO> queryList = new ArrayList<EntityDisposeVO>();
		for (int i = 0; i < resultList.size(); i++) {
			Map map = (Map) resultList.get(i);
			EntityDisposeVO vo = new EntityDisposeVO();
			vo.setId(checkString(map.get("ID"))); // id
			vo.setCzxmmc(checkString(map.get("CZXMMC"))); // 项目名称
			String spjl = checkString(map.get("SPJL"));
			if ("1".equals(spjl)) {
				spjl = "同意";
			} else if ("0".equals(spjl)) {
				spjl = "不同意";
			} else {
				spjl = null;
			}
			vo.setSpjl(spjl); // 审批结论
			vo.setZhuangtai(findZhuangtai(checkString(map.get("ZHUANGTAI")))); // 状态
			vo.setSjhs(statisticQueryBSImpl.statisticIncome(checkString(map
					.get("ID")))); // 实际回收
			double[] d = statisticQueryBSImpl.statisticCost(checkString(map
					.get("ID")));
			Double fy = d[0] + d[1] + d[2] + d[3];
			vo.setSjczfy(fy); // 实际处置费用
			vo.setHycs(checkString(map.get("hycs"))); // 会议次数
			vo.setCldbianhao(checkString(map.get("BIANHAO"))); // 处理单编号
			vo.setCldczfs(this.findStCzFs(checkString(map.get("C_CZFS")))); // 处置方式
			vo.setCldczzclb(""); // 处置资产类型
			vo.setCldje(0D); // 净额
			vo.setCldjz(0D); // 净值
			vo.setCldngbm(checkString(map.get("NGBMMC"))); // 拟稿部门
			vo.setCldngr(checkString(map.get("NGRXM"))); // 拟稿人
			vo.setCldyjczfy(0D); // 预计处置费用
			vo.setCldyjczsr(0D);// 建议处置收入
			vo.setCldyjss(0D); // 预计损失
			vo.setCldyz(0D); // 原值
			vo.setSbrq(checkString(map.get("sbrq")));
			vo.setSlxh(checkString(map.get("slxh")));
			queryList.add(vo);
		}
		return queryList;
	}
	
	public List queryST(Paginator paginator, DisposeItemStaticVO queryVO) {
		String sql = "select x.ID,x.CZXMMC,x.SPJL,x.sbrq,x.slxh,x.ZHUANGTAI,x.HY_ID,s.BIANHAO,s.C_CZFS,"
				+ "s.NGBMMC,s.NGRXM,h.hycs from cz_xmxx_lsb x,cz_stcztz s,cz_hyxx h where x.cld_id = s.id "
				+ "and h.id = x.hy_id and x.fenlei = 3 ";
		String conditionHql = this.prepareHqlST(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParamST(queryVO);
		PageableList pageList = publicDao.queryForList(sql, list, paginator);
		List resultList = pageList.getResults();
		List<EntityDisposeVO> queryList = new ArrayList<EntityDisposeVO>();
		for (int i = 0; i < resultList.size(); i++) {
			Map map = (Map) resultList.get(i);
			EntityDisposeVO vo = new EntityDisposeVO();
			vo.setId(checkString(map.get("ID"))); // id
			vo.setCzxmmc(checkString(map.get("CZXMMC"))); // 项目名称
			String spjl = checkString(map.get("SPJL"));
			if ("1".equals(spjl)) {
				spjl = "同意";
			} else if ("0".equals(spjl)) {
				spjl = "不同意";
			} else {
				spjl = null;
			}
			vo.setSpjl(spjl); // 审批结论
			vo.setZhuangtai(findZhuangtai(checkString(map.get("ZHUANGTAI")))); // 状态
			vo.setSjhs(statisticQueryBSImpl.statisticIncome(checkString(map
					.get("ID")))); // 实际回收
			double[] d = statisticQueryBSImpl.statisticCost(checkString(map
					.get("ID")));
			Double fy = d[0] + d[1] + d[2] + d[3];
			vo.setSjczfy(fy); // 实际处置费用
			vo.setHycs(checkString(map.get("hycs"))); // 会议次数
			vo.setCldbianhao(checkString(map.get("BIANHAO"))); // 处理单编号
			vo.setCldczfs(this.findStCzFs(checkString(map.get("C_CZFS")))); // 处置方式
			vo.setCldczzclb(""); // 处置资产类型
			vo.setCldje(0D); // 净额
			vo.setCldjz(0D); // 净值
			vo.setCldngbm(checkString(map.get("NGBMMC"))); // 拟稿部门
			vo.setCldngr(checkString(map.get("NGRXM"))); // 拟稿人
			vo.setCldyjczfy(0D); // 预计处置费用
			vo.setCldyjczsr(0D);// 建议处置收入
			vo.setCldyjss(0D); // 预计损失
			vo.setCldyz(0D); // 原值
			vo.setSbrq(checkString(map.get("sbrq")));
			vo.setSlxh(checkString(map.get("slxh")));
			queryList.add(vo);
		}
		return queryList;
	}

	private String prepareHqlST(DisposeItemStaticVO queryVO) {
		String hql = "";
		// 拟稿人
		if (queryVO.getNigaoren() != null
				&& queryVO.getNigaoren().trim().length() > 0) {
			hql += " and s.NGRXM like ? ";
		}
		// 拟稿部门
		if (queryVO.getNigaobumen() != null
				&& queryVO.getNigaobumen().trim().length() > 0) {
			hql += " and s.NGBMMC like ? ";
		}
		// 项目名称
		if (queryVO.getXiangmumingcheng() != null
				&& queryVO.getXiangmumingcheng().trim().length() > 0) {
			hql += " and x.CZXMMC like ? ";
		}
		// 项目状态
		if (queryVO.getXiangmuzhuangtai() != null
				&& queryVO.getXiangmuzhuangtai().trim().length() > 0) {
			hql += " and x.ZHUANGTAI = ? ";
		}
		// 处置方式
		if (queryVO.getChuzhifangshi() != null
				&& queryVO.getChuzhifangshi().trim().length() > 0) {
			hql += " and s.C_CZFS = ? ";
		}
		// 申报日期到
		if (queryVO.getSbrqd() != null
				&& queryVO.getSbrqd().trim().length() > 0) {
			hql += " and x.sbrq <= to_date('" + queryVO.getSbrqd()
					+ "','YYYY-MM-DD') ";
		}
		// 申报日期从
		if (queryVO.getSbrqc() != null
				&& queryVO.getSbrqc().trim().length() > 0) {
			hql += " and x.sbrq >= to_date('" + queryVO.getSbrqc()
					+ "','YYYY-MM-DD') ";
		}
		// 会议次数
		if (queryVO.getHycs() != null && queryVO.getHycs().trim().length() > 0) {
			hql += " and h.hycs = ? ";
		}
		// 受理序号
		if (queryVO.getSlxh() != null && queryVO.getSlxh().trim().length() > 0) {
			hql += " and x.slxh = ? ";
		}
		hql += " order by h.hycs asc";
		return hql;
	}

	private List<Object> prepareParamST(DisposeItemStaticVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 拟稿人
		if (queryVO.getNigaoren() != null
				&& queryVO.getNigaoren().trim().length() > 0) {
			list.add("%" + queryVO.getNigaoren() + "%");
		}
		// 拟稿部门
		if (queryVO.getNigaobumen() != null
				&& queryVO.getNigaobumen().trim().length() > 0) {
			list.add("%" + queryVO.getNigaobumen() + "%");
		}
		// 项目名称
		if (queryVO.getXiangmumingcheng() != null
				&& queryVO.getXiangmumingcheng().trim().length() > 0) {
			list.add("%" + queryVO.getXiangmumingcheng() + "%");
		}
		// 项目状态
		if (queryVO.getXiangmuzhuangtai() != null
				&& queryVO.getXiangmuzhuangtai().trim().length() > 0) {
			list.add(queryVO.getXiangmuzhuangtai());
		}
		// 处置方式
		if (queryVO.getChuzhifangshi() != null
				&& queryVO.getChuzhifangshi().trim().length() > 0) {
			list.add(queryVO.getChuzhifangshi());
		}
		// 会议次数
		if (queryVO.getHycs() != null && queryVO.getHycs().trim().length() > 0) {
			list.add(queryVO.getHycs());
		}
		// 受理序号
		if (queryVO.getSlxh() != null && queryVO.getSlxh().trim().length() > 0) {
			list.add(queryVO.getSlxh());
		}
		return list;
	}

	public List queryFA(Paginator paginator, DisposeItemStaticVO queryVO) {
		String sql = "select x.ID,x.czxmmc,x.spjl,x.cld_id,x.zhuangtai,hy.hycs,f.bianhao,f.c_czfs,"
				+ "f.zclb,f.pgjz,f.zmjz,f.ngbmmc,f.slxh,f.ngrxm,to_char(x.sbrq,'yyyy-MM-dd') sbrq,f.yjczfy,f.yjczhsje,f.yjssje,f.zmyz,"
				+ " f.id faId from cz_xmxx_lsb x,cz_cztzfa_xx f,cz_hyxx hy where x.cld_id = f.id and hy.id = x.hy_id";
		String conditionHql = this.prepareHqlFA(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParamFA(queryVO);
		PageableList pageList = publicDao.queryForList(sql, list, paginator);
		List resultList = pageList.getResults();
		List<EntityDisposeVO> queryList = new ArrayList<EntityDisposeVO>();
		for (int i = 0; i < resultList.size(); i++) {
			Map map = (Map) resultList.get(i);
			EntityDisposeVO vo = new EntityDisposeVO();
			vo.setId(checkString(map.get("ID"))); // id
			vo.setCzxmmc(checkString(map.get("CZXMMC"))); // 项目名称
			String spjl = checkString(map.get("SPJL"));
			if ("1".equals(spjl)) {
				spjl = "同意";
			} else if ("0".equals(spjl)) {
				spjl = "不同意";
			} else if (spjl == null) {
				spjl = null;
			}
			vo.setSpjl(spjl); // 审批结论
			vo.setCldid(checkString(map.get("CLD_ID")));
			//卡片数
			long count = 0;
			String cldid = vo.getCldid();
			List param = new ArrayList();
			param.add(cldid);
			String hql = "select zc.azcid from CzZcXx as zc where zc.cldId = ? ";
			List<String> result = (List<String>) publicDao.find(hql, param);
			for(int j = 0; j<result.size(); j++){
				String zcid = (String) result.get(j);
				List param1 = new ArrayList();
				param1.add(zcid);
				String hql2 = "select count(b.cardcode) from Cardinfo as b,CardAssetHistory as a where a.kpId=b.id and a.dqgjzt ='0' and a.spzt='2' and a.zczsbId= ?";
				List<Long> kpsl = (List<Long>) publicDao.find(hql2, param1);
					long count2= kpsl.get(0);
					count = count + count2;
			}
			vo.setKpzsl(count);
			
			vo.setZhuangtai(findZhuangtai(checkString(map.get("ZHUANGTAI")))); // 状态
			vo.setSjhs(statisticQueryBSImpl.statisticIncome(checkString(map
					.get("ID")))); // 实际回收
			double[] d = statisticQueryBSImpl.statisticCost(checkString(map
					.get("ID")));
			Double fy = d[0] + d[1] + d[2] + d[3];
			vo.setSjczfy(fy); // 实际处置费用
			vo.setHycs(checkString(map.get("hycs"))); // 会议次数
			vo.setCldbianhao(checkString(map.get("BIANHAO"))); // 处理单编号
			vo.setCldczfs(this.findFaCzFs(checkString(map.get("faId")))); // 处置方式
			// 翻译处置资产类别
			vo.setCldczzclb(transferZclb((String) map.get("zclb"))); // 处置资产类型~~~~
			vo.setCldje(checkDouble(map.get("PGJZ"))); // 净额
			vo.setCldjz(checkDouble(map.get("ZMJZ"))); // 净值
			vo.setCldngbm(checkString(map.get("NGBMMC"))); // 拟稿部门
			vo.setCldngr(checkString(map.get("NGRXM"))); // 拟稿人
			vo.setCldyjczfy(checkDouble(map.get("YJCZFY"))); // 预计处置费用
			vo.setCldyjczsr(checkDouble(map.get("YJCZHSJE")));// 建议处置收入
			vo.setCldyjss(checkDouble(map.get("YJSSJE"))); // 预计损失
			vo.setCldyz(checkDouble(map.get("ZMYZ"))); // 原值
			vo.setSbrq(checkString(map.get("sbrq")));
			vo.setSlxh(checkString(map.get("slxh")));
			//根据处置投资方案信息表Id查询卡片数
//			vo.setKps(this.findKps(checkString(map.get("faId")))); 
			queryList.add(vo);
		}
		return queryList;
	}
	
	private String prepareHqlFA(DisposeItemStaticVO queryVO) {
		String hql = "";
		// 拟稿人
		if (queryVO.getNigaoren() != null
				&& queryVO.getNigaoren().trim().length() > 0) {
			hql += " and f.NGRXM like ? ";
		}
		// 拟稿部门
		if (queryVO.getNigaobumen() != null
				&& queryVO.getNigaobumen().trim().length() > 0) {
			hql += " and f.NGBMMC like ? ";
		}
		// 项目名称
		if (queryVO.getXiangmumingcheng() != null
				&& queryVO.getXiangmumingcheng().trim().length() > 0) {
			hql += " and x.CZXMMC like ? ";
		}
		// 项目状态
		if (queryVO.getXiangmuzhuangtai() != null
				&& queryVO.getXiangmuzhuangtai().trim().length() > 0) {
			hql += " and x.ZHUANGTAI = ? ";
		}
		// 处置方式
		if (queryVO.getChuzhifangshi() != null
				&& queryVO.getChuzhifangshi().trim().length() > 0) {
			hql += " and f.C_CZFS = ? ";
		}
		// 会议次数
		if (queryVO.getHycs() != null && queryVO.getHycs().trim().length() > 0) {
			hql += " and hy.hycs = ? ";
		}
		// 受理序号
		if (queryVO.getSlxh() != null && queryVO.getSlxh().trim().length() > 0) {
			hql += " and f.slxh = ? ";
		}
		// 申报日期到
		if (queryVO.getSbrqd() != null
				&& queryVO.getSbrqd().trim().length() > 0) {
			hql += " and x.sbrq <= to_date('" + queryVO.getSbrqd()
					+ "','YYYY-MM-DD') ";
		}
		// 申报日期从
		if (queryVO.getSbrqc() != null
				&& queryVO.getSbrqc().trim().length() > 0) {
			hql += " and x.sbrq >= to_date('" + queryVO.getSbrqc()
					+ "','YYYY-MM-DD') ";
		}
		hql += " order by hy.hycs desc";
		return hql;
	}

	private List<Object> prepareParamFA(DisposeItemStaticVO queryVO) {
		List<Object> list = new ArrayList<Object>();
		// 拟稿人
		if (queryVO.getNigaoren() != null
				&& queryVO.getNigaoren().trim().length() > 0) {
			list.add("%" + queryVO.getNigaoren() + "%");
		}
		// 拟稿部门
		if (queryVO.getNigaobumen() != null
				&& queryVO.getNigaobumen().trim().length() > 0) {
			list.add("%" + queryVO.getNigaobumen() + "%");
		}
		// 项目名称
		if (queryVO.getXiangmumingcheng() != null
				&& queryVO.getXiangmumingcheng().trim().length() > 0) {
			list.add("%" + queryVO.getXiangmumingcheng() + "%");
		}
		// 项目状态
		if (queryVO.getXiangmuzhuangtai() != null
				&& queryVO.getXiangmuzhuangtai().trim().length() > 0) {
			list.add(queryVO.getXiangmuzhuangtai());
		}
		// 处置方式
		if (queryVO.getChuzhifangshi() != null
				&& queryVO.getChuzhifangshi().trim().length() > 0) {
			list.add(queryVO.getChuzhifangshi());
		}
		// 会议次数
		if (queryVO.getHycs() != null && queryVO.getHycs().trim().length() > 0) {
			list.add(queryVO.getHycs());
		}
		// 受理序号
		if (queryVO.getSlxh() != null && queryVO.getSlxh().trim().length() > 0) {
			list.add(queryVO.getSlxh());
		}
		return list;
	}

	private String transferZclb(String value) {
		StringBuffer name = new StringBuffer();
		if (value != null) {
			String[] values = value.split(",");
			for (String temp : values) {
				if (StringUtils.equals("0", temp)) {
					name.append("经营性固产").append(",");
				} else if (StringUtils.equals("1", temp)) {
					name.append("实体内资产").append(",");
				} else if (StringUtils.equals("2", temp)) {
					name.append("委贷抵债物").append(",");
				} else if (StringUtils.equals("4", temp)) {
					name.append("自用资产").append(",");
				} else if (StringUtils.equals("5", temp)) {
					name.append("待处置资产").append(",");
				} else if (StringUtils.equals("7", temp)) {
					name.append("债券").append(",");
				} else {
					name.append("无资产").append(",");
				}
			}
			return name.substring(0, name.length() - 1).toString();
		} else {
			return "";
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
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Double checkDouble(Object obj) {
		Double dou = 0D;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0D;
		} else {
			dou = Double.valueOf(String.valueOf(obj));
		}
		return dou;
	}

	/**
	 * 状态
	 * 
	 * @param zhuangtai
	 * @return
	 */
	public String findZhuangtai(String zhuangtai) {
		if ("0".equals(zhuangtai)) {
			zhuangtai = "处置方案未执行";
		} else if ("1".equals(zhuangtai)) {
			zhuangtai = "处置方案执行中";
		} else if ("2".equals(zhuangtai)) {
			zhuangtai = "已结案";
		} else {
			zhuangtai = "";
		}
		return zhuangtai;
	}

	/**
	 * 查找会议次数
	 * 
	 * @param id
	 * @return
	 */
	public String findHYCS(String id) {
		if (id == null || "".equals(id)) {
			return "";
		} else {
			CzHyxx hy = (CzHyxx) publicDao.findById(CzHyxx.class, id);
			if (hy != null) {
				return hy.getHycs();
			} else {
				return "";
			}
		}
	}

	public CzCztzfaXx findCztzFaXX(String cldId) {
		CzCztzfaXx xx = (CzCztzfaXx) publicDao
				.findById(CzCztzfaXx.class, cldId);
		return xx;
	}

	public CzStcztz findCzStcztz(String cldId) {
		CzStcztz tz = (CzStcztz) publicDao.findById(CzStcztz.class, cldId);
		return tz;
	}

	/**
	 * 查找实体的处置方式
	 * 
	 * @return
	 */
	public Map findSTczfs() {
		Map<String, String> map = new HashMap<String, String>();
		String hql = "from Code c where c.codeType = 'ENTITY_DISPOSE_METHOD'";
		List list = publicDao.find(hql);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			Code code = (Code) iterator.next();
			map.put(code.getCodeKey(), code.getCodeValue());
		}
		return map;
	}

	/**
	 * 查找资产的处置方式
	 * 
	 * @return
	 */
	public Map findZCczfs() {
		Map<String, String> map = new HashMap<String, String>();
		String hql = "from Code c where c.codeType = 'ASSET_DISPOSE_METHOD'";
		List list = publicDao.find(hql);
		Iterator iterator = list.iterator();
		while (iterator.hasNext()) {
			Code code = (Code) iterator.next();
			map.put(code.getCodeKey(), code.getCodeValue());
		}
		return map;
	}

	/**
	 * 通过编号查找处置方式
	 * 
	 * @param codeKey
	 * @return
	 */
	public String findStCzFs(String codeKey) {
		String sql = "select t.* from code t where t.code_type = 'ENTITY_DISPOSE_METHOD' and t.code_key = '"
				+ codeKey + "'";
		String returnStr = "";
		List list = new ArrayList();
		list = publicDao.queryForList(sql, new ArrayList());
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			returnStr = checkString(map.get("code_value"));
		}
		return returnStr;
	}

	public String findFaCzFs(String cldId) {
		String sql = "select distinct t.c_czfs from cz_zc_xx t where t.cld_id = '"
				+ cldId + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		String returnStr = "";
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			String czfs = String.valueOf(map.get("c_czfs"));
			czfs = codeBSImpl.findCodeValueByCodeTypeAndCodeKey(
					"ASSET_DISPOSE_METHOD", czfs);
			returnStr = returnStr + czfs + ",";
			returnStr = returnStr.substring(0, returnStr.length()-1);
		}
		return returnStr;
	}

	public String querykp(DisposeItemStaticVO queryVO) {
		String sql = "select x.cld_id from cz_xmxx_lsb x,cz_cztzfa_xx f,cz_hyxx hy where x.cld_id = f.id and hy.id = x.hy_id";
		String conditionHql = this.prepareHqlFA(queryVO);
		sql += conditionHql;
		List<Object> list = this.prepareParamFA(queryVO);
		List resultList = publicDao.queryForList(sql,list);
		long count1 = 0;
		long count3 = 0;
		for (int i = 0; i < resultList.size(); i++) {
			Map map = (Map) resultList.get(i);
			EntityDisposeVO vo = new EntityDisposeVO();
			vo.setCldid(checkString(map.get("CLD_ID")));
			String cldid = vo.getCldid();
			// 卡片数
			List param = new ArrayList();
			param.add(cldid);
			String hql = "select zc.azcid from CzZcXx as zc where zc.cldId = ? ";
			List<String> result = (List<String>) publicDao.find(hql, param);
			for (int j = 0; j < result.size(); j++) {
				String zcid = (String) result.get(j);
				List param1 = new ArrayList();
				param1.add(zcid);
				String hql2 = "select count(b.cardcode) from Cardinfo as b,CardAssetHistory as a where a.kpId=b.id and a.dqgjzt ='0' and a.spzt='2' and a.zczsbId= ?";
				List<Long> kpsl = (List<Long>) publicDao.find(hql2, param1);
				long count2 = kpsl.get(0);
				count1 = count1 + count2;
			}
		}
		count3 = count3 + count1;
		String count5 = Long.toString(count3);
		return count5;
	}
	

}
