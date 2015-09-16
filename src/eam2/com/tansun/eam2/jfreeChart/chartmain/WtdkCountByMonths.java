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
public class WtdkCountByMonths  implements DatasetProducer  {
	
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
       String year=(String)this.arg.get("year");
       String date="";
	   final String series1 = "贷款余额";  
       
	   Calendar c = Calendar.getInstance();
	    String paramYear=null;
	    String currYear =String.valueOf(c.get(Calendar.YEAR));
		int currMonth=c.get(Calendar.MONTH)+1;
	    int maxMonth=0;
	    if(currYear.equals(year)){
	    	maxMonth=currMonth;
	    }else{
	    	maxMonth=12;
	    }
	    for(int i=1;i<=maxMonth;i++){
	    	
	    	if(currYear.equals(year) && currMonth==i){
				java.util.Date d = new java.util.Date();
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//获得当期日期
		    	date = sdf.format(d);
			}else{
					c.set(Integer.parseInt(year),i,0);
					String day = "" + c.getActualMaximum(Calendar.DAY_OF_MONTH);
					String month=i+"";
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
	
			List paramsList = new ArrayList();
			paramsList.add(address);
	    	paramsList.add(date);
	        double num=chartUCC.queryWtdkDataByTime(paramsList);
	        dataset.addValue(num, series1,String.valueOf(i));  	
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
