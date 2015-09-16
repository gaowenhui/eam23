package com.tansun.eam2.jfreeChart.chartmain;
 
import java.util.Date;
import java.util.Map;

import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.PieDataset;

import de.laures.cewolf.DatasetProduceException;
import de.laures.cewolf.DatasetProducer;
import de.laures.cewolf.tooltips.PieToolTipGenerator;

public class ChartEam2  implements DatasetProducer,PieToolTipGenerator  {
// private static ChartUCC chartUCC;
 
 public String getProducerId() {
  return null;
 }
 
 
 public boolean hasExpired(Map arg0, Date arg1) {
  return true;
 }
 
 
 public Object produceDataset(Map arg0) throws DatasetProduceException {
  DefaultPieDataset defaultpiedataset = new DefaultPieDataset();  
 
        defaultpiedataset.setValue("One", new Double(43.200000000000003D)); 
 
        defaultpiedataset.setValue("Two", new Double(10D)); 
 
        defaultpiedataset.setValue("Three", new Double(27.5D)); 
 
        defaultpiedataset.setValue("Four", new Double(17.5D)); 
 
        return defaultpiedataset; 
 
 }


public String generateToolTip(PieDataset arg0, Comparable arg1, int arg2) {
	// TODO Auto-generated method stub
	/*String unit = "℃";
    TimeSeriesCollection ds = (TimeSeriesCollection) arg0;
		String y = String.valueOf(ds.getYValue(arg1, arg2));
		Date dateTemp = new Date();
		dateTemp.setTime((long)ds.getXValue(arg1, arg2));
		String xDateString = "";
		xDateString = sdf.format(dateTemp);
		return xDateString+" "+y+" "+unit;*/

	return null;
}

}
