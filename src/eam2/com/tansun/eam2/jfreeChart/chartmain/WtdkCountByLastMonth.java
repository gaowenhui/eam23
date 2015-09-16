package com.tansun.eam2.jfreeChart.chartmain;
 
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;

@Service
public class WtdkCountByLastMonth  implements DatasetProducer  {
	
	@Autowired
	private ChartUCC chartUCC;
	
	private Map arg;

public String getProducerId() {
  return null;
 }
 
 
public ChartUCC getChartUCC() {
	return chartUCC;
}


public void setChartUCC(ChartUCC chartUCC) {
	this.chartUCC = chartUCC;
}


public boolean hasExpired(Map arg0, Date arg1) {
  return true;
 }
 
 
 public Object produceDataset(Map arg0) throws DatasetProduceException {
       final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
	
       String address=(String)this.arg.get("address");
       
	   final String series1 = "贷款余额";  
       
	   Calendar c = Calendar.getInstance();
	   String year="";
	   String month="";
	   String day="";
	   for(int i=5;i>=0;i--){
		   if(i==5){
			   c.add(Calendar.MONTH, -5);//前5个月
		   }else{
			   c.add(Calendar.MONTH, +1);//前5个月
		   }
		 
		   year =String.valueOf(c.get(Calendar.YEAR));
		   month =String.valueOf(c.get(Calendar.MONTH));
		   c.set(Integer.parseInt(year),Integer.parseInt(month)+1,0);
		   if(i==0){
			    java.util.Date d = new java.util.Date();
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    	String time=sdf.format(d);
		    	day = time.substring((time.length())-2, time.length());
		   }else{
			   day = "" + c.getActualMaximum(Calendar.DAY_OF_MONTH);
		   }
		   int month2= Integer.parseInt(month)+1;
		   month=String.valueOf(month2);
		   if ((month.length()) < 2)
			{
			   month = "0" + month;
			}
			if (day.length() < 2)
			{
				day = "0" + day;
			}
			String date = year + "-"+month+"-" + day;
			List paramsList = new ArrayList();
			paramsList.add(address);
	    	paramsList.add(date);
	        double num=chartUCC.queryWtdkDataByTime(paramsList);
	        dataset.addValue(num, series1,year+"/"+month);  	
	   
	   }
	    
       return dataset;  

        
 }

public Map getArg() {
	return arg;
}

public void setArg(Map arg) {
	this.arg = arg;
}


}
