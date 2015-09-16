package com.tansun.eam2.jfreeChart.chartmain;

import java.text.NumberFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.links.PieSectionLinkGenerator;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

@Service
public class Wtdk implements DatasetProducer, PieToolTipGenerator, PieSectionLinkGenerator {

	/**
	 * 
	 */
	private static final long serialVersionUID = 9187339275891108669L;

	private Map<?, ?> arg;
	
	private Map<?,?> data;

	public Map<?, ?> getData() {
		return data;
	}

	public void setData(Map<?, ?> data) {
		this.data = data;
	}


	public String getProducerId() {
		return "Wtdk produceDataset";
	}

	@SuppressWarnings("unchecked")
	public boolean hasExpired(Map arg0, Date arg1) {
		return System.currentTimeMillis() - arg1.getTime() > 0L;
	}

	public Object produceDataset(Map arg0) throws DatasetProduceException {
		DefaultPieDataset dataset = new DefaultPieDataset();
		//HashMap map = chartUCC.queryWdData();
		if(data != null){
		Double dwtdkye = (Double) data.get("dwtdkye");
		Double dxwtye = (Double) data.get("dxwtye");
		dataset.setValue("委托贷款余额", dwtdkye);
		dataset.setValue("担险委托贷款余额", dxwtye);
		}
		return dataset;
	}

	public String generateToolTip(PieDataset arg0, Comparable arg1, int arg2) {
		// 鼠标移动弹出框
		Double dwtdkye = (Double) data.get("dwtdkye");
		Double dxwtye = (Double) data.get("dxwtye");
		NumberFormat format = NumberFormat.getInstance();
	    format.setMaximumFractionDigits(4);
	    String dwtdkye2=format.format(dwtdkye);
	    String dxwtye2=format.format(dxwtye);
	    if(StringUtils.equals("委托贷款余额", arg1.toString()))
			return "委托贷款余额:\n"+dwtdkye2+"万元";
		else 
			return "担险委托贷款余额：\n"+ dxwtye2+"万元";
	}


	public String generateLink(Object arg0, Object arg1) {
		if (StringUtils.equals("委托贷款余额", arg1.toString()))
			return "tj/MapTjAction_wtdkCount.do";
		else
			return "tj/MapTjAction_dxwtdkCount.do";
	}

	public void setArg(Map<?, ?> arg) {
		this.arg = arg;
	}

	public Map<?, ?> getArg() {
		return arg;
	}

}
