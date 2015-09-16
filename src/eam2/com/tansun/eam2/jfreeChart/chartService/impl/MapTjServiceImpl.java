package com.tansun.eam2.jfreeChart.chartService.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartService.MapTjService;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class MapTjServiceImpl implements MapTjService {
	@Autowired
	public PublicDao publicDao;
	
   
	/**
	 *    查询数据list（全资产统计）
	 * @param 
	 * @return
	 */
	public List queryDataQzcList(){
		String date=this.getCurrDate();
		List paramlist=new ArrayList();
		paramlist.add(date);
		String sql1=" with cc as (select substr(c.code_key,0,3) as  code  from code c " +
				                " where " +
				                " c.code_key!='810000'  and c.code_key!='710000'  and c.code_key!='820000' and  c.code_name='省份' )" +
				                " select" +
				                " (case to_Char(aaa.jzml) when '0' then  0 " +
				                "  else   bbb.czsl/aaa.jzml*100 " +
				                "  end ) as he , bbb.code " +
				                "from (" +
				               " select aa.jzml,cc.code " +
				               " from (" +
				                 " SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml ,  subStr(a.C_ZCDQ,0,3) sheng  " +
				                 " from JYZC_XX a " +
				                 "  where  a.C_ZCLX='1'   and a.c_zcdq is not null group by (subStr(a.C_ZCDQ,0,3)) ) " +
				                 " aa " +
				                 " right join  cc on cc.code = aa.sheng) aaa," +
				               " ( select ff.czsl,cc.code from (select  sum(CZSL) as czsl ,(subStr(jx.C_ZCDQ,0,3)) code from JYZC_XX  jx " +
				               " left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  " +
				               " and   C_HTZT='1' and C_HTLX='2' and ? " +
				               " between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')" +
				               " group by (subStr(jx.C_ZCDQ,0,3))) " +
				               " ff right join cc on cc.code = ff.code" +
				               " ) bbb where aaa.code = bbb.code     order by  aaa.code  ";
		
		List list=publicDao.queryForList(sql1, paramlist);
		return list;
	}
	
	
	/**
	 *    查询数据list（经营类资产统计）
	 * @param 
	 * @return
	 */
	public List queryDataJylzcList(){
		String date=this.getCurrDate();
		List paramlist=new ArrayList();
		paramlist.add(date);
		String sql1=" with cc as (select substr(c.code_key,0,3) as  code  from code c " +
				                " where " +
				                " c.code_key!='810000'  and c.code_key!='710000'  and c.code_key!='820000' and  c.code_name='省份' )" +
				                " select " +
				                " (case to_Char(aaa.jzml) when '0' then  0 " +
				                "  else   bbb.czsl/aaa.jzml*100 " +
				                "  end ) as he , bbb.code " +
				                "from (" +
				               " select aa.jzml,cc.code " +
				               " from (" +
				                 " SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml ,  subStr(a.C_ZCDQ,0,3) sheng  " +
				                 " from JYZC_XX a " +
				                 "  where  a.C_ZCLX='1'   and a.c_jyfl='1' and a.c_zcdq is not null group by (subStr(a.C_ZCDQ,0,3)) ) " +
				                 " aa " +
				                 " right join  cc on cc.code = aa.sheng) aaa," +
				               " ( select ff.czsl,cc.code from (select  sum(CZSL) as czsl ,(subStr(jx.C_ZCDQ,0,3)) code from JYZC_XX  jx " +
				               " left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  " +
				               " and jx.c_jyfl='1' and C_HTZT='1' and C_HTLX='2' and ? " +
				               " between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')" +
				               " group by (subStr(jx.C_ZCDQ,0,3))) " +
				               " ff right join cc on cc.code = ff.code" +
				               " ) bbb where aaa.code = bbb.code  order by  aaa.code  ";
		
		List list=publicDao.queryForList(sql1, paramlist);
		return list;
	}
	
	
	
	
	
	   
	/**
	 * 查询数据list（委托贷款统计）
	 * @param 
	 * @return
	 */
	public List queryDataWtdkList(){
		String sql1="  select dd.* from (select sum(e.gl_dr_bal)/10000 he, substr(e.gl_opun_cod,0,3) code " +
				" from  CRT_TOTAL_ACCOUNT e  where DATA_DATE =( select max(DATA_DATE)  from CRT_TOTAL_ACCOUNT)   and  e.gl_lg_no='79600000'" +
				" group by substr(e.gl_opun_cod,0,3))dd , (select substr(c.code_key,0,3) gl_opun_cod  " +
				" from code c where    c.code_key!='810000'  and c.code_key!='710000' and c.code_key!='820000' and  c.code_name='省份' " +
				") cc where dd.code (+)= cc.gl_opun_cod order by dd.code ";
		
		List list=publicDao.queryForList(sql1, new ArrayList());
		return list;
	}
	
	/**
	 * 查询数据list（担险委托贷款统计）
	 * @param 
	 * @return
	 */
	public List queryDataDxwtdkList(){ 
		String sql1="  select dd.he , cc.code  from (select (sum(LN_LN_BAL))/10000 as he,subStr(ln_ln_acct_no,0,3) as ln_ln_acct_no from crt_dcc_LNLNSLNS" +
				" where ln_ln_acct_no in (select ln_acct_no from WD_LN_MORE_INFOR where ASSET_TYPE= '担险') " +
				" group by subStr(ln_ln_acct_no,0,3))dd , " +
				" (select substr(c.code_key,0,3) as  code  from code c where   " +
				" c.code_key!='810000'  and c.code_key!='710000' and c.code_key!='820000' and  c.code_name='省份' " +
				")cc where dd.ln_ln_acct_no (+)= cc.code   order by cc.code  ";
		
		List list=publicDao.queryForList(sql1, new ArrayList());
		return list;
	}
	
	/**
	 * 查询数据list（资产日常费用）
	 * @param 
	 * @return
	 */
	public List queryDataZcrcfyList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		List paramlist=new ArrayList();
		paramlist.add(startTime);
		paramlist.add(time);
		
		String sql1="  select dd.he , cc.code  from (" +
				" select sum(SQJE)/10000 as he, subStr(jx.C_ZCDQ,0,3) as sheng from  JYZC_XX jx " +
				" left join  JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH" +
				" left join JYZC_HEAD jh on jxl.CLD_ID=jh.id" +
				" left join JYZC_SQSDFY_XX  jsx on jsx.CLD_ID=jxl.CLD_ID " +
				" where" +
				"  jxl.SPZT = '2' and (jh.SHEETTYPE='manage' or jh.SHEETTYPE='agentManage') " +
				" and to_char(NGRQ,'YYYY-MM-DD') between ? and ? " +
				" group by subStr(jx.C_ZCDQ,0,3)" +
				" )dd ,( " +
				" select substr(c.code_key,0,3) as  code  from code c " +
				"  where  c.code_key!='810000'  and c.code_key!='710000'" +
				" and c.code_key!='820000' and  c.code_name='省份' )cc " +
				" where dd.sheng (+)= cc.code  order by cc.code  ";
		
		List list=publicDao.queryForList(sql1, paramlist);
		return list;
	}
	
	
	/**
	 * 查询数据list（合同租金收入）
	 * @param 
	 * @return
	 */
	public List queryDataHtzjsrList(){ 
		String time=this.getCurrDate();
		List paramlist=new ArrayList();
		paramlist.add(time);
		String sql1=" select dd.he , cc.code  from (select sum(SSZJ)/10000 as  he, subStr(jx.C_ZCDQ,0,3) as dq from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id " +
				"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and ? between to_char(jhz.htqsrq,'YYYY-MM-DD')" +
				" and to_char(jhz.htdqrq,'YYYY-MM-DD') group by  subStr(jx.C_ZCDQ,0,3) )dd ," +
				" ( select substr(c.code_key,0,3) as  code  from code c where  c.code_key!='810000'  and c.code_key!='710000' and c.code_key!='820000' and  c.code_name='省份' " +
				")cc where dd.dq (+)= cc.code  order by cc.code  ";
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	/**
	 * 查询数据list（实体日常管理费用）
	 * @param 
	 * @return
	 */
	public List queryDataStrcglfyList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		List paramlist=new ArrayList();
		paramlist.add(startTime);
		paramlist.add(time);
		String sql1=" select dd.he , cc.code  from (select sum(SJFY)/10000 as he,  substr(C_SHENGFEN, 0, 3) as sheng" +
		" from ST_JBXX  left join ST_HEAD on ST_JBXX.ID = ST_HEAD.ST_ID  " +
		" left join ST_GLBT on ST_JBXX.id=ST_GLBT.ST_ID  where ST_GLBT.SPZT='2'" +
		" and   to_char(NGRQ,'YYYY-MM-DD') between ? and ? " +
		" group by substr(C_SHENGFEN, 0, 3))dd ," +
		"(  select substr(c.code_key,0,3) as  code  from code c " +
		"  where  c.code_key!='810000'  and c.code_key!='710000'" +
		" and c.code_key!='820000' and  c.code_name='省份' )cc " +
		" where dd.sheng (+)= cc.code  order by cc.code  ";
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	/**
	 * 查询数据list（债权）
	 * @param 
	 * @return
	 */
	public List queryDataZqList(){ 
		String sql1="  select dd.he , cc.code  from ( " +
		"  select sum(grzye)/10000 as he,subStr(shengfen,0,3) sheng from DEBT_INFO where ZQRMC='中国建投'   and FSHX='0'  " +
		" group by subStr(shengfen,0,3) )dd ,( " +
		"  select substr(c.code_key,0,3) as  code  from code c  " +
		" where  c.code_key!='810000'  and c.code_key!='710000'" +
		" and c.code_key!='820000' and  c.code_name='省份' )cc " +
		" where dd.sheng (+)= cc.code  order by cc.code " ;
		
		List list=publicDao.queryForList(sql1,new ArrayList());
		return list;
	}
	
	
	/**
	 * 查询数据list（债券）
	 * @param 
	 * @return
	 */
	public List queryDataZq2List(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	List paramlist=new ArrayList();
		paramlist.add(currYear);
		
		String sql1="   select dd.he , cc.code || '0'  from (" +
				" select sum(JE1)/10000  as he, subStr(jhfhbm,2,2) as sheng,nf  from STOCK_INFO  si " +
				" left join STOCK_BOOKVALUE sb on si.id=sb.STOCKID where  nf=?" +
				" group by  subStr(jhfhbm,2,2),nf" +
				" )dd ,( " +
				" select substr(c.code_key,0,2) as  code  from code c " +
				" where  c.code_key!='810000'  and c.code_key!='710000' and c.code_key!='820000' and  c.code_name='省份' " +
				" )cc where dd.sheng (+)= cc.code  order by cc.code  " ;
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	/**
	 * 查询数据list（资产处置）
	 * @param 
	 * @return
	 */
	public List queryDataZcczList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		List paramlist=new ArrayList();
		paramlist.add(startTime);
		paramlist.add(time);
		
		String sql1="   select dd.he , cc.code  from (" +
				" select sum(HKZSRJE)/10000 as he, subStr(C_SHENGFEN,0,3) as sheng from  CZ_XM_XX cxx " +
				" left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
				" left join CZ_HYXX ch on ch.id=cxx.hy_id " +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID " +
				" where   to_Char(SPSJ,'YYYY-MM-DD') between ? and ? and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='0'" +
				" group by subStr(C_SHENGFEN,0,3))dd ,( " +
				" select substr(c.code_key,0,3) as  code  from code c " +
				"  where  c.code_key!='810000'  and c.code_key!='710000'  and c.code_key!='820000' and  c.code_name='省份' " +
				")cc where dd.sheng (+)= cc.code  order by cc.code  " ;
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	
	/**
	 * 查询数据list（实体整体处置）
	 * @param 
	 * @return
	 */
	public List queryDataStztczList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		List paramlist=new ArrayList();
		paramlist.add(startTime);
		paramlist.add(time);
		
		String sql1="  select dd.he , cc.code  from (select sum(HKZSRJE)/10000  as he,subStr(STSCSF,0,3) as sheng from  CZ_XM_XX cxx " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id " +
				" left join CZ_HYXX ch on ch.id=cxx.hy_id " +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
				"  where   to_Char(SPSJ,'YYYY-MM-DD') between ? and ?   and FENLEI='3' and  cxx.ZHUANGTAI='0' " +
				" group by subStr(STSCSF,0,3)" +
				")dd ,( " +
				" select substr(c.code_key,0,3) as  code  from code c " +
				" where  c.code_key!='810000'  and c.code_key!='710000'" +
				"  and c.code_key!='820000' and  c.code_name='省份' " +
				")cc where dd.sheng (+)= cc.code  order by cc.code   " ;
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	
	/**
	 * 查询数据list（实体人员安置）
	 * @param 
	 * @return
	 */
	public List queryDataStryazList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	List paramlist=new ArrayList();
		paramlist.add(currYear);
		
		String sql1="  select dd.he , cc.code  from (" +
				"  select count(sf.id) as he,subStr(STSCSF,0,3) as sheng  from CZ_XM_XX cxx  " +
				" left join CZ_AZRY_XX cax on cax.cld_id=cxx.cld_id  " +
				" left join ST_FSXX sf on sf.id=cax.ST_FSXX_ID " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id " +
				" where FENLEI='4' and (FAZZT='0' or FAZZT='1')  and to_char(rylrsj,'YYYY') !=?   group by subStr(STSCSF,0,3))dd ," +
				"( " +
				" select substr(c.code_key,0,3) as  code  from code c " +
				" where  c.code_key!='810000'  and c.code_key!='710000'" +
				" and c.code_key!='820000' and  c.code_name='省份' " +
				")cc where dd.sheng (+)= cc.code  order by cc.code   " ;
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	
	/**
	 * 查询数据list（诉讼信息统计）
	 * @param 
	 * @return
	 */
	public List queryDataSusongList(){ 
		String time=this.getCurrDate();
		Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		List paramlist=new ArrayList();
		paramlist.add(startTime);
		paramlist.add(time);
		
		String sql1=" select dd.he , cc.code  from ( select sum(ybyz)/10000 as he,substr(SFID,0,3) as sheng  from  SS_BASEINFO sb " +
				" left join cardinfo card on card.zcid=sb.SAZCID " +
				"  where card.STATE='01'   and to_char(LARQ,'YYYY-MM-DD')  between ? and ?" +
				" group by substr(SFID,0,3))dd ,( " +
				"  select substr(c.code_key,0,3) as  code  from code c " +
				" where  c.code_key!='810000'  and c.code_key!='710000'" +
				" and c.code_key!='820000' and  c.code_name='省份' " +
				")cc  where dd.sheng (+)= cc.code  order by cc.code    " ;
		
		List list=publicDao.queryForList(sql1,paramlist);
		return list;
	}
	
	
	
	
	/*end */
	
	/* 其他查询*/
	
	
	
	/**
	 * 得到当前时间
	 */
	public String getCurrDate()
	{
		  java.util.Date date = new java.util.Date();
	      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	      String time=sdf.format(date);//获得当前时间
	      return time;
	}
	 
	
	/* end */
}
