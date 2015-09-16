package com.tansun.eam2.stgl.vo;

import com.tansun.eam2.common.model.orm.bo.StFsxx;

public class QueryResultVO extends StFsxx {

    /**
     * 人员及资产查询结果
     */
    private String stmc;

    public String getStmc() {
        return stmc;
    }

    public void setStmc(String stmc) {
        this.stmc = stmc;
    }

    public String toString() {
        final String TAB = ",";
        String retValue = "";
        retValue = "QueryResultVO ( " + super.toString() + TAB + "stmc=" + this.stmc + " )";
        return retValue;
    }


	public QueryResultVO clone(QueryResultVO qr) {
		try {
			return (QueryResultVO) qr.clone();
		} catch (CloneNotSupportedException e) {
			e.printStackTrace();
			return null;
		}
	}
    
}
