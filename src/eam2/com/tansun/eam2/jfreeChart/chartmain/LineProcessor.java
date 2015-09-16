package com.tansun.eam2.jfreeChart.chartmain;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.ui.RectangleInsets;

import de.laures.cewolf.ChartPostProcessor;

public class LineProcessor implements ChartPostProcessor, Serializable
{
	public void processChart (Object arg0, Map params) {
		JFreeChart chart=(JFreeChart)arg0;
		    CategoryPlot localCategoryPlot = (CategoryPlot)chart.getPlot();
		    
		    chart.setBorderVisible(false);
		    chart.setBorderPaint(new Color(255,255,255));
		    chart.setBackgroundPaint(new Color(255,255,255));
		    
		    localCategoryPlot.setBackgroundPaint(Color.white); // 设定图表数据显示部分背景色
		    localCategoryPlot.setOutlinePaint(Color.white);//设置数据区的边界线条颜色
		    localCategoryPlot.setRangeGridlinePaint(Color.white);
		    localCategoryPlot.setAxisOffset(new RectangleInsets(5D, 5D, 5D, 5D)); // 设定坐标轴与图表数据显示部分距离
		    localCategoryPlot.setDomainGridlinePaint(Color.white); // 网格线颜色
            
		    //为每个折线设置颜色
		    LineAndShapeRenderer lineandshaperenderer = (LineAndShapeRenderer)localCategoryPlot.getRenderer();
		    lineandshaperenderer.setShapesVisible(false); // series 点（即数据点）可见
		    lineandshaperenderer.setStroke(new BasicStroke(2));
		    lineandshaperenderer.setSeriesStroke(0, new BasicStroke(2.0F, 1, 1,
		      1.0F, new float[] { 10F, 6F }, 0.0F));
		    lineandshaperenderer.setSeriesStroke(1, new BasicStroke(2.0F, 1, 1,
		    	    1.0F, new float[] { 6F, 6F }, 0.0F));
		    lineandshaperenderer.setSeriesStroke(2, new BasicStroke(2.0F, 1, 1,
		    	    1.0F, new float[] { 2.0F, 6F }, 0.0F));
		    lineandshaperenderer.setShapesFilled(true); //设置线条
		    lineandshaperenderer.setStroke(new BasicStroke(2));//
		    
		    CategoryAxis domainAxis = localCategoryPlot.getDomainAxis(); 
		    domainAxis.setLabelFont(new Font("黑体",Font.PLAIN,12));// 轴标题 
		    domainAxis.setTickLabelFont(new Font("黑体",Font.PLAIN,12));// 轴数值 
		    
		    // y轴设置 
		    ValueAxis rangeAxis = localCategoryPlot.getRangeAxis(); 
		    rangeAxis.setLabelFont(new Font("黑体",Font.PLAIN,12)); 
		    rangeAxis.setTickLabelFont(new Font("黑体",Font.PLAIN,10)); 
		   
		   // 数据轴精度 
		    NumberAxis vn = (NumberAxis) localCategoryPlot.getRangeAxis(); 
		    // vn.setAutoRangeIncludesZero(true); 
		    DecimalFormat df = new DecimalFormat("#0"); 
		    vn.setNumberFormatOverride(df); // 数据轴数据标签的显示格式 

		    
	}
}
