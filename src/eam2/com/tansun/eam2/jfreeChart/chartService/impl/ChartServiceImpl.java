package com.tansun.eam2.jfreeChart.chartService.impl;


import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartService.ChartService;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class ChartServiceImpl implements ChartService {
	@Autowired
	public PublicDao publicDao;
	
	/**
	 * 委托贷款饼图数据查询
	 * @param 
	 * @return
	 */
	public HashMap queryWdData(){
		HashMap map=new HashMap();
		//委托贷款余额查询
		String sql1 = "select sum(GL_DR_BAL)/10000  as data from CRT_TOTAL_ACCOUNT " +
				      " where GL_LG_NO='79600000' " 
			         + "and data_date=(select max(data_date) from CRT_TOTAL_ACCOUNT)";
		
		double dwtdkye=this.queryData(sql1);
		map.put("dwtdkye",dwtdkye);
		
		//担险委托贷款余额
		 sql1="select sum(LN_LN_BAL)/10000  as data from crt_dcc_LNLNSLNS where ln_ln_acct_no in " +
  		"(select ln_acct_no from WD_LN_MORE_INFOR where ASSET_TYPE= '担险')";
		
		 double dxwtye=this.queryData(sql1);
	 	 map.put("dxwtye",dxwtye);
	 	
		return map;
		
	}
	

	/**
	 * 查询委托贷款余额地图浮动框数据
	 * @param 
	 * @return
	 */
	public HashMap queryWtdkData(String addr){
		HashMap map=new HashMap();
		//按地区统计委托贷款余额
		String sql1 = "select (sum(GL_DR_BAL))/10000 as data from CRT_TOTAL_ACCOUNT " +
				      " where GL_LG_NO='79600000' and subStr(gl_opun_cod,0,3)= '" +
		              addr+"' and data_date=(select max(data_date) from CRT_TOTAL_ACCOUNT)";
		double wtdkye=this.queryData(sql1);
		map.put("wtdkye",wtdkye);

		return map;
	}
	/**
	 * 查询实体人员安置（按省、时间统计）
	 * @param 
	 * @return
	 */
	public HashMap queryDealPsersonData(String addr){
		HashMap map=new HashMap();
		
		//待安置人数
		String sql1 = "select count(id) as data from ST_FSXX where (FAZZT= '0' or FAZZT= '1') and  STID in (select id from ST_JBXX  where  subStr(C_SHENGFEN,0,3)='" +
		              addr+"' and ID in (select CLD_ID  from CZ_XM_XX " +
		              " where FENLEI= '4' and HY_ID in (select ID  from CZ_HYXX where subStr(to_char(SPSJ,'yyyy-mm-dd'),0,4)='2011' )))";
	    double dazcount=this.queryData(sql1);
		map.put("dazcount",dazcount);
		
		//安置人数
		 sql1 = "select count(id) as data from ST_FSXX where (FAZZT= '3') and  STID in (select id from ST_JBXX  where  C_SHENGFEN='001' and ID in" +
		        "(select CLD_ID  from CZ_XM_XX where FENLEI= '4' and HY_ID in (select ID  from CZ_HYXX where subStr(to_char(SPSJ,'yyyy-mm-dd'),0,4)='2011' )))";

	    double azcount=this.queryData(sql1);
		map.put("azcount",azcount);
		
		return map;
	}
	/**
	 * 经营性固定资产出租率统计
	 * @param 
	 * @return
	 */
	public double queryData2(HashMap map){
		String address=(String)map.get("address");
		int year=(Integer)map.get("currYear");
		String c_jyfl=(String)map.get("c_jyfl");//判断是固定资产还是全资产
		String sql1=null;
	    Calendar c = Calendar.getInstance();
	    int currYear = c.get(Calendar.YEAR);
	    String date="";
	    //得到当前年，如果当前年与传入的年份一致，则得到当前日期来统计，如果是往年则按12月31日来统计
	    if(year==currYear){
	    	java.util.Date d = new java.util.Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	date = sdf.format(d);
	    }else{
	    	date = year + "-12-31";
	    }
	    
		if(c_jyfl=="1" || "1".equals(c_jyfl)){
		
			sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
			" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
			"  where  a.C_ZCLX='1' and a.c_jyfl='1'  and subStr(a.C_ZCDQ,0,3)='" +
			address+"' " +
			" ) aaa, (" +
			"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
			" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  and jx.c_jyfl='1'  and subStr(jx.C_ZCDQ,0,3)='" +
			address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
			date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}else{
					sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
					" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
					"  where  a.C_ZCLX='1' and subStr(a.C_ZCDQ,0,3)='" +
					address+"' " +
					" ) aaa, (" +
					"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
					" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'   and subStr(jx.C_ZCDQ,0,3)='" +
					address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
					date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}
	   double czl=this.queryData(sql1);
	   return czl;
	}
	
	/**
	 * 按年统计合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjDataByYear(HashMap map){
		String address=(String)map.get("address");
		int year=(Integer)map.get("currYear");
		String c_jyfl=(String)map.get("c_jyfl");//判断是固定资产还是全资产
	    Calendar c = Calendar.getInstance();
	    int currYear = c.get(Calendar.YEAR);
	    String date="";
	    //得到当前年，如果当前年与传入的年份一致，则得到当前日期来统计，如果是往年则按12月31日来统计
	    if(year==currYear){
	    	java.util.Date d = new java.util.Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	date = sdf.format(d);
	    }else{
	    	date = year + "-12-31";
	    }
	    
		String sql1 = "select sum(SSZJ)/10000 as  data from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id  " +
		"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and '" +
		date+"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and  subStr(jx.C_ZCDQ,0,3)='"+address+"'";

	  
	     double htzjsr=this.queryData(sql1);
	   return htzjsr;
	}
	
	
	
	/**
	 * 按月统计出租率
	 * @param 
	 * @return
	 */
	public double queryDataByMonth(HashMap map){
		int yearMonth=(Integer)map.get("yearMonth");
		String address=(String)map.get("address");
		String type=(String)map.get("type");//统计类型 1为经营性资产 2为全资产
		String year=(String)map.get("year");//查询条件年
		Calendar c = Calendar.getInstance();
		String currYear =String.valueOf(c.get(Calendar.YEAR));
		c.set(Integer.parseInt(year),yearMonth,0);
		String month=String.valueOf(yearMonth);
		String date="";
	    //如果是统计当前年度的每月出租率，则按目前日期来与合同开始时间，结束时间匹配，如果是往年则按每个月的最后一天来统计
		if(currYear.equals(year)){
			java.util.Date d = new java.util.Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//获得当期日期
	    	date = sdf.format(d);
		}else{
			String day = "" + c.getActualMaximum(Calendar.DAY_OF_MONTH);
			if ((month.length()) < 2)
			{
				month = "0" + month;
			}
			
			if (day.length() < 2)
			{
				day = "0" + day;
			}
			date = year + "-"+month+"-" + day;
		}
		String sql1="";
		
		//按月统计出租率（1为经营资产统计，2为全资产统计）
		if(type=="1" || "1".equals(type)){
			sql1="  select  ( case to_Char(aaa.jzml) " +
			" when '0' then  0  " +
			" else   bbb.czsl/aaa.jzml*100    " +
			" end )  as data  from (" +
			" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
			"  where  a.C_ZCLX='1' and a.c_jyfl='1'  and subStr(a.C_ZCDQ,0,3)='" +
			address+"' " +
			" ) aaa, (" +
			"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
			" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  and jx.c_jyfl='1'  and subStr(jx.C_ZCDQ,0,3)='" +
			address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
			date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}else{
					sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
					" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
					"  where  a.C_ZCLX='1' and subStr(a.C_ZCDQ,0,3)='" +
					address+"' " +
					" ) aaa, (" +
					"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
					" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'   and subStr(jx.C_ZCDQ,0,3)='" +
					address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
					date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}
 	   double czl=this.queryData(sql1);
		return czl;
	}
	
	
	/**
	 * 统计某年各月的合同租金收入
	 * @param 
	 * @return
	 */
	public double queryHtzjsrDataByYearMonth(HashMap map){
		int yearMonth=(Integer)map.get("yearMonth");
		String address=(String)map.get("address");
		String type=(String)map.get("type");//统计类型 1为经营性资产 2为全资产
		String year=(String)map.get("year");//查询条件年
		Calendar c = Calendar.getInstance();
		String currYear =String.valueOf(c.get(Calendar.YEAR));
		c.set(Integer.parseInt(year),yearMonth,0);
		String month=String.valueOf(yearMonth);
		String date="";
	    //如果是统计当前年度的每月出租率，则按目前日期来与合同开始时间，结束时间匹配，如果是往年则按每个月的最后一天来统计
		if(currYear.equals(year)){
			java.util.Date d = new java.util.Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//获得当期日期
	    	date = sdf.format(d);
		}else{
			String day = "" + c.getActualMaximum(Calendar.DAY_OF_MONTH);
			if ((month.length()) < 2)
			{
				month = "0" + month;
			}
			
			if (day.length() < 2)
			{
				day = "0" + day;
			}
			date = year + "-"+month+"-" + day;
		}
		
		
		String sql1 = "select sum(SSZJ)/10000 as  data from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id  " +
		"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and '" +
		date+"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and  subStr(jx.C_ZCDQ,0,3)='"+address+"'";

 	   double htzjsr=this.queryData(sql1);
		return htzjsr;
	}
	
	
	/**
	 * 统计近期出租率
	 * @param 
	 * @return
	 */
	public double queryDataByNearMonths(HashMap map){
		String address=(String)map.get("address");
		String type=(String)map.get("type");//统计类型 1为经营性资产 2为全资产
		String date=(String)map.get("date");//时间
		
		String sql1="";
		
		//按月统计出租率（1为经营资产统计，2为全资产统计）
		if(type=="1" || "1".equals(type)){
			sql1="  select  ( case to_Char(aaa.jzml) " +
			" when '0' then  0  " +
			" else   bbb.czsl/aaa.jzml*100    " +
			" end )  as data  from (" +
			" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
			"  where  a.C_ZCLX='1' and a.c_jyfl='1'  and subStr(a.C_ZCDQ,0,3)='" +
			address+"' " +
			" ) aaa, (" +
			"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
			" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  and jx.c_jyfl='1'  and subStr(jx.C_ZCDQ,0,3)='" +
			address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
			date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}else{
					sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
					" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
					"  where  a.C_ZCLX='1' and subStr(a.C_ZCDQ,0,3)='" +
					address+"' " +
					" ) aaa, (" +
					"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
					" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'   and subStr(jx.C_ZCDQ,0,3)='" +
					address+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
					date +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}
		
		double czl=this.queryData(sql1);
		return czl;
		
	}
	
	/**
	 *查询近期资产日常费用（申请费用）
	 * @param 
	 * @return
	 */
	public double queryDataByRcfy(List list){
		 
		String sql1 = "select sum(SQJE)/10000 as data from  JYZC_XX jx left join  JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id left join JYZC_SQSDFY_XX  jsx on jsx.CLD_ID=jxl.CLD_ID " +
				"where jxl.SPZT = '2' and (jh.SHEETTYPE='manage' or jh.SHEETTYPE='agentManage')  and to_char(NGRQ,'YYYY-MM-DD') between ? and ?and subStr(jx.C_ZCDQ,0,3)= ?" ;
		double rcfy=this.queryDatas(sql1,list);
		return rcfy;
		
	}
	
	/**
	 *统计近期资产日常费用（报销费用）
	 * @param 
	 * @return
	 */
	public double queryDataByRcfyBxfy(List list){
		 
		//报销费用
		String sql1 = "select sum(SJHF)/10000 as data from JYZC_XX jx  left join JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
		 		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id where " +
		 		" to_char(NGRQ,'YYYY-MM-DD') between ? and ? and subStr(jx.C_ZCDQ,0,3)=? ";
		double bxfy=this.queryDatas(sql1,list);
		return bxfy;
		
	}
	
	
	/**
	 *统计近期合同租金收入
	 * @param 
	 * @return
	 */
	public double queryLastDataByHtzj(HashMap map){
		String address=(String)map.get("address");
		String date=(String)map.get("date");//时间
		
		String sql1 = "select sum(SSZJ)/10000 as  data from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id  " +
		"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and '" +
		date+"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and  subStr(jx.C_ZCDQ,0,3)='"+address+"'";

	
		double htzjsr=this.queryData(sql1);
		return htzjsr;
		
	}

	
	/**
	 * 统计近期实体日常管理费用
	 * @param 
	 * @return
	 */
	public double queryStrcfyByNearMonths(HashMap map){
		String address=(String)map.get("address");
		String date=(String)map.get("date");//时间
		
		String sql1="select sum(SJFY)/10000 as data  from ST_JBXX left join ST_HEAD on ST_JBXX.ID = ST_HEAD.ST_ID  left join ST_GLBT on ST_JBXX.id=ST_GLBT.ST_ID where ST_GLBT.SPZT='2' and  substr(C_SHENGFEN, 0, 3) = '"+address+"'" +
    	"and   to_char(NGRQ,'YYYY-MM')='" +date +"'" ;
	
		double strcfy=this.queryData(sql1);
		return strcfy;
		
	}
	
	

	/**
	 * 查询金额 
	 * @param 
	 * @return
	 */
	public HashMap queryDealData(){
		HashMap map=new HashMap();
		
		//资产处置金额
		String sql1 = "select (sum(SJZC) + sum(GHSLJE)+sum(GHFYJE))/10000 as data  from CZ_FYSR_MX"+ 
        "where ZCLB in ('0','1','2','6','7','8','9','10') and CLD_ID in (select CLD_ID"+
        "from CZ_XM_XX  where HY_ID in (select ID from CZ_HYXX where SPSJ='2011-2-23'))";
		
		double dealValue=this.queryData(sql1);
		map.put("dealValue",dealValue);
	
		
		//实体整体处置
		 sql1="select  (sum(SJZC) + sum(GHSLJE)+sum(GHFYJE))/10000 as data  from CZ_FYSR_MX where CLD_ID in (select CLD_ID from CZ_XM_XX where FENLEI='3') ";
		double zjCount=this.queryData(sql1);
		map.put("zjCount",zjCount);
		return map;
	}

	
	
	
	
	/**
	 * 诉讼原币原值统计 
	 * @param 
	 * @return
	 */
	public double queryYbyzData(HashMap map){
		int year=(Integer)map.get("year");
		String address=(String)map.get("address");
		
		// 诉讼原币原值统计 
		String sql1 = "select sum(ybyz)/10000 as data from cardinfo where zcid in (select SAZCID from  SS_BASEINFO  where LARQ =to_date('" +
		year+"','YYYY-MM-DD') and substr(SFID,0,3)='" +
		address+ "') and STATE='01'";
		
		double ssybyz=this.queryData(sql1);
		return ssybyz;
	}
	
	

	
	/* 资产结构统计*/
	
	
	/**
	 * 查询金额 
	 * @param 
	 * @return
	 */
	public HashMap queryCount(){
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String time=sdf.format(date);//获得当前时间
		HashMap map=new HashMap();
		//固定资产金额
		String sql1 = "SELECT sum(YBYZ)/10000 as data FROM CARDINFO  where CARDINFO.ZCID IN (SELECT ZCID FROM JYZC_XX) AND (CARDINFO.STATE='01' OR CARDINFO.STATE='02')  ";
		double ybyzCount=this.queryData(sql1);
		map.put("ybyzCount",ybyzCount);
		//委托贷款
		sql1="select sum(GL_DR_bal)/10000  as data from CRT_TOTAL_ACCOUNT where GL_LG_NO='79600000' and DATA_DATE =(select max(DATA_DATE) from CRT_TOTAL_ACCOUNT)";
		
		double wtdkCount=this.queryData(sql1);
		map.put("wtdkCount",wtdkCount);
		
		//债券
	    sql1="select sum(JE1)/10000  as  data from STOCK_INFO  si left join STOCK_BOOKVALUE sb on si.id=sb.STOCKID where nf='" + currYear +"'";
		
		double zq=this.queryData(sql1);
		map.put("zjCount",zq);
		
		//债权
	    sql1="select sum(grzye)/10000  as data from DEBT_INFO where ZQRMC='中国建投' and FSHX='0'   ";
		
		double zczq=this.queryData(sql1);
		map.put("zqCount",zczq);
	
		//经营类资产的出租率
		sql1="  select  ( case to_Char(aaa.jzml) " +
		" when '0' then  0  " +
		" else   bbb.czsl/aaa.jzml*100    " +
		" end )  as data  from (" +
		" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
		"  where  a.C_ZCLX='1' and a.c_jyfl='1'  " +
		" ) aaa, (" +
		"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
		" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  and jx.c_jyfl='1'   and   C_HTZT='1' and C_HTLX='2' and '" +
		time +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		
		double jyzcCzl=this.queryData(sql1);
		map.put("jyzcCzl",jyzcCzl);
	
		//经营类资产的成本收益率
	     sql1 = " select sum(ZJSYCBL) as data from JYZC_XX  jx left join JJZC_HT_ZLWG  jhz on  jhz.zcid=jx.id where jx.c_zclx='1' and jx.c_jyfl='1' and C_HTZT='1' and C_HTLX='2' and '" + time+ "' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') ";
	     double jyzcCbsyl=this.queryData(sql1);
	    map.put("jyzcCbsyl",jyzcCbsyl);
		
	    //申请费用
	    sql1 = "select sum(SQJE)/10000 as data from  JYZC_XX jx left join  JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id left join JYZC_SQSDFY_XX  jsx on jsx.CLD_ID=jxl.CLD_ID " +
				"where jxl.SPZT = '2' and (jh.SHEETTYPE='manage' or jh.SHEETTYPE='agentManage')  and to_char(NGRQ,'YYYY-MM-DD') between '" +startTime 
				+"' and '" + time +"'" ;

		double jyzcSqfy=this.queryData(sql1);
		map.put("jyzcSqfy",jyzcSqfy);
		
		//报销费用
		 sql1 = "select sum(SJHF)/10000 as data from JYZC_XX jx  left join JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
		 		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id where " +
		 		" to_char(NGRQ,'YYYY-MM-DD') between '" +startTime + "' and '" +
		 		time + "'";
		
		double jyzcBxfy=this.queryData(sql1);
		map.put("jyzcBxfy",jyzcBxfy);
		
		//经营类资产的合同租金收入
		 sql1 = "select sum(SSZJ)/10000 as  data from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id  " +
				"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and '" +
				time+"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')";

		double jyzcHtzj=this.queryData(sql1);
		map.put("jyzcHtzj",jyzcHtzj);
		
		//全资产出租率
		sql1="  select  ( case to_Char(aaa.jzml) " +
		" when '0' then  0  " +
		" else   bbb.czsl/aaa.jzml*100    " +
		" end )  as data  from (" +
		" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
		"  where  a.C_ZCLX='1' "
		+") aaa, (" +
		"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
		" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'   and   C_HTZT='1' and C_HTLX='2' and '" +
		time +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		
		
		double qczCzl=this.queryData(sql1);
		map.put("qczCzl",qczCzl);
		
		//全资产成本收益率
		 sql1 = " select sum(ZJSYCBL) as data from JYZC_XX  jx left join JJZC_HT_ZLWG  jhz on  jhz.zcid=jx.id where jx.c_zclx='1' and C_HTZT='1' and C_HTLX='2' and '" + time+ "' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') ";
		  double qczCbsyl=this.queryData(sql1);
		    map.put("qczCbsyl",qczCbsyl);
		    
		 return map;
		
	}
	
	/**
	 * 统计债权金额（按省）
	 * @param 
	 * @return
	 */
	public HashMap queryZqData(HashMap map){
		String address=(String)map.get("address");
		HashMap resultMap=new HashMap();
		//固定资产金额
		String sql1 = "select sum(grzye)/10000 as data from DEBT_INFO where ZQRMC='中国建投' and FSHX='0' " +
				"and  subStr(shengfen,0,3)='"+address+"'";
		double zczq=this.queryData(sql1);
		resultMap.put("zczq",zczq);
		
		return resultMap;
	}
	
	/**
	 * 地图上统计担险委托贷款余额
	 * @param 
	 * @return
	 */
	public HashMap queryDxwddkData(HashMap map){
		String address=(String)map.get("address");
		HashMap resultMap=new HashMap();
		//担险委托贷款余额
	    String sql1="select (sum(LN_LN_BAL))/10000 as data from crt_dcc_LNLNSLNS where ln_ln_acct_no in " +
		"(select ln_acct_no from WD_LN_MORE_INFOR where ASSET_TYPE= '担险') and " +
		"  subStr(ln_ln_acct_no,0,3)='" + address +"'";
		double dxwtye=this.queryData(sql1);
		resultMap.put("dxwtye",dxwtye);
		
		return resultMap;
	}
	
	
	/**
	 *  地图上统计债券金额
	 * @param 
	 * @return
	 */
	public HashMap queryZq2Data(HashMap map){
		 Calendar c = Calendar.getInstance();
	     int currYear = c.get(Calendar.YEAR);//当前时间
		String address=(String)map.get("address");
		address=address.substring(0,2);
		HashMap resultMap=new HashMap();
		String otherAdd="";
		String sql1="";
		//地址编码为500代码为重庆市，重庆市分行编码后三位却为511，当按重庆来统计时，应查询出为like 50或者=511的
		if("50".equals(address)){
			sql1 = "select sum(JE1)/10000 as data from STOCK_INFO  si left join STOCK_BOOKVALUE sb on si.id=sb.STOCKID where (subStr(jhfhbm,2,2) = '" 
				+ address+"' or  subStr(jhfhbm,2,3) ='511')" +
						"and  nf= '"+currYear+"'";
		}else{
			sql1 = "select sum(JE1)/10000  as data from STOCK_INFO  si left join STOCK_BOOKVALUE sb on si.id=sb.STOCKID where subStr(jhfhbm,2,2) = '" 
				+ address+"' and  nf= '"+currYear+"'";
		   //其他分行编码的倒数第2位和第3位和传入地址编码的倒数第2位，第3位是相同的，只需like就能判断分行是属于哪个省市
		
		}
		double zq=this.queryData(sql1);
		resultMap.put("zq",zq);
		
		return resultMap;
	}
	

	
	/* end */
	
	/* 经营性固定资产*/
	
	/**
	 *  出租率统计
	 * @param 
	 * @return
	 */
	public  HashMap queryJylzcData(HashMap map){
		HashMap resultMap=new HashMap();
		String address=(String)map.get("address");
		String type=(String)map.get("type");//资产类别
		int addr=Integer.parseInt(address);
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String time=sdf.format(date);//获得当前时间
		String sql1="";
		//按省、资产类别 统计当前时间出租率
    	if(type!=null && "1".equals(type)){
		    		sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
					" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
					"  where  a.C_ZCLX='1' and a.c_jyfl='1'  and subStr(a.C_ZCDQ,0,3)='" +
					addr+"' " +
					" ) aaa, (" +
					"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
					" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'  and jx.c_jyfl='1'  and subStr(jx.C_ZCDQ,0,3)='" +
					addr+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
					time +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}else{
					sql1="  select  ( case to_Char(aaa.jzml) " +
					" when '0' then  0  " +
					" else   bbb.czsl/aaa.jzml*100    " +
					" end )  as data  from (" +
					" SELECT sum(CAST(a.JZMJ AS NUMBER(30)))as jzml from JYZC_XX a " +
					"  where  a.C_ZCLX='1' and subStr(a.C_ZCDQ,0,3)='" +
					addr+"' " +
					" ) aaa, (" +
					"  select  sum(CZSL) as czsl   from JYZC_XX  jx " +
					" left join JJZC_HT_ZLWG  jhz on jhz.ZCID=jx.id where jx.C_ZCLX='1'   and subStr(jx.C_ZCDQ,0,3)='" +
					addr+"'   and   C_HTZT='1' and C_HTLX='2' and '" +
					time +"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD')) bbb";
		}
		double czl=this.queryData(sql1);
		resultMap.put("czl",czl);
		
		//成本收益率
		if(type!=null && "1".equals(type)){
        sql1 = " select sum(ZJSYCBL) as data from JYZC_XX  jx left join JJZC_HT_ZLWG  jhz on  jhz.zcid=jx.id where jx.c_zclx='1' and jx.c_jyfl='1' and C_HTZT='1' and C_HTLX='2' and '" + time+ "' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and subStr(C_ZCDQ,0,3)='"+addr+"' ";
		}else{
			  sql1 = " select sum(ZJSYCBL) as data from JYZC_XX  jx left join JJZC_HT_ZLWG  jhz on  jhz.zcid=jx.id where jx.c_zclx='1' and C_HTZT='1' and C_HTLX='2' and '" + time+ "' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and subStr(C_ZCDQ,0,3)='"+addr+"' ";
		}
		
		double jycb=this.queryData(sql1);
		  resultMap.put("jycb",jycb);
		
		return resultMap;
		
	}
	
	/**
	 *  地图上统计合同租金收入
	 * @param 
	 * @return
	 */
	public  HashMap queryHtzj(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String time=sdf.format(date);//获得当前时间
		//合同租金收入
		String sql1 = "select sum(SSZJ)/10000 as  data from  JYZC_XX jx left join JJZC_HT_ZLWG  jhz  on jhz.ZCID=jx.id  " +
				"left join JYZC_HTQS_BODY jhb on jhb.ZC_ID=jx.id where jx.C_ZCLX='1'  and '" +
				time+"' between to_char(jhz.htqsrq,'YYYY-MM-DD') and to_char(jhz.htdqrq,'YYYY-MM-DD') and  subStr(jx.C_ZCDQ,0,3)='"+address+"'";

		double sszj=this.queryData(sql1);
		resultMap.put("sszj",sszj);
		return resultMap;
	}
	
	/**
	 *  地图上统计资产日常费用
	 * @param 
	 * @return
	 */
	public  HashMap queryRcfyData(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
		//申请费用
        String sql1 = "select sum(SQJE)/10000 as data from  JYZC_XX jx left join  JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
        		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id left join JYZC_SQSDFY_XX  jsx on jsx.CLD_ID=jxl.CLD_ID " +
        				"where jxl.SPZT = '2' and (jh.SHEETTYPE='manage' or jh.SHEETTYPE='agentManage')  and to_char(NGRQ,'YYYY-MM-DD') between '" +startTime 
        				+"' and '" + endTime +  "' and subStr(jx.C_ZCDQ,0,3)= '" + address +"'" ;
		
		double sqfy=this.queryData(sql1);
		  resultMap.put("sqfy",sqfy);
		
		//报销费用
		 sql1 = "select sum(SJHF)/10000 as data from JYZC_XX jx  left join JYZC_XX_LSB jxl on jxl.ZCBH=jx.ZCBH " +
		 		"left join JYZC_HEAD jh on jxl.CLD_ID=jh.id where " +
		 		" to_char(NGRQ,'YYYY-MM-DD') between '" +startTime + "' and '" +
		 				 endTime + "' and subStr(jx.C_ZCDQ,0,3)='" +address+"' ";

		double bxfy=this.queryData(sql1);
		resultMap.put("bxfy",bxfy);
		
		return resultMap;
	}
	
	
	/* end */
    
	/* 资产处置*/
	
	/**
	 *  地图上统计资产处置
	 * @param 
	 * @return
	 */
	public  HashMap queryZcczData(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
    	
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
    	
		//资产整体为”未执行“ 收入
        String sql1 = "select sum(HKZSRJE)/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
        		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
        		" where subStr(C_SHENGFEN,0,3)='" +
        		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
        		startTime+"' and '" +
        		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='0'" ;

		double hkzsrje=this.queryData(sql1);
		  resultMap.put("hkzsrje",hkzsrje);
		
		//资产整体为”执行中“ 收入
         sql1 = "select sum(HKZSRJE)/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
        		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
        		" where subStr(C_SHENGFEN,0,3)='" +
        		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
        		startTime+"' and '" +
        		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='1'" ;

		 double hkzsrje1=this.queryData(sql1);
		  resultMap.put("hkzsrje1",hkzsrje1);
		
		//资产整体为”结案“ 收入
        sql1 = "select sum(HKZSRJE)/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
       		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
       		" where subStr(C_SHENGFEN,0,3)='" +
       		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
       		startTime+"' and '" +
       		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='2'" ;

		 double hkzsrje2=this.queryData(sql1);
		  resultMap.put("hkzsrje2",hkzsrje2);
		
		//”未执行“费用
		sql1 = "select (sum(SJZC)+sum(GHSLJE)+sum(GHFYJE))/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
		" where subStr(C_SHENGFEN,0,3)='" +
		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
		startTime+"' and '" +
		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='0'" ;

		 double fy=this.queryData(sql1);
		resultMap.put("fy",fy);
		
		
		//”执行中“费用
		sql1 = "select (sum(SJZC)+sum(GHSLJE)+sum(GHFYJE))/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
		" where subStr(C_SHENGFEN,0,3)='" +
		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
		startTime+"' and '" +
		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='1'" ;

		 double fy1=this.queryData(sql1);
		resultMap.put("fy1",fy1);
		
		//”执行中“费用
		sql1 = "select (sum(SJZC)+sum(GHSLJE)+sum(GHFYJE))/10000 as data from  CZ_XM_XX cxx left join CZ_ZC_XX czx on czx.CLD_ID=cxx.CLD_ID " +
		"left join CZ_HYXX ch on ch.id=cxx.hy_id  left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID" +
		" where subStr(C_SHENGFEN,0,3)='" +
		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
		startTime+"' and '" +
		endTime+"' and  cfm.ZCLB in ('0','1','2','6','7','8','9','10') and cxx.ZHUANGTAI='2'" ;

		 double fy2=this.queryData(sql1);
		resultMap.put("fy2",fy2);
		
		return resultMap;
		
	}
	
	
	/**
	 *  地图上统计实体整体处置
	 * @param 
	 * @return
	 */
	public  HashMap queryStztczData(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		//状态为"执行中" 实体整体处置收入
        String  sql1 = "select sum(HKZSRJE)/10000  as data from  CZ_XM_XX cxx left join CZ_STCZTZ cs on cs.id=cxx.cld_id" +
		" left join CZ_HYXX ch on ch.id=cxx.hy_id left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID " +
		" where subStr(STSCSF,0,3)='" +
		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
		startTime+"' and '"+endTime+"'  and FENLEI='3' and  cxx.ZHUANGTAI='0'";
		 double stztczsr=this.queryData(sql1);
		  resultMap.put("stztczsr",stztczsr);
		
		//状态为"执行中" 实体整体处置收入
         sql1 = "select sum(HKZSRJE)/10000  as data from  CZ_XM_XX cxx left join CZ_STCZTZ cs on cs.id=cxx.cld_id" +
        		" left join CZ_HYXX ch on ch.id=cxx.hy_id left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID " +
        		" where subStr(STSCSF,0,3)='" +
        		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
        		startTime+"' and '"+endTime+"'  and FENLEI='3' and  cxx.ZHUANGTAI='1'";
		  double stztczsr1=this.queryData(sql1);
		  resultMap.put("stztczsr1",stztczsr1);
		
		//状态为"已结案" 实体整体处置收入
        sql1 = "select sum(HKZSRJE)/10000  as data from  CZ_XM_XX cxx left join CZ_STCZTZ cs on cs.id=cxx.cld_id" +
       		" left join CZ_HYXX ch on ch.id=cxx.hy_id left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID " +
       		" where subStr(STSCSF,0,3)='" +
       		address+"' and to_Char(SPSJ,'YYYY-MM-DD') between '" +
       		startTime+"' and '"+endTime+"'  and FENLEI='3' and  cxx.ZHUANGTAI='2'";
		 double stztczsr2=this.queryData(sql1);
		  resultMap.put("stztczsr2",stztczsr2);
		
		//状态为“未执行” 时 实体整体安置费用（包括实体整体安置费用+实体人员安置费用）
		//实体整体安置费用
		sql1 = "select (sum(SJZC)+ sum(GHSLJE)+sum(GHFYJE))/10000 as data from CZ_XM_XX cxx   " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime +"' and cxx.FENLEI='3' and  subStr(cs.STSCSF,0,3)='" +
				address+"'   and cxx.ZHUANGTAI='0'" ;

		 double stztayfy=this.queryData(sql1);
		 
		sql1 = "select (sum(FSJAZFY)+sum(SJZC))/10000 as data from CZ_XM_XX cxx  " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID left join cz_azry_xx cax on cax.CLD_ID=cxx.CLD_ID" +
				" where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime + "' and cxx.FENLEI='4' and  subStr(cs.STSCSF,0,3)='" +
				address+"' and cxx.ZHUANGTAI='0'" ;
		
		 double stryazfy=this.queryData(sql1);
		
		resultMap.put("anfy",stryazfy+stztayfy);
		
		
		//状态为“执行中” 时 实体整体安置费用（包括实体整体安置费用+实体人员安置费用）
		//实体整体安置费用
		sql1 = "select (sum(SJZC)+ sum(GHSLJE)+sum(GHFYJE))/10000 as data from CZ_XM_XX cxx   " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime +"' and cxx.FENLEI='3' and  subStr(cs.STSCSF,0,3)='" +
				address+"'   and cxx.ZHUANGTAI='1'" ;

		double stztayfy1=this.queryData(sql1);
		 
		sql1 = "select (sum(FSJAZFY)+sum(SJZC))/10000 as data from CZ_XM_XX cxx  " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID left join cz_azry_xx cax on cax.CLD_ID=cxx.CLD_ID" +
				" where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime + "' and cxx.FENLEI='4' and  subStr(cs.STSCSF,0,3)='" +
				address+"' and cxx.ZHUANGTAI='1'" ;


		double stryazfy1=this.queryData(sql1);
		resultMap.put("anfy1",stryazfy1+stztayfy1);
		
		
		//状态为“执行中” 时 实体整体安置费用（包括实体整体安置费用+实体人员安置费用）
		//实体整体安置费用
		sql1 = "select (sum(SJZC)+ sum(GHSLJE)+sum(GHFYJE))/10000 as data from CZ_XM_XX cxx   " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime +"' and cxx.FENLEI='3' and  subStr(cs.STSCSF,0,3)='" +
				address+"'   and cxx.ZHUANGTAI='2'" ;

		double stztayfy2=this.queryData(sql1);
		
		sql1 = "select (sum(FSJAZFY)+sum(SJZC))/10000 as data from CZ_XM_XX cxx  " +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id left join CZ_HYXX ch on ch.id=cxx.hy_id" +
				" left join CZ_FYSR_MX cfm on cfm.CLD_ID=cxx.CLD_ID left join cz_azry_xx cax on cax.CLD_ID=cxx.CLD_ID" +
				" where to_Char(ch.SPSJ,'YYYY-MM-DD') between '" +
				startTime+"' and '" + endTime + "' and cxx.FENLEI='4' and  subStr(cs.STSCSF,0,3)='" +
				address+"' and cxx.ZHUANGTAI='2'" ;


		double stryazfy2=this.queryData(sql1);
		resultMap.put("anfy2",stryazfy2+stztayfy2);
		
		
		return resultMap;
		
	}
	

	/**
	 *  地图上统计实体人员安置
	 * @param 
	 * @return
	 */
	public  HashMap queryStryazta(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
    	
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		//待安置人数
        String sql1 = "select count(sf.id) as data  from CZ_XM_XX cxx  " +
        		" left join CZ_AZRY_XX cax on cax.cld_id=cxx.cld_id  " +
        		" left join ST_FSXX sf on sf.id=cax.ST_FSXX_ID left join CZ_STCZTZ cs on cs.id=cxx.cld_id " +
        		" where FENLEI='4' and (FAZZT='0' or FAZZT='1') and to_char(rylrsj,'YYYY') !='" +
        		currYear+"'  and  subStr(STSCSF,0,3)='" +
        		address +"'" ;

		  double dazrs=this.queryData(sql1);
		  resultMap.put("dazrs",dazrs);
		
		
		//已安置人数
		 sql1 = "select count(sf.id) as data  from CZ_XM_XX cxx  " +
    		" left join CZ_AZRY_XX cax on cax.cld_id=cxx.cld_id  " +
    		" left join ST_FSXX sf on sf.id=cax.ST_FSXX_ID left join CZ_STCZTZ cs on cs.id=cxx.cld_id " +
    		" where FENLEI='4' and FAZZT='3' and to_char(ryazsj,'YYYY-MM-DD') between '" +
    		startTime+"' and '" +endTime +
    				"'  and  subStr(STSCSF,0,3)='" +
    		address +"'" ;

		double yanrs=this.queryData(sql1);
		resultMap.put("yanrs",yanrs);
		
		return resultMap;
	}
	
	
	/* end */
	
	/* 诉讼案件*/
	/**
	 * 地图上统计诉讼案件
	 * @param 
	 * @return
	 */
	public  HashMap querySsajData(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
		//原币原值
        String sql1 = "select sum(ybyz)/10000 as data  from  SS_BASEINFO sb left join cardinfo card on card.zcid=sb.SAZCID  where card.STATE='01' and substr(SFID,0,3)='"+
		address+ "' and to_char(LARQ,'YYYY-MM-DD') between '" +  startTime +"' and '" + endTime +"'";

		  double ssybyz=this.queryData(sql1);
		  resultMap.put("ssybyz",ssybyz);
		
		//付款金额总值
		 sql1 = "select sum(ZXHK)/10000 as data  from SS_BASEINFO where SSLXMC= '被诉' and substr(SFID,0,3)='"+address 
		+"' and to_char(QSSJ,'YYYY-MM-DD')  between '" + startTime +"' and '"+ endTime +"'";

		double fkzh=this.queryData(sql1);
		resultMap.put("fkzh",fkzh);
		
		
		//执行回款
		 sql1 = "select sum(ZXHK)/10000 as data  from SS_BASEINFO where SSLXMC= '起诉' and substr(SFID,0,3)='"+address 
 		+"' and to_char(QSSJ,'YYYY-MM-DD')  between '" + startTime +"' and '"+ endTime +"'";

		  double zxhk=this.queryData(sql1);
		  resultMap.put("zxhk",zxhk);
		
		
		
		return resultMap;
	}
	
	/* end */

	/*实体日常费用统计*/
	/**
	 *  地图上统计实体日常费用
	 * @param 
	 * @return
	 */
	public  HashMap queryStrcfyData(HashMap map){
		HashMap resultMap =new HashMap();
		String address=(String)map.get("address");
		java.util.Date date = new java.util.Date();
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	String endTime=sdf.format(date);//获得当前时间
    	
	    
    	Calendar c = Calendar.getInstance();
    	int currYear=c.get(Calendar.YEAR);
    	String startTime=currYear+"-01-01";
    	
    	
	
        String sql1 = " select sum(SJFY)/10000 as data   from ST_JBXX  left join ST_HEAD on ST_JBXX.ID = ST_HEAD.ST_ID  left join ST_GLBT on ST_JBXX.id=ST_GLBT.ST_ID  " +
        		"where ST_GLBT.SPZT='2' and  substr(C_SHENGFEN, 0, 3) = '" + address +"' and   to_char(NGRQ,'YYYY-MM-DD') between '" + startTime +"' and '" + endTime +"'" ;

		  double strcfy=this.queryData(sql1);
		  resultMap.put("strcfy",strcfy);
		  
		return resultMap;
		
	}
	
	/**
	 *  按年统计实体日常管理费用
	 * @param 
	 * @return
	 */
	public List queryDataList(HashMap map){
		String sql1=(String)map.get("sql1");
		List list=publicDao.queryForList(sql1, new ArrayList());
		return list;
	}
	
	
	/**
	 * 委托贷款按时间统计
	 * @param 
	 * @return
	 */
	public double queryWtdkDataByTime(List list){
		    
		//委托贷款按时间统计
		String sql1 = "select (sum(GL_DR_BAL))/10000 as data from CRT_TOTAL_ACCOUNT where GL_LG_NO='79600000' and subStr(gl_opun_cod,0,3) =? and data_date=to_date(?,'yyyy-mm-dd')";
		double wtdkyearye=this.queryDatas(sql1,list);
		return wtdkyearye;
	}
	
	
	
	/*end */
	
	/* 其他查询*/
	
	/**
	 *  根据省code查询名称
	 * @param 
	 * @return
	 */
	public  String queryCityName(String codeId){
		//各省市名称
		String sql1 = "select code_value as codeValue from ZCYM_CODE  where    subStr(code_key,0,3)='" +
		codeId + "'  and code_name='省份' ";

		
		List list1=publicDao.queryForList(sql1, new ArrayList());
		String  codeValue="";
		if(list1!=null){
		for(int i=0;i<list1.size();i++){
			HashMap map2=(HashMap)list1.get(0);
			codeValue  = (String)map2.get("codeValue");
			}
		  }
		return codeValue;
	}
	
	
	/**
	 * 查询数据
	 */
	public  double queryData(String sql){
		List list1=publicDao.queryForList(sql, new ArrayList());
		double data=0;
		if(list1!=null){
		for(int i=0;i<list1.size();i++){
			HashMap map2=(HashMap)list1.get(0);
			BigDecimal big = (BigDecimal)map2.get("data");
			if(big != null){
				data = big.doubleValue();
			}
		  }
	}
   return data;
  }
	
	/**
	 * 查询数据2
	 */
	public  double queryDatas(String sql,List list){
		List list1=publicDao.queryForList(sql,list);
		double data=0;
		if(list1!=null){
		for(int i=0;i<list1.size();i++){
			HashMap map2=(HashMap)list1.get(0);
			BigDecimal big = (BigDecimal)map2.get("data");
			if(big != null){
				data = big.doubleValue();
			}
		  }
	}
   return data;
  }
	
	
	/* end */
}
