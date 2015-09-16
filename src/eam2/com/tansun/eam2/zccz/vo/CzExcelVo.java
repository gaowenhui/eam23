package com.tansun.eam2.zccz.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class CzExcelVo  extends CommonBO{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3804226972738194707L;

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	private String cldId ;
	private String cscldid ;
	private String assetType ;

	public String getCldId() {
		return cldId;
	}
	public void setCldId(String cldId) {
		this.cldId = cldId;
	}
	public String getCscldid() {
		return cscldid;
	}
	public void setCscldid(String cscldid) {
		this.cscldid = cscldid;
	}
	public String getAssetType() {
		return assetType;
	}
	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

}
