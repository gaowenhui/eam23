package com.tansun.eam2.common.model.orm.bo;

/**
 * CzAzryXx entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class CzAzryXx extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	private static final long serialVersionUID = 3110407808286662243L;
	private String id;
	private String cldId;
	private String stId;
	private String stFsxxId;
	private String zcbh;
	private String rybh;
	private String xingming;
	private String fyddh;
	private String fgddh;
	private String fazfs;
	private Double fazfy;
	private String cldzt;
	private String gzxx;
	private String azrysffszc;
	private String azryzcjg;
	private String azryzcjieguo;
	private String azrysfqsst;
	private String azrystqsqkms;
	private String azrysfqsazxy;
	private String azryxyqsqkms;
	private String azryfjxzUrl;
	private String azryfjscUrl;
	private String azxyxzUrl;
	private String azxyscUrl;
	private Double fsjazfy;

	// Constructors

	/** default constructor */
	public CzAzryXx() {
	}

	/** full constructor */
	public CzAzryXx(String cldId, String stId, String stFsxxId, String zcbh,
			String rybh, String xingming, String fyddh, String fgddh,
			String fazfs, Double fazfy, String cldzt, String gzxx,
			String azrysffszc, String azryzcjg, String azryzcjieguo,
			String azrysfqsst, String azrystqsqkms, String azrysfqsazxy,
			String azryxyqsqkms, String azryfjxzUrl, String azryfjscUrl,
			String azxyxzUrl, String azxyscUrl,Double fsjazfy) {
		this.cldId = cldId;
		this.stId = stId;
		this.stFsxxId = stFsxxId;
		this.zcbh = zcbh;
		this.rybh = rybh;
		this.xingming = xingming;
		this.fyddh = fyddh;
		this.fgddh = fgddh;
		this.fazfs = fazfs;
		this.fazfy = fazfy;
		this.cldzt = cldzt;
		this.gzxx = gzxx;
		this.azrysffszc = azrysffszc;
		this.azryzcjg = azryzcjg;
		this.azryzcjieguo = azryzcjieguo;
		this.azrysfqsst = azrysfqsst;
		this.azrystqsqkms = azrystqsqkms;
		this.azrysfqsazxy = azrysfqsazxy;
		this.azryxyqsqkms = azryxyqsqkms;
		this.azryfjxzUrl = azryfjxzUrl;
		this.azryfjscUrl = azryfjscUrl;
		this.azxyxzUrl = azxyxzUrl;
		this.azxyscUrl = azxyscUrl;
		this.fsjazfy = fsjazfy;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCldId() {
		return this.cldId;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public String getStId() {
		return this.stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

	public String getStFsxxId() {
		return this.stFsxxId;
	}

	public void setStFsxxId(String stFsxxId) {
		this.stFsxxId = stFsxxId;
	}

	public String getZcbh() {
		return this.zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public String getRybh() {
		return this.rybh;
	}

	public void setRybh(String rybh) {
		this.rybh = rybh;
	}

	public String getXingming() {
		return this.xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}

	public String getFyddh() {
		return this.fyddh;
	}

	public void setFyddh(String fyddh) {
		this.fyddh = fyddh;
	}

	public String getFgddh() {
		return this.fgddh;
	}

	public void setFgddh(String fgddh) {
		this.fgddh = fgddh;
	}

	public String getFazfs() {
		return this.fazfs;
	}

	public void setFazfs(String fazfs) {
		this.fazfs = fazfs;
	}

	public Double getFazfy() {
		return this.fazfy;
	}

	public void setFazfy(Double fazfy) {
		this.fazfy = fazfy;
	}

	public String getCldzt() {
		return this.cldzt;
	}

	public void setCldzt(String cldzt) {
		this.cldzt = cldzt;
	}

	public String getGzxx() {
		return this.gzxx;
	}

	public void setGzxx(String gzxx) {
		this.gzxx = gzxx;
	}

	public String getAzrysffszc() {
		return this.azrysffszc;
	}

	public void setAzrysffszc(String azrysffszc) {
		this.azrysffszc = azrysffszc;
	}

	public String getAzryzcjg() {
		return this.azryzcjg;
	}

	public void setAzryzcjg(String azryzcjg) {
		this.azryzcjg = azryzcjg;
	}

	public String getAzryzcjieguo() {
		return this.azryzcjieguo;
	}

	public void setAzryzcjieguo(String azryzcjieguo) {
		this.azryzcjieguo = azryzcjieguo;
	}

	public String getAzrysfqsst() {
		return this.azrysfqsst;
	}

	public void setAzrysfqsst(String azrysfqsst) {
		this.azrysfqsst = azrysfqsst;
	}

	public String getAzrystqsqkms() {
		return this.azrystqsqkms;
	}

	public void setAzrystqsqkms(String azrystqsqkms) {
		this.azrystqsqkms = azrystqsqkms;
	}

	public String getAzrysfqsazxy() {
		return this.azrysfqsazxy;
	}

	public void setAzrysfqsazxy(String azrysfqsazxy) {
		this.azrysfqsazxy = azrysfqsazxy;
	}

	public String getAzryxyqsqkms() {
		return this.azryxyqsqkms;
	}

	public void setAzryxyqsqkms(String azryxyqsqkms) {
		this.azryxyqsqkms = azryxyqsqkms;
	}

	public String getAzryfjxzUrl() {
		return this.azryfjxzUrl;
	}

	public void setAzryfjxzUrl(String azryfjxzUrl) {
		this.azryfjxzUrl = azryfjxzUrl;
	}

	public String getAzryfjscUrl() {
		return this.azryfjscUrl;
	}

	public void setAzryfjscUrl(String azryfjscUrl) {
		this.azryfjscUrl = azryfjscUrl;
	}

	public String getAzxyxzUrl() {
		return this.azxyxzUrl;
	}

	public void setAzxyxzUrl(String azxyxzUrl) {
		this.azxyxzUrl = azxyxzUrl;
	}

	public String getAzxyscUrl() {
		return this.azxyscUrl;
	}

	public void setAzxyscUrl(String azxyscUrl) {
		this.azxyscUrl = azxyscUrl;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public Double getFsjazfy() {
		return fsjazfy;
	}

	public void setFsjazfy(Double fsjazfy) {
		this.fsjazfy = fsjazfy;
	}


}