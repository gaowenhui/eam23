package com.tansun.eam2.jfreeChart.chartmain;
 
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.jfree.data.category.DefaultCategoryDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;

@Service
public class RentalRatesYear  implements DatasetProducer  {
	
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
	   DefaultCategoryDataset dataset = new DefaultCategoryDataset();

	   String address=(String)this.arg.get("address");
	   String type=(String)this.arg.get("type");
       Calendar c = Calendar.getInstance();
       int currYear = c.get(Calendar.YEAR);
 	   for(int i=currYear-5;i<=currYear;i++){
		//查询出租率
		HashMap map =new HashMap();
 		map.put("c_jyfl",type);
 		map.put("address",address);
	    map.put("currYear",i);
        double num=chartUCC.queryData2(map);
        dataset.addValue(num, "出租率",String.valueOf(i)); 
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
