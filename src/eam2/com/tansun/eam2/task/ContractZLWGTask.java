package com.tansun.eam2.task;

import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public class ContractZLWGTask extends TemplateTask{

    //调度策略，每天检查委管合同到期日期。
    public boolean execute() {
        PublicDao dao = (PublicDao) SpringContextHelper.getBean(PublicDao.class);
        List<JjzcHtZlwg> list =  (List<JjzcHtZlwg>) dao.find(getSQL(),getParams());
        if(list != null){
            for (JjzcHtZlwg o : list) {
                String s = getMessage();
                s = s.replaceAll("#1#", o.getHtbh() == null ? "" : o.getHtbh());
                s = s.replaceAll("#2#", DateUtils.formatDate(o.getHtdqrq(), "yyyy-MM-dd"));
                newMessage(s);
            }
        }
        return false;
    }

    public String getSQL(){
         String sql = "SELECT t from JjzcHtZlwg t where to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=? or"
                + " to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=? or to_char(t.htdqrq, 'yyyyMMdd')=?  ";
        return sql;
    }

}
