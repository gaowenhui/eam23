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
public class JyxfdzcRcfy  implements DatasetProducer  {
	
	@Autowired
	private ChartUCC chartUCC;
	


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
	    DefaultCategoryDataset dataset = new DefaultCategoryDataset();
	      try{
		   String address=(String)arg0.get("address");
		   String type=(String)arg0.get("type");
	        Calendar c = Calendar.getInstance();
	    	int currYear = c.get(Calendar.YEAR);
	 		for(int i=currYear-5;i<=currYear;i++){
			    //查询出租率
	 			HashMap map =new HashMap();
	 	 		map.put("c_jyfl",type);
	 	 		map.put("address",address);
	 		    map.put("currYear",i);
		        double num=chartUCC.queryData2(map);
		        dataset.addValue(num, "",String.valueOf(i)); 
	 		}
		 }catch(Exception e){
			 e.printStackTrace();
		 }
 	  
        return dataset; 
        
 }


}
