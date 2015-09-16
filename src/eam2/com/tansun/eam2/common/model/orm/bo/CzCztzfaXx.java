package com.tansun.eam2.common.model.orm.bo;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

import com.tansun.eam2.zccz.vo.CztzfaXxVO;
import com.tansun.rdp4j.common.util.DateUtils;

/**
 * CzCztzfaXx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzCztzfaXx extends com.tansun.rdp4j.common.web.vo.CommonBO
		implements java.io.Serializable {

	private static final long serialVersionUID = -3771589541833937268L;
	private String id;
	private String lcid;
	private String cztzxmmc;
	private String bianhao;
	private String jhcd;
	private Date ngrq;
	private String ngbm;
	private String ngbmmc;
	private String ngr;
	private String ngrxm;
	private String lxdh;
	private String zcszwz;
	private String zclb;
	private String czsbfs;
	private String lcmc;
	private String cldzt;
	private String zcczsyzd;
	private String zcqs;
	private String pgjgmc;
	private String CCzfs;
	private Double zmyz;
	private Double zmjz;
	private Double yjczfy;
	private Double pgjz;
	private Double yjczhsje;
	private Double yjssje;
	private String yjssl;
	private String sfysbd;
	private String sfyczfa;
	private String sfysjqk;
	private String sfypgbg;
	private String qtsbcl;
	private String sfjpgsc;
	private Date pgbgsxqjzrq;
	private Long cbcs;
	private Long hgsccs;
	private Date sbrq;
	private String slxh;
	private String scczfaxxid;
	private String beizhu;
	private Date fblsj;
	private String hqbm;
	private String hqbmid;
	private String cscldid;
	private String cjtzsyyzd;
	private String CTzywlx;
	private String CFalb;
	private String fafl;
	private Double sqfyzje;
	private Double spfyzje;
	private Double zlzje;

	// Constructors

	/** default constructor */
	public CzCztzfaXx() {
	}
	
	public String getFblsjStr(){
		String val = "";
		if(this.fblsj != null){
			val = DateUtils.formatDate(this.fblsj, "yyyy-MM-dd HH:mm:ss");
		}
		return val;
	}

	public List<String> getZclbList(){
		if(StringUtils.isNotEmpty(this.zclb)){
			String[] zclbArray = this.zclb.split(",");
			List<String> zclbList = new ArrayList<String>();
			for(String zclb : zclbArray){
				zclbList.add(zclb);
			}
			return zclbList;
		}
		return null;
	}
		
	/** full constructor */
	public CzCztzfaXx(String lcid, String cztzxmmc, String bianhao,
			String jhcd, Date ngrq, String ngbm, String ngbmmc, String ngr,
			String ngrxm, String lxdh, String zcszwz, String zclb,
			String czsbfs, String lcmc, String cldzt, String zcczsyzd,
			String zcqs, String pgjgmc, String CCzfs, Double zmyz, Double zmjz,
			Double yjczfy, Double pgjz, Double yjczhsje, Double yjssje,
			String yjssl, String sfysbd, String sfyczfa, String sfysjqk,
			String sfypgbg, String qtsbcl, String sfjpgsc, Date pgbgsxqjzrq,
			Long cbcs, Long hgsccs, Date sbrq, String slxh, String scczfaxxid,
			String beizhu, Date fblsj, String hqbm, String cscldid,
			String cjtzsyyzd, String CTzywlx, String CFalb, String fafl,
			Double sqfyzje, Double spfyzje, Double zlzje ,String hqbmid) {
		this.lcid = lcid;
		this.cztzxmmc = cztzxmmc;
		this.bianhao = bianhao;
		this.jhcd = jhcd;
		this.ngrq = ngrq;
		this.ngbm = ngbm;
		this.ngbmmc = ngbmmc;
		this.ngr = ngr;
		this.ngrxm = ngrxm;
		this.lxdh = lxdh;
		this.zcszwz = zcszwz;
		this.zclb = zclb;
		this.czsbfs = czsbfs;
		this.lcmc = lcmc;
		this.cldzt = cldzt;
		this.zcczsyzd = zcczsyzd;
		this.zcqs = zcqs;
		this.pgjgmc = pgjgmc;
		this.CCzfs = CCzfs;
		this.zmyz = zmyz;
		this.zmjz = zmjz;
		this.yjczfy = yjczfy;
		this.pgjz = pgjz;
		this.yjczhsje = yjczhsje;
		this.yjssje = yjssje;
		this.yjssl = yjssl;
		this.sfysbd = sfysbd;
		this.sfyczfa = sfyczfa;
		this.sfysjqk = sfysjqk;
		this.sfypgbg = sfypgbg;
		this.qtsbcl = qtsbcl;
		this.sfjpgsc = sfjpgsc;
		this.pgbgsxqjzrq = pgbgsxqjzrq;
		this.cbcs = cbcs;
		this.hgsccs = hgsccs;
		this.sbrq = sbrq;
		this.slxh = slxh;
		this.scczfaxxid = scczfaxxid;
		this.beizhu = beizhu;
		this.fblsj = fblsj;
		this.hqbm = hqbm;
		this.hqbmid = hqbmid;
		this.cscldid = cscldid;
		this.cjtzsyyzd = cjtzsyyzd;
		this.CTzywlx = CTzywlx;
		this.CFalb = CFalb;
		this.fafl = fafl;
		this.sqfyzje = sqfyzje;
		this.spfyzje = spfyzje;
		this.zlzje = zlzje;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLcid() {
		return this.lcid;
	}

	public void setLcid(String lcid) {
		this.lcid = lcid;
	}

	public String getCztzxmmc() {
		return this.cztzxmmc;
	}

	public void setCztzxmmc(String cztzxmmc) {
		this.cztzxmmc = cztzxmmc;
	}

	public String getBianhao() {
		return this.bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

	public String getJhcd() {
		return this.jhcd;
	}

	public void setJhcd(String jhcd) {
		this.jhcd = jhcd;
	}

	public Date getNgrq() {
		return this.ngrq;
	}

	public void setNgrq(Date ngrq) {
		this.ngrq = ngrq;
	}

	public String getNgbm() {
		return this.ngbm;
	}

	public void setNgbm(String ngbm) {
		this.ngbm = ngbm;
	}

	public String getNgbmmc() {
		return this.ngbmmc;
	}

	public void setNgbmmc(String ngbmmc) {
		this.ngbmmc = ngbmmc;
	}

	public String getNgr() {
		return this.ngr;
	}

	public void setNgr(String ngr) {
		this.ngr = ngr;
	}

	public String getNgrxm() {
		return this.ngrxm;
	}

	public void setNgrxm(String ngrxm) {
		this.ngrxm = ngrxm;
	}

	public String getLxdh() {
		return this.lxdh;
	}

	public void setLxdh(String lxdh) {
		this.lxdh = lxdh;
	}

	public String getZcszwz() {
		return this.zcszwz;
	}

	public void setZcszwz(String zcszwz) {
		this.zcszwz = zcszwz;
	}

	public String getZclb() {
		return this.zclb;
	}

	public void setZclb(String zclb) {
		this.zclb = zclb;
	}

	public String getCzsbfs() {
		return this.czsbfs;
	}

	public void setCzsbfs(String czsbfs) {
		this.czsbfs = czsbfs;
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

	public String getZcczsyzd() {
		return this.zcczsyzd;
	}

	public void setZcczsyzd(String zcczsyzd) {
		this.zcczsyzd = zcczsyzd;
	}

	public String getZcqs() {
		return this.zcqs;
	}

	public void setZcqs(String zcqs) {
		this.zcqs = zcqs;
	}

	public String getPgjgmc() {
		return this.pgjgmc;
	}

	public void setPgjgmc(String pgjgmc) {
		this.pgjgmc = pgjgmc;
	}

	public String getCCzfs() {
		return this.CCzfs;
	}

	public void setCCzfs(String CCzfs) {
		this.CCzfs = CCzfs;
	}

	public Double getZmyz() {
		return this.zmyz;
	}

	public void setZmyz(Double zmyz) {
		this.zmyz = zmyz;
	}

	public Double getZmjz() {
		return this.zmjz;
	}

	public void setZmjz(Double zmjz) {
		this.zmjz = zmjz;
	}

	public Double getYjczfy() {
		return this.yjczfy;
	}

	public void setYjczfy(Double yjczfy) {
		this.yjczfy = yjczfy;
	}

	public Double getPgjz() {
		return this.pgjz;
	}

	public void setPgjz(Double pgjz) {
		this.pgjz = pgjz;
	}

	public Double getYjczhsje() {
		return this.yjczhsje;
	}

	public void setYjczhsje(Double yjczhsje) {
		this.yjczhsje = yjczhsje;
	}

	public Double getYjssje() {
		return this.yjssje;
	}

	public void setYjssje(Double yjssje) {
		this.yjssje = yjssje;
	}

	public String getSfysbd() {
		return this.sfysbd;
	}

	public void setSfysbd(String sfysbd) {
		this.sfysbd = sfysbd;
	}

	public String getSfyczfa() {
		return this.sfyczfa;
	}

	public void setSfyczfa(String sfyczfa) {
		this.sfyczfa = sfyczfa;
	}

	public String getSfysjqk() {
		return this.sfysjqk;
	}

	public void setSfysjqk(String sfysjqk) {
		this.sfysjqk = sfysjqk;
	}

	public String getSfypgbg() {
		return this.sfypgbg;
	}

	public void setSfypgbg(String sfypgbg) {
		this.sfypgbg = sfypgbg;
	}

	public String getQtsbcl() {
		return this.qtsbcl;
	}

	public void setQtsbcl(String qtsbcl) {
		this.qtsbcl = qtsbcl;
	}

	public String getSfjpgsc() {
		return this.sfjpgsc;
	}

	public void setSfjpgsc(String sfjpgsc) {
		this.sfjpgsc = sfjpgsc;
	}

	public Date getPgbgsxqjzrq() {
		return this.pgbgsxqjzrq;
	}

	public void setPgbgsxqjzrq(Date pgbgsxqjzrq) {
		this.pgbgsxqjzrq = pgbgsxqjzrq;
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

	public String getScczfaxxid() {
		return this.scczfaxxid;
	}

	public void setScczfaxxid(String scczfaxxid) {
		this.scczfaxxid = scczfaxxid;
	}

	public String getBeizhu() {
		return this.beizhu;
	}

	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}

	public Date getFblsj() {
		return this.fblsj;
	}

	public void setFblsj(Date fblsj) {
		this.fblsj = fblsj;
	}

	public String getHqbm() {
		return this.hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public String getCscldid() {
		return this.cscldid;
	}

	public void setCscldid(String cscldid) {
		this.cscldid = cscldid;
	}

	public String getCjtzsyyzd() {
		return this.cjtzsyyzd;
	}

	public void setCjtzsyyzd(String cjtzsyyzd) {
		this.cjtzsyyzd = cjtzsyyzd;
	}

	public String getCTzywlx() {
		return this.CTzywlx;
	}

	public void setCTzywlx(String CTzywlx) {
		this.CTzywlx = CTzywlx;
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

	public Double getZlzje() {
		return this.zlzje;
	}

	public void setZlzje(Double zlzje) {
		this.zlzje = zlzje;
	}

	@Override
	public String getMid() {
		return null;
	}

	public String getHqbmid() {
		return hqbmid;
	}

	public void setHqbmid(String hqbmid) {
		this.hqbmid = hqbmid;
	}

	public String getYjssl() {
		return yjssl;
	}

	public void setYjssl(String yjssl) {
		this.yjssl = yjssl;
	}
	
	public void copyVO(CztzfaXxVO vo){
		try {
			BeanUtils.copyProperties(this, vo);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}