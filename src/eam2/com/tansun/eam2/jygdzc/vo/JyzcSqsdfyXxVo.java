package com.tansun.eam2.jygdzc.vo;

public class JyzcSqsdfyXxVo {
	//ID
	private String id;
	//资产ID
	private String zcId;
	//项目名称
	private String xmmc;
	//申请金额
	private String sqje;
	//审定金额
	private String sdje;
	
	//实际费用
	private String sjfy;
	//审批状态
	private String spzt;
	//处理单id
	private String cldId;
	public JyzcSqsdfyXxVo(String id, String zcId, String xmmc, String sqje,
			String sdje, String sjfy, String spzt, String cldId) {
		super();
		this.id = id;
		this.zcId = zcId;
		this.xmmc = xmmc;
		this.sqje = sqje;
		this.sdje = sdje;
		this.sjfy = sjfy;
		this.spzt = spzt;
		this.cldId = cldId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getSqje() {
		return sqje;
	}
	public void setSqje(String sqje) {
		this.sqje = sqje;
	}
	public String getSdje() {
		return sdje;
	}
	public void setSdje(String sdje) {
		this.sdje = sdje;
	}
	public String getSjfy() {
		return sjfy;
	}
	public void setSjfy(String sjfy) {
		this.sjfy = sjfy;
	}
	public String getSpzt() {
		return spzt;
	}
	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}
	public String getCldId() {
		return cldId;
	}
	public void setCldId(String cldId) {
		this.cldId = cldId;
	}
	public JyzcSqsdfyXxVo() {
		super();
	}
}
