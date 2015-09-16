package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class CustomersQueryVO extends CommonBO{
	private String ciCustNo; // 客户编号
	private String ciChnName;// 客户名称
	private String ciUnitChnInil;// 单位中文名称
	private String startCiFlstDt; // 从建档日期
	private String endCiFlstDt; // 到建档日期

	public String getCiCustNo() {
		return ciCustNo;
	}

	public void setCiCustNo(String ciCustNo) {
		this.ciCustNo = ciCustNo;
	}

	public String getCiChnName() {
		return ciChnName;
	}

	public void setCiChnName(String ciChnName) {
		this.ciChnName = ciChnName;
	}

	public String getCiUnitChnInil() {
		return ciUnitChnInil;
	}

	public void setCiUnitChnInil(String ciUnitChnInil) {
		this.ciUnitChnInil = ciUnitChnInil;
	}

	public String getStartCiFlstDt() {
		return startCiFlstDt;
	}

	public void setStartCiFlstDt(String startCiFlstDt) {
		this.startCiFlstDt = startCiFlstDt;
	}

	public String getEndCiFlstDt() {
		return endCiFlstDt;
	}

	public void setEndCiFlstDt(String endCiFlstDt) {
		this.endCiFlstDt = endCiFlstDt;
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
	public String toString(){
	    final String TAB = ",";
	    String retValue = "";
	    retValue = "CustomersQueryVO ( "
	        + super.toString() + TAB
	        + "ciCustNo = " + this.ciCustNo + TAB
	        + "ciChnName = " + this.ciChnName + TAB
	        + "ciUnitChnInil = " + this.ciUnitChnInil + TAB
	        + "startCiFlstDt = " + this.startCiFlstDt + TAB
	        + "endCiFlstDt = " + this.endCiFlstDt
	        + " )";
	    return retValue;
	}
	
	

}
