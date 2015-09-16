package com.tansun.eam2.stgl.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;


/**
 * 实体相关收入（回款审批办结后）
 * @author gengxiaoli
 *
 */
public class IncomeResultVO extends CommonBO{
	//实体名称
    private String gqStmc;
    //流程名称
    private String lcmc;
    //回收金额
    private Double gqHsxjje;
    //回收确认日期
    private Date qrrq;
    //回款性质
    private String gqHkxz;

	public String getGqStmc() {
		return gqStmc;
	}
	public void setGqStmc(String gqStmc) {
		this.gqStmc = gqStmc;
	}
	public String getLcmc() {
		return lcmc;
	}
	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}
	public Double getGqHsxjje() {
		return gqHsxjje;
	}
	public void setGqHsxjje(Double gqHsxjje) {
		this.gqHsxjje = gqHsxjje;
	}
	public Date getQrrq() {
		return qrrq;
	}
	public void setQrrq(Date qrrq) {
		this.qrrq = qrrq;
	}
	public String getGqHkxz() {
		return gqHkxz;
	}
	public void setGqHkxz(String gqHkxz) {
		this.gqHkxz = gqHkxz;
	}
	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	@Override
	public String toString() {
      final String TAB = ",";
      String retValue = "";
      retValue = "IncomeResultVO ( " + super.toString() + TAB + "lcmc=" + this.lcmc + TAB + "lcmc=" + this.lcmc + TAB + "gqHsxjje=" + this.gqHsxjje + TAB + "qrrq=" + this.qrrq + TAB + "gqHkxz=" + this.gqHkxz  + " )";
      return retValue;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
