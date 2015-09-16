package com.tansun.eam2.jfreeChart.chartmain;
 
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

@Service
public class WtdkCountByYear  implements DatasetProducer,PieToolTipGenerator,CategoryItemLinkGenerator   {
 
	
	@Autowired
	private ChartUCC chartUCC;
	
	private Map arg;

    public ChartUCC getChartUCC() {
		return chartUCC;
	}


	public void setChartUCC(ChartUCC chartUCC) {
		this.chartUCC = chartUCC;
	}


public String getProducerId() {
  return null;
 }
 
 



public boolean hasExpired(Map arg0, Date arg1) {
  return true;
 }
 
 
 public Object produceDataset(Map arg0) throws DatasetProduceException {
	  String address=(String)this.arg.get("address");
	  final String series1 = "委托贷款余额";  
      final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
      Calendar c = Calendar.getInstance();
  	  int currYear = c.get(Calendar.YEAR);
  	  for (int i = currYear-5; i <=currYear; i++) {    
  		//根据年、省查询委托贷款余额
  		HashMap pareMap=new HashMap();
  		pareMap.put("year",i);
  		pareMap.put("address",address);
	    String date="";
	    //得到当前年，如果当前年与传入的年份一致，则得到当前日期来统计，如果是往年则按12月31日来统计
	    if(currYear==i){
	    	java.util.Date d = new java.util.Date();
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    	date = sdf.format(d);
	    }else{
	    	date = i + "-12-31";
	    }
	     List list=new ArrayList();
	     list.add(address);
	     list.add(date);
          double value=chartUCC.queryWtdkDataByTime(list);
          dataset.addValue(value, series1, String.valueOf(i));  
  		}         
  	
      return dataset;  
 }

public String generateToolTip(PieDataset arg0, Comparable arg1, int arg2) {
	// 鼠标移动弹出框
	//arg0;
	return "";
}


public String generateLink(Object arg0, int arg1, Object arg2) {
	// 热点链接
	 return null;
}


public Map getArg() {
	return arg;
}


public void setArg(Map arg) {
	this.arg = arg;
}

}
