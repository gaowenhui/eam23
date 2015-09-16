package com.tansun.eam2.jygdzc.vo;




import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 经营租赁查询VO
 * 
 * @author lihuan
 * 
 */
public class JyzlQueryVO extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6289485962153200589L;
	// 标题
	private String biaoti;
	// 编号
	private String bianhao;
	// 资产编号
	private String zcbh;
	// 资产名称
	private String zcmc;
	// 资产类型
	private String CZclx;
	
	// 业务类型
	private String ywlx;
	// 租赁起始时间
	private Date begintime1;
	private Date begintime2;
	// 租赁到期时间
	private Date endtime1;
	private Date endtime2;

	// 承租人
	private String czr;
	
	//一级委托代理机构
	private String cyjwtjg;
	//二级委托代理机构
	private String ccrwtjg;
	

	public JyzlQueryVO(String biaoti, String bianhao, String zcbh, String zcmc,
			String zclx, String ywlx, Date begintime1, Date begintime2,
			Date endtime1, Date endtime2, String czr, String cyjwtjg, String ccrwtjg) {
		super();
		this.biaoti = biaoti;
		this.bianhao = bianhao;
		this.zcbh = zcbh;
		this.zcmc = zcmc;
		CZclx = zclx;
		this.ywlx = ywlx;
		this.begintime1 = begintime1;
		this.begintime2 = begintime2;
		this.endtime1 = endtime1;
		this.endtime2 = endtime2;
		this.czr = czr;
		this.ccrwtjg = ccrwtjg;
		this.cyjwtjg = cyjwtjg;
	}

	public JyzlQueryVO() {
		super();
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
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

	public String getCZclx() {
		return CZclx;
	}

	public void setCZclx(String zclx) {
		CZclx = zclx;
	}

	public String getYwlx() {
		return ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}



	public String getCzr() {
		return czr;
	}

	public void setCzr(String czr) {
		this.czr = czr;
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

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getcyjwtjg() {
		return cyjwtjg;
	}

	public void setcyjwtjg(String cyjwtjg) {
		this.cyjwtjg = cyjwtjg;
	}

	public String getccrwtjg() {
		return ccrwtjg;
	}

	public void setccrwtjg(String ccrwtjg) {
		this.ccrwtjg = ccrwtjg;
	}

	

}
