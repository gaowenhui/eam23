package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class PgsczckBO extends CommonBO {
   private String firsttree;  //一级
   
   private String sceondtree;  //二级
   
   private String threetree;   //三级
	
	public String getFirsttree() {
		return firsttree;
	}
	
	public void setFirsttree(String firsttree) {
		this.firsttree = firsttree;
	}
	
	public String getSceondtree() {
		return sceondtree;
	}
	
	public void setSceondtree(String sceondtree) {
		this.sceondtree = sceondtree;
	}
	
	public String getThreetree() {
		return threetree;
	}
	
	public void setThreetree(String threetree) {
		this.threetree = threetree;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
   
   
}
