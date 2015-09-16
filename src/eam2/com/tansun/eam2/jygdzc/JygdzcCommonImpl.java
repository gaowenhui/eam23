package com.tansun.eam2.jygdzc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.tansun.eam2.jygdzc.vo.JBHCommonVO;
@Service
public class JygdzcCommonImpl implements JygdzcCommon {

	public List getFenhangTypeList(){
		
	    List<JBHCommonVO> fenhangList = new ArrayList<JBHCommonVO>();
	    fenhangList.add(new JBHCommonVO("",""));
	    fenhangList.add(new JBHCommonVO("011,010","中国建设银行营业部")); //010 Added by liubeibei.
	    fenhangList.add(new JBHCommonVO("110","北京市"));
	    fenhangList.add(new JBHCommonVO("120","天津市"));
	    fenhangList.add(new JBHCommonVO("130","河北省"));
	    fenhangList.add(new JBHCommonVO("140","山西省"));
	    fenhangList.add(new JBHCommonVO("150","内蒙古省"));
	    fenhangList.add(new JBHCommonVO("210,212","辽宁省"));
	    fenhangList.add(new JBHCommonVO("220","吉林省"));
	    fenhangList.add(new JBHCommonVO("230","黑龙江省"));
	    fenhangList.add(new JBHCommonVO("300,3","受托实体"));
	    fenhangList.add(new JBHCommonVO("310","上海市"));
	    fenhangList.add(new JBHCommonVO("320,322","江苏省"));
	    fenhangList.add(new JBHCommonVO("330,331","浙江省"));
	    fenhangList.add(new JBHCommonVO("340","安徽省"));
	    fenhangList.add(new JBHCommonVO("350,351","福建省"));
	    fenhangList.add(new JBHCommonVO("360","江西省"));
	    fenhangList.add(new JBHCommonVO("370,371","山东省"));
	    fenhangList.add(new JBHCommonVO("410","河南省"));
	    fenhangList.add(new JBHCommonVO("420,422","湖北省"));
	    fenhangList.add(new JBHCommonVO("430","湖南省"));
	    fenhangList.add(new JBHCommonVO("440,442","广东省"));
	    fenhangList.add(new JBHCommonVO("450","广西区"));
	    fenhangList.add(new JBHCommonVO("460","海南省"));
	    fenhangList.add(new JBHCommonVO("500,511","重庆市"));  //511 Added by liubeibei.
	    fenhangList.add(new JBHCommonVO("510","四川省"));
	    fenhangList.add(new JBHCommonVO("520","贵州省"));
	    fenhangList.add(new JBHCommonVO("530","云南省"));
	    fenhangList.add(new JBHCommonVO("540","西藏自治区"));
	    fenhangList.add(new JBHCommonVO("610","陕西省"));
	    fenhangList.add(new JBHCommonVO("620","甘肃省"));
	    fenhangList.add(new JBHCommonVO("630","青海省"));
	    fenhangList.add(new JBHCommonVO("640","宁夏自治区"));
	    fenhangList.add(new JBHCommonVO("650","新疆自治区"));
	   
		return fenhangList;
	}
}
