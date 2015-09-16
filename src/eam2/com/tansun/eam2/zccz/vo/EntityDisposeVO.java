package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EntityDisposeVO extends CommonBO {
	private String id;
    private String cldid;
	private String cldbianhao;
	private String cldngbm;
	private String cldngr;
	private String cldczfs;
	private Double cldyz;
	private Double cldjz;
	private Double cldje;
	private Double cldyjczsr;
	private Double cldyjczfy;
	private Double cldyjss;
	private String cldczzclb;
    private String zcrxm;
    private String spwyxm;
	private String czxmmc;
	private String hycs;
	private String spjl;
	private String zhuangtai;
	private Double sjhs;
	private Double sjczfy;
	private String sbrq;
	private String slxh;
	private long kpzsl;
    public EntityDisposeVO(){
    }
    public EntityDisposeVO(String id, String cldid, String cldbianhao, 
    		String cldngbm, String cldngr, String cldczfs, String zcrxm, 
    		String czxmmc, String hycs, String zhuangtai,String sbrq) {
        this.id = id;
        this.cldid = cldid;
        this.cldbianhao = cldbianhao;
        this.cldngbm = cldngbm;
        this.cldngr = cldngr;
        this.cldczfs = cldczfs;
        this.zcrxm = zcrxm;
        this.czxmmc = czxmmc;
        this.hycs = hycs;
        this.zhuangtai = zhuangtai;
        this.sbrq = sbrq;
    }

    public String getCldid() {
        return cldid;
    }

    public void setCldid(String cldid) {
        this.cldid = cldid;
    }

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldbianhao() {
		return cldbianhao;
	}

	public void setCldbianhao(String cldbianhao) {
		this.cldbianhao = cldbianhao;
	}

	public String getCldngbm() {
		return cldngbm;
	}

	public void setCldngbm(String cldngbm) {
		this.cldngbm = cldngbm;
	}

	public String getCldngr() {
		return cldngr;
	}

	public void setCldngr(String cldngr) {
		this.cldngr = cldngr;
	}

	public String getCzxmmc() {
		return czxmmc;
	}

	public void setCzxmmc(String czxmmc) {
		this.czxmmc = czxmmc;
	}

	public String getCldczfs() {
		return cldczfs;
	}

	public void setCldczfs(String cldczfs) {
		this.cldczfs = cldczfs;
	}

	public String getCldczzclb() {
		return cldczzclb;
	}

	public void setCldczzclb(String cldczzclb) {
		this.cldczzclb = cldczzclb;
	}

	public Double getCldyz() {
		return cldyz;
	}

	public void setCldyz(Double cldyz) {
		this.cldyz = cldyz;
	}

	public Double getCldjz() {
		return cldjz;
	}

	public void setCldjz(Double cldjz) {
		this.cldjz = cldjz;
	}

	public Double getCldje() {
		return cldje;
	}

	public void setCldje(Double cldje) {
		this.cldje = cldje;
	}

	public Double getCldyjczsr() {
		return cldyjczsr;
	}

	public void setCldyjczsr(Double cldyjczsr) {
		this.cldyjczsr = cldyjczsr;
	}

	public Double getCldyjczfy() {
		return cldyjczfy;
	}

	public void setCldyjczfy(Double cldyjczfy) {
		this.cldyjczfy = cldyjczfy;
	}

	public Double getCldyjss() {
		return cldyjss;
	}

	public void setCldyjss(Double cldyjss) {
		this.cldyjss = cldyjss;
	}

	public String getHycs() {
		return hycs;
	}

	public void setHycs(String hycs) {
		this.hycs = hycs;
	}

	public String getSpjl() {
		return spjl;
	}

	public void setSpjl(String spjl) {
		this.spjl = spjl;
	}

	public String getZhuangtai() {
		return zhuangtai;
	}

	public void setZhuangtai(String zhuangtai) {
		this.zhuangtai = zhuangtai;
	}

	public Double getSjhs() {
		return sjhs;
	}

	public void setSjhs(Double sjhs) {
		this.sjhs = sjhs;
	}

	public Double getSjczfy() {
		return sjczfy;
	}

	public void setSjczfy(Double sjczfy) {
		this.sjczfy = sjczfy;
	}
	
	public String getSbrq() {
		return sbrq;
	}
	public void setSbrq(String sbrq) {
		this.sbrq = sbrq;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

    public String getSpwyxm() {
        return spwyxm;
    }

    public void setSpwyxm(String spwyxm) {
        this.spwyxm = spwyxm;
    }

    public String getZcrxm() {
        return zcrxm;
    }

    public void setZcrxm(String zcrxm) {
        this.zcrxm = zcrxm;
    }
	/**
	 * Constructs a <code>String</code> with all attributes
	 * in name = value format.
	 *
	 * @return a <code>String</code> representation 
	 * of this object.
	 */
	public String toString()
	{
	    final String TAB = "    ";
	    
	    String retValue = "";
	    
	    retValue = "EntityDisposeVO ( "
	        + super.toString() + TAB
	        + "id = " + this.id + TAB
	        + "cldid = " + this.cldid + TAB
	        + "cldbianhao = " + this.cldbianhao + TAB
	        + "cldngbm = " + this.cldngbm + TAB
	        + "cldngr = " + this.cldngr + TAB
	        + "cldczfs = " + this.cldczfs + TAB
	        + "cldyz = " + this.cldyz + TAB
	        + "cldjz = " + this.cldjz + TAB
	        + "cldje = " + this.cldje + TAB
	        + "cldyjczsr = " + this.cldyjczsr + TAB
	        + "cldyjczfy = " + this.cldyjczfy + TAB
	        + "cldyjss = " + this.cldyjss + TAB
	        + "cldczzclb = " + this.cldczzclb + TAB
	        + "zcrxm = " + this.zcrxm + TAB
	        + "spwyxm = " + this.spwyxm + TAB
	        + "czxmmc = " + this.czxmmc + TAB
	        + "hycs = " + this.hycs + TAB
	        + "spjl = " + this.spjl + TAB
	        + "zhuangtai = " + this.zhuangtai + TAB
	        + "sjhs = " + this.sjhs + TAB
	        + "sjczfy = " + this.sjczfy + TAB
	        + "sbrq = " + this.sbrq + TAB
	        + " )";
	
	    return retValue;
	}
	public String getSlxh() {
		return slxh;
	}
	public void setSlxh(String slxh) {
		this.slxh = slxh;
	}
	public long getKpzsl() {
		return kpzsl;
	}
	public void setKpzsl(long kpzsl) {
		this.kpzsl = kpzsl;
	}

    
}
