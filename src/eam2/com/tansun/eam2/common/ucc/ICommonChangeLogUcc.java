package com.tansun.eam2.common.ucc;

import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.rdp4j.common.util.Paginator;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public interface ICommonChangeLogUcc {

    /**
     * 保存修改日志，每次都是保存操作。
     * @param log
     */
    void saveAssetChangeLog(AssetChangeLog log);

    /**
     * 查询日志，界面各功能自己实现，需要根据upobjId与自己的业务表关联。
     * tableName即为当前对象存的表名，fk即为表对应的主键名
     * @param userName
     * @param updateStart
     * @param updateEnd
     * @param subSys
     * @param upsheet
     * @param tableName
     * @param fk
     * @return
     */
    List<AssetChangeLog> queryAssetChangeLog(String userName, String upobjId, String updateStart, String updateEnd, String subSys, String upsheet,
            String tableName, String fk, String name, Paginator paginator);
}