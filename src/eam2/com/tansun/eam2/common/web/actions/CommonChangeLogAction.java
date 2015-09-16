/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.common.web.actions;

import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.ucc.ICommonChangeLogUcc;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 *
 * @author Baitin.Fong
 */
//@Controller
public class CommonChangeLogAction extends CommonAction{

    @Autowired
    private ICommonChangeLogUcc commonChangeLogUccImpl;
    private String updateStart;
    private String updateEnd;
    private String username;
    private String upobjId;
    private String tableName;
    private String tableIdName;
    private String subSys;
    private String assetColName;
    private String upsheet;
    private Paginator paginator;
    private String sidx;
    private String sord;
    public String query4View(){
        try {
            if (paginator == null) {
                paginator = new Paginator();
            }
            paginator.setSortname(sidx != null && sidx.length() > 0 ? sidx : "updatedate");
            paginator.setSorttye(sord != null && sord.length() > 0 ? sord : "DESC");
            updateStart = updateStart != null && updateStart.length() > 0 ? updateStart.replace("-", "") : "";
            updateEnd = updateEnd != null && updateEnd.length() > 0 ? updateEnd.replace("-", "") : "";
            List<AssetChangeLog> list = this.commonChangeLogUccImpl.queryAssetChangeLog(username, upobjId, updateStart, updateEnd, subSys,
                    upsheet, tableName, tableIdName, assetColName, paginator);
            String bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(bodyJSON);
        } catch (IOException ex) {
            Logger.getLogger(CommonChangeLogAction.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ICommonChangeLogUcc getCommonChangeLogUccImpl() {
        return commonChangeLogUccImpl;
    }

    public void setCommonChangeLogUccImpl(ICommonChangeLogUcc commonChangeLogUccImpl) {
        this.commonChangeLogUccImpl = commonChangeLogUccImpl;
    }

    public String getAssetColName() {
        return assetColName;
    }

    public void setAssetColName(String assetColName) {
        this.assetColName = assetColName;
    }

    public String getUpobjId() {
        return upobjId;
    }

    public void setUpobjId(String upobjId) {
        this.upobjId = upobjId;
    }

    public Paginator getPaginator() {
        return paginator;
    }

    public void setPaginator(Paginator paginator) {
        this.paginator = paginator;
    }

    public String getSubSys() {
        return subSys;
    }

    public void setSubSys(String subSys) {
        this.subSys = subSys;
    }

    public String getTableIdName() {
        return tableIdName;
    }

    public void setTableIdName(String tableIdName) {
        this.tableIdName = tableIdName;
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getUpdateEnd() {
        return updateEnd;
    }

    public void setUpdateEnd(String updateEnd) {
        this.updateEnd = updateEnd;
    }

    public String getUpdateStart() {
        return updateStart;
    }

    public void setUpdateStart(String updateStart) {
        this.updateStart = updateStart;
    }

    public String getUpsheet() {
        return upsheet;
    }

    public void setUpsheet(String upsheet) {
        this.upsheet = upsheet;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getSidx() {
        return sidx;
    }

    public void setSidx(String sidx) {
        this.sidx = sidx;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

}
