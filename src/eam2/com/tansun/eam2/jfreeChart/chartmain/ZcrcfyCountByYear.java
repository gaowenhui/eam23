package com.tansun.eam2.jfreeChart.chartmain;
 
import java.awt.Color;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.ChartPostProcessor;
import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.CategoryItemLinkGenerator;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

@Service
public class ZcrcfyCountByYear  implements DatasetProducer,PieToolTipGenerator,CategoryItemLinkGenerator   {
 
	
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
	  final String series1 = "申请费用"; 
	  final String series2 = "报销费用";  
	  
      final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
      Calendar c = Calendar.getInstance();
  	  int currentYear = c.get(Calendar.YEAR);
  	  for (int i = currentYear-5; i <=currentYear; i++) {
	 	    String date="";
	 	    //得到当前年，如果当前年与传入的年份一致，则得到当前日期来统计，如果是往年则按12月31日来统计
	 	    if(currentYear==i){
	 	    	java.util.Date d = new java.util.Date();
	 	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	 	    	date = sdf.format(d);
	 	    }else{
	 	    	date = i + "-12-31";
	 	    }
	 	    String  startTime=i+"-01-01";
	 	    List paramsList = new ArrayList();
		   	paramsList.add(startTime);
		   	paramsList.add(date);
		   	paramsList.add(address);
	       double num=chartUCC.queryDataByRcfy(paramsList);
	       //申请费用
	       dataset.addValue(num, series1,String.valueOf(i)); 
	       //报销费用
	       double num2=chartUCC.queryDataByRcfyBxfy(paramsList);
	       dataset.addValue(num2, series2,String.valueOf(i)); 
	      
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
