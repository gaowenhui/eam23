package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * CzDisposeTrack entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzDisposeTrack extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = 3592046530074388718L;
	private String id;
	private String czgzfs;
	private String czgzhj;
	private String gkpmjgmc;
	private String gkpmsfzjtzjk;
	private String gkpmbzzjkyy;
	private Double gkpmblj;
	private String gkpmbljsfyxxf;
	private Long gkpmyxxfcs;
	private Double gkpmmcxffd;
	private String gkpmjtsfgg;
	private String pmsfcg;
	private String cgpms;
	private Date cgpmsj;
	private String cgpmdd;
	private Long cgpmjmrs;
	private Double cgpmcjj;
	private String cgpmmsr;
	private Double cgpmyjje;
	private String cgpmjkzffs;
	private Double cgpmje;
	private String sfwcgh;
	private String gpcqjysmc;
	private Double gppgj;
	private Date gpqsrq;
	private Date gpjsrq;
	private String gpsfcg;
	private Long gpyxmsrs;
	private Double gpcgcjje;
	private String xyzrmsr;
	private Double xyzrje;
	private String cqsfyswbc;
	private String cqbcwms;
	private String cqsfyhbbc;
	private Double cqbcje;
	private String zxpcfymc;
	private String zxsjjgmc;
	private String zxzqqcqk;
	private Date zxhksj;
	private Double zxje;
	private Date zxdjsj;
	private Date gqzrsj;
	private Double gqzrje;
	private String gqzrmsr;
	private String gqzqzrqk;
	private String gqsfwcbg;
	private String ryazsfpqls;
	private String ryazlsxm;
	private String ryazlslxfs;
	private String ryazsffbazgg;
	private String ryazstqsqkms;
	private String ryazsfqsst;
	private String ryazsffszc;
	private String ryazzcjg;
	private String ryazzcjieguo;
	private String ryazsfqsazxy;
	private String ryazxyqsqkms;
	private String xmid;
	private String zcid;

	// Constructors

	public String getXmid() {
		return xmid;
	}

	public void setXmid(String xmid) {
		this.xmid = xmid;
	}

	public String getZcid() {
		return zcid;
	}

	public void setZcid(String zcid) {
		this.zcid = zcid;
	}

	/** default constructor */
	public CzDisposeTrack() {
	}

	/** full constructor */
	public CzDisposeTrack(String czgzfs, String czgzhj, String gkpmjgmc,
			String gkpmsfzjtzjk, String gkpmbzzjkyy, Double gkpmblj,
			String gkpmbljsfyxxf, Long gkpmyxxfcs, Double gkpmmcxffd,
			String gkpmjtsfgg, String pmsfcg, String cgpms, Date cgpmsj,
			String cgpmdd, Long cgpmjmrs, Double cgpmcjj, String cgpmmsr,
			Double cgpmyjje, String cgpmjkzffs, Double cgpmje, String sfwcgh,
			String gpcqjysmc, Double gppgj, Date gpqsrq, Date gpjsrq,
			String gpsfcg, Long gpyxmsrs, Double gpcgcjje, String xyzrmsr,
			Double xyzrje, String cqsfyswbc, String cqbcwms, String cqsfyhbbc,
			Double cqbcje, String zxpcfymc, String zxsjjgmc, String zxzqqcqk,
			Date zxhksj, Double zxje, Date zxdjsj, Date gqzrsj, Double gqzrje,
			String gqzrmsr, String gqzqzrqk, String gqsfwcbg,
			String ryazsfpqls, String ryazlsxm, String ryazlslxfs,
			String ryazsffbazgg, String ryazstqsqkms, String ryazsfqsst,
			String ryazsffszc, String ryazzcjg, String ryazzcjieguo,
			String ryazsfqsazxy, String ryazxyqsqkms,String xmid,String zcid) {
		this.czgzfs = czgzfs;
		this.czgzhj = czgzhj;
		this.gkpmjgmc = gkpmjgmc;
		this.gkpmsfzjtzjk = gkpmsfzjtzjk;
		this.gkpmbzzjkyy = gkpmbzzjkyy;
		this.gkpmblj = gkpmblj;
		this.gkpmbljsfyxxf = gkpmbljsfyxxf;
		this.gkpmyxxfcs = gkpmyxxfcs;
		this.gkpmmcxffd = gkpmmcxffd;
		this.gkpmjtsfgg = gkpmjtsfgg;
		this.pmsfcg = pmsfcg;
		this.cgpms = cgpms;
		this.cgpmsj = cgpmsj;
		this.cgpmdd = cgpmdd;
		this.cgpmjmrs = cgpmjmrs;
		this.cgpmcjj = cgpmcjj;
		this.cgpmmsr = cgpmmsr;
		this.cgpmyjje = cgpmyjje;
		this.cgpmjkzffs = cgpmjkzffs;
		this.cgpmje = cgpmje;
		this.sfwcgh = sfwcgh;
		this.gpcqjysmc = gpcqjysmc;
		this.gppgj = gppgj;
		this.gpqsrq = gpqsrq;
		this.gpjsrq = gpjsrq;
		this.gpsfcg = gpsfcg;
		this.gpyxmsrs = gpyxmsrs;
		this.gpcgcjje = gpcgcjje;
		this.xyzrmsr = xyzrmsr;
		this.xyzrje = xyzrje;
		this.cqsfyswbc = cqsfyswbc;
		this.cqbcwms = cqbcwms;
		this.cqsfyhbbc = cqsfyhbbc;
		this.cqbcje = cqbcje;
		this.zxpcfymc = zxpcfymc;
		this.zxsjjgmc = zxsjjgmc;
		this.zxzqqcqk = zxzqqcqk;
		this.zxhksj = zxhksj;
		this.zxje = zxje;
		this.zxdjsj = zxdjsj;
		this.gqzrsj = gqzrsj;
		this.gqzrje = gqzrje;
		this.gqzrmsr = gqzrmsr;
		this.gqzqzrqk = gqzqzrqk;
		this.gqsfwcbg = gqsfwcbg;
		this.ryazsfpqls = ryazsfpqls;
		this.ryazlsxm = ryazlsxm;
		this.ryazlslxfs = ryazlslxfs;
		this.ryazsffbazgg = ryazsffbazgg;
		this.ryazstqsqkms = ryazstqsqkms;
		this.ryazsfqsst = ryazsfqsst;
		this.ryazsffszc = ryazsffszc;
		this.ryazzcjg = ryazzcjg;
		this.ryazzcjieguo = ryazzcjieguo;
		this.ryazsfqsazxy = ryazsfqsazxy;
		this.ryazxyqsqkms = ryazxyqsqkms;
		this.xmid = xmid;
		this.zcid = zcid;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCzgzfs() {
		return this.czgzfs;
	}

	public void setCzgzfs(String czgzfs) {
		this.czgzfs = czgzfs;
	}

	public String getCzgzhj() {
		return this.czgzhj;
	}

	public void setCzgzhj(String czgzhj) {
		this.czgzhj = czgzhj;
	}

	public String getGkpmjgmc() {
		return this.gkpmjgmc;
	}

	public void setGkpmjgmc(String gkpmjgmc) {
		this.gkpmjgmc = gkpmjgmc;
	}

	public String getGkpmsfzjtzjk() {
		return this.gkpmsfzjtzjk;
	}

	public void setGkpmsfzjtzjk(String gkpmsfzjtzjk) {
		this.gkpmsfzjtzjk = gkpmsfzjtzjk;
	}

	public String getGkpmbzzjkyy() {
		return this.gkpmbzzjkyy;
	}

	public void setGkpmbzzjkyy(String gkpmbzzjkyy) {
		this.gkpmbzzjkyy = gkpmbzzjkyy;
	}

	public Double getGkpmblj() {
		return this.gkpmblj;
	}

	public void setGkpmblj(Double gkpmblj) {
		this.gkpmblj = gkpmblj;
	}

	public String getGkpmbljsfyxxf() {
		return this.gkpmbljsfyxxf;
	}

	public void setGkpmbljsfyxxf(String gkpmbljsfyxxf) {
		this.gkpmbljsfyxxf = gkpmbljsfyxxf;
	}

	public Long getGkpmyxxfcs() {
		return this.gkpmyxxfcs;
	}

	public void setGkpmyxxfcs(Long gkpmyxxfcs) {
		this.gkpmyxxfcs = gkpmyxxfcs;
	}

	public Double getGkpmmcxffd() {
		return this.gkpmmcxffd;
	}

	public void setGkpmmcxffd(Double gkpmmcxffd) {
		this.gkpmmcxffd = gkpmmcxffd;
	}

	public String getGkpmjtsfgg() {
		return this.gkpmjtsfgg;
	}

	public void setGkpmjtsfgg(String gkpmjtsfgg) {
		this.gkpmjtsfgg = gkpmjtsfgg;
	}

	public String getPmsfcg() {
		return this.pmsfcg;
	}

	public void setPmsfcg(String pmsfcg) {
		this.pmsfcg = pmsfcg;
	}

	public String getCgpms() {
		return this.cgpms;
	}

	public void setCgpms(String cgpms) {
		this.cgpms = cgpms;
	}

	public Date getCgpmsj() {
		return this.cgpmsj;
	}

	public void setCgpmsj(Date cgpmsj) {
		this.cgpmsj = cgpmsj;
	}

	public String getCgpmdd() {
		return this.cgpmdd;
	}

	public void setCgpmdd(String cgpmdd) {
		this.cgpmdd = cgpmdd;
	}

	public Long getCgpmjmrs() {
		return this.cgpmjmrs;
	}

	public void setCgpmjmrs(Long cgpmjmrs) {
		this.cgpmjmrs = cgpmjmrs;
	}

	public Double getCgpmcjj() {
		return this.cgpmcjj;
	}

	public void setCgpmcjj(Double cgpmcjj) {
		this.cgpmcjj = cgpmcjj;
	}

	public String getCgpmmsr() {
		return this.cgpmmsr;
	}

	public void setCgpmmsr(String cgpmmsr) {
		this.cgpmmsr = cgpmmsr;
	}

	public Double getCgpmyjje() {
		return this.cgpmyjje;
	}

	public void setCgpmyjje(Double cgpmyjje) {
		this.cgpmyjje = cgpmyjje;
	}

	public String getCgpmjkzffs() {
		return this.cgpmjkzffs;
	}

	public void setCgpmjkzffs(String cgpmjkzffs) {
		this.cgpmjkzffs = cgpmjkzffs;
	}

	public Double getCgpmje() {
		return this.cgpmje;
	}

	public void setCgpmje(Double cgpmje) {
		this.cgpmje = cgpmje;
	}

	public String getSfwcgh() {
		return this.sfwcgh;
	}

	public void setSfwcgh(String sfwcgh) {
		this.sfwcgh = sfwcgh;
	}

	public String getGpcqjysmc() {
		return this.gpcqjysmc;
	}

	public void setGpcqjysmc(String gpcqjysmc) {
		this.gpcqjysmc = gpcqjysmc;
	}

	public Double getGppgj() {
		return this.gppgj;
	}

	public void setGppgj(Double gppgj) {
		this.gppgj = gppgj;
	}

	public Date getGpqsrq() {
		return this.gpqsrq;
	}

	public void setGpqsrq(Date gpqsrq) {
		this.gpqsrq = gpqsrq;
	}

	public Date getGpjsrq() {
		return this.gpjsrq;
	}

	public void setGpjsrq(Date gpjsrq) {
		this.gpjsrq = gpjsrq;
	}

	public String getGpsfcg() {
		return this.gpsfcg;
	}

	public void setGpsfcg(String gpsfcg) {
		this.gpsfcg = gpsfcg;
	}

	public Long getGpyxmsrs() {
		return this.gpyxmsrs;
	}

	public void setGpyxmsrs(Long gpyxmsrs) {
		this.gpyxmsrs = gpyxmsrs;
	}

	public Double getGpcgcjje() {
		return this.gpcgcjje;
	}

	public void setGpcgcjje(Double gpcgcjje) {
		this.gpcgcjje = gpcgcjje;
	}

	public String getXyzrmsr() {
		return this.xyzrmsr;
	}

	public void setXyzrmsr(String xyzrmsr) {
		this.xyzrmsr = xyzrmsr;
	}

	public Double getXyzrje() {
		return this.xyzrje;
	}

	public void setXyzrje(Double xyzrje) {
		this.xyzrje = xyzrje;
	}

	public String getCqsfyswbc() {
		return this.cqsfyswbc;
	}

	public void setCqsfyswbc(String cqsfyswbc) {
		this.cqsfyswbc = cqsfyswbc;
	}

	public String getCqbcwms() {
		return this.cqbcwms;
	}

	public void setCqbcwms(String cqbcwms) {
		this.cqbcwms = cqbcwms;
	}

	public String getCqsfyhbbc() {
		return this.cqsfyhbbc;
	}

	public void setCqsfyhbbc(String cqsfyhbbc) {
		this.cqsfyhbbc = cqsfyhbbc;
	}

	public Double getCqbcje() {
		return this.cqbcje;
	}

	public void setCqbcje(Double cqbcje) {
		this.cqbcje = cqbcje;
	}

	public String getZxpcfymc() {
		return this.zxpcfymc;
	}

	public void setZxpcfymc(String zxpcfymc) {
		this.zxpcfymc = zxpcfymc;
	}

	public String getZxsjjgmc() {
		return this.zxsjjgmc;
	}

	public void setZxsjjgmc(String zxsjjgmc) {
		this.zxsjjgmc = zxsjjgmc;
	}

	public String getZxzqqcqk() {
		return this.zxzqqcqk;
	}

	public void setZxzqqcqk(String zxzqqcqk) {
		this.zxzqqcqk = zxzqqcqk;
	}

	public Date getZxhksj() {
		return this.zxhksj;
	}

	public void setZxhksj(Date zxhksj) {
		this.zxhksj = zxhksj;
	}

	public Double getZxje() {
		return this.zxje;
	}

	public void setZxje(Double zxje) {
		this.zxje = zxje;
	}

	public Date getZxdjsj() {
		return this.zxdjsj;
	}

	public void setZxdjsj(Date zxdjsj) {
		this.zxdjsj = zxdjsj;
	}

	public Date getGqzrsj() {
		return this.gqzrsj;
	}

	public void setGqzrsj(Date gqzrsj) {
		this.gqzrsj = gqzrsj;
	}

	public Double getGqzrje() {
		return this.gqzrje;
	}

	public void setGqzrje(Double gqzrje) {
		this.gqzrje = gqzrje;
	}

	public String getGqzrmsr() {
		return this.gqzrmsr;
	}

	public void setGqzrmsr(String gqzrmsr) {
		this.gqzrmsr = gqzrmsr;
	}

	public String getGqzqzrqk() {
		return this.gqzqzrqk;
	}

	public void setGqzqzrqk(String gqzqzrqk) {
		this.gqzqzrqk = gqzqzrqk;
	}

	public String getGqsfwcbg() {
		return this.gqsfwcbg;
	}

	public void setGqsfwcbg(String gqsfwcbg) {
		this.gqsfwcbg = gqsfwcbg;
	}

	public String getRyazsfpqls() {
		return this.ryazsfpqls;
	}

	public void setRyazsfpqls(String ryazsfpqls) {
		this.ryazsfpqls = ryazsfpqls;
	}

	public String getRyazlsxm() {
		return this.ryazlsxm;
	}

	public void setRyazlsxm(String ryazlsxm) {
		this.ryazlsxm = ryazlsxm;
	}

	public String getRyazlslxfs() {
		return this.ryazlslxfs;
	}

	public void setRyazlslxfs(String ryazlslxfs) {
		this.ryazlslxfs = ryazlslxfs;
	}

	public String getRyazsffbazgg() {
		return this.ryazsffbazgg;
	}

	public void setRyazsffbazgg(String ryazsffbazgg) {
		this.ryazsffbazgg = ryazsffbazgg;
	}

	public String getRyazstqsqkms() {
		return this.ryazstqsqkms;
	}

	public void setRyazstqsqkms(String ryazstqsqkms) {
		this.ryazstqsqkms = ryazstqsqkms;
	}

	public String getRyazsfqsst() {
		return this.ryazsfqsst;
	}

	public void setRyazsfqsst(String ryazsfqsst) {
		this.ryazsfqsst = ryazsfqsst;
	}

	public String getRyazsffszc() {
		return this.ryazsffszc;
	}

	public void setRyazsffszc(String ryazsffszc) {
		this.ryazsffszc = ryazsffszc;
	}

	public String getRyazzcjg() {
		return this.ryazzcjg;
	}

	public void setRyazzcjg(String ryazzcjg) {
		this.ryazzcjg = ryazzcjg;
	}

	public String getRyazzcjieguo() {
		return this.ryazzcjieguo;
	}

	public void setRyazzcjieguo(String ryazzcjieguo) {
		this.ryazzcjieguo = ryazzcjieguo;
	}

	public String getRyazsfqsazxy() {
		return this.ryazsfqsazxy;
	}

	public void setRyazsfqsazxy(String ryazsfqsazxy) {
		this.ryazsfqsazxy = ryazsfqsazxy;
	}

	public String getRyazxyqsqkms() {
		return this.ryazxyqsqkms;
	}

	public void setRyazxyqsqkms(String ryazxyqsqkms) {
		this.ryazxyqsqkms = ryazxyqsqkms;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}