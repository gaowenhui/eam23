package com.tansun.eam2.jfreeChart.chartmain;

import java.awt.Color;
import java.awt.Paint;
import java.awt.RenderingHints;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartFrame;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.DateTickMarkPosition;
import org.jfree.chart.axis.DateTickUnit;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.NumberTickUnit;
import org.jfree.chart.axis.SegmentedTimeline;
import org.jfree.chart.plot.CombinedDomainXYPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.CandlestickRenderer;
import org.jfree.chart.renderer.xy.XYBarRenderer;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.time.Day;
import org.jfree.data.time.Month;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.time.ohlc.OHLCSeries;
import org.jfree.data.time.ohlc.OHLCSeriesCollection;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.tansun.eam2.jfreeChart.chartUcc.ChartUCC;

/** 
 * 该类用于演示最简单的柱状图生成 
 */ 
@Service
public class JFreeChartEam2  { 
	
	private static ChartUCC chartUCC;

	public static void main(String[] args) throws IOException{ 
 

		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		chartUCC = (ChartUCC)ctx.getBean("chartUCCImpl");
		JFreeChartEam2 jFreeChartEam2=new JFreeChartEam2();
		  
	
	 	
	 	
    	/*资产结构信息统计*/
		//jFreeChartEam2.genPie3D(); //资产结构信息统计饼状图 
		
		/*经营性固定资产信息统计*/
	      
		//jFreeChartEam2.genCategoryByYear(); //按省统计各年出租率柱状图
		
		jFreeChartEam2.genCategoryByMonth(); //按省统计近期出租率柱状图
		
		
		
		//jFreeChartEam2.genPie3DDealPerson(); //按省统计实体人员安置饼图
		
	     jFreeChartEam2.genWtdkPie3D(); //委托贷款余额饼图统计
	     
	//	jFreeChartEam2.genWdLineByYear();//委托贷款按年统计折线图
	//	jFreeChartEam2.genLineByMonth();//委托贷款按月统计柱状图
		
	   	//jFreeChartEam2.genLineByMonth();//担险委托贷款按省排名（前十）
		
	//	jFreeChartEam2.genPie3DDeal(); //资产处置饼状图 
		
		//实体当年各月日常管理费用统计（柱状图）
		//jFreeChartEam2.genRcglByMonth();
		
		//实体近年日常管理费用统计（柱状图）
		//jFreeChartEam2.genRcglByYear();
		
		//诉讼案件信息统计(按原币原值、付款金额总值、执行回款总额)
      // jFreeChartEam2.genSsajLine();
		
		
		//例子
		//jFreeChartEam2.genCategory(); //柱状图
        // KLineCombineChart(); 
		//jFreeChartEam2.genTimeSeries(); 
		//jFreeChartEam2.genLine(); 
    } 
 
	// 按省统计实体人员安置饼图
    private  void genPie3DDealPerson() { 
        DefaultPieDataset dataset = new DefaultPieDataset();
        //需要按省统计当前年度的实体人员安置
        String address="370";//由地图热点传入
        HashMap map=chartUCC.queryDealPsersonData(address);
        Double dazcount=(Double)map.get("dazcount");
        Double azcount=(Double)map.get("azcount");
        dataset.setValue("待安置人数",dazcount); 
        dataset.setValue("已安置人数",azcount); 
        HashMap paraMap=new HashMap();//参数值传入
        paraMap.put("title","实体人员安置饼图");
        this.genPie3DPub(dataset,paraMap);
    }
     // 资产结构信息统计饼状图 
    private  void genPie3D() { 
        DefaultPieDataset dataset = new DefaultPieDataset();
        HashMap map=chartUCC.queryCount();
        Double ybyzCount=(Double)map.get("ybyzCount");
        Double wtdkCount=(Double)map.get("wtdkCount");
        Double zjCount=(Double)map.get("zjCount");
        Double zqCount=(Double)map.get("zqCount");
        dataset.setValue("经营性固定资产",ybyzCount); 
        dataset.setValue("委托贷款",wtdkCount); 
        dataset.setValue("债券",zjCount); 
        dataset.setValue("债权",zqCount); 
        HashMap paraMap=new HashMap();//参数值传入
        paraMap.put("title","资产结构信息统计");
        this.genPie3DPub(dataset,paraMap);
        
     
    } 

    // 委托贷款余额统计饼状图 
    private  void genWtdkPie3D() { 
        DefaultPieDataset dataset = new DefaultPieDataset();
        String addr="370";//按省来统计，省需要传入数据
        HashMap paraMap=new HashMap();//参数值传入
        paraMap.put("title","资产结构信息统计");
        HashMap map=chartUCC.queryWtdkData(addr);
        Double dwtdkye=(Double)map.get("dwtdkye");
        Double dxwtye=(Double)map.get("dxwtye");
        dataset.setValue("委托贷款余额",dwtdkye); 
        dataset.setValue("担险委托贷款余额",dxwtye);
        HashMap parametMap=new HashMap();//参数值传入
        paraMap.put("title","委托贷款余额统计");
        this.genPie3DPub(dataset,parametMap);
    } 
    
  
    private  void genCategoryByYear(){ 
    	HashMap map=new HashMap();
    	CategoryDataset dataset = getDataSet2(map);
    	HashMap paramMap=new HashMap();
    	paramMap.put("title","各年经营性固定资产信息统计--出租率");
    	this.genPubCategory(dataset, paramMap);
    } 
    
    private  void genCategoryByMonth(){ 
        CategoryDataset dataset = getDataSetByMonth(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","近期经营性固定资产信息统计--出租率");
    	this.genPubCategory(dataset, paramMap);
    } 

    // 折线图 
    private  void genLine(){ 
        CategoryDataset dataset = getDatasetLine(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","折线图");
        this.genLinePub(dataset, paramMap);
    } 
    
  

    /**
     * 委托贷款按年统计
     */
    private  void genWdLineByYear() { 
        CategoryDataset dataset = createDatasetByYear(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","委托贷款按年统计");
    	this.genLinePub(dataset, paramMap);
    }
    

    
    /**
     * 诉讼案件统计
     */
    private  void   genSsajLine() { 
        CategoryDataset dataset = createDatasetSsajLine(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","诉讼案件");
    	this.genLinePub(dataset, paramMap);
    }
    
    
    /**
     * 委托贷款按月统计
     */
    private  void genLineByMonth() { 
        
        CategoryDataset dataset = createDatasetByMonth(); 
        
        HashMap paramMap=new HashMap();
    	paramMap.put("title","委托贷款按月统计");
    	this.genPubCategory(dataset, paramMap);
    }
    
    /**
     * 实体日常管理费用按月、省来统计
     */
    private  void genRcglByMonth() { 
        
        CategoryDataset dataset = createRcglDatasetByMonth(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","近期实体日常管理费用统计");
    	this.genPubCategory(dataset, paramMap);
    }
    
    /**
     * 实体日常管理费用按年、省来统计
     */
    private  void genRcglByYear() { 
        
        CategoryDataset dataset = createRcglDatasetByYear(); 
        HashMap paramMap=new HashMap();
    	paramMap.put("title","实体日常管理费用各年统计");
    	this.genPubCategory(dataset, paramMap);
    }
    
    
    
    private  void genTimeSeries() { 
        TimeSeriesCollection dataset = getDataSetTimeSeries(); 
        JFreeChart chart = ChartFactory.createTimeSeriesChart( 
                "时序图TimeSeries", 
                "Date", 
                "Price Per Unit", 
                dataset, 
                true, 
                true, 
                false 
        ); 
        ChartFrame frame = new ChartFrame("测试", chart); 
        frame.pack(); 
        frame.setVisible(true); 
//        FileOutputStream fos_jpg = null; 
//        try{ 
//            fos_jpg = new FileOutputStream("D:\\fruittime.jpg"); 
//            ChartUtilities.writeChartAsJPEG(fos_jpg,1,chart,400,300,null); 
//            FileOutputStream output = new FileOutputStream("D:\\fruittime2.png"); 
//            //设置背景色 
//            chart.setBackgroundPaint(Color.WHITE); 
//            //设置时序图中线条的颜色 
//            XYLineAndShapeRenderer xylinerenderer=(XYLineAndShapeRenderer)chart.getXYPlot().getRenderer(); 
//            //以下分别给同一个曲线图中3条曲线设置颜色,0为第一条1为第二条,...... 
//            xylinerenderer.setSeriesPaint(0,Color.YELLOW); 
//            //chart.setBorderPaint(Color.BLUE); 
//            ChartUtilities.writeChartAsPNG(output, chart, 800, 600); 
//        }catch (Exception e) {} 
//        finally { 
//            try { 
//                fos_jpg.close(); 
//            }catch(Exception e) {} 
//        } 
    } 

    /* 
    private static TimeSeriesCollection genTimeSeries2() { 
        TimeSeriesCollection data = getDataSetTimeSeries(); 

        XYBarRenderer xyBarRender = new XYBarRenderer(); 

//      volume range 
        NumberAxis y2Axis = new NumberAxis(""); 
        y2Axis.setAutoRangeIncludesZero(false); 
        // setVolumnAxis(y2Axis); 
        XYPlot plot2 = new XYPlot(data, null, y2Axis, xyBarRender); 

        // combine two plot 
        CombinedDomainXYPlot combineddomainxyplot = new CombinedDomainXYPlot(x1Axis); 
        combineddomainxyplot.add(plot1, 2); 
        combineddomainxyplot.add(plot2, 1); 
        combineddomainxyplot.setGap(4); 

        String title = String.format("%s - %s", stockInfo.getCode().getCode() 
                , stockInfo.getStockName()); 
        JFreeChart chart = new JFreeChart(title, 
                JFreeChart.DEFAULT_TITLE_FONT, combineddomainxyplot, false); 
        try{ 
            FileOutputStream output = new FileOutputStream("D:\\fruittime2.png"); 
            ChartUtilities.writeChartAsPNG(output, chart, 800, 600); 
        }catch (Exception e) {} 
        finally { } 
    } 
     */ 


    public static void KLineCombineChart() { 
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式 
        double highValue = Double.MIN_VALUE;//设置K线数据当中的最大值 
        double minValue = Double.MAX_VALUE;//设置K线数据当中的最小值 
        double high2Value = Double.MIN_VALUE;//设置成交量的最大值 
        double min2Value = Double.MAX_VALUE;//设置成交量的最低值 
        OHLCSeries series = new OHLCSeries("");//高开低收数据序列，股票K线图的四个数据，依次是开，高，低，收 
        series.add(new Day(28, 9, 2007), 9.2, 9.58, 9.16, 9.34); 
        series.add(new Day(27, 9, 2007), 8.9, 9.06, 8.83, 8.96); 
        series.add(new Day(26, 9, 2007), 9.0, 9.1, 8.82, 9.04); 
        series.add(new Day(25, 9, 2007), 9.25, 9.33, 8.88, 9.00); 
        series.add(new Day(24, 9, 2007), 9.05, 9.50, 8.91, 9.25); 
        series.add(new Day(21, 9, 2007), 8.68, 9.05, 8.40, 9.00); 
        series.add(new Day(20, 9, 2007), 8.68, 8.95, 8.50, 8.69); 
        series.add(new Day(19, 9, 2007), 8.80, 8.94, 8.50, 8.66); 
        series.add(new Day(18, 9, 2007), 8.88, 9.17, 8.69, 8.80); 
        series.add(new Day(17, 9, 2007), 8.26, 8.98, 8.15, 8.89); 
        series.add(new Day(14, 9, 2007), 8.44, 8.45, 8.13, 8.33); 
        series.add(new Day(13, 9, 2007), 8.13, 8.46, 7.97, 8.42); 
        series.add(new Day(12, 9, 2007), 8.2, 8.4, 7.81, 8.13); 
        series.add(new Day(11, 9, 2007), 9.0, 9.0, 8.1, 8.24); 
        series.add(new Day(10, 9, 2007), 8.6, 9.03, 8.40, 8.95); 
        series.add(new Day(7, 9, 2007), 8.89, 9.04, 8.70, 8.73); 
        series.add(new Day(6, 9, 2007), 8.4, 9.08, 8.33, 8.88); 
        series.add(new Day(5, 9, 2007), 8.2, 8.74, 8.17, 8.36); 
        series.add(new Day(4, 9, 2007), 7.7, 8.46, 7.67, 8.27); 
        series.add(new Day(3, 9, 2007), 7.5, 7.8, 7.48, 7.69); 
        series.add(new Day(31, 8, 2007), 7.4, 7.6, 7.28, 7.43); 
        series.add(new Day(30, 8, 2007), 7.42, 7.56, 7.31, 7.40); 
        series.add(new Day(29, 8, 2007), 7.42, 7.66, 7.22, 7.33); 
        series.add(new Day(28, 8, 2007), 7.31, 7.70, 7.15, 7.56); 
        series.add(new Day(27, 8, 2007), 7.05, 7.46, 7.02, 7.41); 
        series.add(new Day(24, 8, 2007), 7.05, 7.09, 6.90, 6.99); 
        series.add(new Day(23, 8, 2007), 7.12, 7.16, 7.00, 7.03); 
        series.add(new Day(22, 8, 2007), 6.96, 7.15, 6.93, 7.11); 
        series.add(new Day(21, 8, 2007), 7.10, 7.15, 7.02, 7.07); 
        series.add(new Day(20, 8, 2007), 7.02, 7.19, 6.94, 7.14); 
        final OHLCSeriesCollection seriesCollection = new OHLCSeriesCollection();//保留K线数据的数据集，必须申明为final，后面要在匿名内部类里面用到 
        seriesCollection.addSeries(series); 
        TimeSeries series2=new TimeSeries("");//对应时间成交量数据 
        series2.add(new Day(28, 9, 2007), 260659400/100); 
        series2.add(new Day(27, 9, 2007), 119701900/100); 
        series2.add(new Day(26, 9, 2007), 109719000/100); 
        series2.add(new Day(25, 9, 2007), 178492400/100); 
        series2.add(new Day(24, 9, 2007), 269978500/100); 
        series2.add(new Day(21, 9, 2007), 361042300/100); 
        series2.add(new Day(20, 9, 2007), 173912600/100); 
        series2.add(new Day(19, 9, 2007), 154622600/100); 
        series2.add(new Day(18, 9, 2007), 200661600/100); 
        series2.add(new Day(17, 9, 2007), 312799600/100); 
        series2.add(new Day(14, 9, 2007), 141652900/100); 
        series2.add(new Day(13, 9, 2007), 221260400/100); 
        series2.add(new Day(12, 9, 2007), 274795400/100); 
        series2.add(new Day(11, 9, 2007), 289287300/100); 
        series2.add(new Day(10, 9, 2007), 289063600/100); 
        series2.add(new Day(7, 9, 2007), 351575300/100); 
        series2.add(new Day(6, 9, 2007), 451357300/100); 
        series2.add(new Day(5, 9, 2007), 442421200/100); 
        series2.add(new Day(4, 9, 2007), 671942600/100); 
        series2.add(new Day(3, 9, 2007), 349647800/100); 
        series2.add(new Day(31, 8, 2007), 225339300/100); 
        series2.add(new Day(30, 8, 2007), 160048200/100); 
        series2.add(new Day(29, 8, 2007), 247341700/100); 
        series2.add(new Day(28, 8, 2007), 394975400/100); 
        series2.add(new Day(27, 8, 2007), 475797500/100); 
        series2.add(new Day(24, 8, 2007), 297679500/100); 
        series2.add(new Day(23, 8, 2007), 191760600/100); 
        series2.add(new Day(22, 8, 2007), 232570200/100); 
        series2.add(new Day(21, 8, 2007), 215693200/100); 
        series2.add(new Day(20, 8, 2007), 200287500/100); 
        TimeSeriesCollection timeSeriesCollection=new TimeSeriesCollection();//保留成交量数据的集合 
        timeSeriesCollection.addSeries(series2); 

        //获取K线数据的最高值和最低值 
        int seriesCount = seriesCollection.getSeriesCount();//一共有多少个序列，目前为一个 
        for (int i = 0; i < seriesCount; i++) { 
            int itemCount = seriesCollection.getItemCount(i);//每一个序列有多少个数据项 
            for (int j = 0; j < itemCount; j++) { 
                if (highValue < seriesCollection.getHighValue(i, j)) {//取第i个序列中的第j个数据项的最大值 
                    highValue = seriesCollection.getHighValue(i, j); 
                } 
                if (minValue > seriesCollection.getLowValue(i, j)) {//取第i个序列中的第j个数据项的最小值 
                    minValue = seriesCollection.getLowValue(i, j); 
                } 
            } 
        } 
        //获取最高值和最低值 
        int seriesCount2 = timeSeriesCollection.getSeriesCount();//一共有多少个序列，目前为一个 
        for (int i = 0; i < seriesCount2; i++) { 
            int itemCount = timeSeriesCollection.getItemCount(i);//每一个序列有多少个数据项 
            for (int j = 0; j < itemCount; j++) { 
                if (high2Value < timeSeriesCollection.getYValue(i,j)) {//取第i个序列中的第j个数据项的值 
                    high2Value = timeSeriesCollection.getYValue(i,j); 
                } 
                if (min2Value > timeSeriesCollection.getYValue(i, j)) {//取第i个序列中的第j个数据项的值 
                    min2Value = timeSeriesCollection.getYValue(i, j); 
                } 
            } 
        } 

        final CandlestickRenderer candlestickRender=new CandlestickRenderer();//设置K线图的画图器，必须申明为final，后面要在匿名内部类里面用到 
        candlestickRender.setUseOutlinePaint(true); //设置是否使用自定义的边框线，程序自带的边框线的颜色不符合中国股票市场的习惯 
        candlestickRender.setAutoWidthMethod(CandlestickRenderer.WIDTHMETHOD_AVERAGE);//设置如何对K线图的宽度进行设定 
        candlestickRender.setAutoWidthGap(0.001);//设置各个K线图之间的间隔 
        candlestickRender.setUpPaint(Color.RED);//设置股票上涨的K线图颜色 
        candlestickRender.setDownPaint(Color.GREEN);//设置股票下跌的K线图颜色 
        DateAxis x1Axis=new DateAxis();//设置x轴，也就是时间轴 
        x1Axis.setAutoRange(false);//设置不采用自动设置时间范围 
        try{ 
            x1Axis.setRange(dateFormat.parse("2007-08-20"),dateFormat.parse("2007-09-29"));//设置时间范围，注意时间的最大值要比已有的时间最大值要多一天 
        }catch(Exception e){ 
            e.printStackTrace(); 
        } 
        x1Axis.setTimeline(SegmentedTimeline.newMondayThroughFridayTimeline());//设置时间线显示的规则，用这个方法就摒除掉了周六和周日这些没有交易的日期(很多人都不知道有此方法)，使图形看上去连续 
        x1Axis.setAutoTickUnitSelection(false);//设置不采用自动选择刻度值 
        x1Axis.setTickMarkPosition(DateTickMarkPosition.MIDDLE);//设置标记的位置 
        x1Axis.setStandardTickUnits(DateAxis.createStandardDateTickUnits());//设置标准的时间刻度单位 
        x1Axis.setTickUnit(new DateTickUnit(DateTickUnit.DAY,7));//设置时间刻度的间隔，一般以周为单位 
        x1Axis.setDateFormatOverride(new SimpleDateFormat("yyyy-MM-dd"));//设置显示时间的格式 
        NumberAxis y1Axis=new NumberAxis();//设定y轴，就是数字轴 
        y1Axis.setAutoRange(false);//不不使用自动设定范围 
        y1Axis.setRange(minValue*0.9, highValue*1.1);//设定y轴值的范围，比最低值要低一些，比最大值要大一些，这样图形看起来会美观些 
        y1Axis.setTickUnit(new NumberTickUnit((highValue*1.1-minValue*0.9)/10));//设置刻度显示的密度 
        XYPlot plot1=new XYPlot(seriesCollection,x1Axis,y1Axis,candlestickRender);//设置画图区域对象 

        XYBarRenderer xyBarRender=new XYBarRenderer(){ 
            private static final long serialVersionUID = 1L;//为了避免出现警告消息，特设定此值 
            public Paint getItemPaint(int i, int j){//匿名内部类用来处理当日的成交量柱形图的颜色与K线图的颜色保持一致 
                if(seriesCollection.getCloseValue(i,j)>seriesCollection.getOpenValue(i,j)){//收盘价高于开盘价，股票上涨，选用股票上涨的颜色 
                    return candlestickRender.getUpPaint(); 
                }else{ 
                    return candlestickRender.getDownPaint(); 
                } 
            }}; 

            xyBarRender.setMargin(0.1);//设置柱形图之间的间隔 
            NumberAxis y2Axis=new NumberAxis();//设置Y轴，为数值,后面的设置，参考上面的y轴设置 
            y2Axis.setAutoRange(false); 
            y2Axis.setRange(min2Value*0.9, high2Value*1.1); 
            y2Axis.setTickUnit(new NumberTickUnit((high2Value*1.1-min2Value*0.9)/4)); 
            XYPlot plot2=new XYPlot(timeSeriesCollection,null,y2Axis,xyBarRender);//建立第二个画图区域对象，主要此时的x轴设为了null值，因为要与第一个画图区域对象共享x轴 
            CombinedDomainXYPlot combineddomainxyplot = new CombinedDomainXYPlot(x1Axis);//建立一个恰当的联合图形区域对象，以x轴为共享轴 
            combineddomainxyplot.add(plot1, 2);//添加图形区域对象，后面的数字是计算这个区域对象应该占据多大的区域2/3 
            combineddomainxyplot.add(plot2, 1);//添加图形区域对象，后面的数字是计算这个区域对象应该占据多大的区域1/3 
            combineddomainxyplot.setGap(10);//设置两个图形区域对象之间的间隔空间 
            JFreeChart chart = new JFreeChart("中国联通", JFreeChart.DEFAULT_TITLE_FONT, combineddomainxyplot, false); 
            ChartFrame frame = new ChartFrame("中国联通股票", chart); 
            frame.pack(); 
            frame.setVisible(true); 
    } 

    /** 
     * 获取按年统计数据集对象 
     * @return 
     */ 
   private  CategoryDataset getDataSet2(HashMap paramMap) { 
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);
    	String address="110";//传入参数省
    	
    	String c_jyfl="01";//前台传入用来判断是统计全资产还是统计固定资产
 		for(int i=currYear;i>=currYear-5;i--){
		//查询出租率
 		HashMap map =new HashMap();
 		map.put("c_jyfl",c_jyfl);
 		map.put("address",address);
 		map.put("currYear",i);
        double num=chartUCC.queryData2(map);
          dataset.addValue(num, "",String.valueOf(i)); 
 		}
        return dataset; 
        
    } 
    
    /** 
     * 获取一个演示用的组合数据集对象 
     * @return 
     */ 
    private  CategoryDataset getDataSetByMonth() { 
        DefaultCategoryDataset dataset = new DefaultCategoryDataset();
        Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);
		int currMonth=c.get(Calendar.MONTH)+1;
		String address="010";//省由地图传入
		
		
	  /*  for(int i=1;i<=currMonth;i++){
	    	
	    	String yearmonth=String.valueOf(currYear)+"-"+month+"-"+"01";
	      	System.out.print("yearmonth:"+yearmonth);
	    	HashMap map=new HashMap();
	    	map.put("yearMonth",yearmonth);
	    	map.put("address",address);
	        double num=chartUCC.queryDataByMonth(map);
	        
	        dataset.addValue(400,"",yearmonth); 
	    }*/
        return dataset; 
    } 
    
    
    // 资产结构信息统计饼状图 
    private  void genPie3DDeal() { 
        DefaultPieDataset dataset = new DefaultPieDataset();
        
        HashMap map=chartUCC.queryDealData();
        Double ybyzCount=(Double)map.get("ybyzCount");
        Double wtdkCount=(Double)map.get("wtdkCount");
        Double zjCount=(Double)map.get("zjCount");
        dataset.setValue("资产处置",ybyzCount); 
        dataset.setValue("实体整体处置",wtdkCount); 
        dataset.setValue("实体人员安置",zjCount); 
        HashMap paramMap=new HashMap();
        paramMap.put("title","资产结构信息统计");
        this.genPie3DPub(dataset,paramMap);
       /* PiePlot localPiePlot = (PiePlot)chart.getPlot();
        localPiePlot.setSectionPaint("资产处置"+ybyzCount+"万元", new Color(160, 160, 255));
        localPiePlot.setSectionPaint("实体整体处置"+wtdkCount+"万元", new Color(128, 128, 223));
        localPiePlot.setSectionPaint("实体人员安置"+zjCount+"万元", new Color(96, 96, 191));
        localPiePlot.setNoDataMessage("No data available");
        localPiePlot.setExplodePercent("Two", 0.2D);
        localPiePlot.setLegendLabelToolTipGenerator(new StandardPieSectionLabelGenerator("Tooltip for legend item {0}"));
        localPiePlot.setSimpleLabels(true);
        localPiePlot.setInteriorGap(0.0D);
        */
    } 

   
    private  CategoryDataset getDatasetLine() {  

//      row keys...  
        final String series1 = "First";  
        final String series2 = "Second";  
        final String series3 = "Third";  

//      column keys...  
        final String type1 = "Type 1";  
        final String type2 = "Type 2";  
        final String type3 = "Type 3";  
        final String type4 = "Type 4";  
        final String type5 = "Type 5";  
        final String type6 = "Type 6";  
        final String type7 = "Type 7";  
        final String type8 = "Type 8";  

//      create the dataset...  
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  

        dataset.addValue(1.0, series1, type1);  
        dataset.addValue(4.0, series1, type2);  
        dataset.addValue(3.0, series1, type3);  
        dataset.addValue(5.0, series1, type4);  
        dataset.addValue(5.0, series1, type5);  
        dataset.addValue(7.0, series1, type6);  
        dataset.addValue(7.0, series1, type7);  
        dataset.addValue(8.0, series1, type8);  

        dataset.addValue(5.0, series2, type1);  
        dataset.addValue(7.0, series2, type2);  
        dataset.addValue(6.0, series2, type3);  
        dataset.addValue(8.0, series2, type4);  
        dataset.addValue(4.0, series2, type5);  
        dataset.addValue(4.0, series2, type6);  
        dataset.addValue(2.0, series2, type7);  
        dataset.addValue(1.0, series2, type8);  

        dataset.addValue(4.0, series3, type1);  
        dataset.addValue(3.0, series3, type2);  
        dataset.addValue(2.0, series3, type3);  
        dataset.addValue(3.0, series3, type4);  
        dataset.addValue(6.0, series3, type5);  
        dataset.addValue(3.0, series3, type6);  
        dataset.addValue(4.0, series3, type7);  
        dataset.addValue(3.0, series3, type8);  

        return dataset;  

    }  

    
    private  CategoryDataset createDatasetByYear() {  

//      row keys...  
        final String series1 = "First";  
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
//      column keys...
        Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);
    	for (int i = currYear; i >=currYear-5; i--) {    
    		//根据年、省查询委托贷款余额
    		String address="370";
    		HashMap pareMap=new HashMap();
    		pareMap.put("year",i);
    		pareMap.put("address",address);
         //   double value=chartUCC.queryWtdkDataByYear(pareMap);
           // dataset.addValue(value, series1, String.valueOf(i));  
    		}         
    	
        return dataset;  

    }  
    
    private  CategoryDataset createDatasetSsajLine() {  

        // row keys...  
        final String series1 = "First";  
        final String series2 = "Second";  
        final String series3 = "Third";  
        
        final DefaultCategoryDataset dataset = new DefaultCategoryDataset();  
        //      column keys...
        Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);//获得当前年度
    	int startYear = currYear-5;//需要从当前年度的前5年开始统计
		String address="110";
		//原币原值统计
		String sql1=" select sum(ybyz)/10000 as ssybyz,to_char(LARQ,'YYYY')  as  larq from  SS_BASEINFO sb left join cardinfo card on card.zcid=sb.SAZCID  where card.STATE='01' and substr(SFID,0,3)='"+
		address+ "' and (to_char(LARQ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(LARQ,'YYYY')  order by LARQ desc ";
    	HashMap pareMap=new HashMap();
    	pareMap.put("sql1",sql1);
    	//折线1
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
 		
 	
	/*	
		//被诉类案件的付款金额总值
 		sql1="select sum(ZXHK) as zxhk,to_char(QSSJ,'YYYY') as qssj from SS_BASEINFO where SSLXMC= '起诉' and substr(SFID,0,3)='"+address 
 		+"' and (to_char(QSSJ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(QSSJ,'YYYY')  order by LARQ desc ";
 		HashMap pareMap2=new HashMap();
 		pareMap2.put("sql1",sql1);
    	//折线1
    	list =chartUCC.queryDataList(pareMap2);
      	double zxhk=0;
      	HashMap susongMap=null;
 		if(list!=null){
 		for(int i=0;i<list.size();i++){
 			susongMap=(HashMap)list.get(i);
 			BigDecimal big = (BigDecimal)susongMap.get("zxhk");
 			String qssj = (String)susongMap.get("qssj");
 			if(big != null){
 				zxhk = big.doubleValue();
 			}
 			 dataset.addValue(zxhk, series2,qssj);  	 
 		  }
 		}  */
 		
 		
 		
 		//起诉类案件的执行回款总值
 		sql1="select sum(ZXHK)/10000 as zxhk,to_char(QSSJ,'YYYY') as qssj from SS_BASEINFO where SSLXMC= '起诉' and substr(SFID,0,3)='"+address 
 		+"' and (to_char(QSSJ,'YYYY')  between '" + startYear +"' and '"+ currYear +"') group by to_char(QSSJ,'YYYY')  order by QSSJ desc ";
 		HashMap pareMap2=new HashMap();
 		pareMap2.put("sql1",sql1);
    	//折线1
    	list =chartUCC.queryDataList(pareMap2);
      	double zxhk=0;
      	HashMap susongMap=null;
 		if(list!=null){
 		for(int i=0;i<list.size();i++){
 			susongMap=(HashMap)list.get(i);
 			BigDecimal big = (BigDecimal)susongMap.get("zxhk");
 			String qssj = (String)susongMap.get("qssj");
 			if(big != null){
 				zxhk = big.doubleValue();
 			}
 			 dataset.addValue(zxhk, series2,qssj);  	 
 		  }
 		}  
        return dataset;  

    }  
    
    /**       
     ** 按月统计   
     ** @return XYDataset对象       
     */ 
    public static CategoryDataset createDatasetByMonth() {
    	
        DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
      
        
    	java.sql.Date date = new java.sql.Date(new java.util.Date().getTime());
		int currYear=0;
		/*if(currYear==0){
			currYear=date.getYear()+1900;//当前年度
		}else{
			currYear=2007;
		}*/
		currYear=2007;
		//按当前年度统计或者根据查询条件统计某一年的
    	for (int i = 1; i <=12; i++) {    
    		//根据年、省查询委托贷款余额
    		String address="370";
    		HashMap pareMap=new HashMap();
    		pareMap.put("month",i);
    		pareMap.put("currYear",currYear);
    		pareMap.put("address",address);
         /*   double value=chartUCC.queryWtdkDataByMonth(pareMap);
    		 dataset.addValue(value, "",String.valueOf(i)); */
    		}         
         return dataset;   
    	
    	}  
    
    /**       
     ** 实体日常管理费用按月、省统计
     ** @return XYDataset对象       
     */ 
    public static CategoryDataset createRcglDatasetByMonth() {
    	
        DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
    	Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);//获得当前年
    	String address="110";
    	String sql1="select sum(SJFY)/10000 as sjfy ,to_char(NGRQ,'MM')  as sjfyMonth  from ST_JBXX left join ST_HEAD on ST_JBXX.ID = ST_HEAD.ST_ID  left join ST_GLBT on ST_JBXX.id=ST_GLBT.ST_ID where ST_GLBT.SPZT='2' and  substr(C_SHENGFEN, 0, 3) = '"+address+"'" +
    	"and   to_char(NGRQ,'YYYY')='" +currYear 
    	+"'group by to_char(NGRQ,'YYYY'), to_char(NGRQ,'MM')";
    	//按当前年度统计某省各月的实体日常费用
    	HashMap pareMap=new HashMap();
    	pareMap.put("sql1",sql1);
        //    double value=chartUCC.queryRcglDataByMonth(pareMap);
        List list =chartUCC.queryDataList(pareMap);
     	double sjfy=0;
     	HashMap map2=null;
		if(list!=null){
		for(int i=0;i<list.size();i++){
			map2=(HashMap)list.get(i);
			BigDecimal big = (BigDecimal)map2.get("sjfy");
			String month = (String)map2.get("sjfyMonth");
			if(big != null){
				sjfy = big.doubleValue();
			}
	         dataset.addValue(sjfy, "",month); 		 
		  }
		}  

    		//}         
         return dataset;   
    	
    	}  
    
    /**       
     ** 实体日常管理费用按年、省统计
     ** @return XYDataset对象       
     */ 
    public static CategoryDataset createRcglDatasetByYear() {
    	
        DefaultCategoryDataset dataset = new DefaultCategoryDataset(); 
        Calendar c = Calendar.getInstance();
    	int currYear = c.get(Calendar.YEAR);//当前年度
		int startYear=currYear-5;//前5年是哪一年
		String address="110";
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
    		         dataset.addValue(sjfy, "",tjYear); 		 
    			  }
    			}  
    	      return dataset;   
    	}  
    
    	

    // time 时序图 
    private  TimeSeriesCollection getDataSetTimeSeries() { 
        TimeSeries s1 = new TimeSeries("L&G European Index Trust", Month.class); 
        s1.add(new Month(2, 2001), 181.8); 
        s1.add(new Month(3, 2001), 167.3); 
        s1.add(new Month(4, 2001), 153.8); 
        s1.add(new Month(5, 2001), 167.6); 
        s1.add(new Month(6, 2001), 158.8); 
        s1.add(new Month(7, 2001), 148.3); 
        s1.add(new Month(8, 2001), 153.9); 
        s1.add(new Month(9, 2001), 142.7); 
        s1.add(new Month(10, 2001), 123.2); 
        s1.add(new Month(11, 2001), 131.8); 
        s1.add(new Month(12, 2001), 139.6); 
        s1.add(new Month(1, 2002), 142.9); 
        s1.add(new Month(2, 2002), 138.7); 
        s1.add(new Month(3, 2002), 137.3); 
        s1.add(new Month(4, 2002), 143.9); 
        s1.add(new Month(5, 2002), 139.8); 
        s1.add(new Month(6, 2002), 137.0); 
        s1.add(new Month(7, 2002), 132.8); 
        TimeSeries s2 = new TimeSeries("L&G UK Index Trust", Month.class); 
        s2.add(new Month(2, 2001), 129.6); 
        s2.add(new Month(3, 2001), 123.2); 
        s2.add(new Month(4, 2001), 117.2); 
        s2.add(new Month(5, 2001), 124.1); 
        s2.add(new Month(6, 2001), 122.6); 
        s2.add(new Month(7, 2001), 119.2); 
        s2.add(new Month(8, 2001), 116.5); 
        s2.add(new Month(9, 2001), 112.7); 
        s2.add(new Month(10, 2001), 101.5); 
        s2.add(new Month(11, 2001), 106.1); 
        s2.add(new Month(12, 2001), 110.3); 
        s2.add(new Month(1, 2002), 111.7); 
        s2.add(new Month(2, 2002), 111.0); 
        s2.add(new Month(3, 2002), 109.6); 
        s2.add(new Month(4, 2002), 113.2); 
        s2.add(new Month(5, 2002), 111.6); 
        s2.add(new Month(6, 2002), 108.8); 
        s2.add(new Month(7, 2002), 101.6); 

        TimeSeriesCollection dataset = new TimeSeriesCollection(); 
        dataset.addSeries(s1); 
        dataset.addSeries(s2); 
        return dataset; 
    } 
    
    
    /**
     * 饼状图公共方法
     */
    private  void genPie3DPub(DefaultPieDataset dataset,HashMap paramMap) { 
    	String title=(String)paramMap.get("title");
        JFreeChart chart = ChartFactory.createPieChart3D(title,  // 图表标题 
        		dataset,  
                true, // 是否显示图例 
                false, 
                false 
        ); 
         PiePlot3D localPiePlot3D1 = (PiePlot3D)chart.getPlot();
        localPiePlot3D1.setStartAngle(120D);
        localPiePlot3D1.setBaseSectionOutlinePaint(new Color(255, 255, 255)); 
    /*    localPiePlot3D1.setSectionPaint("经营性固定资产"+ybyzCount, new Color(254, 222, 107));
        localPiePlot3D1.setSectionPaint("委托贷款"+wtdkCount, new Color(239, 192, 229));
        localPiePlot3D1.setSectionPaint("债券"+zjCount, new Color(4, 195, 136));
        localPiePlot3D1.setSectionPaint("债权"+zqCount, new Color(207, 235, 81));*/
        localPiePlot3D1.setForegroundAlpha(0.6F);
        localPiePlot3D1.setCircular(true);
        localPiePlot3D1.setInteriorGap(0.04D);
        localPiePlot3D1.setMaximumLabelWidth(0.2D);
        
        ChartFrame frame = new ChartFrame(title, chart); 
        frame.pack(); 
        frame.setVisible(true); 
    }
    
    /**
     * 柱状图公共方法
     */
    private  void genPubCategory(CategoryDataset dataset,HashMap paramMap){
    	String title=(String)paramMap.get("title");
    	String xValue=(String)paramMap.get("xValue");
    	String yValue=(String)paramMap.get("yValue");
    	JFreeChart chart = ChartFactory.createBarChart3D(
    			title, // 图表标题 
    			xValue, // 目录轴的显示标签 
    			yValue, // 数值轴的显示标签 
                dataset, // 数据集 
                PlotOrientation.VERTICAL, // 图表方向：水平、垂直 
                true,   // 是否显示图例(对于简单的柱状图必须是false) 
                false,  // 是否生成工具 
                false   // 是否生成URL链接 
        ); 
        chart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING,RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);
        ChartFrame frame = new ChartFrame(title, chart); 
        frame.pack(); 
        frame.setVisible(true); 
    } 
    
    
    /**
     * 折线图 公共方法
     */
    private  void genLinePub(CategoryDataset dataset,HashMap paramMap) { 
    	String title=(String)paramMap.get("title");
    	String xValue=(String)paramMap.get("xValue");
     	String yValue=(String)paramMap.get("yValue");
        JFreeChart chart = ChartFactory.createLineChart( 
        		title, // chart title 
        		xValue, // domain axis label 
        		yValue, // range axis label 
                dataset, // data 
                PlotOrientation.VERTICAL, // orientation 
                true, // include legend 
                true, // tooltips 
                false // urls 
        ); 
        ChartFrame frame = new ChartFrame(title, chart); 
        frame.pack(); 
        frame.setVisible(true); 
        
        
    }
    
    
    

}
