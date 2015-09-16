package com.tansun.eam2.stgl.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class ZCXXQueryVO extends CommonBO implements java.io.Serializable {

	 /**
     * 资产信息汇总查询条件
     *
     */
    //实体名称
    private String stmc;
    //资产类型
    private String stnzcfl;
    //账户
    private String hzhanghu;
    //土地名称
    private String jtdmc;
    //实际占有人
    private String jsjzyr;
    //土地是否抵押
    private String jtdsfdy;
    //土地使用权证
    private String jtdsyqz;
    //房屋名称
    private String kfwmc;
    //房屋实际占有人
    private String kfwsjzyr;
    //有无房屋使用权证
    private String kywfwsyqz;
    //房屋是否抵押
    private String ksfdy;
    //机器设备名称
    private String msbmc;
    //机器设备权属
    private String msbqs;
    //机器设备实际占有人
    private String msbsjzyr;
    //机器设备是否抵押
    private String msbsfdy;
    //交通工具名称（车牌号）
    private String lcph;
    //交通工具权属
    private String lqs;
    //交通工具实际占有人
    private String lsjzyr;
    //交通工具是否抵押
    private String lsfdy;
    //被投资企业名称
    private String nbtqymc;
    //投资方式
    private String ntzfs;
    //其他资产名称
    private String pqtzcmc;
    //其他资产权属
    private String pqtzcqs;
    //其他资产实际占有人
    private String pqtzcsjzyr;
    //其他资产是否抵押
    private String pqtzcsfdy;

    public String getHzhanghu() {
        return hzhanghu;
    }

    public void setHzhanghu(String hzhanghu) {
        this.hzhanghu = hzhanghu;
    }

    public String getJtdmc() {
        return jtdmc;
    }

    public void setJtdmc(String jtdmc) {
        this.jtdmc = jtdmc;
    }

    public String getJsjzyr() {
        return jsjzyr;
    }

    public void setJsjzyr(String jsjzyr) {
        this.jsjzyr = jsjzyr;
    }

    public String getJtdsfdy() {
        return jtdsfdy;
    }

    public void setJtdsfdy(String jtdsfdy) {
        this.jtdsfdy = jtdsfdy;
    }

    public String getJtdsyqz() {
        return jtdsyqz;
    }

    public void setJtdsyqz(String jtdsyqz) {
        this.jtdsyqz = jtdsyqz;
    }

    public String getKfwmc() {
        return kfwmc;
    }

    public void setKfwmc(String kfwmc) {
        this.kfwmc = kfwmc;
    }

    public String getKfwsjzyr() {
        return kfwsjzyr;
    }

    public void setKfwsjzyr(String kfwsjzyr) {
        this.kfwsjzyr = kfwsjzyr;
    }

    public String getKywfwsyqz() {
        return kywfwsyqz;
    }

    public void setKywfwsyqz(String kywfwsyqz) {
        this.kywfwsyqz = kywfwsyqz;
    }

    public String getKsfdy() {
        return ksfdy;
    }

    public void setKsfdy(String ksfdy) {
        this.ksfdy = ksfdy;
    }

    public String getMsbmc() {
        return msbmc;
    }

    public void setMsbmc(String msbmc) {
        this.msbmc = msbmc;
    }

    public String getMsbqs() {
        return msbqs;
    }

    public void setMsbqs(String msbqs) {
        this.msbqs = msbqs;
    }

    public String getMsbsjzyr() {
        return msbsjzyr;
    }

    public void setMsbsjzyr(String msbsjzyr) {
        this.msbsjzyr = msbsjzyr;
    }

    public String getMsbsfdy() {
        return msbsfdy;
    }

    public void setMsbsfdy(String msbsfdy) {
        this.msbsfdy = msbsfdy;
    }

    public String getLcph() {
        return lcph;
    }

    public void setLcph(String lcph) {
        this.lcph = lcph;
    }

    public String getLqs() {
        return lqs;
    }

    public void setLqs(String lqs) {
        this.lqs = lqs;
    }

    public String getLsjzyr() {
        return lsjzyr;
    }

    public void setLsjzyr(String lsjzyr) {
        this.lsjzyr = lsjzyr;
    }

    public String getLsfdy() {
        return lsfdy;
    }

    public void setLsfdy(String lsfdy) {
        this.lsfdy = lsfdy;
    }

    public String getNbtqymc() {
        return nbtqymc;
    }

    public void setNbtqymc(String nbtqymc) {
        this.nbtqymc = nbtqymc;
    }

    public String getNtzfs() {
        return ntzfs;
    }

    public void setNtzfs(String ntzfs) {
        this.ntzfs = ntzfs;
    }

    public String getPqtzcmc() {
        return pqtzcmc;
    }

    public void setPqtzcmc(String pqtzcmc) {
        this.pqtzcmc = pqtzcmc;
    }

    public String getPqtzcqs() {
        return pqtzcqs;
    }

    public void setPqtzcqs(String pqtzcqs) {
        this.pqtzcqs = pqtzcqs;
    }

    public String getPqtzcsjzyr() {
        return pqtzcsjzyr;
    }

    public void setPqtzcsjzyr(String pqtzcsjzyr) {
        this.pqtzcsjzyr = pqtzcsjzyr;
    }

    public String getPqtzcsfdy() {
        return pqtzcsfdy;
    }

    public void setPqtzcsfdy(String pqtzcsfdy) {
        this.pqtzcsfdy = pqtzcsfdy;
    }

    public String getStmc() {
        return stmc;
    }

    public void setStmc(String stmc) {
        this.stmc = stmc;
    }

    public String getStnzcfl() {
        return stnzcfl;
    }

    public void setStnzcfl(String stnzcfl) {
        this.stnzcfl = stnzcfl;
    }

    public String toString() {
        final String TAB = ", ";
        String retValue = "";
        retValue = "AssetQueryVO ( " + super.toString() + TAB + "stmc=" + this.stmc + TAB + "stnzcfl=" + this.stnzcfl + TAB + "hzhanghu=" + this.hzhanghu + TAB + "jtdmc=" + this.jtdmc + TAB + "jsjzyr=" + this.jsjzyr + TAB + "jtdsfdy=" + this.jtdsfdy + TAB + "jtdsyqz=" + this.jtdsyqz + TAB + "kfwmc=" + this.kfwmc + TAB + "kfwsjzyr=" + this.kfwsjzyr + TAB + "kywfwsyqz=" + this.kywfwsyqz + TAB + "ksfdy=" + this.ksfdy + TAB + "msbmc=" + this.msbmc + TAB + "msbqs=" + this.msbqs + TAB + "msbsjzyr=" + this.msbsjzyr + TAB + "msbsfdy=" + this.msbsfdy + TAB + "lcph=" + this.lcph + TAB + "lqs=" + this.lqs + TAB + "lsjzyr=" + this.lsjzyr + TAB + "lsfdy=" + this.lsfdy + TAB + "nbtqymc=" + this.nbtqymc + TAB + "ntzfs=" + this.ntzfs + TAB + "pqtzcmc=" + this.pqtzcmc + TAB + "pqtzcqs=" + this.pqtzcqs + TAB + "pqtzcsjzyr=" + this.pqtzcsjzyr + TAB + "pqtzcsfdy=" + this.pqtzcsfdy + " )";
        return retValue;
    }

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

   
	
}
