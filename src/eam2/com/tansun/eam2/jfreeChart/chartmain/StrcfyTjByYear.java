package com.tansun.eam2.jfreeChart.chartmain;
 
import java.math.BigDecimal;
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
public class StrcfyTjByYear  implements DatasetProducer  {
	
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

	   String address=(String)this.arg.get("address");
	   DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
       Calendar c = Calendar.getInstance();
   	   int currYear = c.get(Calendar.YEAR);//当前年度
		int startYear=currYear-5;//前5年是哪一年
		String sql1="select sum(SJFY)/10000 as sjfy , to_char(NGRQ,'YYYY') as tjYear  from ST_JBXX left join ST_HEAD on ST_JBXX.ID = ST_HEAD.ST_ID  left join ST_GLBT on ST_JBXX.id=ST_GLBT.ST_ID where ST_GLBT.SPZT='2' and  substr(C_SHENGFEN, 0, 3) = '"+address+"'" +
                 	"and   to_char(NGRQ,'YYYY') between '" +startYear 
   	                +"' and '" + currYear+
                 	"'  group by to_char(NGRQ,'YYYY') order by to_char(NGRQ,'YYYY') desc";
		//按当前年度统计某省各月的实体日常费用
   		
   		HashMap pareMap=new HashMap();
   	 	pareMap.put("sql1",sql1);
   	     List list =chartUCC.queryDataList(pareMap);
   	     double sjfy=0;
   	     	HashMap map2=null;
   			if(list!=null){
   			for(int i=0;i<list.size();i++){
   				map2=(HashMap)list.get(i);
   				BigDecimal big = (BigDecimal)map2.get("sjfy");
   				String tjYear = (String)map2.get("tjYear");
   				if(big != null){
   					sjfy = big.doubleValue();
   				}
   		         dataset.addValue(sjfy, "实体日常管理费用",tjYear); 		 
   			  }
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
