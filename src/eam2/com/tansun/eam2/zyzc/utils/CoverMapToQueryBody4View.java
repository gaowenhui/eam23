package com.tansun.eam2.zyzc.utils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.tansun.eam2.zyzc.vo.QueryBody4View;

public class CoverMapToQueryBody4View {
	public static QueryBody4View obatainQueryBody4ViewFromMap(Map map){
		QueryBody4View queryBody4View = new QueryBody4View();
		queryBody4View.setYjflmc(map.get("YJFLMC")!=null?(String)map.get("YJFLMC"):null);
		queryBody4View.setEjflmc(map.get("EJFLMC")!=null?(String)map.get("EJFLMC"):null);
		queryBody4View.setSjflmc(map.get("SJFLMC")!=null?(String)map.get("SJFLMC"):null);
		queryBody4View.setYjflbm(map.get("YJFLBM")!=null?(String)map.get("YJFLBM"):null);
		queryBody4View.setEjflbm(map.get("EJFLBM")!=null?(String)map.get("EJFLBM"):null);
		queryBody4View.setSjflbm(map.get("SJFLBM")!=null?(String)map.get("SJFLBM"):null);
		queryBody4View.setSbodyId(map.get("SBODYID")!=null?(String)map.get("SBODYID"):null);
		queryBody4View.setZcmc(map.get("ZCMC")!=null?(String)map.get("ZCMC"):null);
		queryBody4View.setGg(map.get("GG")!=null?(String)map.get("GG"):null);
		queryBody4View.setKcsl(map.get("KCSL")!=null?(String)map.get("KCSL"):null);
		queryBody4View.setZcbh(map.get("ZCBH")!=null?(String)map.get("ZCBH"):null);
		queryBody4View.setZczt(map.get("ZCZT")!=null?(String)map.get("ZCZT"):null);
		queryBody4View.setKssyrq(map.get("KSSYRQ")!=null?(Date)map.get("KSSYRQ"):null);
		queryBody4View.setSfsckp(map.get("SFSCKP")!=null?(String)map.get("SFSCKP"):null);
		queryBody4View.setJldw(map.get("JLDW")!=null?(String)map.get("JLDW"):null);
		queryBody4View.setDj((map.get("DZYHDJ") != null)?((BigDecimal)map.get("DZYHDJ")).doubleValue():null);
		queryBody4View.setJe((map.get("DZYHJG") != null)?((BigDecimal)map.get("DZYHJG")).doubleValue():null);
		if(map.get("SL") != null){
			queryBody4View.setSl(((BigDecimal)map.get("SL")).intValue());
		}
		queryBody4View.setZcId(map.get("ZC_ID")!=null?(String)map.get("ZC_ID"):null);
		queryBody4View.setJydqrq(map.get("JYDQRQ")!=null?(Date)map.get("JYDQRQ"):null);
		queryBody4View.setLyrmc(map.get("LYRMC")!=null?(String)map.get("LYRMC"):null);
		queryBody4View.setBz(map.get("BZ")!=null?(String)map.get("BZ"):null);
		queryBody4View.setLybmmc(map.get("LYBMMC")!=null?(String)map.get("LYBMMC"):null);
		queryBody4View.setJybmmc(map.get("JYBMMC")!=null?(String)map.get("JYBMMC"):null);
		queryBody4View.setBgdd(map.get("BGDD")!=null?(String)map.get("BGDD"):null);
		queryBody4View.setGys(map.get("GYS")!=null?(String)map.get("GYS"):null);
		queryBody4View.setBxjg(map.get("BXJG")!=null?(String)map.get("BXJG"):null);
		queryBody4View.setBxfws(map.get("BXFWS")!=null?(String)map.get("BXFWS"):null);
		queryBody4View.setCbrq(map.get("CBRQ")!=null?(String)map.get("CBRQ"):null);
		queryBody4View.setPdjg(map.get("PDJG")!=null?(String)map.get("PDJG"):null);
		queryBody4View.setXxbrq(map.get("XXBRQ")!=null?(Date)map.get("XXBRQ"):null);
		if(map.get("YJKCSL") != null){
			queryBody4View.setYjkcsl(((BigDecimal)map.get("YJKCSL")).intValue());
		}
		queryBody4View.setCzyz(map.get("CZYZ")!=null?((BigDecimal)map.get("CZYZ")).doubleValue():null);
		queryBody4View.setLyrq(map.get("LYRQ")!=null?(Date)map.get("LYRQ"):null);
		return queryBody4View;
	}
	
}
