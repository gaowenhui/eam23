package com.tansun.eam2.zccz.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.zccz.service.IEvalQueryBS;
import com.tansun.eam2.zccz.vo.EvalVO1;
import com.tansun.eam2.zccz.vo.EvalVO2;
import com.tansun.eam2.zccz.vo.EvalVO3;
import com.tansun.eam2.zccz.vo.EvalVO4;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class EvalQueryBSImpl implements IEvalQueryBS {

	@Autowired
	public PublicDao publicDao;
	@Autowired
	private ICodeService codeServiceImpl;
	
	CzPgscJl czPgscJl1;
	CzPgscJl czPgscJl2;
	public void init() {
	}
	public Map<String, String> findEjFl(String yjFlBm) {
		Map<String, String> map = new HashMap<String, String>();
//		List params = new ArrayList();
//		List list = publicDao.queryForList(
//				"select distinct(SCXMMC) ,SCXMBH  from CZ_PGSC_JL  t ", params);
//		for (int i = 0; i < list.size(); i++) {
//			Map tempMap = (Map) list.get(i);
//			map.put(tempMap.get("SCXMBH").toString(), tempMap.get("SCXMMC")
//					.toString());
//		}
		return map;

	}

	public CzPgscJl findLXbyID(String strId) {
		List params = new ArrayList();
		params.add(strId);
		CzPgscJl czPgscJl = (CzPgscJl) publicDao.findSingleResult(
				"select distinct c  from CzPgscJl  c where c.scxmbh  = ?",
				params);
		return czPgscJl;
	}

	public Map<String, String> findYjFl() {
		Map<String, String> map = new HashMap<String, String>();
//		List params = new ArrayList();
//		List list = publicDao.queryForList(
//				"select distinct(VALUE) ,OLD_ID  from CZ_PGSC_JL  t ", params);
//		for (int i = 0; i < list.size(); i++) {
//			Map tempMap = (Map) list.get(i);
//			map.put(tempMap.get("OLD_ID").toString(), tempMap.get("VALUE")
//					.toString());
//		}
		return map;
	}

	//审查意见查询页面
	public List<EvalVO1> queryCzPgscZskwhCld(Paginator paginator,
			EvalVO1 evalVO1) {
//		System.out.println("=============处置评估审查意见明细 ==========");
		List<EvalVO1> listresult = new ArrayList<EvalVO1>();
		List<Object> listTemp = new ArrayList<Object>();
		List<Object> params = new ArrayList<Object>();
		StringBuffer strWhere = new StringBuffer();
		String preparSQL = "select b.id1,a.ngrq ngrq, a.biaoti as biaoti, a.bianhao as bianhao, b.C_SCJL as SCJL, t3 as jtyj ,c.spjl,  c.yjnr  from " +
								"(select t.id as id1,t.cld_id as headid, t.value as t1, c.value as t2, t.BGWTBZ, p.value as t3, t.rowid ,t.c_scjl from cz_pgsc_jl t, cz_pgsc_jl c, cz_pgsc_jl p where c.pid = t.id and c.id = p.pid  and t.pid = '0'  and t.jlxz !='0' ";
		
		strWhere.append(" ) b, cz_pgsc_zskwh_cld a ,(select a1.tbdid , b1.spjl, c1.yjnr from common_according a1, cz_xmxx_lsb b1, p_t_common_opinion c1 where a1.bdid = b1.cld_id and b1.id = c1.bdid and a1.lcmc = '评估审查' and c1.yjylx = '17') c where a.id=b.headid and c.tbdid(+) = a.id ");
		
		//标题
		if (evalVO1.getBgmc() != null && evalVO1.getBgmc().trim().length() > 0) {
			params.add("%" + evalVO1.getBgmc() + "%");
			strWhere.append("  and a.biaoti like ?  ");
		}
		// 编号
		if ( evalVO1.getCldh() != null &&  evalVO1.getCldh().trim().length() > 0) {
			params.add("%"+ evalVO1.getCldh()+"%");
			strWhere.append(" and  a.bianhao like ?  ");
		}
		//审查结论
		if (evalVO1.getScjl() != null && evalVO1.getScjl().trim().length() > 0) {
			params.add(evalVO1.getScjl());
			strWhere.append("  and b.C_SCJL = ?  ");
		}
		//具体意见
		if (evalVO1.getJtyj()!= null && evalVO1.getJtyj().trim().length() > 0) {
			params.add("%" + evalVO1.getJtyj() + "%");
			strWhere.append("  and b.t3 like ?  ");
		}	
		
		strWhere.append(	" order by ngrq desc ");		
		
		preparSQL = preparSQL + strWhere.toString();
		
		System.out.println(preparSQL);
		
		List list =  this.publicDao.queryForList(preparSQL.toString(), params,paginator).getResults(); 
		System.out.println("-----------"+list.size());
		for (int i = 0; i < list.size(); i++) {
			Map tempMap = (Map) list.get(i);
			EvalVO1 evalVO = new EvalVO1();
			String spjl =checkString( tempMap.get("SPJL"));
			if("1".equals(spjl)){
				spjl= "同意";
			}else if("0".equals(spjl)){
				spjl = "不同意";
			}
			evalVO.setBgmc(checkString(tempMap.get("BIAOTI")));
			evalVO.setCldh(checkString(tempMap.get("BIANHAO")));
			String scjl = checkString(tempMap.get("SCJL"));
			if("1".equals(scjl)){
				scjl = "通过";
			}else if("2".equals(scjl)){
				scjl = "通过（附参考意见）";
			}else if("3".equals(scjl)){
				scjl = "不通过";
			}else if("4".equals(scjl)){
				scjl = "不具备评估审查条件";
			}
			evalVO.setScjl(scjl);
			evalVO.setJtyj(checkString(tempMap.get("JTYJ")));
			evalVO.setYjnr(checkString(tempMap.get("YJNR")));
			evalVO.setSpjl(spjl);
			listresult.add(evalVO);
		}

		return listresult;
	}

	
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	
	public String checkDouble(Object obj) {
		String str = "0";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "0";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}
	
	//评估报告问题明细表查询
	public List<EvalVO2> queryCzPgscZskwhCld2(Paginator paginator,EvalVO2 evalVO2	) {
		
		List<EvalVO2> listresult = new ArrayList();
		
		List listTemp = new ArrayList();
		
		List params = new ArrayList();
		
		StringBuffer strWhere = new StringBuffer();
		
	//查询展现列
		//审查项目、审查要点、具体意见、报告名称、备注
		String preparSQL = "select b.id1,b.t1 as scxm ,b.t2 as scyd,b.t3 as jtyj ,a.biaoti as biaoti,b.beizhu as MEMO,b.tjrq tjrq " +
								"from (select t.id as id1,t.cld_id as headid, t.value as t1, c.value as t2,p.value as t3,t.BGWTBZ beizhu,t.tjrq tjrq " +
											"from cz_pgsc_jl t, cz_pgsc_jl c, cz_pgsc_jl p where c.pid = t.id and c.id = p.pid  and t.pid = '0' and p.jlxz != '0' and t.c_scjl is not null) b," +
									  "cz_pgsc_zskwh_cld a where a.id = b.headid ";
								
		//String biaoti, String scxm, String scyd,String jtyj,String datebegin,String dateend
		if (evalVO2.getBiaoti() != null && evalVO2.getBiaoti().trim().length() > 0) {
			params.add("%" + evalVO2.getBiaoti() + "%");
			strWhere.append("  and a.biaoti like ?  ");
		}
		if (evalVO2.getScxmmc() != null && evalVO2.getScxmmc().trim().length() > 0) {
			params.add("%" + evalVO2.getScxmmc() + "%");
			strWhere.append("  and  b.t1 like ?  ");
		}
		if (evalVO2.getScydmc() != null && evalVO2.getScydmc().trim().length() > 0) {
			params.add("%"+evalVO2.getScydmc()+"%");
			strWhere.append(" and    b.t2 like ?   ");
		}
		if (evalVO2.getJtyj() != null && evalVO2.getJtyj().trim().length() > 0) {
			params.add("%"+evalVO2.getJtyj()+"%");
			strWhere.append(" and    b.t3 like ?   ");
		}
		if (evalVO2.getTjrqB() != null && evalVO2.getTjrqB().trim().length() > 0) {
			strWhere.append(" and to_char(b.tjrq,'yyyy-MM-dd') >='"+evalVO2.getTjrqB()+"'");
		}
		if (evalVO2.getTjrqE() != null && evalVO2.getTjrqE().trim().length() > 0) {
			strWhere.append(" and to_char(b.tjrq,'yyyy-MM-dd') <='"+evalVO2.getTjrqE()+"'");
		}
		strWhere.append(" order by id1 desc ");		
		preparSQL = preparSQL+strWhere.toString();
		listTemp = (List<Map>) publicDao.queryForList(preparSQL, params,paginator).getResults();
		System.out.println("评估报告问题明细表=========="+preparSQL);
		for (int i = 0; i < listTemp.size(); i++) {
			Map tempMap = (Map) listTemp.get(i);
			EvalVO2 evalVO = new EvalVO2();
			String id=(String) tempMap.get("ID1");
			String scxmmc = (String) tempMap.get("SCXM");
			String scydmc = (String) tempMap.get("SCYD");
			String jtyj_ = (String) tempMap.get("JTYJ");
			String bgmc = (String) tempMap.get("BIAOTI");
			String memo=(String) tempMap.get("MEMO");
			evalVO.setId(id);
			evalVO.setBgmc(bgmc);
			evalVO.setJtyj(jtyj_);
			evalVO.setScxmmc(scxmmc);
			evalVO.setScydmc(scydmc);
			evalVO.setMemo(memo);
			listresult.add(evalVO);
		}
		return listresult;
	}

	/**
	 * @param paginator 分页信息
	 * @param evalVO3 查询条件
	 * @return List<EvalVO4> 全口径查询的查询结果
	 */
	public List<EvalVO4> queryCzPgscZskwhCld3(Paginator paginator,EvalVO3 evalVO3) {
		
		List<EvalVO4> listresult = new ArrayList();
		
		List listTemp = new ArrayList();
		
		List<String> params = new ArrayList<String>();
		
		//拼接查询条件
		StringBuffer strWhere = new StringBuffer();
		
		//查询展现列
			//编号、拟稿日期、拟稿人、补充材料提交时间、审查结论、审查时间、意见条数、标题、评估机构、报告类型、
			strWhere.
					append("select t.bianhao bianhao,to_char(t.ngrq,'yyyy-MM-dd') ngrq,t.nigaorenxm nigaorenxm,to_char(t.bccltjsj,'yyyy-MM-dd') bccltjsj,yj.C_SCJL C_SCJL,t.SCSJ SCSJ,yj.yjts yjts,t.biaoti biaoti,t.PGJG PGJG,t.C_BGLX C_BGLX,");
			//评估资产类别、评估基准日、评估目的
			strWhere.
					append("t.PGZCLB PGZCLB,to_char(t.PGJZR,'yyyy-MM-dd') PGJZR,t.PGMD PGMD,");
			//省份、卡片编号、资产名称、资产类别、评估值、基准日账面值、评估方法、价值类型、账面原值、账面净值、增减值、增减幅度
			strWhere.
					append("zcinfo.adress shengfen,zcinfo.kpbh kpbh,zcinfo.zcmc zcmc,zcinfo.zclb zclb,zcinfo.zmyz,zcinfo.zmjz,zcinfo.pgz pgz,zcinfo.jzrjz jzrjz,zcinfo.pgff pgff,zcinfo.jzlx jzlx,zcinfo.zjz zjz,zcinfo.zjfd zjfd,");
			//审批时间、审批结论、会议次数、审核结果
			strWhere.
					append("czhyxx.spsj spsj,czhyxx.spjl spjl,czhyxx.hycs hycs,czhyxx.yjnr yjnr");
			
		//查询结果表
			strWhere.
					append(" from cz_pgsc_zskwh_cld t,")
					.append("(select t3.id id,count(jl.id)/3 yjts,jl.C_SCJL C_SCJL from cz_pgsc_zskwh_cld t3,cz_pgsc_jl jl where t3.id = jl.cld_id and jl.c_scjl is not null and (jl.JLXZ = '1' or jl.jlxz = '2') group by t3.id,jl.C_SCJL) yj,")
					.append("(select t2.id pgcldId,to_char(hy.spsj,'yyyy-MM-dd') spsj,lsb.spjl spjl,hy.hycs hycs,op.yjnr yjnr from cz_pgsc_zskwh_cld t2,common_according acc,cz_xmxx_lsb lsb,CZ_HYXX hy,p_t_common_opinion op")
							.append(" where t2.id = acc.tbdid and acc.lcmc = '评估审查' and acc.bdid = lsb.cld_id and op.bdid = lsb.id and lsb.hy_id = hy.id and op.yjylx = '17') czhyxx,")
					.append("(select zc.czpgscclid id,")
							.append("decode(zc.pgzclb,'0',zc.sfmc,'1',zc.STCFWZ,'2',zc.CCFWZ,'3',zc.GQSTSF,'4',null,'5',zc.ZYBGDD) adress,")
							.append("decode(zc.pgzclb,'0',zc.ZKPBH,'1',null,'2',null,'3',null,'4',null,'5',zc.ZYKPBH) kpbh,")
							.append("decode(zc.pgzclb,'0',zc.zcmc,'1',zc.stzcmc,'2',zc.czcmc,'3',zc.gqstmc,'4',zc.zwrmc,'5',zc.ZYZCMC) zcmc,")
							.append("decode(zc.pgzclb,'0',zc.ZCLB,'1',zc.STZCLB,'2',zc.CZCLX,'3',zc.GQSTZL,'4',zc.ZQZL,'5',null) zclb,")
							.append("decode(zc.pgzclb,'0',zc.ZCYBYZ,'1',null,'2',null,'3',null,'4',null,'5',null) zmyz,")
							.append("decode(zc.pgzclb,'0',zc.ZCZMJZ,'1',null,'2',null,'3',null,'4',null,'5',null) zmjz,")
							.append("zc.pingguzhi pgz,zc.jzrzmjz jzrjz,zc.pgff pgff,zc.c_jzlx jzlx,zc.zjz zjz,zc.zjfd zjfd")
							.append(" from cz_pgxx_lsb zc )zcinfo ")
					.append("	where yj.id = t.id and t.id = czhyxx.pgcldId(+) and t.id = zcinfo.id ");
		
		//编号进行模糊查询
		if (evalVO3.getBianhao() != null && evalVO3.getBianhao().trim().length() > 0) {
			params.add("%" + evalVO3.getBianhao() + "%");
			strWhere.append(" and t.bianhao like ? ");
		}
		
		//标题进行模糊查询
		if (evalVO3.getBiaoti() != null && evalVO3.getBiaoti().trim().length() > 0) {
			params.add("%" + evalVO3.getBiaoti() + "%");
			strWhere.append(" and t.biaoti like ? ");
		}
		//评估机构进行模糊查询
		if (evalVO3.getPinggujigou()  != null && evalVO3.getPinggujigou().trim().length() > 0) {
			params.add("%" + evalVO3.getPinggujigou() + "%");
			strWhere.append(" and t.pgjg like ? ");
		}
		//拟稿人姓名进行模糊查询
		if (evalVO3.getNgr() != null && evalVO3.getNgr().trim().length() > 0) {
			params.add("%" + evalVO3.getNgr() + "%");
			strWhere.append(" and t.nigaorenxm like ? ");
		}
		//审查结论进行精确查询
		if (evalVO3.getScjl()  != null && evalVO3.getScjl().trim().length() > 0) {
			params.add(evalVO3.getScjl());
			strWhere.append(" and yj.c_scjl  =  ? ");
		}
		//审批结果进行精确查询
		if (evalVO3.getSpjg()  != null && evalVO3.getSpjg().trim().length() > 0) {
			params.add(evalVO3.getSpjg());
			strWhere.append(" and spjl =  ? ");
		}	
		//按照拟稿日期进行区间查询
		if (evalVO3.getNgrqbegin()  != null && evalVO3.getNgrqbegin().trim().length() > 0) {
			params.add(evalVO3.getNgrqbegin());
			strWhere.append(" and to_char(t.ngrq,'yyyy-MM-dd') >=  ? ");
		}
		
		if (evalVO3.getNgrqend()  != null && evalVO3.getNgrqend().trim().length() > 0) {
			params.add(evalVO3.getNgrqend());
			strWhere.append(" and to_char(t.ngrq,'yyyy-MM-dd') <= ? ");
		}

		//按照审查时间进行精确查询
		if (evalVO3.getScrqbegin()  != null && evalVO3.getScrqbegin().trim().length() > 0) {
			params.add(evalVO3.getScrqbegin());
			strWhere.append(" and to_char(t.scsj,'yyyy-MM-dd') >=  ? ");
		}
		if (evalVO3.getScrqend()  != null && evalVO3.getScrqend().trim().length() > 0) {
			params.add(evalVO3.getScrqend());
			strWhere.append(" and to_char(t.scsj,'yyyy-MM-dd') <=  ? ");
		}
		
		//按照审批时间进行精确查询
		if (evalVO3.getSprqbegin() != null && evalVO3.getSprqbegin().trim().length() > 0) {
			params.add(evalVO3.getSprqbegin());
			strWhere.append(" and  to_char(czhyxx.spsj,'yyyy-MM-dd')  >= ? ");
		}
		if (evalVO3.getSprqend() != null && evalVO3.getSprqend().trim().length() > 0) {
			params.add(evalVO3.getSprqend());
			strWhere.append(" and to_char(czhyxx.spsj,'yyyy-MM-dd')  <=? ");
		}
		
		/* 查询的是办结的处理单
		if (evalVO3.getCldzt()  != null && evalVO3.getCldzt().trim().length() > 0) {
			params.add(evalVO3.getCldzt());
			strWhere.append(" and a.cldzt =  ? ");
		}
		*/
		strWhere
			 .append(" order by ngrq desc");		
			
		System.out.print("preparSQL全口径查询----------->" + strWhere.toString());
		PageableList pageableList =  publicDao.queryForList(strWhere.toString(),params, paginator);
		listTemp = pageableList.getResults();
		for (int i = 0; i < listTemp.size(); i++) {
			Map tempMap = (Map) listTemp.get(i);
			EvalVO4 evalVO4 = new EvalVO4();

			String bianhao=String.valueOf(tempMap.get("bianhao"));
			
			String ngrq = (String)tempMap.get("NGRQ");
			
			String nigaorenxm = (String) tempMap.get("nigaorenxm");
			
			String bccltjsj = (String) tempMap.get("bccltjsj");
			
			String c_scjl = (String) tempMap.get("C_SCJL");
			
			String scsj = tempMap.get("SCSJ") == null?"":DateUtils.formatDate((Date) tempMap.get("SCSJ"),"yyyy-MM-dd");
			
			String yjts = ((java.math.BigDecimal) tempMap.get("YJTS")).toString();
			
			String biaoti = (String) tempMap.get("BIAOTI");
			
			String pgjg = (String) tempMap.get("PGJG");
			
			String c_bglx = (String) tempMap.get("C_BGLX");

			//评估资产类别、评估基准日、评估目的
			String pgzclb = String.valueOf(tempMap.get("PGZCLB"));
			
			String pgjzr = String.valueOf(tempMap.get("PGJZR"));
			
			String pgmd = String.valueOf(tempMap.get("PGMD"));
			
			//省份、卡片编号、资产名称、资产类别、评估值、基准日账面值、评估方法、价值类型、增减值、增减幅度
			String shengfen = String.valueOf(tempMap.get("shengfen"));
			
			String kpbh	= String.valueOf(tempMap.get("kpbh"));
			
			String zcmc = String.valueOf(tempMap.get("zcmc"));
			
			String zclb = String.valueOf(tempMap.get("zclb"));
			
			String zmyz = String.valueOf(tempMap.get("zmyz"));
			
			String zmjz = String.valueOf(tempMap.get("zmjz"));
			
			String pingguzhi = String.valueOf(tempMap.get("pgz"));
			
			String jzrzmjz = String.valueOf(tempMap.get("jzrjz"));
			
			String pgff = String.valueOf(tempMap.get("pgff"));
			
			String jzlx = String.valueOf(tempMap.get("jzlx"));
			
			String zjz = String.valueOf(tempMap.get("zjz"));
			
			String zjfd = String.valueOf(tempMap.get("zjfd"));
			
			String spjg = String.valueOf(tempMap.get("spjl"));
			
			String spsj = String.valueOf(tempMap.get("SPSJ"));
			
			String yjnr = String.valueOf(tempMap.get("YJNR"));
			
			String hycs = String.valueOf(tempMap.get("HYCS"));
		
			if(StringUtils.equals(pgzclb, "1") || StringUtils.equals(pgzclb, "2")){
				if(StringUtils.equals(zclb,StglCommon.ST_INFO_JINE)){
					zclb = "现金";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_TUDI)){
					zclb = "土地";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_FANGWU)){
					zclb = "房屋";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_JIXIESHEBE)){
					zclb = "机械设备";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_JIAOTONGYUNSHU)){
					zclb = "交通运输";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_DUIWAITOUZI)){
					zclb = "对外投资";
				}else if(StringUtils.equals(zclb,StglCommon.ST_INFO_QITAZICHAN)){
					zclb = "其他资产";
				}
			} else if (StringUtils.equals(pgzclb, "0")) {
				zclb = this.findCoteNameByCoteKey("ASSET_TYPE", zclb);
			} else {
				zclb = "";
			}
			
			//翻译评估资产类别、报告类型、审批结论
			pgzclb = this.getPgzclb(pgzclb);
			c_bglx = getDicAppAssetState1("ESTIMATE_REPORT_TYPE",c_bglx);
			if(StringUtils.equals(spjg, "0")){
				spjg = "不同意";
			}else if (StringUtils.equals(spjg, "1")){
				spjg = "同意";
			}
			
			evalVO4.setBianhao(checkString(bianhao));
			evalVO4.setNgrq(checkString(ngrq));
			evalVO4.setNigaorenxm(checkString(nigaorenxm));
			evalVO4.setBccltjsj(checkString(bccltjsj));
			if(StringUtils.equals(c_scjl, "2")){
				c_scjl = "通过（附参考意见）";
			}else if (StringUtils.equals(c_scjl, "1")){
				c_scjl = "通过";
			}else if (StringUtils.equals(c_scjl, "3")){
				c_scjl = "不通过";	
			}else if (StringUtils.equals(c_scjl, "4")){
				c_scjl = "不具备评估审查条件";
			}
			evalVO4.setC_scjl(checkString(c_scjl));
			evalVO4.setScsj(checkString(scsj));
			evalVO4.setYjts(checkString(yjts));
			evalVO4.setBiaoti(checkString(biaoti));
			evalVO4.setPgjg(checkString(pgjg));
			evalVO4.setC_bglx(checkString(c_bglx));
			evalVO4.setPgzclbName(checkString(pgzclb));
			evalVO4.setPgmd(checkString(pgmd));
			evalVO4.setPgjzr(checkString(pgjzr));
			
			//股权
			if(StringUtils.equals(pgzclb, "股权")){
				Code code = codeServiceImpl.findByCodeTypeAndCodeKey("PROVIENCE",shengfen);
				if(code != null){
					evalVO4.setSfmc(code.getCodeValue());
				}
			}else{
				evalVO4.setSfmc(checkString(shengfen));
			}
			
			evalVO4.setZkpbh(checkString(kpbh));
			evalVO4.setZcmc1(checkString(zcmc));
			
			//翻译资产类别、评估方法、价值类型
			pgff = this.getDicAppAssetState1("ESTIMATE_METHOD", pgff);
			jzlx = this.getDicAppAssetState1("ESTIMATE_VALUE_TYPE", jzlx);
			
			evalVO4.setZclb(checkString(zclb));
			evalVO4.setPgff(checkString(pgff));
			evalVO4.setC_jzlx(checkString(jzlx));
			evalVO4.setJzrzmjz(checkString(jzrzmjz));
			evalVO4.setZczmyz(checkString(zmyz));
			evalVO4.setZczmjz(checkString(zmjz));
			evalVO4.setPingguzhi(checkString(pingguzhi));
			evalVO4.setZjz(checkString(zjz));
			if(StringUtils.isNotEmpty(zjfd) && !StringUtils.equals(zjfd, "null")){
				java.math.BigDecimal zjfdValue = new java.math.BigDecimal(zjfd);
				java.math.BigDecimal temp = new java.math.BigDecimal(100L);
				zjfd = (zjfdValue.multiply(temp)).setScale(2).toPlainString() + "%";
			}
			evalVO4.setZjfd(checkString(zjfd));
			evalVO4.setSpjg(checkString(spjg));
			evalVO4.setSpsj(checkString(spsj));
			evalVO4.setHycs(checkString(hycs));
			evalVO4.setSpwyj(checkString(yjnr));
			
			listresult.add(evalVO4);			

		}
		return listresult;
	}
	
	/**
	 * @param paginator 分页信息
	 * @param evalVO3 查询条件
	 * @return List<EvalVO4> 统计查询的查询结果
	 */
	public List<EvalVO4> queryCzPgscZskwhCld4(Paginator paginator,EvalVO3 evalVO3) {
		
		List<EvalVO4> listresult = new ArrayList();
		
		List listTemp = new ArrayList();
		
		List<String> params = new ArrayList<String>();
		
		//拼接查询sql
		StringBuffer strWhere = new StringBuffer();
		
	//查询展现列
		//编号、拟稿日期、拟稿人、补充材料提交时间、审查结论、审查时间、意见条数、标题、评估机构、报告类型、
		strWhere.
				append("select t.bianhao bianhao,to_char(t.ngrq,'yyyy-MM-dd') ngrq,t.nigaorenxm nigaorenxm,to_char(t.bccltjsj,'yyyy-MM-dd') bccltjsj,yj.C_SCJL C_SCJL,t.SCSJ SCSJ,yj.yjts yjts,t.biaoti biaoti,t.PGJG PGJG,t.C_BGLX C_BGLX,");
		//评估资产类别、评估基准日、评估目的、评估值、基准日账面值、账面原值、账面价值、增减值、增减幅度
		strWhere.
				append("t.PGZCLB PGZCLB,to_char(t.PGJZR,'yyyy-MM-dd') PGJZR,t.PGMD PGMD,t.PGZZ PGZZ,t.JZRZMJZ JZRZMJZ,t.ZCZMYZ ZCZMYZ,t.ZCZMJZ ZCZMJZ,t.ZJZ ZJZ,t.ZJFD ZJFD,");
		
		//审批时间、审批结论、会议次数、审核结果
		strWhere.
				append("czhyxx.spsj spsj,czhyxx.spjl spjl,czhyxx.hycs hycs,czhyxx.yjnr yjnr");
		
	//查询结果表
		strWhere.
				append(" from cz_pgsc_zskwh_cld t,")
				.append("(select t3.id id,count(jl.id)/3 yjts,jl.C_SCJL C_SCJL from cz_pgsc_zskwh_cld t3,cz_pgsc_jl jl where t3.id = jl.cld_id and jl.c_scjl is not null and (jl.JLXZ = '1' or jl. JLXZ = '2') group by t3.id,jl.C_SCJL) yj,")
				.append("(select t2.id pgcldId,to_char(hy.spsj,'yyyy-MM-dd') spsj,lsb.spjl spjl,hy.hycs hycs,op.yjnr yjnr from cz_pgsc_zskwh_cld t2,common_according acc,cz_xmxx_lsb lsb,CZ_HYXX hy,p_t_common_opinion op")
						.append(" where t2.id = acc.tbdid and acc.lcmc = '评估审查' and acc.bdid = lsb.cld_id and op.bdid = lsb.id and lsb.hy_id = hy.id and op.yjylx = '17') czhyxx	")
				.append("	where yj.id = t.id and t.id = czhyxx.pgcldId(+) ");
	//拼接查询条件
		//编号进行模糊查询
		if (evalVO3.getBianhao() != null && evalVO3.getBianhao().trim().length() > 0) {
			params.add("%" + evalVO3.getBianhao() + "%");
			strWhere.append(" and t.bianhao like ? ");
		}
		
		//标题进行模糊查询
		if (evalVO3.getBiaoti() != null && evalVO3.getBiaoti().trim().length() > 0) {
			params.add("%" + evalVO3.getBiaoti() + "%");
			strWhere.append(" and t.biaoti like ? ");
		}
		//评估机构进行模糊查询
		if (evalVO3.getPinggujigou()  != null && evalVO3.getPinggujigou().trim().length() > 0) {
			params.add("%" + evalVO3.getPinggujigou() + "%");
			strWhere.append(" and t.pgjg like ? ");
		}
		//拟稿人姓名进行模糊查询
		if (evalVO3.getNgr() != null && evalVO3.getNgr().trim().length() > 0) {
			params.add("%" + evalVO3.getNgr() + "%");
			strWhere.append(" and t.nigaorenxm like ? ");
		}
		//审查结论进行精确查询
		if (evalVO3.getScjl()  != null && evalVO3.getScjl().trim().length() > 0) {
			params.add(evalVO3.getScjl());
			strWhere.append(" and yj.c_scjl  =  ? ");
		}
		//审批结果进行精确查询
		if (evalVO3.getSpjg()  != null && evalVO3.getSpjg().trim().length() > 0) {
			params.add(evalVO3.getSpjg());
			strWhere.append(" and spjl  =  ? ");
		}	
		//按照拟稿日期进行区间查询
		if (evalVO3.getNgrqbegin()  != null && evalVO3.getNgrqbegin().trim().length() > 0) {
			params.add(evalVO3.getNgrqbegin());
			strWhere.append(" and to_char(t.ngrq,'yyyy-MM-dd')>=  ? ");
		}
		
		if (evalVO3.getNgrqend()  != null && evalVO3.getNgrqend().trim().length() > 0) {
			params.add(evalVO3.getNgrqend());
			strWhere.append(" and to_char(t.ngrq,'yyyy-MM-dd') <= ? ");
		}

		//按照审查时间进行精确查询
		if (evalVO3.getScrqbegin()  != null && evalVO3.getScrqbegin().trim().length() > 0) {
			params.add(evalVO3.getScrqbegin());
			strWhere.append(" and to_char(t.scsj,'yyyy-MM-dd') >=  ? ");
		}
		if (evalVO3.getScrqend()  != null && evalVO3.getScrqend().trim().length() > 0) {
			params.add(evalVO3.getScrqend());
			strWhere.append(" and to_char(t.scsj,'yyyy-MM-dd') <=  ? ");
		}
		
		//按照审批时间进行精确查询
		if (evalVO3.getSprqbegin() != null && evalVO3.getSprqbegin().trim().length() > 0) {
			params.add(evalVO3.getSprqbegin());
			strWhere.append(" and  to_char(spsj,'yyyy-MM-dd')  >= ? ");
		}
		if (evalVO3.getSprqend() != null && evalVO3.getSprqend().trim().length() > 0) {
			params.add(evalVO3.getSprqend());
			strWhere.append(" and to_char(spsj,'yyyy-MM-dd')  <=? ");
		}
		
		strWhere
				.append(" order by ngrq desc");
		
		System.out.print("preparSQL--------------->" + strWhere.toString());

		PageableList	pageableList =  publicDao.queryForList(strWhere.toString(),
				params, paginator);
		listTemp = pageableList.getResults();
		for (int i = 0; i < listTemp.size(); i++) {
			Map tempMap = (Map) listTemp.get(i);
			EvalVO4 evalVO4 = new EvalVO4();
			
			String bianhao=String.valueOf(tempMap.get("bianhao"));
			
			String ngrq = (String)tempMap.get("NGRQ");
			
			String nigaorenxm = (String) tempMap.get("nigaorenxm");
			
			String bccltjsj = (String) tempMap.get("bccltjsj");
			
			String c_scjl = (String) tempMap.get("C_SCJL");
			
			String scsj = tempMap.get("SCSJ") == null?"":DateUtils.formatDate((Date) tempMap.get("SCSJ"),"yyyy-MM-dd");
			
			String yjts = ((java.math.BigDecimal) tempMap.get("YJTS")).toString();
			
			String biaoti = (String) tempMap.get("BIAOTI");
			
			String pgjg = (String) tempMap.get("PGJG");
			
			String c_bglx = (String) tempMap.get("C_BGLX");

			//评估资产类别、评估基准日、评估目的、评估值、基准日账面值、账面原值、账面价值、增减值、增减幅度
			String pgzclb = String.valueOf(tempMap.get("PGZCLB"));
			
			String pgjzr = String.valueOf(tempMap.get("PGJZR"));
			
			String pgmd = String.valueOf(tempMap.get("PGMD"));
			
			String pingguzhi = String.valueOf(tempMap.get("PGZZ"));
			
			String jzrzmjz = String.valueOf(tempMap.get("JZRZMJZ"));
			
			String zczmyz = String.valueOf(tempMap.get("ZCZMYZ"));
			
			String zczmjz = String.valueOf(tempMap.get("ZCZMJZ"));
			
			String zjz = String.valueOf(tempMap.get("ZJZ"));
			
			String zjfd =String.valueOf(tempMap.get("ZJFD"));
			
			String spjg = String.valueOf(tempMap.get("spjl"));
			
			String spsj = String.valueOf(tempMap.get("SPSJ"));
			
			String yjnr = String.valueOf(tempMap.get("YJNR"));
			
			String hycs = String.valueOf(tempMap.get("HYCS"));
			
			//翻译评估资产类别、报告类型、审批结论
			pgzclb = this.getPgzclb(pgzclb);
			c_bglx = getDicAppAssetState1("ESTIMATE_REPORT_TYPE",c_bglx);
			if(StringUtils.equals(spjg, "0")){
				spjg = "不同意";
			}else if (StringUtils.equals(spjg, "1")){
				spjg = "同意";
			}
			
			evalVO4.setBianhao(checkString(bianhao));
			evalVO4.setNgrq(checkString(ngrq));
			evalVO4.setNigaorenxm(checkString(nigaorenxm));
			evalVO4.setBccltjsj(checkString(bccltjsj));
			if(StringUtils.equals(c_scjl, "2")){
				c_scjl = "通过（附参考意见）";
			}else if (StringUtils.equals(c_scjl, "1")){
				c_scjl = "通过";
			}else if (StringUtils.equals(c_scjl, "3")){
				c_scjl = "不通过";	
			}else if (StringUtils.equals(c_scjl, "4")){
				c_scjl = "不具备评估审查条件";
			}
			evalVO4.setC_scjl(checkString(c_scjl));
			evalVO4.setScsj(checkString(scsj));
			evalVO4.setYjts(checkString(yjts));
			evalVO4.setBiaoti(checkString(biaoti));
			evalVO4.setPgjg(checkString(pgjg));
			evalVO4.setC_bglx(checkString(c_bglx));
			evalVO4.setPgzclbName(checkString(pgzclb));
			evalVO4.setPgmd(checkString(pgmd));
			evalVO4.setPgjzr(checkString(pgjzr));
			
			evalVO4.setZczmyz(checkString(zczmyz));
			evalVO4.setZczmjz(checkString(zczmjz));
			evalVO4.setJzrzmjz(checkString(jzrzmjz));
			evalVO4.setPingguzhi(checkString(pingguzhi));
			evalVO4.setZjz(checkString(zjz));
			if(StringUtils.isNotEmpty(zjfd)){
				java.math.BigDecimal zjfdValue = new java.math.BigDecimal(zjfd);
				java.math.BigDecimal temp = new java.math.BigDecimal(100L);
				zjfd = (zjfdValue.multiply(temp)).setScale(2).toPlainString() + "%";
			}
			evalVO4.setZjfd(checkString(zjfd));
			evalVO4.setSpjg(checkString(spjg));
			evalVO4.setSpsj(checkString(spsj));
			evalVO4.setHycs(checkString(hycs));
			evalVO4.setSpwyj(checkString(yjnr));
			
			listresult.add(evalVO4);
		}
		return listresult;
	}
	//评估资产类别'0':'固定资产','1':'实体内资产','2':'委贷抵债物','3':'股权','4':'债权'
	public String getPgzclb(String pgzclb){
		if(StringUtils.equals(pgzclb, "0")){
			return "固定资产";
		}else if(StringUtils.equals(pgzclb, "1")){
			return "实体内资产";
		}else if(StringUtils.equals(pgzclb, "2")){
			return "委贷抵债物";
		}else if(StringUtils.equals(pgzclb, "3")){
			return "股权";
		}else if(StringUtils.equals(pgzclb, "4")){
			return "债权";
		}else if(StringUtils.equals(pgzclb, "5")){
			return "自用资产";
		}else {
			return null;
		}

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
	
	public void updateMemo(String strId, String strMemo) {
		String strSQL="update cz_pgsc_jl  set BGWTBZ ='"+strMemo+"' where id='"+strId+"'";
		System.out.println(strSQL);
		publicDao.getJdbcTemplate().update(strSQL);
	}
	
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
