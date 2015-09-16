package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * SsProc entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class SsProc extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	private String id;
	//诉讼基本信息ID
	private String ssjbxxId;
	//诉讼阶段ID
	private String ssjdid;
	//诉讼阶段编码
	private String ssjdbm;
	//诉讼阶段名称
	private String ssjdmc;
	//诉讼阶段描述
	private String ssjdms;
	//诉讼时间
	private Date sssj;
	//管辖/法院/仲裁庭
	private String zct;
	//裁判生效时间
	private Date cpsxsj;
	//生效判决结果
	private String sxpjjg;
	//代理人
	private String dlr;
	//案程要述
	private String acys;
	//录入人ID
	private String lrrid;
	//录入人
	private String lrr;
	//录入日期
	private Date lrrq;
	//备注
	private String bz;

	// Constructors

	/** default constructor */
	public SsProc() {
	}

	/** full constructor */
	public SsProc(String ssjbxxId, String ssjdid, String ssjdbm, String ssjdmc,
			String ssjdms, Date sssj, String zct, Date cpsxsj, String sxpjjg,
			String dlr, String acys, String lrrid, String lrr, Date lrrq,
			String bz) {
		this.ssjbxxId = ssjbxxId;
		this.ssjdid = ssjdid;
		this.ssjdbm = ssjdbm;
		this.ssjdmc = ssjdmc;
		this.ssjdms = ssjdms;
		this.sssj = sssj;
		this.zct = zct;
		this.cpsxsj = cpsxsj;
		this.sxpjjg = sxpjjg;
		this.dlr = dlr;
		this.acys = acys;
		this.lrrid = lrrid;
		this.lrr = lrr;
		this.lrrq = lrrq;
		this.bz = bz;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSsjbxxId() {
		return this.ssjbxxId;
	}

	public void setSsjbxxId(String ssjbxxId) {
		this.ssjbxxId = ssjbxxId;
	}

	public String getSsjdid() {
		return this.ssjdid;
	}

	public void setSsjdid(String ssjdid) {
		this.ssjdid = ssjdid;
	}

	public String getSsjdbm() {
		return this.ssjdbm;
	}

	public void setSsjdbm(String ssjdbm) {
		this.ssjdbm = ssjdbm;
	}

	public String getSsjdmc() {
		return this.ssjdmc;
	}

	public void setSsjdmc(String ssjdmc) {
		this.ssjdmc = ssjdmc;
	}

	public String getSsjdms() {
		return this.ssjdms;
	}

	public void setSsjdms(String ssjdms) {
		this.ssjdms = ssjdms;
	}

	public Date getSssj() {
		return this.sssj;
	}

	public void setSssj(Date sssj) {
		this.sssj = sssj;
	}

	public String getZct() {
		return this.zct;
	}

	public void setZct(String zct) {
		this.zct = zct;
	}

	public Date getCpsxsj() {
		return this.cpsxsj;
	}

	public void setCpsxsj(Date cpsxsj) {
		this.cpsxsj = cpsxsj;
	}

	public String getSxpjjg() {
		return this.sxpjjg;
	}

	public void setSxpjjg(String sxpjjg) {
		this.sxpjjg = sxpjjg;
	}

	public String getDlr() {
		return this.dlr;
	}

	public void setDlr(String dlr) {
		this.dlr = dlr;
	}

	public String getAcys() {
		return this.acys;
	}

	public void setAcys(String acys) {
		this.acys = acys;
	}

	public String getLrrid() {
		return this.lrrid;
	}

	public void setLrrid(String lrrid) {
		this.lrrid = lrrid;
	}

	public String getLrr() {
		return this.lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public Date getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

	public String getBz() {
		return this.bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}