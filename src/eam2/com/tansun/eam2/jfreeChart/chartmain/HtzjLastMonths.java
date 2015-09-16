package com.tansun.eam2.jfreeChart.chartmain;
 
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

@Service
public class HtzjLastMonths  implements DatasetProducer  {
	@Autowired
	private ChartUCC chartUCC;
  
	private Map arg;



public String getProducerId() {
  return null;
 }
 
 
 public boolean hasExpired(Map arg0, Date arg1) {
  return true;
 }
 
 /**
  * 统计近期合同租金收入
  */
 public Object produceDataset(Map arg0) throws DatasetProduceException {
	   String address=(String)this.arg.get("address");
       DefaultCategoryDataset dataset = new DefaultCategoryDataset();
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
			    java.util.Date date = new java.util.Date();
		    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    	String endTime=sdf.format(date);//获得当前时间
		    	day=endTime.substring(endTime.length()-2, endTime.length());
		   }else{
			   day = "" + c.getActualMaximum(Calendar.DAY_OF_MONTH);
		   }
		    int mon=(Integer.parseInt(month)+1);
		    month=String.valueOf(mon);
		   if ((month.length()) < 2)
			{
				month = "0" + month;
			}
			if (day.length() < 2)
			{
				day = "0" + day;
			}
			String date = year + "-"+month+"-" + day;
			HashMap map=new HashMap();
	    	map.put("date",date);
	    	map.put("address",address);
	        double num=chartUCC.queryLastDataByHtzj(map);
	        dataset.addValue(num,"合同租金收入",year+"/"+month); 
	   }
	    
        return dataset; 
 }


public ChartUCC getChartUCC() {
	return chartUCC;
}


public void setChartUCC(ChartUCC chartUCC) {
	this.chartUCC = chartUCC;
}


public Map getArg() {
		return arg;
	}


	public void setArg(Map arg) {
		this.arg = arg;
	}



}
