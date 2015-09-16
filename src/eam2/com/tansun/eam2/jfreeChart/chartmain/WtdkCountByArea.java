package com.tansun.eam2.jfreeChart.chartmain;
 
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.xy.XYDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.ChartPostProcessor;
import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.XYItemLinkGenerator;
import de.laures.cewolf.tooltips.XYToolTipGenerator;

@Service
public class WtdkCountByArea  implements DatasetProducer  {
	
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

		HashMap map =new HashMap();
		String sql1=" select ww.he/10000 as he, ww.gl_opun_cod, c.code_value as   cityName " +
				" from ( " +
				"select  qq.he, qq.gl_opun_cod from ( " +
				"select sum(e.gl_dr_bal) he, substr(e.gl_opun_cod,0,3) gl_opun_cod  from " +
				"CRT_TOTAL_ACCOUNT e " +
				"where  e.gl_lg_no='79600000'  and DATA_DATE =(select max(DATA_DATE) from CRT_TOTAL_ACCOUNT) " +
				"group by substr(e.gl_opun_cod,0,3)" +
				"order by  sum(GL_DR_BAL) desc " +
				") qq  where rownum <=10 )" +
				" ww,  ZCYM_CODE c where " +
				"ww.gl_opun_cod = substr(c.code_key,0,3) and c.code_name='省份' ";
		
		map.put("sql1",sql1);
        List list=chartUCC.queryDataList(map);
    	double num=0;
     	HashMap map2=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			map2=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)map2.get("he");
			String cityName = (String)map2.get("cityName");
			if(big != null){
				num = big.doubleValue();
			}
		      dataset.addValue(num, "委托贷款余额",cityName); 
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
