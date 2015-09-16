package com.tansun.eam2.stgl.vo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class StaffQueryVO extends CommonBO implements java.io.Serializable {

    /**
     * 人员信息汇总查询条件
     */
    //实体名称
    private String stmc;
    //人员类型
    private String fcRylb;
    //姓名
    private String fxingming;
    //安置方式
    private String fazfs;
    //安置状态
    private String fazzt;
    //工资发放单位
    private String fgzffdw;

    public String getStmc() {
        return stmc;
    }

    public void setStmc(String stmc) {
        this.stmc = stmc;
    }

    public String getFcRylb() {
        return fcRylb;
    }

    public void setFcRylb(String fcRylb) {
        this.fcRylb = fcRylb;
    }

    public String getFxingming() {
        return fxingming;
    }

    public void setFxingming(String fxingming) {
        this.fxingming = fxingming;
    }

    public String getFazfs() {
        return fazfs;
    }

    public void setFazfs(String fazfs) {
        this.fazfs = fazfs;
    }

    public String getFazzt() {
        return fazzt;
    }

    public void setFazzt(String fazzt) {
        this.fazzt = fazzt;
    }

    public String getFgzffdw() {
        return fgzffdw;
    }

    public void setFgzffdw(String fgzffdw) {
        this.fgzffdw = fgzffdw;
    }

    public String toString() {
        final String TAB = ", ";
        String retValue = "";
        retValue = "StaffQueryVO ( " + super.toString() + TAB + "stmc=" + this.stmc + TAB + "fcRylb=" + this.fcRylb + TAB + "fxingming=" + this.fxingming + TAB + "fazfs=" + this.fazfs + TAB + "fazzt=" + this.fazzt + TAB + "fgzffdw=" + this.fgzffdw + " )";
        return retValue;
    }

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
}
