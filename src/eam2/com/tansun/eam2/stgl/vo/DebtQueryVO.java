package com.tansun.eam2.stgl.vo;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;

public class DebtQueryVO extends DebtInfo implements java.io.Serializable {

    /**
     * 债权债务汇总查询条件
     *
     */
    //实体名称
    private String stzwmc;
    //债权债务类型
    public String leixing;
    //债权期限(天)最大值
    private Long zqqxMax;
    //债权期限(天)最小值
    private Long zqqxMin;
    //是否诉讼
    private String sfss;
    
    private String sfValue;
    public String getStzwmc() {
        return stzwmc;
    }

    public void setStzwmc(String stzwmc) {
        this.stzwmc = stzwmc;
    }

    public String getLeixing() {
        return leixing;
    }

    public void setLeixing(String leixing) {
        this.leixing = leixing;
    }

    public Long getZqqxMax() {
        return zqqxMax;
    }

    public void setZqqxMax(Long zqqxMax) {
        this.zqqxMax = zqqxMax;
    }

    public Long getZqqxMin() {
        return zqqxMin;
    }

    public void setZqqxMin(Long zqqxMin) {
        this.zqqxMin = zqqxMin;
    }

    public String getSfss() {
    	
        return this.getSfValue(sfss);
    }

    public void setSfss(String sfss) {
        this.sfss = sfss;
    }

	public String getSfValue(String sfss) {
		String returnValue="";
		if("0".equals(sfss)){
			returnValue = "不诉讼";
		}else if("1".equals(sfss)){
			returnValue = "诉讼";
		}
		return returnValue;
		
	}


    public String toString() {
        final String TAB = ", ";
        String retValue = "";
        retValue = "DebtQueryVO ( " + super.toString() + TAB + "stzwmc=" + this.stzwmc + TAB + "zqqxMax=" + this.zqqxMax + TAB + "zqqxMin=" + this.zqqxMin + TAB + "sfss=" + this.sfss + " )";
        return retValue;
    }
}
