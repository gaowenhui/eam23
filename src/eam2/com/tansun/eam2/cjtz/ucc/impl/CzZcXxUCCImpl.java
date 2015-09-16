package com.tansun.eam2.cjtz.ucc.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICzZcXxService;
import com.tansun.eam2.cjtz.ucc.ICzZcXxUCC;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.jygdzc.service.IAssetBS;

@Service
public class CzZcXxUCCImpl implements ICzZcXxUCC {

	private ICzZcXxService czZcXxService;
	@Autowired
	private IAssetBS assetBS;
	@Autowired
	public void setCzZcXxService(ICzZcXxService czZcXxService) {
		this.czZcXxService = czZcXxService;
	}

	public List<CzZcXx> getCzZcXxListByCzCztzfaXxId(String czCztzfaXxId) {
		return czZcXxService.getListByCzCztzfaXxId(czCztzfaXxId);
	}

	public String getEjfhListByJbhKeys(String jbhKeys){
		if(StringUtils.isNotEmpty(jbhKeys)){
			List<Map<String, Object>> ejfhList = new ArrayList<Map<String, Object>>();
			for(String jbhKey : jbhKeys.split(",")){
				List<Map<String,Object>> list = czZcXxService.getEjfhListByJbhKey(jbhKey);
				ejfhList.addAll(list);
			}
			return JSONArray.fromObject(ejfhList).toString();
		}
		return "";
	}
	
	public Map<String, String> getJbhMap(){
		Map<String, String> jbhMap = new LinkedHashMap<String, String>();
		jbhMap.put("","--请选择--");
		jbhMap.put("011","中国建设银行营业部");
		jbhMap.put("110","北京市");
		jbhMap.put("120","天津市");
		jbhMap.put("130","河北省");
		jbhMap.put("140","山西省");
		jbhMap.put("150","内蒙古省");
		jbhMap.put("210,212","辽宁省");
		jbhMap.put("220","吉林省");
		jbhMap.put("230","黑龙江省");
		jbhMap.put("300","受托实体");
		jbhMap.put("310","上海市");
		jbhMap.put("320,322","江苏省");
		jbhMap.put("330,331","浙江省");
		jbhMap.put("340","安徽省");
		jbhMap.put("350,351","福建省");
		jbhMap.put("360","江西省");
		jbhMap.put("370,371","山东省");
		jbhMap.put("410","河南省");
		jbhMap.put("420,422","湖北省");
		jbhMap.put("430","湖南省");
		jbhMap.put("440,442","广东省");
		jbhMap.put("450","广西区");
		jbhMap.put("460","海南省");
		jbhMap.put("500","重庆市");
		jbhMap.put("510","四川省");
		jbhMap.put("520","贵州省");
		jbhMap.put("530","云南省");
		jbhMap.put("540","西藏自治区");
		jbhMap.put("610","陕西省");
		return jbhMap;
	}

	public String getCzZcXxJsonByZcId(String azcid) {
		CzZcXx czZcXx = new CzZcXx();
		JyzcXx asset = (JyzcXx)assetBS.findById(JyzcXx.class, azcid);
//		Cardinfo card = cardBS.findById(Cardinfo.class, asset.get)
//		czZcXx
		return null;
	}
}
