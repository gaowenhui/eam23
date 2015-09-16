package com.tansun.eam2.stgl;

public interface StglCommon {
	//实体分类 0：咨询类实体   1：非咨询处置类实体    10：外部实体   3：非咨询持续经营类实体
	String ST_TYPE_ZIXUN = "0"; //咨询类
	String ST_TYPE_FEIZIXUN_CHUZHI = "1";//非咨询处置类
	String ST_TYPE_WAIBU = "10";        //外部实体
	String ST_TYPE_FEIZIXUN_FEICHIXU = "3";     //非咨询持续经营类实体
	
	//实体信息类
	String ST_INFO_JIBEN = "0";//基本信息
	String ST_INFO_RENYUAN = "1";//人员信息
	String ST_INFO_WEIJIAN = "2";//文件及公章存放情况
	String ST_INFO_ZICHAN = "3";//实体资产情况
	String ST_INFO_ZAIWU = "4";//实体债务债权情况
	String ST_INFO_SUSONG = "5";//实体诉讼信息
	String ST_INFO_RIZHI = "6";//实体日志信息
	String ST_INFO_LIUCHENG = "7";//实体流程信息
	String ST_INFO_CHUZHI = "8";//实体处置信息
	String ST_INFO_GAOGUAN = "9";//高管人员
	String ST_INFO_GUQUAN = "10";//实体股权结构
	String ST_INFO_GREATAFFAIR = "11";//实体大事记
	String ST_INFO_REPORTFORM = "12";//实体财务报表信息
	String ST_INFO_FEIYONG = "13";//实体相关处理流程所产生的费用
	String ST_INFO_FUJIAN = "14";//实体相关附件
	
	//弹出页面
	//pop  1:实体人员信息列表   2：高管人员信息  3：实体股权结构  4：实体大事记 
	// 5:实体财务报表  6：(实体资产)金额  7：(实体资产)土地 8：(实体资产)房屋
	// 9：(实体资产)机械设备  10：交通运输 11：对外投资 12 ：其他资产
	//13:项目企业出资情况   14:知情人员 15:安置人员  16:文件及公章存放情况
	//17:债务债权--主要债权  18:债务债权--主要债务  19:实体资产--税款缴纳
	
	
	String ST_INFO_SHITIRENYUAN = "1";    //1:实体人员信息列表
	String ST_INFO_GAOGUANRENYUAN = "2";  //2：高管人员信息
	String ST_INFO_SHITIGUQUAN = "3";	  //3：实体股权结构
	String ST_INFO_SHITIDASHIJI = "4";	  //4：实体大事记
	String ST_INFO_CAIWUBAOBIAO = "5";	  //5:实体财务报表
	String ST_INFO_JINE = "6";	  		  //6：(实体资产)金额
	String ST_INFO_TUDI = "7";			  //7：(实体资产)土地
	String ST_INFO_FANGWU = "8";		  //8：(实体资产)房屋
	String ST_INFO_JIXIESHEBE = "9";	  //9：(实体资产)机械设备
	String ST_INFO_JIAOTONGYUNSHU = "10"; //10：交通运输
	String ST_INFO_DUIWAITOUZI = "11";    //11：对外投资
	String ST_INFO_QITAZICHAN = "12";	  //12：其他资产
	String ST_INFO_XIANGMUCHUZI = "13";	  //13:项目企业出资情况
	String ST_INFO_ZHIQINGRENYUAN = "14"; //14:知情人员 
	String ST_INFO_ANZHIRENYUAN = "15";	  //15:安置人员  
	String ST_INFO_WENJIANCUNFANG = "16"; //16:文件及公章存放情况
	String ST_INFO_ZHUYAOZHAIQUAN = "17"; //17:债务债权--主要债权
	String ST_INFO_ZHUYAOZHAIWU = "18";	  //18:债务债权--主要债务
	String ST_INFO_RUIKUANJIAONA = "19";  //19:实体资产--税款缴纳
	
	
	//实体处理单类型
	String ST_LCMC_CLDLX_ZENGJIANZI = "0";//增资减资
	String ST_LCMC_CLDLX_YONGGONGJIHUA = "1";//用工计划
	String ST_LCMC_CLDLX_FARENDAIBIAO = "2";//法人代表变更
	String ST_LCMC_CLDLX_CAIWUSHIXIANG = "3";//重大财务事项审批
	String ST_LCMC_CLDLX_QUEQUAN = "4";//确权审批
	String ST_LCMC_CLDLX_QITASHIXIANG = "5";//其他事项审批
	String ST_LCMC_CLDLX_SHITIGAIZHI = "6";//实体改制
	
	//实体处理单状态
	String ST_SPZT_WTJ= "0";//未提交
	String ST_SPZT_SPZ= "1";//审批中
	String ST_SPZT_YSP= "2";//已审批
	
	//业务类型
	String ST_YWLX_ZENGZI="0";//增资
	String ST_YWLX_JIANZI="1";//减资
	
	//实体性质
	String ST_XINGZHI_FEISHANGSHI="0";//非上市实体
	String ST_XINGZHI_SHANGSHI="上市";//上市实体
	
	//实体人员职务
	String ST_ZHIWU_ZONGJINGLI="0";//总经理
	String ST_ZHIWU_FUZONGJINGLI="1";//副总经理
	
	//确权方式
	String ST_QUEQUAN_XIEYIZHUANRANG="0";//协议转让
	String ST_QUEQUAN_GUQUANBIANGENG="1";//股权变更
	
	//存放内容
	String ST_CUNFANGNEIRONG_WENJIAN="0";//文件
	String ST_CUNFANGNEIRONG_GONGZHANG="1";//公章
	String ST_CUNFANGNEIRONG_QUANZHENG="2";//权证
	String ST_CUNFANGNEIRONG_ZHAIQUANZHAIWU="3";//债券债务
	
	// 0：未安置1：安置审批中2：安置执行中 3:已安置
	String ST_RENYUANANZHI_WEIANZHI = "0";
	String ST_RENYUANANZHI_SHENPIZHONG = "1";
	String ST_RENYUANANZHI_ZIXINGZHONG = "2";
	String ST_RENYUANANZHI_YIANZHI = "3";
	
	//1：未处置2：处置审批中3：处置执行中 4:已处置 
	String ST_CZZT_WEICHUZHI = "1";
	String ST_CZZT_CHUZHISHENPIZHONG = "2";
	String ST_CZZT_CHUZHIZHIXINGZHONG = "3";
	String ST_CZZT_YICHUZHI = "4";
}
