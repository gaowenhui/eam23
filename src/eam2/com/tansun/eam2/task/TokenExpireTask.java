package com.tansun.eam2.task;

import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public class TokenExpireTask extends TemplateTask{

    //调度策略，每天检查到期日期。
    public boolean execute() {
        PublicDao dao = (PublicDao) SpringContextHelper.getBean(PublicDao.class);
        List<ZyZc> list =  (List<ZyZc>) dao.find(getSQL(),getParams());
        if(list != null){
            for (ZyZc o : list) {
                String s = getMessage();
                s = s.replaceAll("#1#", o.getLph() == null ? "" : o.getLph());
                s = s.replaceAll("#2#", DateUtils.formatDate(o.getLpsx(), "yyyy-MM-dd"));
                newMessage(s);
            }
        }
        return false;
    }

    public String getSQL(){
         String sql = "SELECT t from ZyZc t where to_char(t.lpsx, 'yyyyMMdd')=? or to_char(t.lpsx, 'yyyyMMdd')=? or"
                + " to_char(t.lpsx, 'yyyyMMdd')=? or to_char(t.lpsx, 'yyyyMMdd')=? or to_char(t.lpsx, 'yyyyMMdd')=?  ";
        return sql;
    }

}
