/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.task;

import com.tansun.eam2.common.model.orm.bo.JjzcHtBx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public class ContractBXTask extends TemplateTask {

    public boolean execute() {
        PublicDao dao = (PublicDao) SpringContextHelper.getBean(PublicDao.class);
        List<JjzcHtBx> list =  (List<JjzcHtBx>) dao.find(getSQL(),getParams());
        if(list != null){
            for (JjzcHtBx o : list) {
                String s = getMessage();
                s = s.replaceAll("#1#", o.getHtbh() == null ? "" : o.getHtbh());
                s = s.replaceAll("#2#", DateUtils.formatDate(o.getHtdqrq(), "yyyy-MM-dd"));
                newMessage(s);
            }
        }
        return false;
    }

    public String getSQL(){
         String sql = "SELECT t from JjzcHtBx t where to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=? or"
                + " to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=?  ";
        return sql;
    }
}
