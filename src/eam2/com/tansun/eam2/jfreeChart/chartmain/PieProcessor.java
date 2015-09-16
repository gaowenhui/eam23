package com.tansun.eam2.jfreeChart.chartmain;

import java.awt.Color;
import java.awt.Font;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.renderer.AbstractRenderer;

import de.laures.cewolf.ChartPostProcessor;

public class PieProcessor implements ChartPostProcessor, Serializable
{
	public void processChart (Object arg0, Map params) {
		JFreeChart chart=(JFreeChart)arg0;
		  chart.setBackgroundPaint(new Color(255, 255, 255));//
		  chart.setBorderVisible(false);
		  
		  chart.setBorderPaint(new Color(255, 255, 255));
		  //  chart.setBorderStroke(Stroke stroke)     边界线条笔触
		  chart.setBorderVisible(false);     //边界线条是否可见

		  
		  PiePlot localPiePlot3D1 = (PiePlot)chart.getPlot();
		  localPiePlot3D1.setStartAngle(120D);
		  localPiePlot3D1.setBackgroundPaint(new Color(255, 255, 255));
		  localPiePlot3D1.setBaseSectionOutlinePaint(new Color(255, 255, 255));
		  
		  localPiePlot3D1.setForegroundAlpha(0.9F);
		  localPiePlot3D1.setCircular(true); localPiePlot3D1.setInteriorGap(0.04D);
		  localPiePlot3D1.setMaximumLabelWidth(0.2D); //PageContext
         
		  //设置分饼的颜色
		  localPiePlot3D1.setSectionPaint(0, new Color(5,209,22)); 
		  localPiePlot3D1.setSectionPaint(1, new Color(253,158,2)); 
		  localPiePlot3D1.setSectionPaint(2, new Color(248,255,1)); 
		  localPiePlot3D1.setSectionPaint(3, new Color(253,210,2)); 
		  
		  
		  localPiePlot3D1.setNoDataMessagePaint(new Color(51,153,225));//没有数据时显示的消息颜色
		  
		  //分类标签设置
		  localPiePlot3D1.setLabelFont(new Font("宋体", 0, 12));     // 分类标签的字体
		 // localPiePlot3D1.setLabelLinkMargin(double margin)     //分类标签与图的连接线边距
		  localPiePlot3D1.setLabelLinkPaint(new Color(51,153,225));    // 分类标签与图的连接线颜色
		  //localPiePlot3D1.setLabelLinkStroke(Stroke stroke);   // 分类标签与图的连接线笔触
		  localPiePlot3D1.setLabelOutlinePaint(new Color(51,153,225));   // 分类标签边框颜色
		  //localPiePlot3D1.setLabelOutlineStroke(Paint paint);    // 分类标签边框笔触
		  //  localPiePlot3D1.setLabelShadowPaint(new Color(51,153,225)); //  分类标签阴影颜色
		 // localPiePlot3D1.setLabelBackgroundPaint(new Color(253,214,90));   // 分类标签的底色
		  
		  //百分比设置
		  localPiePlot3D1.setLabelGenerator(new StandardPieSectionLabelGenerator(
          "{0} {2}",
          NumberFormat.getNumberInstance(),
          new DecimalFormat("0.00%")));
		  
		  //饼图初始角度
		  localPiePlot3D1.setStartAngle(50);
		  

	}
}
