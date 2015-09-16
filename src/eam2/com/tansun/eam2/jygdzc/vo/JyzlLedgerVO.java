package com.tansun.eam2.jygdzc.vo;




import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 经营租赁查询VO
 * 
 * @author lihuan
 * 
 */
public class JyzlLedgerVO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -2561642904176897709L;
	/**
	 * 
	 */
	//合同ID
	private String id;
	//一级分行
	private String yjfh;
	//  资产名称
	private String zcmc;
	// 资产编号
	private String zcbh;
	// 经营分类
	private String jyfl;
	//卡片编号
	private String kpbh;
	// 本币原值
	private String ybyz;
	// 存放地点
	private String cfdd;
	//建筑面积
	private String jzmj;
	//承租人
	private String czr;
	//租赁面积原值
	private String zlmjyz;
	//租赁面积所处位置
	private String zlmjscwz;
	//承租面积
	private String czsl;
	//合同开始日期
	private Date htqsrq;
	//合同到期日期
	private Date htdqrq;
	//用途
	private String zlyt;
	//月收费标准
	private String ysfbz;
	//月租金
	private String yzj;
	//年租金
	private String nzjjg;
	//付款方式
	private String jsfs;
	//应收未收金额
	private String yswsje;
	//本年实收金额
	private String bnssje;
	//整个租期累计收款
	private String sszje;
	//是否执行完毕
	private String sfzxwb;
	//交易对象
	private String jydx;
	//备注
	private String beizhu;
	//管理人
	private String glr;
	// 合同起始时间
	private Date begintime1;
	private Date begintime2;
	// 合同到期时间
	private Date endtime1;
	private Date endtime2;
	
	public JyzlLedgerVO() {
		super();
	}
	public JyzlLedgerVO(String id, String yjfh, String zcmc, String zcbh,
			String jyfl, String kpbh, String ybyz, String cfdd, String jzmj,
			String czr, String zlmjyz, String zlmjscwz, String czsl,
			Date htqsrq, Date htdqrq, String zlyt, String ysfbz, String yzj,
			String nzjjg, String jsfs, String yswsje, String bnssje,
			String sszje, String sfzxwb, String jydx, String beizhu,
			String glr, Date begintime1, Date begintime2, Date endtime1,
			Date endtime2) {
		super();
		this.id = id;
		this.yjfh = yjfh;
		this.zcmc = zcmc;
		this.zcbh = zcbh;
		this.jyfl = jyfl;
		this.kpbh = kpbh;
		this.ybyz = ybyz;
		this.cfdd = cfdd;
		this.jzmj = jzmj;
		this.czr = czr;
		this.zlmjyz = zlmjyz;
		this.zlmjscwz = zlmjscwz;
		this.czsl = czsl;
		this.htqsrq = htqsrq;
		this.htdqrq = htdqrq;
		this.zlyt = zlyt;
		this.ysfbz = ysfbz;
		this.yzj = yzj;
		this.nzjjg = nzjjg;
		this.jsfs = jsfs;
		this.yswsje = yswsje;
		this.bnssje = bnssje;
		this.sszje = sszje;
		this.sfzxwb = sfzxwb;
		this.jydx = jydx;
		this.beizhu = beizhu;
		this.glr = glr;
		this.begintime1 = begintime1;
		this.begintime2 = begintime2;
		this.endtime1 = endtime1;
		this.endtime2 = endtime2;
	}
	public Date getBegintime1() {
		return begintime1;
	}
	public void setBegintime1(Date begintime1) {
		this.begintime1 = begintime1;
	}
	public Date getBegintime2() {
		return begintime2;
	}
	public void setBegintime2(Date begintime2) {
		this.begintime2 = begintime2;
	}
	public Date getEndtime1() {
		return endtime1;
	}
	public void setEndtime1(Date endtime1) {
		this.endtime1 = endtime1;
	}
	public Date getEndtime2() {
		return endtime2;
	}
	public void setEndtime2(Date endtime2) {
		this.endtime2 = endtime2;
	}
	public String getYjfh() {
		return yjfh;
	}
	public void setYjfh(String yjfh) {
		this.yjfh = yjfh;
	}
	public String getZcmc() {
		return zcmc;
	}
	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}
	public String getZcbh() {
		return zcbh;
	}
	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}
	public String getKpbh() {
		return kpbh;
	}
	public void setKpbh(String kpbh) {
		this.kpbh = kpbh;
	}
	public String getYbyz() {
		return ybyz;
	}
	public void setYbyz(String ybyz) {
		this.ybyz = ybyz;
	}
	public String getCfdd() {
		return cfdd;
	}
	public void setCfdd(String cfdd) {
		this.cfdd = cfdd;
	}
	public String getJzmj() {
		return jzmj;
	}
	public void setJzmj(String jzmj) {
		this.jzmj = jzmj;
	}
	public String getCzr() {
		return czr;
	}
	public void setCzr(String czr) {
		this.czr = czr;
	}
	public String getZlmjyz() {
		return zlmjyz;
	}
	public void setZlmjyz(String zlmjyz) {
		this.zlmjyz = zlmjyz;
	}
	public String getZlmjscwz() {
		return zlmjscwz;
	}
	public void setZlmjscwz(String zlmjscwz) {
		this.zlmjscwz = zlmjscwz;
	}
	public String getCzsl() {
		return czsl;
	}
	public void setCzsl(String czsl) {
		this.czsl = czsl;
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
	public String getZlyt() {
		return zlyt;
	}
	public void setZlyt(String zlyt) {
		this.zlyt = zlyt;
	}
	public String getYsfbz() {
		return ysfbz;
	}
	public void setYsfbz(String ysfbz) {
		this.ysfbz = ysfbz;
	}
	public String getYzj() {
		return yzj;
	}
	public void setYzj(String yzj) {
		this.yzj = yzj;
	}
	public String getNzjjg() {
		return nzjjg;
	}
	public void setNzjjg(String nzjjg) {
		this.nzjjg = nzjjg;
	}
	public String getJsfs() {
		return jsfs;
	}
	public void setJsfs(String jsfs) {
		this.jsfs = jsfs;
	}
	public String getYswsje() {
		return yswsje;
	}
	public void setYswsje(String yswsje) {
		this.yswsje = yswsje;
	}
	public String getBnssje() {
		return bnssje;
	}
	public void setBnssje(String bnssje) {
		this.bnssje = bnssje;
	}
	public String getSszje() {
		return sszje;
	}
	public void setSszje(String sszje) {
		this.sszje = sszje;
	}
	public String getJydx() {
		return jydx;
	}
	public void setJydx(String jydx) {
		this.jydx = jydx;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public String getGlr() {
		return glr;
	}
	public void setGlr(String glr) {
		this.glr = glr;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public String getSfzxwb() {
		return sfzxwb;
	}
	public void setSfzxwb(String sfzxwb) {
		this.sfzxwb = sfzxwb;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJyfl() {
		return jyfl;
	}
	public void setJyfl(String jyfl) {
		this.jyfl = jyfl;
	}

}
