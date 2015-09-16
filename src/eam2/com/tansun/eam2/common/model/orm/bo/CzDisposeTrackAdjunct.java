package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzDisposeTrackAdjunct entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzDisposeTrackAdjunct extends
		com.tansun.rdp4j.common.web.vo.CommonBO implements java.io.Serializable {

	private static final long serialVersionUID = 5959005275320772008L;
	private String id;
	private String trackid;
	private String fsxxlx;
	private Date pmwcgpmsj;
	private String pmwcgpmdd;
	private Long pmwcgjmrs;
	private Double pmwcgjmzgj;
	private Double pmwcgblj;
	private Long pmwcgcs;
	private String slmc;
	private Double fyje;
	private String fyzl;
	private String qsxzryxm;
	private String qsxzrylxfs;
	private String qsxzrygzdw;
	private Date hksj;
	private Double hkje;
	private Double hkfy;
	private Double hksr;
	private String hkfkr;
	private String hkbz;
	private String lsxm;
	private String lxfs;
	private String zxqk;
	private String lrrbh;
	private String lrr;
	private Date lrrq;
	// Constructors

	/** default constructor */
	public CzDisposeTrackAdjunct() {
	}

	/** full constructor */
	public CzDisposeTrackAdjunct(String trackid, String fsxxlx, Date pmwcgpmsj,
			String pmwcgpmdd, Long pmwcgjmrs, Double pmwcgjmzgj,
			Double pmwcgblj, String slmc, Double fyje, String fyzl,
			String qsxzryxm, String qsxzrylxfs, String qsxzrygzdw, Date hksj,
			Double hkje, Double hkfy, Double hksr, String hkfkr, String hkbz,Long pmwcgcs,
			String lsxm,String lxfs, String zxqk,String lrrbh, String lrr,Date lrrq) {
		this.trackid = trackid;
		this.fsxxlx = fsxxlx;
		this.pmwcgpmsj = pmwcgpmsj;
		this.pmwcgpmdd = pmwcgpmdd;
		this.pmwcgjmrs = pmwcgjmrs;
		this.pmwcgjmzgj = pmwcgjmzgj;
		this.pmwcgblj = pmwcgblj;
		this.slmc = slmc;
		this.fyje = fyje;
		this.fyzl = fyzl;
		this.qsxzryxm = qsxzryxm;
		this.qsxzrylxfs = qsxzrylxfs;
		this.qsxzrygzdw = qsxzrygzdw;
		this.hksj = hksj;
		this.hkje = hkje;
		this.hkfy = hkfy;
		this.hksr = hksr;
		this.hkfkr = hkfkr;
		this.hkbz = hkbz;
		this.pmwcgcs = pmwcgcs;
		this.lsxm = lsxm;
		this.lxfs = lxfs;
		this.zxqk = zxqk;
		this.lrrbh = lrrbh;
		this.lrr = lrr;
		this.lrrq = lrrq;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTrackid() {
		return this.trackid;
	}

	public void setTrackid(String trackid) {
		this.trackid = trackid;
	}

	public String getFsxxlx() {
		return this.fsxxlx;
	}

	public void setFsxxlx(String fsxxlx) {
		this.fsxxlx = fsxxlx;
	}

	public Date getPmwcgpmsj() {
		return this.pmwcgpmsj;
	}

	public void setPmwcgpmsj(Date pmwcgpmsj) {
		this.pmwcgpmsj = pmwcgpmsj;
	}

	public String getPmwcgpmdd() {
		return this.pmwcgpmdd;
	}

	public void setPmwcgpmdd(String pmwcgpmdd) {
		this.pmwcgpmdd = pmwcgpmdd;
	}

	public Long getPmwcgjmrs() {
		return this.pmwcgjmrs;
	}

	public void setPmwcgjmrs(Long pmwcgjmrs) {
		this.pmwcgjmrs = pmwcgjmrs;
	}

	public Double getPmwcgjmzgj() {
		return this.pmwcgjmzgj;
	}

	public void setPmwcgjmzgj(Double pmwcgjmzgj) {
		this.pmwcgjmzgj = pmwcgjmzgj;
	}

	public Double getPmwcgblj() {
		return this.pmwcgblj;
	}

	public void setPmwcgblj(Double pmwcgblj) {
		this.pmwcgblj = pmwcgblj;
	}

	public String getSlmc() {
		return this.slmc;
	}

	public void setSlmc(String slmc) {
		this.slmc = slmc;
	}

	public Double getFyje() {
		return this.fyje;
	}

	public void setFyje(Double fyje) {
		this.fyje = fyje;
	}

	public String getFyzl() {
		return this.fyzl;
	}

	public void setFyzl(String fyzl) {
		this.fyzl = fyzl;
	}

	public String getQsxzryxm() {
		return this.qsxzryxm;
	}

	public void setQsxzryxm(String qsxzryxm) {
		this.qsxzryxm = qsxzryxm;
	}

	public String getQsxzrylxfs() {
		return this.qsxzrylxfs;
	}

	public void setQsxzrylxfs(String qsxzrylxfs) {
		this.qsxzrylxfs = qsxzrylxfs;
	}

	public String getQsxzrygzdw() {
		return this.qsxzrygzdw;
	}

	public void setQsxzrygzdw(String qsxzrygzdw) {
		this.qsxzrygzdw = qsxzrygzdw;
	}

	public Date getHksj() {
		return this.hksj;
	}

	public void setHksj(Date hksj) {
		this.hksj = hksj;
	}

	public Double getHkje() {
		return this.hkje;
	}

	public void setHkje(Double hkje) {
		this.hkje = hkje;
	}

	public Double getHkfy() {
		return this.hkfy;
	}

	public void setHkfy(Double hkfy) {
		this.hkfy = hkfy;
	}

	public Double getHksr() {
		return this.hksr;
	}

	public void setHksr(Double hksr) {
		this.hksr = hksr;
	}

	public String getHkfkr() {
		return this.hkfkr;
	}

	public void setHkfkr(String hkfkr) {
		this.hkfkr = hkfkr;
	}

	public String getHkbz() {
		return this.hkbz;
	}

	public void setHkbz(String hkbz) {
		this.hkbz = hkbz;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public Long getPmwcgcs() {
		return pmwcgcs;
	}

	public void setPmwcgcs(Long pmwcgcs) {
		this.pmwcgcs = pmwcgcs;
	}

	public String getLsxm() {
		return lsxm;
	}

	public void setLsxm(String lsxm) {
		this.lsxm = lsxm;
	}

	public String getLxfs() {
		return lxfs;
	}

	public void setLxfs(String lxfs) {
		this.lxfs = lxfs;
	}

	public String getZxqk() {
		return zxqk;
	}

	public void setZxqk(String zxqk) {
		this.zxqk = zxqk;
	}

	public String getLrrbh() {
		return lrrbh;
	}

	public void setLrrbh(String lrrbh) {
		this.lrrbh = lrrbh;
	}

	public String getLrr() {
		return lrr;
	}

	public void setLrr(String lrr) {
		this.lrr = lrr;
	}

	public Date getLrrq() {
		return lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

}