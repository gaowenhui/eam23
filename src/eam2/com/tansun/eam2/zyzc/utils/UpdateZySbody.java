package com.tansun.eam2.zyzc.utils;

import com.tansun.eam2.common.model.orm.bo.ZySbody;

public class UpdateZySbody {
	public static ZySbody obtainUpdateBody(ZySbody body,ZySbody bodyFromTable){
		bodyFromTable.setSbodyId     (body.getSbodyId    ()!=null?body.getSbodyId    ():(bodyFromTable.getSbodyId    ()!=null?bodyFromTable.getSbodyId    ():null));
		bodyFromTable.setSheadId     (body.getSheadId    ()!=null?body.getSheadId    ():(bodyFromTable.getSheadId    ()!=null?bodyFromTable.getSheadId    ():null));
		bodyFromTable.setYjflbm      (body.getYjflbm     ()!=null?body.getYjflbm     ():(bodyFromTable.getYjflbm     ()!=null?bodyFromTable.getYjflbm     ():null));
		bodyFromTable.setEjflbm      (body.getEjflbm     ()!=null?body.getEjflbm     ():(bodyFromTable.getEjflbm     ()!=null?bodyFromTable.getEjflbm     ():null));
		bodyFromTable.setSjflbm      (body.getSjflbm     ()!=null?body.getSjflbm     ():(bodyFromTable.getSjflbm     ()!=null?bodyFromTable.getSjflbm     ():null));
		bodyFromTable.setYjflmc      (body.getYjflmc     ()!=null?body.getYjflmc     ():(bodyFromTable.getYjflmc     ()!=null?bodyFromTable.getYjflmc     ():null));
		bodyFromTable.setEjflmc      (body.getEjflmc     ()!=null?body.getEjflmc     ():(bodyFromTable.getEjflmc     ()!=null?bodyFromTable.getEjflmc     ():null));
		bodyFromTable.setSjflmc      (body.getSjflmc     ()!=null?body.getSjflmc     ():(bodyFromTable.getSjflmc     ()!=null?bodyFromTable.getSjflmc     ():null));
		bodyFromTable.setZcId        (body.getZcId       ()!=null?body.getZcId       ():(bodyFromTable.getZcId       ()!=null?bodyFromTable.getZcId       ():null));
		bodyFromTable.setZcbh        (body.getZcbh       ()!=null?body.getZcbh       ():(bodyFromTable.getZcbh       ()!=null?bodyFromTable.getZcbh       ():null));
		bodyFromTable.setZcmc        (body.getZcmc       ()!=null?body.getZcmc       ():(bodyFromTable.getZcmc       ()!=null?bodyFromTable.getZcmc       ():null));
		bodyFromTable.setGg          (body.getGg         ()!=null?body.getGg         ():(bodyFromTable.getGg         ()!=null?bodyFromTable.getGg         ():null));
		bodyFromTable.setSl          (body.getSl         ()!=null?body.getSl         ():(bodyFromTable.getSl         ()!=null?bodyFromTable.getSl         ():null));
		bodyFromTable.setJldw        (body.getJldw       ()!=null?body.getJldw       ():(bodyFromTable.getJldw       ()!=null?bodyFromTable.getJldw       ():null));
		bodyFromTable.setDj          (body.getDj         ()!=null?body.getDj         ():(bodyFromTable.getDj         ()!=null?bodyFromTable.getDj         ():null));
		bodyFromTable.setJe          (body.getJe         ()!=null?body.getJe         ():(bodyFromTable.getJe         ()!=null?bodyFromTable.getJe         ():null));
		bodyFromTable.setGys         (body.getGys        ()!=null?body.getGys        ():(bodyFromTable.getGys        ()!=null?bodyFromTable.getGys        ():null));
		bodyFromTable.setCbrq        (body.getCbrq       ()!=null?body.getCbrq       ():(bodyFromTable.getCbrq       ()!=null?bodyFromTable.getCbrq       ():null));
		bodyFromTable.setBxjg        (body.getBxjg       ()!=null?body.getBxjg       ():(bodyFromTable.getBxjg       ()!=null?bodyFromTable.getBxjg       ():null));
		bodyFromTable.setJyts        (body.getJyts       ()!=null?body.getJyts       ():(bodyFromTable.getJyts       ()!=null?bodyFromTable.getJyts       ():null));
		bodyFromTable.setWrksl       (body.getSl		 ()!=null?body.getSl().longValue():(bodyFromTable.getSl()!=null?bodyFromTable.getSl().longValue():0));
		bodyFromTable.setBz1         (body.getBz1        ()!=null?body.getBz1        ():(bodyFromTable.getBz1        ()!=null?bodyFromTable.getBz1        ():null));
		bodyFromTable.setBxfws       (body.getBxfws      ()!=null?body.getBxfws      ():(bodyFromTable.getBxfws      ()!=null?bodyFromTable.getBxfws      ():null));
		bodyFromTable.setXxbrq       (body.getXxbrq      ()!=null?body.getXxbrq      ():(bodyFromTable.getXxbrq      ()!=null?bodyFromTable.getXxbrq      ():null));
		bodyFromTable.setBz2         (body.getBz2        ()!=null?body.getBz2        ():(bodyFromTable.getBz2        ()!=null?bodyFromTable.getBz2        ():null));
		bodyFromTable.setFybh        (body.getFybh       ()!=null?body.getFybh       ():(bodyFromTable.getFybh       ()!=null?bodyFromTable.getFybh       ():null));
		bodyFromTable.setSqfy        (body.getSqfy       ()!=null?body.getSqfy       ():(bodyFromTable.getSqfy       ()!=null?bodyFromTable.getSqfy       ():null));
		bodyFromTable.setSpje        (body.getSpje       ()!=null?body.getSpje       ():(bodyFromTable.getSpje       ()!=null?bodyFromTable.getSpje       ():null));
		bodyFromTable.setYbxje       (body.getYbxje      ()!=null?body.getYbxje      ():(bodyFromTable.getYbxje      ()!=null?bodyFromTable.getYbxje      ():null));
		bodyFromTable.setBz3         (body.getBz3        ()!=null?body.getBz3        ():(bodyFromTable.getBz3        ()!=null?bodyFromTable.getBz3        ():null));
		bodyFromTable.setCgrq        (body.getCgrq       ()!=null?body.getCgrq       ():(bodyFromTable.getCgrq       ()!=null?bodyFromTable.getCgrq       ():null));
		bodyFromTable.setCgdbodyid   (body.getCgdbodyid  ()!=null?body.getCgdbodyid  ():(bodyFromTable.getCgdbodyid  ()!=null?bodyFromTable.getCgdbodyid  ():null));
		bodyFromTable.setGrsqdbodyid (body.getGrsqdbodyid()!=null?body.getGrsqdbodyid():(bodyFromTable.getGrsqdbodyid()!=null?bodyFromTable.getGrsqdbodyid():null));
		bodyFromTable.setSqrid       (body.getSqrid      ()!=null?body.getSqrid      ():(bodyFromTable.getSqrid      ()!=null?bodyFromTable.getSqrid      ():null));
		bodyFromTable.setSqrmc       (body.getSqrmc      ()!=null?body.getSqrmc      ():(bodyFromTable.getSqrmc      ()!=null?bodyFromTable.getSqrmc      ():null));
		bodyFromTable.setSqbmid      (body.getSqbmid      ()!=null?body.getSqbmid      ():(bodyFromTable.getSqbmid      ()!=null?bodyFromTable.getSqbmid      ():null));
		bodyFromTable.setSqbmmc      (body.getSqbmmc      ()!=null?body.getSqbmmc      ():(bodyFromTable.getSqbmmc      ()!=null?bodyFromTable.getSqbmmc      ():null));
		bodyFromTable.setPdpc        (body.getPdpc       ()!=null?body.getPdpc       ():(bodyFromTable.getPdpc       ()!=null?bodyFromTable.getPdpc       ():null));
		bodyFromTable.setZczt        (body.getZczt       ()!=null?body.getZczt       ():(bodyFromTable.getZczt       ()!=null?bodyFromTable.getZczt       ():null));
		bodyFromTable.setJylyrq      (body.getJylyrq     ()!=null?body.getJylyrq     ():(bodyFromTable.getJylyrq     ()!=null?bodyFromTable.getJylyrq     ():null));
		bodyFromTable.setJydqrq      (body.getJydqrq     ()!=null?body.getJydqrq     ():(bodyFromTable.getJydqrq     ()!=null?bodyFromTable.getJydqrq     ():null));
		bodyFromTable.setWxfy        (body.getWxfy       ()!=null?body.getWxfy       ():(bodyFromTable.getWxfy       ()!=null?bodyFromTable.getWxfy       ():null));
		bodyFromTable.setSszg		 (body.getSszg  	 ()!=null?body.getSszg		 ():(bodyFromTable.getSszg		 ()!=null?bodyFromTable.getSszg		  ():null));
		bodyFromTable.setXlh		 (body.getXlh		 ()!=null?body.getXlh		 ():(bodyFromTable.getXlh		 ()!=null?bodyFromTable.getXlh		  ():null));
		bodyFromTable.setFdjbh	 	 (body.getFdjbh	     ()!=null?body.getFdjbh	     ():(bodyFromTable.getFdjbh	     ()!=null?bodyFromTable.getFdjbh	  ():null));
		bodyFromTable.setCpuxh	 	 (body.getCpuxh	     ()!=null?body.getCpuxh	     ():(bodyFromTable.getCpuxh	     ()!=null?bodyFromTable.getCpuxh	  ():null));
		bodyFromTable.setMemory	 	 (body.getMemory	 ()!=null?body.getMemory     ():(bodyFromTable.getMemory     ()!=null?bodyFromTable.getMemory     ():null));
		bodyFromTable.setDisk		 (body.getDisk		 ()!=null?body.getDisk	     ():(bodyFromTable.getDisk	     ()!=null?bodyFromTable.getDisk	      ():null));
		bodyFromTable.setNzdisk	 	 (body.getNzdisk	 ()!=null?body.getNzdisk     ():(bodyFromTable.getNzdisk     ()!=null?bodyFromTable.getNzdisk     ():null));
		bodyFromTable.setXtxsq	 	 (body.getXtxsq	     ()!=null?body.getXtxsq	     ():(bodyFromTable.getXtxsq	     ()!=null?bodyFromTable.getXtxsq	  ():null));
		bodyFromTable.setTxmbh	 	 (body.getTxmbh	     ()!=null?body.getTxmbh	     ():(bodyFromTable.getTxmbh	     ()!=null?bodyFromTable.getTxmbh	  ():null));
		return bodyFromTable;
	}
}
