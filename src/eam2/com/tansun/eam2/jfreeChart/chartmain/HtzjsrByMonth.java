package com.tansun.eam2.jfreeChart.chartmain;
 
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
public class HtzjsrByMonth  implements DatasetProducer  {
	@Autowired
	private ChartUCC chartUCC;
  
	private Map arg;
  
 public Map getArg() {
		return arg;
	}


	public void setArg(Map arg) {
		this.arg = arg;
	}


public String getProducerId() {
  return null;
 }
 
 
 public boolean hasExpired(Map arg0, Date arg1) {
  return true;
 }
 
 /**
  * 统计某年各月的合同租金收入
  */
 public Object produceDataset(Map arg0) throws DatasetProduceException {
	   DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	   String address=(String)this.arg.get("address");
	   String type=(String)this.arg.get("type");
	   String year=(String)this.arg.get("year");
    
	    Calendar c = Calendar.getInstance();
	    String paramYear=null;
	    String currYear =String.valueOf(c.get(Calendar.YEAR));
		int currMonth=c.get(Calendar.MONTH)+1;
	    int maxMonth=0;
	    if(currYear.equals(year)){
	    	maxMonth=currMonth;
	    	paramYear=currYear;
	    }else{
	    	maxMonth=12;
	    	paramYear=year;
	    }
	  
	    for(int i=1;i<=maxMonth;i++){
	    	
	    	HashMap map=new HashMap();
	    	map.put("yearMonth",i);
	    	map.put("address",address);
	    	map.put("type",type);
	    	map.put("year",paramYear);
	        double num=chartUCC.queryHtzjsrDataByYearMonth(map);
	        dataset.addValue(num,"合同租金收入",year+"/"+String.valueOf(i)); 
	    }
	    
        return dataset; 
 }


public ChartUCC getChartUCC() {
	return chartUCC;
}


public void setChartUCC(ChartUCC chartUCC) {
	this.chartUCC = chartUCC;
}



}
