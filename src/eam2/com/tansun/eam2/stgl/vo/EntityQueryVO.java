package com.tansun.eam2.stgl.vo;

import java.io.Serializable;

import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EntityQueryVO extends CommonBO implements Serializable {

    private static final long serialVersionUID = 1L;
    private String assertNumber;//=======
    private String entityName;//==========
    private String typeCode;//有无历史遗留问题
    private String deptID;
    private String province;//===========
    private String area;
    private String problem;
    private String type; //区分咨询实体与非咨询实体
    private String CStzt; //实体状态; 
    private String CGlbm; //管理部门
    private String c_czfs;//实体处置方式
    private String CWtgljg; // 委托管理部门============
    private String jyfl; //经营分类================

    public String getJyfl() {
        return jyfl;
    }

    public void setJyfl(String jyfl) {
        this.jyfl = jyfl;
    }

    public String getCGlbm() {
        return CGlbm;
    }

    public void setCGlbm(String glbm) {
        CGlbm = glbm;
    }

    public String getCWtgljg() {
        return CWtgljg;
    }

    public void setCWtgljg(String wtgljg) {
        CWtgljg = wtgljg;
    }

    public String getAssertNumber() {
        return assertNumber;
    }

    public void setAssertNumber(String assertNumber) {
        this.assertNumber = assertNumber;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getDeptID() {
        return deptID;
    }

    public void setDeptID(String deptID) {
        this.deptID = deptID;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    @Override
    public String getMid() {
        // TODO Auto-generated method stub
        return null;
    }

    public String getCStzt() {
        return CStzt;
    }

    public void setCStzt(String stzt) {
        CStzt = stzt;
    }

    public String getC_czfs() {
        return c_czfs;
    }

    public void setC_czfs(String c_czfs) {
        this.c_czfs = c_czfs;
    }

    public String toString() {
        final String TAB = ",";
        String retValue = "";
        retValue = "EntityQueryVO ( " + super.toString() + TAB + "assertNumber=" + this.assertNumber + TAB + "entityName=" + this.entityName + TAB + "typeCode=" + this.typeCode + TAB + "deptID=" + this.deptID + TAB + "province=" + this.province + TAB + "area=" + this.area + TAB + "problem=" + this.problem + TAB + "type=" + this.type + TAB + "CStzt=" + this.CStzt + TAB + "CGlbm=" + this.CGlbm + TAB + "c_czfs=" + this.c_czfs + TAB + "CWtgljg=" + this.CWtgljg + TAB + "jyfl=" + this.jyfl + " )";
        return retValue;
    }
}
