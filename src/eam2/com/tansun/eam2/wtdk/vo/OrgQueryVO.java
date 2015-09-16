package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 机构查询VO
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public class OrgQueryVO extends CommonBO {

	private String cmOpunCod; // 机构编号

	private String cmOpunFlmnChn; // 机构名称

	private String cmOfcCtbrh;// 上级机构名称

	private String cmAreaInil;// 地区简称

	public String getCmOpunCod() {
		return cmOpunCod;
	}

	public void setCmOpunCod(String cmOpunCod) {
		this.cmOpunCod = cmOpunCod;
	}

	public String getCmOpunFlmnChn() {
		return cmOpunFlmnChn;
	}

	public void setCmOpunFlmnChn(String cmOpunFlmnChn) {
		this.cmOpunFlmnChn = cmOpunFlmnChn;
	}

	public String getCmOfcCtbrh() {
		return cmOfcCtbrh;
	}

	public void setCmOfcCtbrh(String cmOfcCtbrh) {
		this.cmOfcCtbrh = cmOfcCtbrh;
	}

	public String getCmAreaInil() {
		return cmAreaInil;
	}

	public void setCmAreaInil(String cmAreaInil) {
		this.cmAreaInil = cmAreaInil;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString() {
	    final String TAB = ",";
	    String retValue = "";
	    retValue = "OrgQueryVO ( "
	        + super.toString() + TAB
	        + "cmOpunCod = " + this.cmOpunCod + TAB
	        + "cmOpunFlmnChn = " + this.cmOpunFlmnChn + TAB
	        + "cmOfcCtbrh = " + this.cmOfcCtbrh + TAB
	        + "cmAreaInil = " + this.cmAreaInil
	        + " )";
	    return retValue;
	}
	
	

}
