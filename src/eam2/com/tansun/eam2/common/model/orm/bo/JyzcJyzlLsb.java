package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * JyzcJyzlLsb generated by MyEclipse Persistence Tools
 */

public class JyzcJyzlLsb extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	// Fields
	//ID
	private String id;
	//处理单ID
	private String cldId;
	//资产ID
	private String zcId;
	//交易对象
	private String jydx;
	//经办行省份
	private String CJbhsf;
	//二级经办行
	private String CEjjbh;
	//租赁起始日期
	private Date zlqsrq;
	//租赁到期日期
	private Date zldqrq;
	//资产承租人
	private String czr;
	//意向租赁面积
	private Double yxzlmj;
	//意向租金总金额
	private Double yxzjzje;
	//出租用途
	private String czyt;
	//意向租期
	private String yxzq;
	//租赁说明
	private String zlsm;
	//变更说明
	private String bgsm;
	//退租日期
	private Date tzrq;
	//退租原因
	private String tzyy;
	//退租办理说明
	private String tzblsm;
	//审批状态
	private String spzt;
	//经营租赁信息表ID
	private String jyzlId;
	//合同交易对象
	private String htjydx;
	//合同中承租人
	private String htczr;
	//合同起始日期
	private Date htqsrq;
	//合同到期日期
	private Date htdqrq;
	//合同中租赁用途
	private String htzlyt;
	//合同ID
	private String htId;
	//度量单位
	private String dldw;

	// Constructors

	

	public String getHtjydx() {
		return htjydx;
	}

	public void setHtjydx(String htjydx) {
		this.htjydx = htjydx;
	}

	public String getHtczr() {
		return htczr;
	}

	public void setHtczr(String htczr) {
		this.htczr = htczr;
	}

	public Date getHtqsrq() {
		return htqsrq;
	}

	public void setHtqsrq(Date htqsrq) {
		this.htqsrq = htqsrq;
	}

	public Date getHtdqrq() {
		return htdqrq;
	}

	public void setHtdqrq(Date htdqrq) {
		this.htdqrq = htdqrq;
	}

	public String getHtzlyt() {
		return htzlyt;
	}

	public void setHtzlyt(String htzlyt) {
		this.htzlyt = htzlyt;
	}

	public String getHtId() {
		return htId;
	}

	public void setHtId(String htId) {
		this.htId = htId;
	}

	/** default constructor */
	public JyzcJyzlLsb() {
	}

	/** full constructor */
	public JyzcJyzlLsb(String id, String cldId, String zcId, String jydx,
			String jbhsf, String ejjbh, Date zlqsrq, Date zldqrq, String czr,
			Double yxzlmj, Double yxzjzje, String czyt, String yxzq,
			String zlsm, String bgsm, Date tzrq, String tzyy, String tzblsm,
			String spzt, String jyzlId, String htjydx, String htczr,
			Date htqsrq, Date htdqrq, String htzlyt, String htId ,String dldw) {
		super();
		this.id = id;
		this.cldId = cldId;
		this.zcId = zcId;
		this.jydx = jydx;
		CJbhsf = jbhsf;
		CEjjbh = ejjbh;
		this.zlqsrq = zlqsrq;
		this.zldqrq = zldqrq;
		this.czr = czr;
		this.yxzlmj = yxzlmj;
		this.yxzjzje = yxzjzje;
		this.czyt = czyt;
		this.yxzq = yxzq;
		this.zlsm = zlsm;
		this.bgsm = bgsm;
		this.tzrq = tzrq;
		this.tzyy = tzyy;
		this.tzblsm = tzblsm;
		this.spzt = spzt;
		this.jyzlId = jyzlId;
		this.htjydx = htjydx;
		this.htczr = htczr;
		this.htqsrq = htqsrq;
		this.htdqrq = htdqrq;
		this.htzlyt = htzlyt;
		this.htId = htId;
		this.dldw = dldw;
	}
	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldId() {
		return this.cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getZcId() {
		return this.zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public String getJydx() {
		return this.jydx;
	}

	public void setJydx(String jydx) {
		this.jydx = jydx;
	}

	public String getCJbhsf() {
		return this.CJbhsf;
	}

	public void setCJbhsf(String CJbhsf) {
		this.CJbhsf = CJbhsf;
	}

	public String getCEjjbh() {
		return this.CEjjbh;
	}

	public void setCEjjbh(String CEjjbh) {
		this.CEjjbh = CEjjbh;
	}

	public Date getZlqsrq() {
		return this.zlqsrq;
	}

	public void setZlqsrq(Date zlqsrq) {
		this.zlqsrq = zlqsrq;
	}

	public Date getZldqrq() {
		return this.zldqrq;
	}

	public void setZldqrq(Date zldqrq) {
		this.zldqrq = zldqrq;
	}

	public String getCzr() {
		return this.czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

	public Double getYxzlmj() {
		return this.yxzlmj;
	}

	public void setYxzlmj(Double yxzlmj) {
		this.yxzlmj = yxzlmj;
	}

	public Double getYxzjzje() {
		return this.yxzjzje;
	}

	public void setYxzjzje(Double yxzjzje) {
		this.yxzjzje = yxzjzje;
	}

	public String getCzyt() {
		return this.czyt;
	}

	public void setCzyt(String czyt) {
		this.czyt = czyt;
	}

	public String getYxzq() {
		return this.yxzq;
	}

	public void setYxzq(String yxzq) {
		this.yxzq = yxzq;
	}

	public String getZlsm() {
		return this.zlsm;
	}

	public void setZlsm(String zlsm) {
		this.zlsm = zlsm;
	}

	public String getBgsm() {
		return this.bgsm;
	}

	public void setBgsm(String bgsm) {
		this.bgsm = bgsm;
	}

	public Date getTzrq() {
		return this.tzrq;
	}

	public void setTzrq(Date tzrq) {
		this.tzrq = tzrq;
	}

	public String getTzyy() {
		return this.tzyy;
	}

	public void setTzyy(String tzyy) {
		this.tzyy = tzyy;
	}

	public String getTzblsm() {
		return this.tzblsm;
	}

	public void setTzblsm(String tzblsm) {
		this.tzblsm = tzblsm;
	}

	public String getSpzt() {
		return this.spzt;
	}

	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}

	public String getJyzlId() {
		return this.jyzlId;
	}

	public void setJyzlId(String jyzlId) {
		this.jyzlId = jyzlId;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getDldw() {
		return dldw;
	}

	public void setDldw(String dldw) {
		this.dldw = dldw;
	}

}