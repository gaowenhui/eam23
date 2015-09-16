package com.tansun.eam2.stgl.vo;

public class AllAssetQueryResultVO extends QueryResultVO {

    /**
     * 所有资产查询结果
     */
    private static final long serialVersionUID = 1L;
    //名称
    private String zmingcheng;
    //实际占有人
    private String zsjzyr;
    //存放何处
    private String zcfhc;
    //权属
    private String zquanshu;
    //抵押
    private String zdiya;
    //评估值
    private Double zpgz;
    //变限额
    private Double zbxe;
    //描述
    private String zmiaoshu;

    public String getZmingcheng() {
        return zmingcheng;
    }

    public void setZmingcheng(String zmingcheng) {
        this.zmingcheng = zmingcheng;
    }

    public String getZsjzyr() {
        return zsjzyr;
    }

    public void setZsjzyr(String zsjzyr) {
        this.zsjzyr = zsjzyr;
    }

    public String getZcfhc() {
        return zcfhc;
    }

    public void setZcfhc(String zcfhc) {
        this.zcfhc = zcfhc;
    }

    public String getZquanshu() {
        return zquanshu;
    }

    public void setZquanshu(String zquanshu) {
        this.zquanshu = zquanshu;
    }

    public String getZdiya() {
        return zdiya;
    }

    public void setZdiya(String zdiya) {
        this.zdiya = zdiya;
    }

    public Double getZpgz() {
        return zpgz;
    }

    public void setZpgz(Double zpgz) {
        this.zpgz = zpgz;
    }

    public Double getZbxe() {
        return zbxe;
    }

    public void setZbxe(Double zbxe) {
        this.zbxe = zbxe;
    }

    public String getZmiaoshu() {
        return zmiaoshu;
    }

    public void setZmiaoshu(String zmiaoshu) {
        this.zmiaoshu = zmiaoshu;
    }

    public String toString() {
        final String TAB = ", ";
        String retValue = "";
        retValue = "AllAssetQueryResultVO ( " + super.toString() + TAB + "zmingcheng=" + this.zmingcheng + TAB + "zsjzyr=" + this.zsjzyr + TAB + "zcfhc=" + this.zcfhc + TAB + "zquanshu=" + this.zquanshu + TAB + "zdiya=" + this.zdiya + TAB + "zpgz=" + this.zpgz + TAB + "zbxe=" + this.zbxe + TAB + "zmiaoshu=" + this.zmiaoshu + " )";
        return retValue;
    }
}
