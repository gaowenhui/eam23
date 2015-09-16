package com.tansun.eam2.jfreeChart.chartmain;

import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.Map;

import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.Axis;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer3D;

import de.laures.cewolf.ChartPostProcessor;

public class BarProcessor implements ChartPostProcessor, Serializable
{
	public void processChart (Object arg0, Map params) {
		    JFreeChart chart=(JFreeChart)arg0;
		    
		    CategoryPlot localCategoryPlot = (CategoryPlot)chart.getPlot();
		    //设置Plot，不显示所有网格
		    localCategoryPlot.setOutlinePaint(null);
		    localCategoryPlot.setDomainGridlinesVisible(false);
		    localCategoryPlot.setRangeGridlinesVisible(false);
		    localCategoryPlot.setForegroundAlpha(0.9f); //透明度
		    
		    BarRenderer3D localBarRenderer = (BarRenderer3D)localCategoryPlot.getRenderer();
		    localBarRenderer.setDrawBarOutline(false);
		    localBarRenderer.setItemMargin(100D);//每个BAR之间的间隔
		    localBarRenderer.setMaximumBarWidth(3D);//每个BAR的最大宽度
		    localBarRenderer.setMinimumBarLength(10);
		    localBarRenderer.setWallPaint(Color.white);//3D坐标轴的墙体颜色
		    localCategoryPlot.setBackgroundPaint(Color.white); // 设定图表数据显示部分背景色
		    localCategoryPlot.setOutlinePaint(Color.white);//设置数据区的边界线条颜色
		    localBarRenderer.setDrawBarOutline(false); // Bar的外轮廓线不画
		    //为bar设置特定颜色
		    GradientPaint localGradientPaint2 = new GradientPaint(0.0F, 0.0F, new Color(64,191,236), 0.0F, 0.0F, new Color(64,191,236));
		    localBarRenderer.setSeriesPaint(0, localGradientPaint2);
		    localBarRenderer.setSeriesOutlinePaint(0,Color.red);//边框颜色

		    localCategoryPlot.setRenderer(localBarRenderer);//使用我们设计的效果

		    CategoryAxis localCategoryAxis = localCategoryPlot.getDomainAxis();
		    localCategoryAxis.setCategoryLabelPositions(CategoryLabelPositions.createUpRotationLabelPositions(0.5235987755982988D));
		    //x轴设置
		    localCategoryAxis.setLabelFont(new Font("黑体",Font.PLAIN,12));// 轴标题 
		    localCategoryAxis.setTickLabelFont(new Font("黑体",Font.PLAIN,12));// 轴数值 

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
