package com.tansun.eam2.zyzc.utils;

import java.math.BigDecimal;
import java.util.Date;
import java.util.Map;

import com.tansun.eam2.common.model.orm.bo.ZySbody;

public class CopyOfCoverMapToBody4ReBorrow {
	public static ZySbody obtainZySbodyFromMap(Map map){
		ZySbody body = new ZySbody();
		body.setZcId   (map.get("ZC_ID") !=null?(String)map.get("ZC_ID"):null);
		body.setYjflbm (map.get("YJFLBM")!=null?(String)map.get("YJFLBM"):null);
		body.setEjflbm (map.get("EJFLBM")!=null?(String)map.get("EJFLBM"):null); 
		body.setSjflbm (map.get("SJFLBM")!=null?(String)map.get("SJFLBM"):null); 
		body.setYjflmc (map.get("YJFLMC")!=null?(String)map.get("YJFLMC"):null); 
		body.setEjflmc (map.get("EJFLMC")!=null?(String)map.get("EJFLMC"):null); 
		body.setSjflmc (map.get("SJFLMC")!=null?(String)map.get("SJFLMC"):null); 
		body.setZcbh   (map.get("ZCBH")!=null?(String)map.get("ZCBH"):null); 
		body.setZcmc   (map.get("ZCMC")!=null?(String)map.get("ZCMC"):null); 
		body.setTxmbh  (map.get("TXMBH")!=null?(String)map.get("TXMBH"):null); 
		body.setXlh    (map.get("XLH")!=null?(String)map.get("XLH"):null); 
		if(map.get("SL")!=null){
			body.setSl(((BigDecimal)map.get("SL")).doubleValue()); 
		}
		body.setJldw   (map.get("JLDW")!=null?(String)map.get("JLDW"):null); 
		body.setGg     (map.get("GG")!=null?(String)map.get("GG"):null); 
		body.setZczt   (map.get("ZCZT")!=null?(String)map.get("ZCZT"):null); 
		body.setFdjbh  (map.get("FDJBH")!=null?(String)map.get("FDJBH"):null); 
		body.setCbrq   (map.get("CBRQ")!=null?(Date)map.get("CBRQ"):null); 
		body.setCpuxh  (map.get("CPUXH ")!=null?(String)map.get("CPUXH"):null); 
		body.setMemory (map.get("MEMORY")!=null?(String)map.get("MEMORY"):null); 
		body.setDisk   (map.get("DISK")!=null?(String)map.get("DISK"):null); 
		body.setNzdisk (map.get("NZDISK")!=null?(String)map.get("NZDISK"):null); 
		body.setXtxsq  (map.get("XTXSQ")!=null?(String)map.get("XTXSQ"):null); 
		body.setSszg   (map.get("SSZG")!=null?(String)map.get("SSZG"):null); 
		if(map.get("JYBMMC")!=null){
			body.setSqbmmc((String)map.get("JYBMMC"));
		}else{
			body.setSqbmmc((String)map.get("LYBMMC"));
		}
		
		if(map.get("JYBMBM")!=null){
			body.setSqbmid((String)map.get("JYBMBM"));
		}else{
			body.setSqbmid((String)map.get("LYBMBM"));
		}
		body.setSqrid  (map.get("LYRBH")!=null?(String)map.get("LYRBH"):null);
		body.setSqrmc  (map.get("LYRMC")!=null?(String)map.get("LYRMC"):null); 
//		body.setJylyrq (map.get("LYRQ")!=null?(Date)map.get("LYRQ"):null); 
		body.setJylyrq (map.get("JYDQRQ")!=null?(Date)map.get("JYDQRQ"):null); 
		body.setWxfy   (map.get("WXFY")!=null?(Double)map.get("WXFY"):null);
		return body;
	}
}
