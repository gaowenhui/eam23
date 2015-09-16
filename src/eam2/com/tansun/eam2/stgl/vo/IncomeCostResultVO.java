package com.tansun.eam2.stgl.vo;

import com.tansun.eam2.common.model.orm.bo.StHead;

/**
 * 实体相关业务费用、业务列表
 * @author gengxiaoli
 *
 */
public class IncomeCostResultVO extends StHead {

    private String bodyId;
    private String CSqsxlx;
    private Double sqje;
    private Double sdje;
    private String sqxmmc;
    private String fyzl;
    private String sqsm;

    public String getCSqsxlx() {
        return CSqsxlx;
    }

    public void setCSqsxlx(String sqsxlx) {
        CSqsxlx = sqsxlx;
    }

    public Double getSqje() {
        return sqje;
    }

    public void setSqje(Double sqje) {
        this.sqje = sqje;
    }

    public Double getSdje() {
        return sdje;
    }

    public void setSdje(Double sdje) {
        this.sdje = sdje;
    }

    public String getSqxmmc() {
        return sqxmmc;
    }

    public void setSqxmmc(String sqxmmc) {
        this.sqxmmc = sqxmmc;
    }

    public String getFyzl() {
        return fyzl;
    }

    public void setFyzl(String fyzl) {
        this.fyzl = fyzl;
    }

    public String getSqsm() {
        return sqsm;
    }

    public void setSqsm(String sqsm) {
        this.sqsm = sqsm;
    }

    public String getBodyId() {
        return bodyId;
    }

    public void setBodyId(String bodyId) {
        this.bodyId = bodyId;
    }

    public String toString() {
        final String TAB = ",";
        String retValue = "";
        retValue = "IncomeCostResultVO ( " + super.toString() + TAB + "bodyId=" + this.bodyId + TAB + "CSqsxlx=" + this.CSqsxlx + TAB + "sqje=" + this.sqje + TAB + "sdje=" + this.sdje + TAB + "sqxmmc=" + this.sqxmmc + TAB + "fyzl=" + this.fyzl + TAB + "sqsm=" + this.sqsm + " )";
        return retValue;
    }
}
