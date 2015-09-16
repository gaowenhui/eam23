package com.tansun.eam2.jfreeChart.chartmain;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

import de.laures.cewolf.DatasetProduceException;
public class ChartAction extends CommonAction {

	@Autowired
	private ChartUCC chartUCC;
	
	//经营性固定资产 出租率 统计
	@Autowired
	private RentalRatesYear ce;//出租率按年柱状图统计
	@Autowired
	private RentalRatesMonth ceMonth;//出租率按月柱状图统计
	@Autowired
	private RentalRatesLastMonths lastCount;//近期出租率统计
	
	@Autowired
	private RcfyLastMonths rcfyLastMonths;//近期日常费用统计
	
	@Autowired
	private ZcrcfyCountByYear rcfyYear;//资产日常费用按年线图统计
	
	@Autowired
	private RcfyCountByMonths rcfyMonths;//资产日常费用按月线图统计
	
	
	@Autowired
	private HtzjLastMonths htzjLastMonths;//近期合同租金统计
	
	@Autowired
	private HtzjCountYears htzjYears;//合同租金按年统计
	
	@Autowired
	private HtzjsrByMonth htzjsrMonths;//合同租金按年的各月统计
	
	
	
	//诉讼统计
	@Autowired
	private SusongAnJian susong;//诉讼折线图统计
	
	//实体日常管理费用统计
	@Autowired
	private StrcfyTjByYear strcfyYear; //实体日常管理费用按年统计
	@Autowired
	private StrcfyTjByMonths strcfyMonth;//实体日常管理费用按月统计
	
    //资产处置
	@Autowired
	private Czryaz czryaz;//实体人员安置线状图统计
	
	//委托贷款
	
	@Autowired
	private WtdkCountByLastMonth wtdkLastMonth;//线图统计近期委托贷款余额
	
	@Autowired
	private WtdkCountByYear wtdkYear;//委托贷款按年线图统计
	
	
	@Autowired
	private WtdkCountByArea wtdkArea;//委托贷款地区排名
	
	@Autowired
	private WtdkCountByQuarter wtdkQuarter;//委托贷款按季度线图统计
	
	@Autowired
	private WtdkCountByMonths wtdkMonths;//委托贷款按月线图统计
    
	
	
    private List yearList;

	
	/**
	 * 经营性固定资产统计(分全资产、经营性资产)
	 * @return
	 */
	public String queryJyzc(){
		try{
			String address = request.getParameter("address");
			String type= request.getParameter("type");//资产类型 1经营资产 2全资产
			HashMap map=new HashMap();
			map.put("address",address);
			map.put("type",type);
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			//查询出租率和成本收益率
	        HashMap resultMap=chartUCC.queryJylzcData(map);
	        Double czl=(Double)resultMap.get("czl");
	        Double cbsyl=(Double)resultMap.get("jycb");
	        
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String czl2=format.format(czl);
	        String cbsyl2=format.format(cbsyl);
	        
			response.setCharacterEncoding("UTF-8");
			request.setAttribute("type",type);
			response.getWriter().print(cityName+"|*|"+czl2+"%" + "|*|" + cbsyl2+"%");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 委托贷款余额统计
	 * @return
	 */
	public String queryWdye(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			//查询委托贷款余额和担险委托贷款余额
	        HashMap resultMap=chartUCC.queryWtdkData(address);
	        Double wtdkye=(Double)resultMap.get("wtdkye");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String wtdkye2=format.format(wtdkye);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"" +
					"|*|"+wtdkye2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
  /**
	 * 诉讼案件统计
	 * @return
	 */
	public String querySsaj(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.querySsajData(map);
	        Double ssybyz=(Double)resultMap.get("ssybyz");
	        Double fkje=(Double)resultMap.get("fkzh");
	        Double zxhk=(Double)resultMap.get("zxhk");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String ssybyz2=format.format(ssybyz);
	        String fkje2=format.format(fkje);
	        String zxhk2=format.format(zxhk);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+ssybyz2 + "|*|" + fkje2+"|*|"+zxhk2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	 /**
	 * 债权统计
	 * @return
	 */
	public String queryZqData(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryZqData(map);
	        Double zczq=(Double)resultMap.get("zczq");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String zczq2=format.format(zczq);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+zczq2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	 /**
	 * 担险委托贷款
	 * @return
	 */
	public String queryDxwddkData(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryDxwddkData(map);
	        Double dxwtye=(Double)resultMap.get("dxwtye");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String dxwtye2=format.format(dxwtye);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+dxwtye2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	
    /**
	 * 债券统计
	 * @return
	 */
	public String queryZq2Data(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryZq2Data(map);
	        Double zczq=(Double)resultMap.get("zq");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String zczq2=format.format(zczq);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+zczq2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
	 /**
	 * 合同租金收入
	 * @return
	 */
	public String queryHtzj(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryHtzj(map);
	        Double sszj=(Double)resultMap.get("sszj");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String sszj2=format.format(sszj);
	        response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+sszj2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 实体日常费用
	 * @return
	 */
	public String queryStrcfy(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryStrcfyData(map);
	        Double strcfy=(Double)resultMap.get("strcfy");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String strcfy2=format.format(strcfy);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+strcfy2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 资产处置
	 * @return
	 */
	public String queryZcczData(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryZcczData(map);
	        Double hkzsrje=(Double)resultMap.get("hkzsrje");
	        Double fy=(Double)resultMap.get("fy");
	        Double hkzsrje1=(Double)resultMap.get("hkzsrje1");
	        Double fy1=(Double)resultMap.get("fy1");
	        Double hkzsrje2=(Double)resultMap.get("hkzsrje2");
	        Double fy2=(Double)resultMap.get("fy2");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String hkzsrjea=format.format(hkzsrje);
	        String fya=format.format(fy);
	        String hkzsrje1a=format.format(hkzsrje1);
	        String fy1a=format.format(fy1);
	        String hkzsrje2a=format.format(hkzsrje2);
	        String fy2a=format.format(fy2);
	        
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+hkzsrjea+"|*|"+fya+"|*|"+hkzsrje1a+"|*|"+fy1a+"|*|"+hkzsrje2a+"|*|"+fy2a);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 实体整体处置
	 * @return
	 */
	public String queryStztczData(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryStztczData(map);
	        Double stztczsr=(Double)resultMap.get("stztczsr");
	        Double anfy=(Double)resultMap.get("anfy");
	        Double stztczsr1=(Double)resultMap.get("stztczsr1");
	        Double anfy1=(Double)resultMap.get("anfy1");
	        Double stztczsr2=(Double)resultMap.get("stztczsr2");
	        Double anfy2=(Double)resultMap.get("anfy2");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String stztczsra=format.format(stztczsr);
	        String anfya=format.format(anfy);
	        String stztczsr1a=format.format(stztczsr1);
	        String anfy1a=format.format(anfy1);
	        String stztczsr2a=format.format(stztczsr2);
	        String anfy2a=format.format(anfy2);
	        
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+stztczsra+"|*|"+anfya+"|*|"+stztczsr1a+"|*|"+anfy1a+"|*|"+stztczsr2a+"|*|"+anfy2a);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 实体人员安置
	 * @return
	 */
	public String queryStryazta(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryStryazta(map);
	        Double dazrs=(Double)resultMap.get("dazrs");
	        int   dazrsa=dazrs.intValue();
	        Double yanrs=(Double)resultMap.get("yanrs");
	        int yanrsa=yanrs.intValue();
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+dazrsa+"|*|"+yanrsa);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	 /**
	 * 日常费用
	 * @return
	 */
	public String queryRcfy(){
		try{
			String address = request.getParameter("address");
			//根据省code查询省名称
		 	String cityName=this.getCityName(address);
			HashMap map=new HashMap();
			map.put("address",address);
	        HashMap resultMap=chartUCC.queryRcfyData(map);
	        Double sqfy=(Double)resultMap.get("sqfy");
	        Double bxfy=(Double)resultMap.get("bxfy");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String sqfy2=format.format(sqfy);
	        String bxfy2=format.format(bxfy);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"|*|"+sqfy2 + "|*|" + bxfy2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	public String stfyByMonth(){
		String address = request.getParameter("address");
		RentalRatesMonth ce = new RentalRatesMonth();
		Map map = new HashMap();
		map.put("address", address);
		try {
			ce.produceDataset(map);
		} catch (DatasetProduceException e) {
			e.printStackTrace();
		}
		request.setAttribute("data1", ce);
		return "stfyMonth";
	}
	
	/**
	 * 按年统计出租率
	 * @return
	 */
	public String czlByYear(){
		try {
				String address = request.getParameter("address");
				String type=request.getParameter("type");//资产类型
				//查询出最近的六年的list
			    List yearList=this.queryYearList();
			 
				//根据省code查询省名称
			 	String cityName=this.getCityName(address);
				Map map = new HashMap();
				map.put("address", address);
				map.put("type", type);
				request.setAttribute("yearList", yearList);
				request.setAttribute("address", address);
				request.setAttribute("cityName", cityName);
				ce.setArg(map);
				request.setAttribute("czlyear", ce);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "czlByYear";
	}
	
	/**
	 * 按年统计合同租金收入
	 * @return
	 */
	public String htzjCountByYear(){
		try {
				String address = request.getParameter("address");
				String type=request.getParameter("type");//资产类型
				//查询出最近的六年的list
			    List yearList=this.queryYearList();
			 
				//根据省code查询省名称
			 	String cityName=this.getCityName(address);
				Map map = new HashMap();
				map.put("address", address);
				map.put("type", type);
				request.setAttribute("yearList", yearList);
				request.setAttribute("address", address);
				request.setAttribute("cityName", cityName);
				htzjYears.setArg(map);
				request.setAttribute("htzjYears",htzjYears);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "htzjsrByYears";
	}
	
	

	
	/**
	 * 按月统计出租率
	 * @return
	 */
	public String czlByMonth(){
		String address = request.getParameter("address");
		String year=request.getParameter("year");
		String type=request.getParameter("type");//资产类型
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
		Map map = new HashMap();
		map.put("address", address);
		map.put("year", year);
		map.put("type", type);
		request.setAttribute("address", address);
		
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
	 	
		try {
			ceMonth.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("ceMonth", ceMonth);
		request.setAttribute("cityName", cityName);
		request.setAttribute("year", year);
		request.setAttribute("yearList", yearList);
		return  "czlByMonth";
	}
	
	
	/**
	 * 统计某年各月的合同租金收入
	 * @return
	 */
	public String htzjsrCountByMonth(){
		String address = request.getParameter("address");
		String year=request.getParameter("year");
		String type=request.getParameter("type");//资产类型
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
		Map map = new HashMap();
		map.put("address", address);
		map.put("year", year);
		map.put("type", type);
		request.setAttribute("address", address);
		
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
	 	
		try {
			htzjsrMonths.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("htzjsrMonths", htzjsrMonths);
		request.setAttribute("cityName", cityName);
		request.setAttribute("year", year);
		request.setAttribute("yearList", yearList);
		return  "htzjByMonth";
	}
	
	
	
	/**
	 * 诉讼案件折线图统计
	 * @return
	 */
	public String susongLine(){
		String address = request.getParameter("address");
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
		Map map = new HashMap();
		map.put("address", address);
		request.setAttribute("address", address);
		try {
			susong.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("susong", susong);
		request.setAttribute("cityName", cityName);
		return  "susongLine";
	}
	
	
	/**
	 * 处置人员安置折线图
	 * @return
	 */
	public String czryazLine(){
		String address = request.getParameter("address");
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
		Map map = new HashMap();
		map.put("address", address);
		request.setAttribute("address", address);
		try {
			czryaz.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("czryaz", czryaz);
		request.setAttribute("cityName", cityName);
		return  "czryazLine";
	}
	
	/**
	 * 实体日常费用按近期统计
	 * @return
	 */
	public String stfyCountByMonths(){
		String address = request.getParameter("address");
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
	 	
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		Map map = new HashMap();
		map.put("address", address);
		request.setAttribute("address", address);
	
		try {
			strcfyMonth.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("StrcfyTjByMonths",strcfyMonth);
		request.setAttribute("cityName", cityName);
		return  "strcfyTjByMonths";
	}
	

	/**
	 * 实体日常费用年统计
	 * @return
	 */
	public String stfyCountByYear(){
		String address = request.getParameter("address");
		//根据省code查询省名称
	 	String cityName=this.getCityName(address);
	 	
		Map map = new HashMap();
		map.put("address", address);
		request.setAttribute("address", address);
		
		try {
			 strcfyYear.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		request.setAttribute("stfyYear",strcfyYear);
		request.setAttribute("cityName", cityName);
		return  "stfyYear";
	}
	
	/**
	 * 统计近期出租率
	 * @return
	 */
	public String czlCountLastMonths(){
		String address = request.getParameter("address");
		String type=request.getParameter("type");//资产类型
		//根据省code查询省名称
		String cityName=this.getCityName(address);
		Map map = new HashMap();
		map.put("address", address);
		map.put("type", type);
		request.setAttribute("address", address);
		request.setAttribute("type", type);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		try {
			lastCount.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("lastMonthsCountResult", lastCount);
		request.setAttribute("yearList", yearList);
		return  "czlCountLastMonths";
	}
	
	
	/**
	 * 资产结构统计饼图
	 * @return
	 */
	public String zcjgCount(){
	 	HashMap map=new HashMap();
	 	ZcjgPie zcjg = null;
		try {
			Map<?,?> date = chartUCC.queryCount();
			zcjg = new ZcjgPie();
			zcjg.setArg(map);
			zcjg.setData(date);
			request.setAttribute("zcjg",zcjg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  "zcjgtj";
	}
	
	/**
	 * 委托贷款统计饼图
	 * @return
	 */
	public String wtdkCount(){
	 	HashMap map=new HashMap();
	 	Wtdk wtdk=null;
		try {
			Map<?,?> data = chartUCC.queryWdData();
			wtdk = new Wtdk();
			wtdk.setData(data);
			wtdk.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdk",wtdk);
		return  "wtdk";
	}
	
	/**
	 *  首页地址
	 * @return
	 */
	public String goHomePage(){
		return  "homePage";
	}
	
	/**
	 * 委托贷款按近期统计
	 * @return
	 */
	public String wtdkCountByLastMonth(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			wtdkLastMonth.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdkMonth",wtdkLastMonth);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		return  "wtdkByLastMonth";
	}
	
	/**
	 * 资产日常费用按近期统计
	 * @return
	 */
	public String rcfyCountByLastMonth(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			rcfyLastMonths.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("rcfyLastMonths",rcfyLastMonths);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		
		return  "rcfyByLastMonths";
	}
	
	/**
	 * 合同租金收入按近期统计
	 * @return
	 */
	public String htzjCountByLastMonth(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			htzjLastMonths.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("htzjLastMonths",htzjLastMonths);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		
		return  "htzjByLastMonths";
	}
	
	
	
	/**
	 * 委托贷款按年统计
	 * @return
	 */
	public String wtdkCountByYear(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			wtdkYear.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdkYear",wtdkYear);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		
		return  "wtdkByYear";
	}
	
	
	
	/**
	 * 资产日常费用按年统计
	 * @return
	 */
	public String rcfyCountByYear(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			rcfyYear.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("rcfyYear",rcfyYear);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		return  "rcfyByYearLine";
	}
	
	
	/**
	 * 委托贷款按地区统计
	 * @return
	 */
	public String wtdkCountByArea(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			wtdkArea.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdkArea",wtdkArea);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		return  "wtdkArea";
	}
	
	
	/**
	 * 委托贷款按季度统计
	 * @return
	 */
	public String wtdkCountByQuarter(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
	 	HashMap map=new HashMap();
		map.put("address", address);
		try {
			wtdkQuarter.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdkQuarter",wtdkQuarter);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		return  "wtdkQuarter";
	}
	
	/**
	 * 委托贷款按月统计
	 * @return
	 */
	public String wtdkCountByMonths(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
		String year=request.getParameter("year");
		
	 	HashMap map=new HashMap();
		map.put("address", address);
		map.put("year", year);
		try {
			wtdkMonths.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("wtdkMonths",wtdkMonths);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		return  "wtdkMonths";
	}
	
	
	/**
	 * 资产日常费用按月统计
	 * @return
	 */
	public String rcfyCountByMonths(){
		String address = request.getParameter("address");
		//根据省code查询省名称
		String cityName=this.getCityName(address);
		String year=request.getParameter("year");
		
	 	HashMap map=new HashMap();
		map.put("address", address);
		map.put("year", year);
		try {
			rcfyMonths.setArg(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("rcfyMonths",rcfyMonths);
		request.setAttribute("address", address);
		request.setAttribute("cityName", cityName);
		//查询出最近的六年的list
	    List yearList=this.queryYearList();
		request.setAttribute("yearList", yearList);
		
		return  "rcfyMonths";
	}
	
	
	
	/**
	 * 地区委托贷款的excel
	 * @return
	 *//*
	public String toWtdkExcel(){
		
	    HashMap resultMap=chartUCC.queryHtzj();
	    return "toWtdkExcel";
	}
	*/
	
	
	/**
	 * 根据省级编码查询省名称
	 * @param addressCode
	 * @return
	 */
	public String getCityName(String addressCode){
		String cityName=chartUCC.queryCityName(addressCode);
		return cityName;
	}
	
	
	
	
    /**
     * 年list
     * @return
     */
	public List queryYearList(){
		//查询出最近的六年的list
		Calendar c = Calendar.getInstance();
	    int currYear = c.get(Calendar.YEAR);
	    List yearList=new ArrayList();
	 	for(int i=currYear;i>=currYear-5;i--){
	 		yearList.add(i);
	 	}
	 	return yearList;
	}
	public List qetYearList() {
		return yearList;
	}


	public void setYearList(List yearList) {
		this.yearList = yearList;
	}

	public ChartUCC getChartUCC() {
		return chartUCC;
	}


	public void setChartUCC(ChartUCC chartUCC) {
		this.chartUCC = chartUCC;
	}

   
}
