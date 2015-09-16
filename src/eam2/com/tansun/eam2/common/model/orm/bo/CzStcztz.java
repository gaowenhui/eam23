package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;
import com.tansun.rdp4j.common.util.DateUtils;

import com.tansun.rdp4j.common.web.vo.CommonBO;
/**
 * CzStcztz entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzStcztz extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {
	private static final long serialVersionUID = -4586201531679896646L;
	
	public static final String renyuanPDK = "实体人员安置";
	public static final String zichanPDK = "资产处置";
	public static final String shitiPDK = "实体整体处置";
	
	private String id;
	private String lcId;
	private String czxmmc;
	private String bianhao;
	private String chengsong;
	private String jhcd;
	private String ngbmmc;
	private String ngbm;
	private String ngrxm;
	private String ngr;
	private Date ngrq;
	private String lxdh;
	private String czsbfs;
	private String hqbm;
	private String stid;
	private String zcbh;
	private String stmc;
	private String stscsf;
	private String stxz;
	private String stlx;
	private String stywyxzc;
	private String stywry;
	private String djtstyzr;
	private Double fzje;
	private String ryazfysfxjtdf;
	private Double dfje;
	private String gszmnsfyysfzje;
	private Double yjfzje;
	private Long azrs;
	private Double azfy;
	private String azsm;
	private String CCzfs;
	private String jydx;
	private Double zcpgz;
	private Double stpgz;
	private String pgjg;
	private Double zzc;
	private Double fuzhai;
	private String guben;
	private Double jzc;
	private Double shouru;
	private Double jlr;
	private String sfsh;
	private String lcmc;
	private String cldzt;
	private Long cbcs;
	private Long hgsccs;
	private Date sbrq;
	private String slxh;
	private String scfaxxid;
	private String beizhu;
	private String tzywlx;
	private Double zmzcze;
	private Double zmzcfz;
	private Date fblsj;
	private String tzfs;
	private Double tzje;
	private String czfs;
	private Double czje;
	private String gqgc;
	private String zzqk;
	private String bgdz;
	private Long strs;
	private Double zmtz;
	private String CWtgljg;
	private String CGlbm;
	private String czygsnsqk;
	private String zyyw;
	private String hqbmid;
	private String CFalb;
	private String fafl;
	private Double sqfyzje;
	private Double spfyzje;

	// Constructors

	public String getFblsjStr(){
		String val = "";
		if(this.fblsj != null){
			val = DateUtils.formatDate(this.fblsj, "yyyy-MM-dd HH:mm:ss");
		}
		return val;
	}
	/** default constructor */
	public CzStcztz() {
	}

	/** minimal constructor */
	public CzStcztz(String id) {
		this.id = id;
	}

	/** full constructor */
	public CzStcztz(String id, String lcId, String czxmmc, String bianhao, String chengsong, String jhcd, String ngbmmc, String ngbm, String ngrxm,
			String ngr, Date ngrq, String lxdh, String czsbfs, String hqbm, String stid, String zcbh, String stmc, String stscsf, String stxz,
			String stlx, String stywyxzc, String stywry, String djtstyzr, Double fzje, String ryazfysfxjtdf, Double dfje, String gszmnsfyysfzje,
			Double yjfzje, Long azrs, Double azfy, String azsm, String CCzfs, String jydx, Double zcpgz, Double stpgz, String pgjg, Double zzc,
			Double fuzhai, String guben, Double jzc, Double shouru, Double jlr, String sfsh, String lcmc, String cldzt, Long cbcs, Long hgsccs,
			Date sbrq, String slxh, String scfaxxid, String beizhu, String tzywlx, Double zmzcze, Double zmzcfz, Date fblsj, String tzfs,
			Double tzje, String czfs, Double czje, String gqgc, String zzqk, String bgdz, Long strs, Double zmtz, String CWtgljg, String CGlbm,
			String czygsnsqk, String zyyw, String hqbmid, String CFalb, String fafl, Double sqfyzje, Double spfyzje) {
		this.id = id;
		this.lcId = lcId;
		this.czxmmc = czxmmc;
		this.bianhao = bianhao;
		this.chengsong = chengsong;
		this.jhcd = jhcd;
		this.ngbmmc = ngbmmc;
		this.ngbm = ngbm;
		this.ngrxm = ngrxm;
		this.ngr = ngr;
		this.ngrq = ngrq;
		this.lxdh = lxdh;
		this.czsbfs = czsbfs;
		this.hqbm = hqbm;
		this.stid = stid;
		this.zcbh = zcbh;
		this.stmc = stmc;
		this.stscsf = stscsf;
		this.stxz = stxz;
		this.stlx = stlx;
		this.stywyxzc = stywyxzc;
		this.stywry = stywry;
		this.djtstyzr = djtstyzr;
		this.fzje = fzje;
		this.ryazfysfxjtdf = ryazfysfxjtdf;
		this.dfje = dfje;
		this.gszmnsfyysfzje = gszmnsfyysfzje;
		this.yjfzje = yjfzje;
		this.azrs = azrs;
		this.azfy = azfy;
		this.azsm = azsm;
		this.CCzfs = CCzfs;
		this.jydx = jydx;
		this.zcpgz = zcpgz;
		this.stpgz = stpgz;
		this.pgjg = pgjg;
		this.zzc = zzc;
		this.fuzhai = fuzhai;
		this.guben = guben;
		this.jzc = jzc;
		this.shouru = shouru;
		this.jlr = jlr;
		this.sfsh = sfsh;
		this.lcmc = lcmc;
		this.cldzt = cldzt;
		this.cbcs = cbcs;
		this.hgsccs = hgsccs;
		this.sbrq = sbrq;
		this.slxh = slxh;
		this.scfaxxid = scfaxxid;
		this.beizhu = beizhu;
		this.tzywlx = tzywlx;
		this.zmzcze = zmzcze;
		this.zmzcfz = zmzcfz;
		this.fblsj = fblsj;
		this.tzfs = tzfs;
		this.tzje = tzje;
		this.czfs = czfs;
		this.czje = czje;
		this.gqgc = gqgc;
		this.zzqk = zzqk;
		this.bgdz = bgdz;
		this.strs = strs;
		this.zmtz = zmtz;
		this.CWtgljg = CWtgljg;
		this.CGlbm = CGlbm;
		this.czygsnsqk = czygsnsqk;
		this.zyyw = zyyw;
		this.hqbmid = hqbmid;
		this.CFalb = CFalb;
		this.fafl = fafl;
		this.sqfyzje = sqfyzje;
		this.spfyzje = spfyzje;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLcId() {
		return this.lcId;
	}

	public void setLcId(String lcId) {
		this.lcId = lcId;
	}

	public String getCzxmmc() {
		return this.czxmmc;
	}

	public void setCzxmmc(String czxmmc) {
		this.czxmmc = czxmmc;
	}

	public String getBianhao() {
		return this.bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getChengsong() {
		return this.chengsong;
	}

	public void setChengsong(String chengsong) {
		this.chengsong = chengsong;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getNgbm() {
		return this.ngbm;
	}

	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
	}

	public String getNgrxm() {
		return this.ngrxm;
	}

	public void setNgrxm(String ngrxm) {
		this.ngrxm = ngrxm;
	}

	public String getNgr() {
		return this.ngr;
	}

	public void setNgr(String ngr) {
		this.ngr = ngr;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getCzsbfs() {
		return this.czsbfs;
	}

	public void setCzsbfs(String czsbfs) {
		this.czsbfs = czsbfs;
	}

	public String getHqbm() {
		return this.hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public String getStid() {
		return this.stid;
	}

	public void setStid(String stid) {
		this.stid = stid;
	}

	public String getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getStmc() {
		return this.stmc;
	}

	public void setStmc(String stmc) {
		this.stmc = stmc;
	}

	public String getStscsf() {
		return this.stscsf;
	}

	public void setStscsf(String stscsf) {
		this.stscsf = stscsf;
	}

	public String getStxz() {
		return this.stxz;
	}

	public void setStxz(String stxz) {
		this.stxz = stxz;
	}

	public String getStlx() {
		return this.stlx;
	}

	public void setStlx(String stlx) {
		this.stlx = stlx;
	}

	public String getStywyxzc() {
		return this.stywyxzc;
	}

	public void setStywyxzc(String stywyxzc) {
		this.stywyxzc = stywyxzc;
	}

	public String getStywry() {
		return this.stywry;
	}

	public void setStywry(String stywry) {
		this.stywry = stywry;
	}

	public String getDjtstyzr() {
		return this.djtstyzr;
	}

	public void setDjtstyzr(String djtstyzr) {
		this.djtstyzr = djtstyzr;
	}

	public Double getFzje() {
		return this.fzje;
	}

	public void setFzje(Double fzje) {
		this.fzje = fzje;
	}

	public String getRyazfysfxjtdf() {
		return this.ryazfysfxjtdf;
	}

	public void setRyazfysfxjtdf(String ryazfysfxjtdf) {
		this.ryazfysfxjtdf = ryazfysfxjtdf;
	}

	public Double getDfje() {
		return this.dfje;
	}

	public void setDfje(Double dfje) {
		this.dfje = dfje;
	}

	public String getGszmnsfyysfzje() {
		return this.gszmnsfyysfzje;
	}

	public void setGszmnsfyysfzje(String gszmnsfyysfzje) {
		this.gszmnsfyysfzje = gszmnsfyysfzje;
	}

	public Double getYjfzje() {
		return this.yjfzje;
	}

	public void setYjfzje(Double yjfzje) {
		this.yjfzje = yjfzje;
	}

	public Long getAzrs() {
		return this.azrs;
	}

	public void setAzrs(Long azrs) {
		this.azrs = azrs;
	}

	public Double getAzfy() {
		return this.azfy;
	}

	public void setAzfy(Double azfy) {
		this.azfy = azfy;
	}

	public String getAzsm() {
		return this.azsm;
	}

	public void setAzsm(String azsm) {
		this.azsm = azsm;
	}

	public String getCCzfs() {
		return this.CCzfs;
	}

	public void setCCzfs(String CCzfs) {
		this.CCzfs = CCzfs;
	}

	public String getJydx() {
		return this.jydx;
	}

	public void setJydx(String jydx) {
		this.jydx = jydx;
	}

	public Double getZcpgz() {
		return this.zcpgz;
	}

	public void setZcpgz(Double zcpgz) {
		this.zcpgz = zcpgz;
	}

	public Double getStpgz() {
		return this.stpgz;
	}

	public void setStpgz(Double stpgz) {
		this.stpgz = stpgz;
	}

	public String getPgjg() {
		return this.pgjg;
	}

	public void setPgjg(String pgjg) {
		this.pgjg = pgjg;
	}

	public Double getZzc() {
		return this.zzc;
	}

	public void setZzc(Double zzc) {
		this.zzc = zzc;
	}

	public Double getFuzhai() {
		return this.fuzhai;
	}

	public void setFuzhai(Double fuzhai) {
		this.fuzhai = fuzhai;
	}

	public String getGuben() {
		return this.guben;
	}

	public void setGuben(String guben) {
		this.guben = guben;
	}

	public Double getJzc() {
		return this.jzc;
	}

	public void setJzc(Double jzc) {
		this.jzc = jzc;
	}

	public Double getShouru() {
		return this.shouru;
	}

	public void setShouru(Double shouru) {
		this.shouru = shouru;
	}

	public Double getJlr() {
		return this.jlr;
	}

	public void setJlr(Double jlr) {
		this.jlr = jlr;
	}

	public String getSfsh() {
		return this.sfsh;
	}

	public void setSfsh(String sfsh) {
		this.sfsh = sfsh;
	}

	public String getLcmc() {
		return this.lcmc;
	}

	public void setLcmc(String lcmc) {
		this.lcmc = lcmc;
	}

	public String getCldzt() {
		return this.cldzt;
	}

	public void setCldzt(String cldzt) {
		this.cldzt = cldzt;
	}

	public Long getCbcs() {
		return this.cbcs;
	}

	public void setCbcs(Long cbcs) {
		this.cbcs = cbcs;
	}

	public Long getHgsccs() {
		return this.hgsccs;
	}

	public void setHgsccs(Long hgsccs) {
		this.hgsccs = hgsccs;
	}

	public Date getSbrq() {
		return this.sbrq;
	}

	public void setSbrq(Date sbrq) {
		this.sbrq = sbrq;
	}

	public String getSlxh() {
		return this.slxh;
	}

	public void setSlxh(String slxh) {
		this.slxh = slxh;
	}

	public String getScfaxxid() {
		return this.scfaxxid;
	}

	public void setScfaxxid(String scfaxxid) {
		this.scfaxxid = scfaxxid;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public String getTzywlx() {
		return this.tzywlx;
	}

	public void setTzywlx(String tzywlx) {
		this.tzywlx = tzywlx;
	}

	public Double getZmzcze() {
		return this.zmzcze;
	}

	public void setZmzcze(Double zmzcze) {
		this.zmzcze = zmzcze;
	}

	public Double getZmzcfz() {
		return this.zmzcfz;
	}

	public void setZmzcfz(Double zmzcfz) {
		this.zmzcfz = zmzcfz;
	}

	public Date getFblsj() {
		return this.fblsj;
	}

	public void setFblsj(Date fblsj) {
		this.fblsj = fblsj;
	}

	public String getTzfs() {
		return this.tzfs;
	}

	public void setTzfs(String tzfs) {
		this.tzfs = tzfs;
	}

	public Double getTzje() {
		return this.tzje;
	}

	public void setTzje(Double tzje) {
		this.tzje = tzje;
	}

	public String getCzfs() {
		return this.czfs;
	}

	public void setCzfs(String czfs) {
		this.czfs = czfs;
	}

	public Double getCzje() {
		return this.czje;
	}

	public void setCzje(Double czje) {
		this.czje = czje;
	}

	public String getGqgc() {
		return this.gqgc;
	}

	public void setGqgc(String gqgc) {
		this.gqgc = gqgc;
	}

	public String getZzqk() {
		return this.zzqk;
	}

	public void setZzqk(String zzqk) {
		this.zzqk = zzqk;
	}

	public String getBgdz() {
		return this.bgdz;
	}

	public void setBgdz(String bgdz) {
		this.bgdz = bgdz;
	}

	public Long getStrs() {
		return this.strs;
	}

	public void setStrs(Long strs) {
		this.strs = strs;
	}

	public Double getZmtz() {
		return this.zmtz;
	}

	public void setZmtz(Double zmtz) {
		this.zmtz = zmtz;
	}

	public String getCWtgljg() {
		return this.CWtgljg;
	}

	public void setCWtgljg(String CWtgljg) {
		this.CWtgljg = CWtgljg;
	}

	public String getCGlbm() {
		return this.CGlbm;
	}

	public void setCGlbm(String CGlbm) {
		this.CGlbm = CGlbm;
	}

	public String getCzygsnsqk() {
		return this.czygsnsqk;
	}

	public void setCzygsnsqk(String czygsnsqk) {
		this.czygsnsqk = czygsnsqk;
	}

	public String getZyyw() {
		return this.zyyw;
	}

	public void setZyyw(String zyyw) {
		this.zyyw = zyyw;
	}

	public String getHqbmid() {
		return this.hqbmid;
	}

	public void setHqbmid(String hqbmid) {
		this.hqbmid = hqbmid;
	}

	public String getCFalb() {
		return this.CFalb;
	}

	public void setCFalb(String CFalb) {
		this.CFalb = CFalb;
	}

	public String getFafl() {
		return this.fafl;
	}

	public void setFafl(String fafl) {
		this.fafl = fafl;
	}

	public Double getSqfyzje() {
		return this.sqfyzje;
	}

	public void setSqfyzje(Double sqfyzje) {
		this.sqfyzje = sqfyzje;
	}

	public Double getSpfyzje() {
		return this.spfyzje;
	}

	public void setSpfyzje(Double spfyzje) {
		this.spfyzje = spfyzje;
	}

	@Override
	public String getMid() {
		return null;
	}

}