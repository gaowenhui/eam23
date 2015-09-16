package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

public class JyzcJyzlLsbVO {
	
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
	private String yxzlmj;
	//意向租金总金额
	private String yxzjzje;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCldId() {
		return cldId;
	}
	public void setCldId(String cldId) {
		this.cldId = cldId;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	public String getJydx() {
		return jydx;
	}
	public void setJydx(String jydx) {
		this.jydx = jydx;
	}
	public String getCJbhsf() {
		return CJbhsf;
	}
	public void setCJbhsf(String jbhsf) {
		CJbhsf = jbhsf;
	}
	public String getCEjjbh() {
		return CEjjbh;
	}
	public void setCEjjbh(String ejjbh) {
		CEjjbh = ejjbh;
	}
	public Date getZlqsrq() {
		return zlqsrq;
	}
	public void setZlqsrq(Date zlqsrq) {
		this.zlqsrq = zlqsrq;
	}
	public Date getZldqrq() {
		return zldqrq;
	}
	public void setZldqrq(Date zldqrq) {
		this.zldqrq = zldqrq;
	}
	public String getCzr() {
		return czr;
	}
	public void setCzr(String czr) {
		this.czr = czr;
	}
	public String getYxzlmj() {
		return yxzlmj;
	}
	public void setYxzlmj(String yxzlmj) {
		this.yxzlmj = yxzlmj;
	}
	public String getYxzjzje() {
		return yxzjzje;
	}
	public void setYxzjzje(String yxzjzje) {
		this.yxzjzje = yxzjzje;
	}
	public String getCzyt() {
		return czyt;
	}
	public void setCzyt(String czyt) {
		this.czyt = czyt;
	}
	public String getYxzq() {
		return yxzq;
	}
	public void setYxzq(String yxzq) {
		this.yxzq = yxzq;
	}
	public String getZlsm() {
		return zlsm;
	}
	public void setZlsm(String zlsm) {
		this.zlsm = zlsm;
	}
	public String getBgsm() {
		return bgsm;
	}
	public void setBgsm(String bgsm) {
		this.bgsm = bgsm;
	}
	public Date getTzrq() {
		return tzrq;
	}
	public void setTzrq(Date tzrq) {
		this.tzrq = tzrq;
	}
	public String getTzyy() {
		return tzyy;
	}
	public void setTzyy(String tzyy) {
		this.tzyy = tzyy;
	}
	public String getTzblsm() {
		return tzblsm;
	}
	public void setTzblsm(String tzblsm) {
		this.tzblsm = tzblsm;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public String getJyzlId() {
		return jyzlId;
	}
	public void setJyzlId(String jyzlId) {
		this.jyzlId = jyzlId;
	}
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
	public JyzcJyzlLsbVO(String id, String cldId, String zcId, String jydx,
			String jbhsf, String ejjbh, Date zlqsrq, Date zldqrq, String czr,
			String yxzlmj, String yxzjzje, String czyt, String yxzq,
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
		this.dldw =dldw;
	}
	public JyzcJyzlLsbVO() {
		super();
	}
	public String getDldw() {
		return dldw;
	}
	public void setDldw(String dldw) {
		this.dldw = dldw;
	}
}
