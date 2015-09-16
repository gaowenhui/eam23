package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class JyzcXxBuilding extends CommonBO{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6920158139085131489L;
	//建成日期
	private Date jcrq;
	//房屋结构
	private String fwjg;
	//檐高
	private String yangao;
	//标准层高
	private String bzcg;
	//总层数
	private String zcs;
	//坐落在第几层
	private String zlzdjc;
	//房间号
	private String fjh;
	//建筑面积
	private String jzmj;
	//成本单价
	private String cbdj;
	//房地分离房屋
	private String fdflfw;
	//有无土地
	private String CYwtd;
	//房产证所有权人
	private String fczsyqr;
	//房产证号
	private String fczh;
	//房产证替代文件
	private String fcztdwj;
	//房产证无有效文件
	private String fczwyxwj;
	//房屋已办证
	private String fwybz;
	//	房产证办理时间
	private String fczblsj;
	//空地
	private String kongdi;
	//	用地性质
	private String CYdxz;
	//	土地面积
	private String tdmj;
	//	取得日期
	private String qdrq;
	//准用年限
	private String zynx;
	//剩余使用年限
	private String sysynx;
	//开发程度
	private String kfcd;
	//房地分离土地
	private String fdfltd;
	//	土地证使用权人
	private String tdzsyqr;
	//土地证号
	private String tdzh;
	//土地证替代文件
	private String tdztdwj;
	//土地无有效文件
	private String tdwyxwj;
	//土地已办证
	private String tdybz;
	//	土地证办理日期
	private Date tdzblsj;
	//结构
	private String gzwjg;
	//规格尺寸
	private String ggcc;
	//计量单位
	private String jldw;
	//	构筑物数量
	private Long gzwsl;
	//构筑物成本单价
	private Double gzwcbdj;
	//构筑物建成时间
	private String gzwjcsj;
	//	房地合一
	private String fdhy;
	//房地合一已办证
	private String fdhyybz;
	//房地合一权证号
	private String fdhyqzh;
	//特殊类型
	private String tslx;
	//无法办证原因
	private String wfbzyy;
	//两证全未办
	private String lzqwb;
	public Date getJcrq() {
		return jcrq;
	}
	public void setJcrq(Date jcrq) {
		this.jcrq = jcrq;
	}
	public String getFwjg() {
		return fwjg;
	}
	public void setFwjg(String fwjg) {
		this.fwjg = fwjg;
	}
	public String getYangao() {
		return yangao;
	}
	public void setYangao(String yangao) {
		this.yangao = yangao;
	}
	public String getBzcg() {
		return bzcg;
	}
	public void setBzcg(String bzcg) {
		this.bzcg = bzcg;
	}
	public String getZcs() {
		return zcs;
	}
	public void setZcs(String zcs) {
		this.zcs = zcs;
	}
	public String getZlzdjc() {
		return zlzdjc;
	}
	public void setZlzdjc(String zlzdjc) {
		this.zlzdjc = zlzdjc;
	}
	public String getFjh() {
		return fjh;
	}
	public void setFjh(String fjh) {
		this.fjh = fjh;
	}
	public String getJzmj() {
		return jzmj;
	}
	public void setJzmj(String jzmj) {
		this.jzmj = jzmj;
	}
	public String getCbdj() {
		return cbdj;
	}
	public void setCbdj(String cbdj) {
		this.cbdj = cbdj;
	}
	public String getFdflfw() {
		return fdflfw;
	}
	public void setFdflfw(String fdflfw) {
		this.fdflfw = fdflfw;
	}
	public String getCYwtd() {
		return CYwtd;
	}
	public void setCYwtd(String ywtd) {
		CYwtd = ywtd;
	}
	public String getFczsyqr() {
		return fczsyqr;
	}
	public void setFczsyqr(String fczsyqr) {
		this.fczsyqr = fczsyqr;
	}
	public String getFczh() {
		return fczh;
	}
	public void setFczh(String fczh) {
		this.fczh = fczh;
	}
	public String getFcztdwj() {
		return fcztdwj;
	}
	public void setFcztdwj(String fcztdwj) {
		this.fcztdwj = fcztdwj;
	}
	public String getFczwyxwj() {
		return fczwyxwj;
	}
	public void setFczwyxwj(String fczwyxwj) {
		this.fczwyxwj = fczwyxwj;
	}
	public String getFwybz() {
		return fwybz;
	}
	public void setFwybz(String fwybz) {
		this.fwybz = fwybz;
	}
	public String getFczblsj() {
		return fczblsj;
	}
	public void setFczblsj(String fczblsj) {
		this.fczblsj = fczblsj;
	}
	public String getKongdi() {
		return kongdi;
	}
	public void setKongdi(String kongdi) {
		this.kongdi = kongdi;
	}
	public String getCYdxz() {
		return CYdxz;
	}
	public void setCYdxz(String ydxz) {
		CYdxz = ydxz;
	}
	public String getTdmj() {
		return tdmj;
	}
	public void setTdmj(String tdmj) {
		this.tdmj = tdmj;
	}
	public String getQdrq() {
		return qdrq;
	}
	public void setQdrq(String qdrq) {
		this.qdrq = qdrq;
	}
	public String getZynx() {
		return zynx;
	}
	public void setZynx(String zynx) {
		this.zynx = zynx;
	}
	public String getSysynx() {
		return sysynx;
	}
	public void setSysynx(String sysynx) {
		this.sysynx = sysynx;
	}
	public String getKfcd() {
		return kfcd;
	}
	public void setKfcd(String kfcd) {
		this.kfcd = kfcd;
	}
	public String getFdfltd() {
		return fdfltd;
	}
	public void setFdfltd(String fdfltd) {
		this.fdfltd = fdfltd;
	}
	public String getTdzsyqr() {
		return tdzsyqr;
	}
	public void setTdzsyqr(String tdzsyqr) {
		this.tdzsyqr = tdzsyqr;
	}
	public String getTdzh() {
		return tdzh;
	}
	public void setTdzh(String tdzh) {
		this.tdzh = tdzh;
	}
	public String getTdztdwj() {
		return tdztdwj;
	}
	public void setTdztdwj(String tdztdwj) {
		this.tdztdwj = tdztdwj;
	}
	public String getTdwyxwj() {
		return tdwyxwj;
	}
	public void setTdwyxwj(String tdwyxwj) {
		this.tdwyxwj = tdwyxwj;
	}
	public String getTdybz() {
		return tdybz;
	}
	public void setTdybz(String tdybz) {
		this.tdybz = tdybz;
	}
	public Date getTdzblsj() {
		return tdzblsj;
	}
	public void setTdzblsj(Date tdzblsj) {
		this.tdzblsj = tdzblsj;
	}
	public String getGzwjg() {
		return gzwjg;
	}
	public void setGzwjg(String gzwjg) {
		this.gzwjg = gzwjg;
	}
	public String getGgcc() {
		return ggcc;
	}
	public void setGgcc(String ggcc) {
		this.ggcc = ggcc;
	}
	public String getJldw() {
		return jldw;
	}
	public void setJldw(String jldw) {
		this.jldw = jldw;
	}
	public Long getGzwsl() {
		return gzwsl;
	}
	public void setGzwsl(Long gzwsl) {
		this.gzwsl = gzwsl;
	}
	public Double getGzwcbdj() {
		return gzwcbdj;
	}
	public void setGzwcbdj(Double gzwcbdj) {
		this.gzwcbdj = gzwcbdj;
	}
	public String getGzwjcsj() {
		return gzwjcsj;
	}
	public void setGzwjcsj(String gzwjcsj) {
		this.gzwjcsj = gzwjcsj;
	}
	public String getFdhy() {
		return fdhy;
	}
	public void setFdhy(String fdhy) {
		this.fdhy = fdhy;
	}
	public String getFdhyybz() {
		return fdhyybz;
	}
	public void setFdhyybz(String fdhyybz) {
		this.fdhyybz = fdhyybz;
	}
	public String getFdhyqzh() {
		return fdhyqzh;
	}
	public void setFdhyqzh(String fdhyqzh) {
		this.fdhyqzh = fdhyqzh;
	}
	public String getTslx() {
		return tslx;
	}
	public void setTslx(String tslx) {
		this.tslx = tslx;
	}
	public String getWfbzyy() {
		return wfbzyy;
	}
	public void setWfbzyy(String wfbzyy) {
		this.wfbzyy = wfbzyy;
	}
	public String getLzqwb() {
		return lzqwb;
	}
	public void setLzqwb(String lzqwb) {
		this.lzqwb = lzqwb;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
