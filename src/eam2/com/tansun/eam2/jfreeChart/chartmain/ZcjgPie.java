package com.tansun.eam2.jfreeChart.chartmain;

import java.awt.Color;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PiePlot;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.stereotype.Service;

import de.laures.cewolf.ChartPostProcessor;
import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.PieSectionLinkGenerator;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

@Service
public class ZcjgPie implements DatasetProducer, PieToolTipGenerator, PieSectionLinkGenerator,ChartPostProcessor {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2942975585185691601L;

	private Map<?,?> arg;
	
	private Map<?,?> data;

	

	public String getProducerId() {
		return "ZcjgPie produceDataset";
	}

	@SuppressWarnings("unchecked")
	public boolean hasExpired(Map arg0, Date arg1) {
		return System.currentTimeMillis() - arg1.getTime() > 0L;
	}

	public Map<?, ?> getData() {
		return data;
	}

	public void setData(Map<?, ?> data) {
		this.data = data;
	}

	@SuppressWarnings("unchecked")
	public Object produceDataset(Map arg0) throws DatasetProduceException {
		DefaultPieDataset dataset = new DefaultPieDataset();
		//DefaultPieDataset dataset = new DefaultPieDataset();
		if(data != null){
			Double ybyzCount = (Double) data.get("ybyzCount");
			Double wtdkCount = (Double) data.get("wtdkCount");
			Double zjCount = (Double) data.get("zjCount");
			Double zqCount = (Double) data.get("zqCount");
			dataset.setValue("经营性固定资产", ybyzCount);
			dataset.setValue("委托贷款", wtdkCount);
			dataset.setValue("债券", zjCount);
			dataset.setValue("债权", zqCount);
		}
		return dataset;
	}

//	public String generateLink(Object dataset, int series, Object category) {
//		return "pages/chart/jyzcChart.jsp";
//	}
	
	@SuppressWarnings("unchecked")
	public String generateToolTip(PieDataset arg0, Comparable arg1, int arg2) {
		// 鼠标移动弹出框
		Double ybyzCount = (Double) data.get("ybyzCount");
		Double wtdkCount = (Double) data.get("wtdkCount");
		Double zjCount = (Double) data.get("zjCount");
		Double zqCount = (Double) data.get("zqCount");
		
		//经营性固定资产
		Double jyzcCzl = (Double) data.get("jyzcCzl");
		Double jyzcCbsyl = (Double) data.get("jyzcCbsyl");
		Double jyzcSqfy = (Double) data.get("jyzcSqfy");
		Double jyzcBxfy = (Double) data.get("jyzcBxfy");
		Double jyzcHtzj = (Double) data.get("jyzcHtzj");
		
		//全资产
		Double qczCzl = (Double) data.get("qczCzl");
		Double qczCbsyl = (Double) data.get("qczCbsyl");
		
		
		NumberFormat format = NumberFormat.getInstance();
	    format.setMaximumFractionDigits(4);
	    String jyzcCzl2=format.format(jyzcCzl);
	    String jyzcCbsyl2=format.format(jyzcCbsyl);
	    
	    String qczCzl2=format.format(qczCzl);
	    String qczCbsyl2=format.format(qczCbsyl);
	    
	    String zjCount2=format.format(zjCount);
	    String wtdkCount2=format.format(wtdkCount);
	    String zqCount2=format.format(zqCount); 
	    
	    String jyzcSqfy2=format.format(jyzcSqfy);
	    String jyzcBxfy2=format.format(jyzcBxfy);
	    String jyzcHtzj2=format.format(jyzcHtzj);
		if(StringUtils.equals("经营性固定资产", arg1.toString()))
			return "经营类资产统计\n出租率："+jyzcCzl2+"%\n成本收益率："+jyzcCbsyl2+"%\n申请费用："+jyzcSqfy2+"万元\n报销费用："+jyzcBxfy2+"万元\n合同租金收入："+jyzcHtzj2+"万元\n\n全资产统计\n出租率:"+qczCzl2+"%\n成本收益率："+qczCbsyl2+"%";
		else if(StringUtils.equals("委托贷款", arg1.toString()))
			return "委托贷款余额：\n"+ wtdkCount2+"万元";
		else if(StringUtils.equals("债券", arg1.toString()))
			return "债券金额：\n"+zjCount2+"万元";
		else
			return "债权金额：\n"+zqCount2+"万元";
	}

	public Map<?, ?> getArg() {
		return arg;
	}

	public void setArg(Map<?, ?> arg) {
		this.arg = arg;
	}

	public String generateLink(Object dataset, Object category) {
		if(StringUtils.equals("经营性固定资产", category.toString()))
			return "tj/MapTjAction_qzcCount.do";
		else if(StringUtils.equals("委托贷款", category.toString()))
			return "char/CharAction_wtdkCount.do" ;
		else if(StringUtils.equals("债券", category.toString()))
			return "tj/MapTjAction_zqCount2.do";
		else
			return "tj/MapTjAction_zqCount.do";
	}

	public void processChart(Object arg0, Map arg1) {
	}
}
