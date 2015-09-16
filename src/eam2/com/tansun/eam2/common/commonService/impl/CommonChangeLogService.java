/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.common.commonService.impl;

import com.tansun.eam2.common.commonService.ICommonChangeLogService;
import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baitin.Fong
 */
@Service
public class CommonChangeLogService implements ICommonChangeLogService{

    @Autowired
	private PublicDao publicDao;

    public List<AssetChangeLog> queryAssetChangeLog(String userid, String upobjId, String updateStart, String updateEnd, String subSys,
            String upsheet, String tableName, String fk, String name, Paginator paginator) {
        List<Object> params = new ArrayList<Object>();
        StringBuffer sbSql = new StringBuffer();
        sbSql.append("SELECT new AssetChangeLog(l.id, l.personId, l.personName, l.updatedate, l.updatetype, l.upobjId, ");
        sbSql.append("t.").append(name).append(", l.upobjcode, l.upsheet, l.upproper, l.upbefovalue, l.upaftervalue, l.subsys) ");
        StringBuffer sb = new StringBuffer();
        sb.append(" FROM AssetChangeLog l, ").append(tableName).append(" t WHERE l.upobjId=t.").append(fk);
        sb.append(" AND l.subsys=? ");
        params.add(subSys);
        if(StringUtils.isNotEmpty(upsheet)){
           sb.append(" AND l.upsheet=? ");
           params.add(upsheet);
        }
        if(StringUtils.isNotEmpty(upobjId)){
           sb.append(" AND l.upobjId=? ");
           params.add(upobjId);
        }
        if(StringUtils.isNotEmpty(userid)){
            sb.append(" AND l.personName like ? ");
            params.add("%" + userid + "%");
        }
        if(StringUtils.isNotEmpty(updateStart) && StringUtils.isNotEmpty(updateEnd)){
            sb.append(" AND To_char(l.updatedate, 'yyyyMMdd')>=? AND To_char(l.updatedate, 'yyyyMMdd')<=? ");
            params.add(updateStart);
            params.add(updateEnd);
        }else if(StringUtils.isNotEmpty(updateStart)){
            sb.append(" AND To_char(l.updatedate, 'yyyyMMdd')>=? ");
           params.add(updateStart);
        }else if(StringUtils.isNotEmpty(updateEnd)){
            sb.append(" AND To_char(l.updatedate, 'yyyyMMdd')<=? ");
            params.add(updateEnd);
        }
        sb.append(" ORDER BY l.").append(paginator.getSortname()).append(" ").append(paginator.getSorttye());
        sbSql.append(sb);
        PageableList pl = publicDao.queryByHQLWithPaginator(sbSql.toString(), sb.toString(), params, paginator);
        List<AssetChangeLog> list = null;
        if(pl.getResults() == null){
               list = new ArrayList<AssetChangeLog>();
        }else{
            list = (List<AssetChangeLog>)pl.getResults();
        }
        return list;
    }

    public void saveAssetChangeLog(AssetChangeLog log) {
       publicDao.save(log);
    }

    public PublicDao getPublicDao() {
        return publicDao;
    }

    public void setPublicDao(PublicDao publicDao) {
        this.publicDao = publicDao;
    }

}
