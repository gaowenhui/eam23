/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.common.ucc;

import com.tansun.eam2.common.commonService.ICommonChangeLogService;
import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.rdp4j.common.util.Paginator;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baitin.Fong
 */
@Service
public class CommonChangeLogUccImpl implements ICommonChangeLogUcc{

    @Autowired
    private ICommonChangeLogService commonChangeLogService;

    public List<AssetChangeLog> queryAssetChangeLog(String userName, String upobjId, String updateStart, String updateEnd, 
            String subSys, String upsheet, String tableName, String fk, String name, Paginator paginator) {
        return this.commonChangeLogService.queryAssetChangeLog(userName, upobjId, updateStart, updateEnd, subSys, upsheet,
                tableName, fk, name, paginator);
    }

    public void saveAssetChangeLog(AssetChangeLog log) {
        this.commonChangeLogService.saveAssetChangeLog(log);
    }

    public ICommonChangeLogService getCommonChangeLogService() {
        return commonChangeLogService;
    }

    public void setCommonChangeLogService(ICommonChangeLogService commonChangeLogService) {
        this.commonChangeLogService = commonChangeLogService;
    }

}
