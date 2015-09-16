package com.tansun.eam2.wtdk.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 基金与贷款关联的查询VO
 * 
 * @author 陈煜霄
 * @date 2011-03-11
 */
public class RelateQueryVO extends CommonBO {

	private String id;
	private String saAcctNo;
	private String saCustNo;
	private String saCustName;
	private Double sazhye;
	private Double lnzhye;
	private Double sajy;
	private String saAclg;
	private String saOpacInstnNo;
	private String saCurrCod;
	private String lnAcctNo;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSaAcctNo() {
		return saAcctNo;
	}

	public void setSaAcctNo(String saAcctNo) {
		this.saAcctNo = saAcctNo;
	}

	public String getSaCustNo() {
		return saCustNo;
	}

	public void setSaCustNo(String saCustNo) {
		this.saCustNo = saCustNo;
	}

	public String getSaCustName() {
		return saCustName;
	}

	public void setSaCustName(String saCustName) {
		this.saCustName = saCustName;
	}

	public Double getSazhye() {
		return sazhye;
	}

	public void setSazhye(Double sazhye) {
		this.sazhye = sazhye;
	}

	public Double getLnzhye() {
		return lnzhye;
	}

	public void setLnzhye(Double lnzhye) {
		this.lnzhye = lnzhye;
	}

	public Double getSajy() {
		return sajy;
	}

	public void setSajy(Double sajy) {
		this.sajy = sajy;
	}

	public String getSaAclg() {
		return saAclg;
	}

	public void setSaAclg(String saAclg) {
		this.saAclg = saAclg;
	}

	public String getSaOpacInstnNo() {
		return saOpacInstnNo;
	}

	public void setSaOpacInstnNo(String saOpacInstnNo) {
		this.saOpacInstnNo = saOpacInstnNo;
	}

	public String getSaCurrCod() {
		return saCurrCod;
	}

	public void setSaCurrCod(String saCurrCod) {
		this.saCurrCod = saCurrCod;
	}

	public String getLnAcctNo() {
		return lnAcctNo;
	}

	public void setLnAcctNo(String lnAcctNo) {
		this.lnAcctNo = lnAcctNo;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}
