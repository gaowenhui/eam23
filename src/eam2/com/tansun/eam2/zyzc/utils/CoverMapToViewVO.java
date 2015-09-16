package com.tansun.eam2.zyzc.utils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.tansun.eam2.zyzc.vo.ViewVO;

public class CoverMapToViewVO {
	public static ViewVO obtainViewVOFromMap(Map map){
		ViewVO vv = new ViewVO();
		vv.setZcId   (map.get("ZC_ID") !=null?(String)map.get("ZC_ID"):null);
		vv.setYjflbm (map.get("YJFLBM")!=null?(String)map.get("YJFLBM"):null);
		vv.setEjflbm (map.get("EJFLBM")!=null?(String)map.get("EJFLBM"):null); 
		vv.setSjflbm (map.get("SJFLBM")!=null?(String)map.get("SJFLBM"):null); 
		vv.setYjflmc (map.get("YJFLMC")!=null?(String)map.get("YJFLMC"):null); 
		vv.setEjflmc (map.get("EJFLMC")!=null?(String)map.get("EJFLMC"):null); 
		vv.setSjflmc (map.get("SJFLMC")!=null?(String)map.get("SJFLMC"):null); 
		vv.setZcbh   (map.get("ZCBH")!=null?(String)map.get("ZCBH"):null); 
		vv.setZcmc   (map.get("ZCMC")!=null?(String)map.get("ZCMC"):null); 
		vv.setKpbh   (map.get("KPBH")!=null?(String)map.get("KPBH"):null); 
		vv.setTxmbh  (map.get("TXMBH")!=null?(String)map.get("TXMBH"):null); 
		vv.setXlh    (map.get("XLH")!=null?(String)map.get("XLH"):null); 
		if(map.get("SL")!=null){
			vv.setSl(((BigDecimal)map.get("SL")).intValue()); 
		}
		vv.setJldw   (map.get("JLDW")!=null?(String)map.get("JLDW"):null); 
		vv.setGg     (map.get("GG")!=null?(String)map.get("GG"):null); 
		vv.setZczt   (map.get("ZCZT")!=null?(String)map.get("ZCZT"):null); 
		vv.setYjkcsl (map.get("YJKCSL")!=null?(String)map.get("YJKCSL"):null); 
		vv.setZtwz   (map.get("ZTWZ")!=null?(String)map.get("ZTWZ"):null); 
		vv.setBgdd   (map.get("BGDD")!=null?(String)map.get("BGDD"):null); 
		vv.setKssyrq (map.get("KSSYRQ")!=null?(Date)map.get("KSSYRQ"):null); 
		vv.setFdjbh  (map.get("FDJBH")!=null?(String)map.get("FDJBH"):null); 
		vv.setYlrr   (map.get("YLRR")!=null?(String)map.get("YLRR"):null); 
		vv.setDzyhdj (map.get("DZYHDJ")!=null?((BigDecimal)map.get("DZYHDJ")).doubleValue():null); 
		vv.setDzyhjg (map.get("DZYHJG")!=null?((BigDecimal)map.get("DZYHJG")).doubleValue():null); 
		vv.setCbrq   (map.get("CBRQ")!=null?(Date)map.get("CBRQ"):null); 
		vv.setCpuxh  (map.get("CPUXH ")!=null?(String)map.get("CPUXH"):null); 
		vv.setMemory (map.get("MEMORY")!=null?(String)map.get("MEMORY"):null); 
		vv.setDisk   (map.get("DISK")!=null?(String)map.get("DISK"):null); 
		vv.setNzdisk (map.get("NZDISK")!=null?(String)map.get("NZDISK"):null); 
		vv.setXtxsq  (map.get("XTXSQ")!=null?(String)map.get("XTXSQ"):null); 
		vv.setZjxgsj (map.get("ZJXGSJ")!=null?(Date)map.get("ZJXGSJ"):null); 
		vv.setSszg   (map.get("SSZG")!=null?(String)map.get("SSZG"):null); 
		vv.setZcbz   (map.get("ZCBZ")!=null?(String)map.get("ZCBZ"):null); 
		vv.setZjpdrq (map.get("ZJPDRQ")!=null?(Date)map.get("ZJPDRQ"):null); 
		vv.setRkrq   (map.get("RKRQ")!=null?(Date)map.get("RKRQ"):null); 
		vv.setLybmmc (map.get("LYBMMC")!=null?(String)map.get("LYBMMC"):null); 
		vv.setJybmmc (map.get("JYBMMC")!=null?(String)map.get("JYBMMC"):null); 
		vv.setLyrmc  (map.get("LYRMC")!=null?(String)map.get("LYRMC"):null); 
		vv.setLyrq   (map.get("LYRQ")!=null?(Date)map.get("LYRQ"):null); 
		vv.setRq   	 (map.get("RQ")!=null?(Date)map.get("RQ"):null);
		vv.setJydqrq (map.get("JYDQRQ")!=null?(Date)map.get("JYDQRQ"):null); 
		vv.setDjlx   (map.get("DJLX")!=null?(String)map.get("DJLX"):null); 
		vv.setDjh    (map.get("DJH")!=null?(String)map.get("DJH"):null); 
		vv.setCksl   (map.get("CKSL")!=null?((BigDecimal)map.get("CKSL")).intValue():null); 
		vv.setSfzxjl (map.get("SFZXJL")!=null?((BigDecimal)map.get("SFZXJL")).intValue()+"":null); 
		vv.setGhsj   (map.get("GHSJ")!=null?(Date)map.get("GHSJ"):null); 
		vv.setGhbh   (map.get("GHBH")!=null?(String)map.get("GHBH"):null); 
		vv.setTzzt   (map.get("TZZT")!=null?(String)map.get("TZZT"):null); 
		vv.setSfxj   (map.get("SFXJ")!=null?(String)map.get("SFXJ"):null);
		vv.setWxfy	 (map.get("WXFY")!=null?((BigDecimal)map.get("WXFY")).doubleValue():null);
		vv.setTzbz   (map.get("TZBZ")!=null?(String)map.get("TZBZ"):null); 
		return vv;
	}
}
