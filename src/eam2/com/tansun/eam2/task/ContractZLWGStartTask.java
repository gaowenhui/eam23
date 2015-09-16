/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.task;

import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public class ContractZLWGStartTask extends TemplateTask {

    public boolean execute() {
        PublicDao dao = (PublicDao) SpringContextHelper.getBean(PublicDao.class);
        List<JjzcHtZlwg> list =  (List<JjzcHtZlwg>) dao.find(getSQL(),getParams());
        if(list != null){
            for (JjzcHtZlwg o : list) {
                o.setCHtzt("1");
                dao.saveOrUpdate(o);
                String s = getMessage();
                s = s.replaceAll("#1#", o.getHtbh() == null ? "" : o.getHtbh());
                s = s.replaceAll("#2#", DateUtils.formatDate(o.getHtqsrq(), "yyyy-MM-dd"));
                newMessage(s);
            }
        }
        return false;
    }

    public String getSQL(){
         String sql = "SELECT t from JjzcHtZlwg t where to_char(t.htqsrq, 'yyyyMMdd')=? ";
        return sql;
    }

    public String[] getParams(){
        String mstr =  DateUtils.formatDate(new Date(), "yyyyMMdd");
        return  new String[]{mstr};
    }
}
