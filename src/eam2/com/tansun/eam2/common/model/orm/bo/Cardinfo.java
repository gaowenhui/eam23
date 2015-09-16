package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * Cardinfo entity.
 * 
 * @author MyEclipse Persistence Tools
 */
@Service
public class Cardinfo extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1397746001566325124L;
	private Long id;
	private String zcid;
	private Long bwid;
	private String cardcode;
	private String zcname;
	private String saveadsress;
	private String typecode;
	private String ggxh;
	private String addtype;
	private String zjtype;
	private String ifjc;
	private String glbm;
	private String usepartment;
	private String zjcdbm;
	private String usestatus;
	private String zcstatus;
	private String mainyt;
	private Date ksdate;
	private String qydate;
	private Double ybyz;
	private Double yzje;
	private Double yzjl;
	private Double ljzj;
	private Double jcz;
	private Double jczl;
	private Double jvalue;
	private Long syyx;
	private Long yjtyf;
	private Double jzzb;
	private Double jevalue;
	private String oldcode;
	private String pgqyz;
	private String pgqljzj;
	private String bzsm;
	private String fdjhm;
	private String clpxh;
	private String txff;
	private String txcdbm;
	private Long txnx;
	private Long ytxyf;
	private Double ytxe;
	private Double montxe;
	private Double wtxe;
	private String qszm;
	private String tdzhm;
	private String qzsyz;
	private String ysqdjz;
	private String oldyearyz;
	private String oldyearjz;
	private String oldjz;
	private String zyzt;
	private String cupxh;
	private String wzyp;
	private String nzyp;
	private String xsq;
	private String qpxh;
	private String nsave;
	private String sbxlh;
	private String gys;
	private String hthm;
	private String bxq;
	private String smbxq;
	private String sxbxq;
	private String yxtlry;
	private String username;
	private String zhcfzr;
	private String gdzcgly;
	private Date zxrq;
	private String fdzhm;
	private String ywdytd;
	private String dytdzh;
	private String dytdkp;
	private String jzmj;
	private String zdmj;
	private String zxmj;
	private String zyzk;
	private String rkdh;
	private Long parentid;
	private String childid;
	private String state;
	private Long lctempid;
	private Date lrrq;
	private String attachmenturl;
	private String oldcardid;
	private String changereason;
	private Double bcjt;
	private String firstbranch;
	private Long synx;
	private String erpassetcode;
	private String erppk;
	private String assetstate;
	private String memo1;
	private String dealmethod;
	private String usedPerson;
	private String usedWorkflowKey;
	private String sfzy;
	//add by liubeibei
	private ZyZc zyZc;
	private JyzcXx jyZc;
	
	/** default constructor */
	public Cardinfo() {
	}
	
	public JyzcXx getJyZc(PublicDao publicDao) {
		//根据zcid获得经营资产bo
		if("0".equals(this.getSfzy().trim())){
			String[] strs = new String[]{String.valueOf(this.getZcid())};
			jyZc = (JyzcXx)publicDao.findSingleResult("from JyzcXx o where o.id = ?", strs);
		}
		if(jyZc==null){
			jyZc = new JyzcXx();
		}
		return jyZc;
	}

	public void setJyZc(JyzcXx jyZc) {
		this.jyZc = jyZc;
	}

	public ZyZc getZyZc(PublicDao publicDao) {
		//根据id获得自用资产bo
		if("1".equals(this.getSfzy().trim())){
			String[] strs = new String[]{String.valueOf(this.getZcid())};
			zyZc = (ZyZc)publicDao.findSingleResult("from ZyZc o where o.id = ?", strs);
		}	
		if(zyZc==null){
			zyZc = new ZyZc();
		}
		return zyZc;
	}
	
	public ZyZc getZyZc() {
		return zyZc;
	}

	public JyzcXx getJyZc() {
		return jyZc;
	}

	public void setZyZc(ZyZc zyZc) {
		this.zyZc = zyZc;
	}
	/** full constructor */
	public Cardinfo(String zcid, Long bwid, String cardcode, String zcname,
			String saveadsress, String typecode, String ggxh, String addtype,
			String zjtype, String ifjc, String glbm, String usepartment,
			String zjcdbm, String usestatus, String zcstatus, String mainyt,
			Date ksdate, String qydate, Double ybyz, Double yzje, Double yzjl,
			Double ljzj, Double jcz, Double jczl, Double jvalue, Long syyx,
			Long yjtyf, Double jzzb, Double jevalue, String oldcode,
			String pgqyz, String pgqljzj, String bzsm, String fdjhm,
			String clpxh, String txff, String txcdbm, Long txnx, Long ytxyf,
			Double ytxe, Double montxe, Double wtxe, String qszm, String tdzhm,
			String qzsyz, String ysqdjz, String oldyearyz, String oldyearjz,
			String oldjz, String zyzt, String cupxh, String wzyp, String nzyp,
			String xsq, String qpxh, String nsave, String sbxlh, String gys,
			String hthm, String bxq, String smbxq, String sxbxq, String yxtlry,
			String username, String zhcfzr, String gdzcgly, Date zxrq,
			String fdzhm, String ywdytd, String dytdzh, String dytdkp,
			String jzmj, String zdmj, String zxmj, String zyzk, String rkdh,
			Long parentid, String childid, String state, Long lctempid,
			Date lrrq, String attachmenturl, String oldcardid,
			String changereason, Double bcjt, String firstbranch, Long synx,
			String erpassetcode, String erppk, String assetstate, String memo1,
			String dealmethod, String usedPerson, String usedWorkflowKey,
			String sfzy) {
		this.zcid = zcid;
		this.bwid = bwid;
		this.cardcode = cardcode;
		this.zcname = zcname;
		this.saveadsress = saveadsress;
		this.typecode = typecode;
		this.ggxh = ggxh;
		this.addtype = addtype;
		this.zjtype = zjtype;
		this.ifjc = ifjc;
		this.glbm = glbm;
		this.usepartment = usepartment;
		this.zjcdbm = zjcdbm;
		this.usestatus = usestatus;
		this.zcstatus = zcstatus;
		this.mainyt = mainyt;
		this.ksdate = ksdate;
		this.qydate = qydate;
		this.ybyz = ybyz;
		this.yzje = yzje;
		this.yzjl = yzjl;
		this.ljzj = ljzj;
		this.jcz = jcz;
		this.jczl = jczl;
		this.jvalue = jvalue;
		this.syyx = syyx;
		this.yjtyf = yjtyf;
		this.jzzb = jzzb;
		this.jevalue = jevalue;
		this.oldcode = oldcode;
		this.pgqyz = pgqyz;
		this.pgqljzj = pgqljzj;
		this.bzsm = bzsm;
		this.fdjhm = fdjhm;
		this.clpxh = clpxh;
		this.txff = txff;
		this.txcdbm = txcdbm;
		this.txnx = txnx;
		this.ytxyf = ytxyf;
		this.ytxe = ytxe;
		this.montxe = montxe;
		this.wtxe = wtxe;
		this.qszm = qszm;
		this.tdzhm = tdzhm;
		this.qzsyz = qzsyz;
		this.ysqdjz = ysqdjz;
		this.oldyearyz = oldyearyz;
		this.oldyearjz = oldyearjz;
		this.oldjz = oldjz;
		this.zyzt = zyzt;
		this.cupxh = cupxh;
		this.wzyp = wzyp;
		this.nzyp = nzyp;
		this.xsq = xsq;
		this.qpxh = qpxh;
		this.nsave = nsave;
		this.sbxlh = sbxlh;
		this.gys = gys;
		this.hthm = hthm;
		this.bxq = bxq;
		this.smbxq = smbxq;
		this.sxbxq = sxbxq;
		this.yxtlry = yxtlry;
		this.username = username;
		this.zhcfzr = zhcfzr;
		this.gdzcgly = gdzcgly;
		this.zxrq = zxrq;
		this.fdzhm = fdzhm;
		this.ywdytd = ywdytd;
		this.dytdzh = dytdzh;
		this.dytdkp = dytdkp;
		this.jzmj = jzmj;
		this.zdmj = zdmj;
		this.zxmj = zxmj;
		this.zyzk = zyzk;
		this.rkdh = rkdh;
		this.parentid = parentid;
		this.childid = childid;
		this.state = state;
		this.lctempid = lctempid;
		this.lrrq = lrrq;
		this.attachmenturl = attachmenturl;
		this.oldcardid = oldcardid;
		this.changereason = changereason;
		this.bcjt = bcjt;
		this.firstbranch = firstbranch;
		this.synx = synx;
		this.erpassetcode = erpassetcode;
		this.erppk = erppk;
		this.assetstate = assetstate;
		this.memo1 = memo1;
		this.dealmethod = dealmethod;
		this.usedPerson = usedPerson;
		this.usedWorkflowKey = usedWorkflowKey;
		this.sfzy = sfzy;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getZcid() {
		return zcid;
	}

	public void setZcid(String zcid) {
		this.zcid = zcid;
	}

	public Long getBwid() {
		return this.bwid;
	}

	public void setBwid(Long bwid) {
		this.bwid = bwid;
	}

	public String getCardcode() {
		return this.cardcode;
	}

	public void setCardcode(String cardcode) {
		this.cardcode = cardcode;
	}

	public String getZcname() {
		return this.zcname;
	}

	public void setZcname(String zcname) {
		this.zcname = zcname;
	}

	public String getSaveadsress() {
		return this.saveadsress;
	}

	public void setSaveadsress(String saveadsress) {
		this.saveadsress = saveadsress;
	}

	public String getTypecode() {
		return this.typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getGgxh() {
		return this.ggxh;
	}

	public void setGgxh(String ggxh) {
		this.ggxh = ggxh;
	}

	public String getAddtype() {
		return this.addtype;
	}

	public void setAddtype(String addtype) {
		this.addtype = addtype;
	}

	public String getZjtype() {
		return this.zjtype;
	}

	public void setZjtype(String zjtype) {
		this.zjtype = zjtype;
	}

	public String getIfjc() {
		return this.ifjc;
	}

	public void setIfjc(String ifjc) {
		this.ifjc = ifjc;
	}

	public String getGlbm() {
		return this.glbm;
	}

	public void setGlbm(String glbm) {
		this.glbm = glbm;
	}

	public String getUsepartment() {
		return this.usepartment;
	}

	public void setUsepartment(String usepartment) {
		this.usepartment = usepartment;
	}

	public String getZjcdbm() {
		return this.zjcdbm;
	}

	public void setZjcdbm(String zjcdbm) {
		this.zjcdbm = zjcdbm;
	}

	public String getUsestatus() {
		return this.usestatus;
	}

	public void setUsestatus(String usestatus) {
		this.usestatus = usestatus;
	}

	public String getZcstatus() {
		return this.zcstatus;
	}

	public void setZcstatus(String zcstatus) {
		this.zcstatus = zcstatus;
	}

	public String getMainyt() {
		return this.mainyt;
	}

	public void setMainyt(String mainyt) {
		this.mainyt = mainyt;
	}

	public Date getKsdate() {
		return this.ksdate;
	}

	public void setKsdate(Date ksdate) {
		this.ksdate = ksdate;
	}

	public String getQydate() {
		return this.qydate;
	}

	public void setQydate(String qydate) {
		this.qydate = qydate;
	}

	public Double getYbyz() {
		return this.ybyz;
	}

	public void setYbyz(Double ybyz) {
		this.ybyz = ybyz;
	}

	public Double getYzje() {
		return this.yzje;
	}

	public void setYzje(Double yzje) {
		this.yzje = yzje;
	}

	public Double getYzjl() {
		return this.yzjl;
	}

	public void setYzjl(Double yzjl) {
		this.yzjl = yzjl;
	}

	public Double getLjzj() {
		return this.ljzj;
	}

	public void setLjzj(Double ljzj) {
		this.ljzj = ljzj;
	}

	public Double getJcz() {
		return this.jcz;
	}

	public void setJcz(Double jcz) {
		this.jcz = jcz;
	}

	public Double getJczl() {
		return this.jczl;
	}

	public void setJczl(Double jczl) {
		this.jczl = jczl;
	}

	public Double getJvalue() {
		return this.jvalue;
	}

	public void setJvalue(Double jvalue) {
		this.jvalue = jvalue;
	}

	public Long getSyyx() {
		return this.syyx;
	}

	public void setSyyx(Long syyx) {
		this.syyx = syyx;
	}

	public Long getYjtyf() {
		return this.yjtyf;
	}

	public void setYjtyf(Long yjtyf) {
		this.yjtyf = yjtyf;
	}

	public Double getJzzb() {
		return this.jzzb;
	}

	public void setJzzb(Double jzzb) {
		this.jzzb = jzzb;
	}

	public Double getJevalue() {
		return this.jevalue;
	}

	public void setJevalue(Double jevalue) {
		this.jevalue = jevalue;
	}

	public String getOldcode() {
		return this.oldcode;
	}

	public void setOldcode(String oldcode) {
		this.oldcode = oldcode;
	}

	public String getPgqyz() {
		return this.pgqyz;
	}

	public void setPgqyz(String pgqyz) {
		this.pgqyz = pgqyz;
	}

	public String getPgqljzj() {
		return this.pgqljzj;
	}

	public void setPgqljzj(String pgqljzj) {
		this.pgqljzj = pgqljzj;
	}

	public String getBzsm() {
		return this.bzsm;
	}

	public void setBzsm(String bzsm) {
		this.bzsm = bzsm;
	}

	public String getFdjhm() {
		return this.fdjhm;
	}

	public void setFdjhm(String fdjhm) {
		this.fdjhm = fdjhm;
	}

	public String getClpxh() {
		return this.clpxh;
	}

	public void setClpxh(String clpxh) {
		this.clpxh = clpxh;
	}

	public String getTxff() {
		return this.txff;
	}

	public void setTxff(String txff) {
		this.txff = txff;
	}

	public String getTxcdbm() {
		return this.txcdbm;
	}

	public void setTxcdbm(String txcdbm) {
		this.txcdbm = txcdbm;
	}

	public Long getTxnx() {
		return this.txnx;
	}

	public void setTxnx(Long txnx) {
		this.txnx = txnx;
	}

	public Long getYtxyf() {
		return this.ytxyf;
	}

	public void setYtxyf(Long ytxyf) {
		this.ytxyf = ytxyf;
	}

	public Double getYtxe() {
		return this.ytxe;
	}

	public void setYtxe(Double ytxe) {
		this.ytxe = ytxe;
	}

	public Double getMontxe() {
		return this.montxe;
	}

	public void setMontxe(Double montxe) {
		this.montxe = montxe;
	}

	public Double getWtxe() {
		return this.wtxe;
	}

	public void setWtxe(Double wtxe) {
		this.wtxe = wtxe;
	}

	public String getQszm() {
		return this.qszm;
	}

	public void setQszm(String qszm) {
		this.qszm = qszm;
	}

	public String getTdzhm() {
		return this.tdzhm;
	}

	public void setTdzhm(String tdzhm) {
		this.tdzhm = tdzhm;
	}

	public String getQzsyz() {
		return this.qzsyz;
	}

	public void setQzsyz(String qzsyz) {
		this.qzsyz = qzsyz;
	}

	public String getYsqdjz() {
		return this.ysqdjz;
	}

	public void setYsqdjz(String ysqdjz) {
		this.ysqdjz = ysqdjz;
	}

	public String getOldyearyz() {
		return this.oldyearyz;
	}

	public void setOldyearyz(String oldyearyz) {
		this.oldyearyz = oldyearyz;
	}

	public String getOldyearjz() {
		return this.oldyearjz;
	}

	public void setOldyearjz(String oldyearjz) {
		this.oldyearjz = oldyearjz;
	}

	public String getOldjz() {
		return this.oldjz;
	}

	public void setOldjz(String oldjz) {
		this.oldjz = oldjz;
	}

	public String getZyzt() {
		return this.zyzt;
	}

	public void setZyzt(String zyzt) {
		this.zyzt = zyzt;
	}

	public String getCupxh() {
		return this.cupxh;
	}

	public void setCupxh(String cupxh) {
		this.cupxh = cupxh;
	}

	public String getWzyp() {
		return this.wzyp;
	}

	public void setWzyp(String wzyp) {
		this.wzyp = wzyp;
	}

	public String getNzyp() {
		return this.nzyp;
	}

	public void setNzyp(String nzyp) {
		this.nzyp = nzyp;
	}

	public String getXsq() {
		return this.xsq;
	}

	public void setXsq(String xsq) {
		this.xsq = xsq;
	}

	public String getQpxh() {
		return this.qpxh;
	}

	public void setQpxh(String qpxh) {
		this.qpxh = qpxh;
	}

	public String getNsave() {
		return this.nsave;
	}

	public void setNsave(String nsave) {
		this.nsave = nsave;
	}

	public String getSbxlh() {
		return this.sbxlh;
	}

	public void setSbxlh(String sbxlh) {
		this.sbxlh = sbxlh;
	}

	public String getGys() {
		return this.gys;
	}

	public void setGys(String gys) {
		this.gys = gys;
	}

	public String getHthm() {
		return this.hthm;
	}

	public void setHthm(String hthm) {
		this.hthm = hthm;
	}

	public String getBxq() {
		return this.bxq;
	}

	public void setBxq(String bxq) {
		this.bxq = bxq;
	}

	public String getSmbxq() {
		return this.smbxq;
	}

	public void setSmbxq(String smbxq) {
		this.smbxq = smbxq;
	}

	public String getSxbxq() {
		return this.sxbxq;
	}

	public void setSxbxq(String sxbxq) {
		this.sxbxq = sxbxq;
	}

	public String getYxtlry() {
		return this.yxtlry;
	}

	public void setYxtlry(String yxtlry) {
		this.yxtlry = yxtlry;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getZhcfzr() {
		return this.zhcfzr;
	}

	public void setZhcfzr(String zhcfzr) {
		this.zhcfzr = zhcfzr;
	}

	public String getGdzcgly() {
		return this.gdzcgly;
	}

	public void setGdzcgly(String gdzcgly) {
		this.gdzcgly = gdzcgly;
	}

	public Date getZxrq() {
		return this.zxrq;
	}

	public void setZxrq(Date zxrq) {
		this.zxrq = zxrq;
	}

	public String getFdzhm() {
		return this.fdzhm;
	}

	public void setFdzhm(String fdzhm) {
		this.fdzhm = fdzhm;
	}

	public String getYwdytd() {
		return this.ywdytd;
	}

	public void setYwdytd(String ywdytd) {
		this.ywdytd = ywdytd;
	}

	public String getDytdzh() {
		return this.dytdzh;
	}

	public void setDytdzh(String dytdzh) {
		this.dytdzh = dytdzh;
	}

	public String getDytdkp() {
		return this.dytdkp;
	}

	public void setDytdkp(String dytdkp) {
		this.dytdkp = dytdkp;
	}

	public String getJzmj() {
		return this.jzmj;
	}

	public void setJzmj(String jzmj) {
		this.jzmj = jzmj;
	}

	public String getZdmj() {
		return this.zdmj;
	}

	public void setZdmj(String zdmj) {
		this.zdmj = zdmj;
	}

	public String getZxmj() {
		return this.zxmj;
	}

	public void setZxmj(String zxmj) {
		this.zxmj = zxmj;
	}

	public String getZyzk() {
		return this.zyzk;
	}

	public void setZyzk(String zyzk) {
		this.zyzk = zyzk;
	}

	public String getRkdh() {
		return this.rkdh;
	}

	public void setRkdh(String rkdh) {
		this.rkdh = rkdh;
	}

	public Long getParentid() {
		return this.parentid;
	}

	public void setParentid(Long parentid) {
		this.parentid = parentid;
	}

	public String getChildid() {
		return this.childid;
	}

	public void setChildid(String childid) {
		this.childid = childid;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Long getLctempid() {
		return this.lctempid;
	}

	public void setLctempid(Long lctempid) {
		this.lctempid = lctempid;
	}

	public Date getLrrq() {
		return this.lrrq;
	}

	public void setLrrq(Date lrrq) {
		this.lrrq = lrrq;
	}

	public String getAttachmenturl() {
		return this.attachmenturl;
	}

	public void setAttachmenturl(String attachmenturl) {
		this.attachmenturl = attachmenturl;
	}

	public String getOldcardid() {
		return this.oldcardid;
	}

	public void setOldcardid(String oldcardid) {
		this.oldcardid = oldcardid;
	}

	public String getChangereason() {
		return this.changereason;
	}

	public void setChangereason(String changereason) {
		this.changereason = changereason;
	}

	public Double getBcjt() {
		return this.bcjt;
	}

	public void setBcjt(Double bcjt) {
		this.bcjt = bcjt;
	}

	public String getFirstbranch() {
		return this.firstbranch;
	}

	public void setFirstbranch(String firstbranch) {
		this.firstbranch = firstbranch;
	}

	public Long getSynx() {
		return this.synx;
	}

	public void setSynx(Long synx) {
		this.synx = synx;
	}

	public String getErpassetcode() {
		return this.erpassetcode;
	}

	public void setErpassetcode(String erpassetcode) {
		this.erpassetcode = erpassetcode;
	}

	public String getErppk() {
		return this.erppk;
	}

	public void setErppk(String erppk) {
		this.erppk = erppk;
	}

	public String getAssetstate() {
		return this.assetstate;
	}

	public void setAssetstate(String assetstate) {
		this.assetstate = assetstate;
	}

	public String getMemo1() {
		return this.memo1;
	}

	public void setMemo1(String memo1) {
		this.memo1 = memo1;
	}

	public String getDealmethod() {
		return this.dealmethod;
	}

	public void setDealmethod(String dealmethod) {
		this.dealmethod = dealmethod;
	}

	public String getUsedPerson() {
		return this.usedPerson;
	}

	public void setUsedPerson(String usedPerson) {
		this.usedPerson = usedPerson;
	}

	public String getUsedWorkflowKey() {
		return this.usedWorkflowKey;
	}

	public void setUsedWorkflowKey(String usedWorkflowKey) {
		this.usedWorkflowKey = usedWorkflowKey;
	}

	public String getSfzy() {
		return this.sfzy;
	}

	public void setSfzy(String sfzy) {
		this.sfzy = sfzy;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}