package com.tansun.eam2.ssgl.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class SsBaseinfoQueryVO  extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5929128549098784308L;
	String id; // 编号
	String sfid; // 省份编号
	String sazclbid; // 资产编号
	String sazcmc;
	String sslxid;
	String ssztid;
	Date qssjbegin; // 开始时间
	Date qssjend;
	String qisu;
	String beisu;

	public String getSfid() {
		return sfid;
	}

	public void setSfid(String sfid) {
		this.sfid = sfid;
	}

	public String getSazclbid() {
		return sazclbid;
	}

	public void setSazclbid(String sazclbid) {
		this.sazclbid = sazclbid;
	}

	public String getSazcmc() {
		return sazcmc;
	}

	public void setSazcmc(String sazcmc) {
		this.sazcmc = sazcmc;
	}

	public String getSslxid() {
		return sslxid;
	}

	public void setSslxid(String sslxid) {
		this.sslxid = sslxid;
	}

	public String getSsztid() {
		return ssztid;
	}

	public void setSsztid(String ssztid) {
		this.ssztid = ssztid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getQssjbegin() {
		return qssjbegin;
	}

	public void setQssjbegin(Date qssjbegin) {
		this.qssjbegin = qssjbegin;
	}

	public Date getQssjend() {
		return qssjend;
	}

	public void setQssjend(Date qssjend) {
		this.qssjend = qssjend;
	}

	public String getQisu() {
		return qisu;
	}

	public void setQisu(String qisu) {
		this.qisu = qisu;
	}

	public String getBeisu() {
		return beisu;
	}

	public void setBeisu(String beisu) {
		this.beisu = beisu;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
