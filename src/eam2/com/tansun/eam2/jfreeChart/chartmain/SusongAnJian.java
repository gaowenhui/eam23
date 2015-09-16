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
public class SusongAnJian  implements DatasetProducer  {
	
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
       
	   final String series1 = "原币原值总值";  
       final String series2 = "付款金额总值";  
       final String series3 = "执行回款总值";  
       
       // column keys...
       Calendar c = Calendar.getInstance();
     	int currYear = c.get(Calendar.YEAR);//获得当前年度
   	    int startYear = currYear-5;//需要从当前年度的前5年开始统计
		//原币原值统计
		String sql1=" select sum(ybyz)/10000 as ssybyz,to_char(LARQ,'YYYY')  as  larq from  SS_BASEINFO sb left join cardinfo card on card.zcid=sb.SAZCID  where card.STATE='01' and substr(SFID,0,3)='"+
		address+ "' and (to_char(LARQ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(LARQ,'YYYY')  ";
     	HashMap pareMap=new HashMap();
     	pareMap.put("sql1",sql1);
     	List list =chartUCC.queryDataList(pareMap);
     	
     	double ssybyz=0;
     	HashMap map2=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			map2=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)map2.get("ssybyz");
			String larq = (String)map2.get("larq");
			if(big != null){
				ssybyz = big.doubleValue();
			}
			 dataset.addValue(ssybyz, series1,larq);  	
		  }
		}  
		//被诉类案件的付款金额总值
		sql1="select sum(ZXHK)/10000 as fkzh,to_char(QSSJ,'YYYY') as fkzhQssj from SS_BASEINFO where SSLXMC= '被诉' and substr(SFID,0,3)='"+address 
		+"' and (to_char(QSSJ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(QSSJ,'YYYY')   ";
		HashMap pareMap2=new HashMap();
		pareMap2.put("sql1",sql1);
     	//折线2
   	    list =chartUCC.queryDataList(pareMap2);
     	double fkzh=0;
     	HashMap susongMap=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			susongMap=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)susongMap.get("fkzh");
			String fkzhQssj = (String)susongMap.get("fkzhQssj");
			if(big != null){
				fkzh = big.doubleValue();
			}
			 dataset.addValue(fkzh, series2,fkzhQssj);  	 
		  }
		}  
		
		//起诉类案件的执行回款总值
		sql1="select sum(ZXHK)/10000 as zxhk,to_char(QSSJ,'YYYY') as qssj from SS_BASEINFO where SSLXMC= '起诉' and substr(SFID,0,3)='"+address 
		+"' and (to_char(QSSJ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(QSSJ,'YYYY') ";
		HashMap pareMap3=new HashMap();
		pareMap3.put("sql1",sql1);
   	    //折线3
   	    list =chartUCC.queryDataList(pareMap3);
     	double zxhk=0;
     	HashMap zxhkMap=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			zxhkMap=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)zxhkMap.get("zxhk");
			String qssj = (String)zxhkMap.get("qssj");
			if(big != null){
				zxhk = big.doubleValue();
			}
			 dataset.addValue(zxhk, series3,qssj);  	 
		  }
		}  
		
		//测试数据
		/* dataset.addValue(45466, series1,"2011");  
		 dataset.addValue(466, series1,"2010");  
		 dataset.addValue(4566, series1,"2009");  
		 dataset.addValue(25466, series1,"2008");  
		 dataset.addValue(15436, series1,"2007");  
		 dataset.addValue(95566, series1,"2006");  
		 
		 
		 dataset.addValue(45436, series2,"2011");  
		 dataset.addValue(48656, series2,"2010");  
		 dataset.addValue(4566, series2,"2009");  
		 dataset.addValue(15466, series2,"2008");  
		 dataset.addValue(35466, series2,"2007");  
		 dataset.addValue(25466, series2,"2006");  
		 
		 dataset.addValue(66, series3,"2011");  
		 dataset.addValue(49466, series3,"2010");  
		 dataset.addValue(15466, series3,"2009");  
		 dataset.addValue(93556, series3,"2008");  
		 dataset.addValue(75496, series3,"2007");  
		 dataset.addValue(4546, series3,"2006");  */
        return dataset;  
 }

public Map getArg() {
	return arg;
}

public void setArg(Map arg) {
	this.arg = arg;
}


}
