package com.tansun.eam2.jfreeChart.action;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;
import com.tansun.eam2.jfreeChart.chartmain.Wtdk;
import com.tansun.eam2.jfreeChart.chartmain.WtdkCountByArea;
import com.tansun.eam2.jfreeChart.chartmain.WtdkCountByLastMonth;
import com.tansun.eam2.jfreeChart.chartmain.WtdkCountByMonths;
import com.tansun.eam2.jfreeChart.chartmain.WtdkCountByYear;
import com.tansun.rdp4j.common.web.action.CommonAction;
import de.laures.cewolf.DatasetProduceException;
public class WtdkTjAction extends CommonAction {

	@Autowired
	private ChartUCC chartUCC;
	
	//委托贷款
	
	@Autowired
	private WtdkCountByLastMonth wtdkLastMonth;//线图统计近期委托贷款余额
	
	@Autowired
	private WtdkCountByYear wtdkYear;//委托贷款按年线图统计
	
	
	@Autowired
	private WtdkCountByArea wtdkArea;//委托贷款地区排名
	
	
	@Autowired
	private WtdkCountByMonths wtdkMonths;//委托贷款按月线图统计
    
	
	
    private List yearList;

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
	        Double dxwtye=(Double)resultMap.get("dxwtye");
	        NumberFormat format = NumberFormat.getInstance();
	        format.setMaximumFractionDigits(4);
	        String wtdkye2=format.format(wtdkye);
	        //String dxwtye2=format.format(dxwtye);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(cityName+"" +
					"|*|"+wtdkye2 );
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
		return  "wtdkByLastMonth";
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
		return  "wtdkByYear";
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
		return  "wtdkMonths";
	}
	
	
	/**
	 * 根据省级编码查询省名称
	 * @param addressCode
	 * @return
	 */
	public String getCityName(String addressCode){
		String cityName=chartUCC.queryCityName(addressCode);
		return cityName;
	}
	
	public List getYearList() {
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
