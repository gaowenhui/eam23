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
public class Czryaz  implements DatasetProducer  {
	
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
       
	   final String series1 = "待安置人数";  
       final String series2 = "已安置人数";  
       
        Calendar c = Calendar.getInstance();
     	int currYear = c.get(Calendar.YEAR);//获得当前年度
   	    int startYear = currYear-5;//需要从当前年度的前5年开始统计
		//待安置人数统计
		String sql1=" select count(sf.id) as dazrs ,to_char(ryazsj,'YYYY') as tjyear from CZ_XM_XX cxx  " +
				" left join CZ_AZRY_XX cax on cax.cld_id=cxx.cld_id left join ST_FSXX sf on sf.id=cax.ST_FSXX_ID" +
				" left join CZ_STCZTZ cs on cs.id=cxx.cld_id where FENLEI='4' and  (FAZZT='0' or FAZZT='1') and subStr(STSCSF,0,3)='" +
				address+"' and to_char(ryazsj,'YYYY') between  '" +
				startYear + "' and '" +
				currYear +	"' group by to_char(ryazsj,'YYYY')";
     	HashMap pareMap=new HashMap();
     	pareMap.put("sql1",sql1);
     	List list =chartUCC.queryDataList(pareMap);
     	
     	double dazrs=0;
     	HashMap map2=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			map2=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)map2.get("dazrs");
			String tjyear = (String)map2.get("tjyear");
			if(big != null){
				dazrs = big.doubleValue();
			}
			 dataset.addValue(dazrs, series1,tjyear);  	
		  }
		}  
		
		//已安置人数统计
		 sql1=" select count(sf.id) as yazrs ,to_char(ryazsj,'YYYY') as yaztjyear from CZ_XM_XX cxx  " +
		" left join CZ_AZRY_XX cax on cax.cld_id=cxx.cld_id left join ST_FSXX sf on sf.id=cax.ST_FSXX_ID" +
		" left join CZ_STCZTZ cs on cs.id=cxx.cld_id where FENLEI='4' and  FAZZT='3' and subStr(STSCSF,0,3)='" +
		address+"' and to_char(ryazsj,'YYYY') between  '" +
		startYear + "' and '" +
		currYear +	"' group by to_char(ryazsj,'YYYY')";
		HashMap pareMap2=new HashMap();
		pareMap2.put("sql1",sql1);
     	//折线2
   	    list =chartUCC.queryDataList(pareMap2);
     	double yazrs=0;
     	HashMap susongMap=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			susongMap=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)susongMap.get("yazrs");
			String yaztjyear = (String)susongMap.get("yaztjyear");
			if(big != null){
				yazrs = big.doubleValue();
			}
			 dataset.addValue(yazrs, series2,yaztjyear);  	 
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
