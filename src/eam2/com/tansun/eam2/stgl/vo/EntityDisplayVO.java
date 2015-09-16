package com.tansun.eam2.stgl.vo;


import com.tansun.eam2.common.model.orm.bo.StJbxx;

/**
 * 实体展现结果
 * @author gengxiaoli
 *
 */
public class EntityDisplayVO extends StJbxx {

    private static final long serialVersionUID = -708020075577775901L;
    private int renshu;
    private String diqu;
    private String gqgc;

    public String getGqgc() {
        return gqgc;
    }

    public void setGqgc(String gqgc) {
        this.gqgc = gqgc;
    }

    public int getRenshu() {
        return renshu;
    }

    public void setRenshu(int renshu) {
        this.renshu = renshu;
    }

    public String getDiqu() {
        return diqu;
    }

    public void setDiqu(String diqu) {
        this.diqu = diqu;
    }

    public String toString() {
        final String TAB = ",";
        String retValue = "";
        retValue = "EntityDisplayVO ( " + super.toString() + TAB + "renshu=" + this.renshu + TAB + "diqu=" + this.diqu + TAB + "gqgc=" + this.gqgc + " )";
        return retValue;
    }
}
