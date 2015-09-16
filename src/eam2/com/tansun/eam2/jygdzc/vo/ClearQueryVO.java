package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 清算合同查询vo
 * 
 * @author lihuan
 * 
 */
public class ClearQueryVO extends CommonBO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1968004329574456954L;
	// id
	private String id;
	// 清算批次
	private String qspc;
	// 合同类型
	private String htlx;
	// 交易对象
	private String jydx;
	// 清算日期开始
	private String qsrq1;
	// 清算日期结束
	private String qsrq2;
	// 合同编号
	private String htbh;
	// 拟稿部门
	private String ngbm;
	// 资产编号
	private String zcbh;
	// 资产名称
	private String zcmc;
	// 资产所属地区
	private String zcssdq;
	// 应收租金
	private String yszj;
	//应收修改原因
	private String ysxgyy;
	//调整租金
	private String tzzj;
	// 修改后应收租金
	private String xghyszj;
	// 实收租金
	private String sszj;
	// 上次变动金额
	private String scbdje;
	// 本次变动金额
	private String bcbdje;
	// 清算调整金额
	private String qstzje;
	// 变动原因
	private String bdyy;
	// 承租人
	private String czr;
	// 月租金
	private String yzj;
	// 合同终止日期
	private String htzzrq;
	// 清算开始日期
	private String qsksrq;
	// 清算截止日期
	private String qsjzrq;
	// 合同到期日期
	private String htdqrq;
	// bodyId
	private String bodyId;
	// 清算类型
	private String qslx;
	//拟稿日期
	private String ngrq;
	//处理单下body数
	private String counts;
	//免租期
	private String mzq;
	
	public String getMzq() {
		return mzq;
	}

	public void setMzq(String mzq) {
		this.mzq = mzq;
	}

	public String getCounts() {
		return counts;
	}

	public void setCounts(String counts) {
		this.counts = counts;
	}

	public String getBodyId() {
		return bodyId;
	}

	public void setBodyId(String bodyId) {
		this.bodyId = bodyId;
	}

	public String getHtdqrq() {
		return htdqrq;
	}

	public void setHtdqrq(String htdqrq) {
		this.htdqrq = htdqrq;
	}

	public String getQsksrq() {
		return qsksrq;
	}

	public void setQsksrq(String qsksrq) {
		this.qsksrq = qsksrq;
	}

	public String getQsjzrq() {
		return qsjzrq;
	}

	public void setQsjzrq(String qsjzrq) {
		this.qsjzrq = qsjzrq;
	}

	public String getHtzzrq() {
		return htzzrq;
	}

	public void setHtzzrq(String htzzrq) {
		this.htzzrq = htzzrq;
	}

	public String getZcssdq() {
		return zcssdq;
	}

	public void setZcssdq(String zcssdq) {
		this.zcssdq = zcssdq;
	}

	public String getYszj() {
		return yszj;
	}

	public void setYszj(String yszj) {
		this.yszj = yszj;
	}

	public String getXghyszj() {
		return xghyszj;
	}

	public void setXghyszj(String xghyszj) {
		this.xghyszj = xghyszj;
	}

	public String getSszj() {
		return sszj;
	}

	public void setSszj(String sszj) {
		this.sszj = sszj;
	}

	public String getScbdje() {
		return scbdje;
	}

	public void setScbdje(String scbdje) {
		this.scbdje = scbdje;
	}

	public String getBcbdje() {
		return bcbdje;
	}

	public void setBcbdje(String bcbdje) {
		this.bcbdje = bcbdje;
	}

	public String getQstzje() {
		return qstzje;
	}

	public void setQstzje(String qstzje) {
		this.qstzje = qstzje;
	}

	public String getBdyy() {
		return bdyy;
	}

	public void setBdyy(String bdyy) {
		this.bdyy = bdyy;
	}

	public String getQspc() {
		return qspc;
	}

	public void setQspc(String qspc) {
		this.qspc = qspc;
	}

	public String getHtlx() {
		return htlx;
	}

	public void setHtlx(String htlx) {
		this.htlx = htlx;
	}

	public String getJydx() {
		return jydx;
	}

	public void setJydx(String jydx) {
		this.jydx = jydx;
	}

	public String getQsrq1() {
		return qsrq1;
	}

	public void setQsrq1(String qsrq1) {
		this.qsrq1 = qsrq1;
	}

	public String getQsrq2() {
		return qsrq2;
	}

	public void setQsrq2(String qsrq2) {
		this.qsrq2 = qsrq2;
	}

	public String getHtbh() {
		return htbh;
	}

	public void setHtbh(String htbh) {
		this.htbh = htbh;
	}

	public String getNgbm() {
		return ngbm;
	}

	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCzr() {
		return czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
	}

	public String getYzj() {
		return yzj;
	}

	public void setYzj(String yzj) {
		this.yzj = yzj;
	}

	public String getQslx() {
		return qslx;
	}

	public void setQslx(String qslx) {
		this.qslx = qslx;
	}

	public String getNgrq() {
		return ngrq;
	}

	public void setNgrq(String ngrq) {
		this.ngrq = ngrq;
	}

	public String getTzzj() {
		return tzzj;
	}

	public void setTzzj(String tzzj) {
		this.tzzj = tzzj;
	}

	public String getYsxgyy() {
		return ysxgyy;
	}

	public void setYsxgyy(String ysxgyy) {
		this.ysxgyy = ysxgyy;
	}

}
