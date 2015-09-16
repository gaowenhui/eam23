package com.tansun.eam2.task;

import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public abstract class TemplateTask extends Eam2Task{

    private String mesg;
    private List<PTMessage> mesglist = new ArrayList<PTMessage>();
    private String loginnames;
    //调度策略，每天检查到期日期。
    public void newMessage(String content){
        String[] users = getLoginnames().split(",") ;
        for (int i = 0; i < users.length; i++) {
            Long long1 = UserCache.getUserBO(users[i]).getTid();
            PTMessage m = new PTMessage();
            m.setMessage(content);
            m.setUserId(long1);
            mesglist.add(m);
        }
    }

    public String[] getParams(){
        Date date = DateUtils.dateMonthAdd(new Date(), 1);
        String mstr =  DateUtils.formatDate(date, "yyyyMMdd");
        date = DateUtils.dateDayAdd(new Date(), 28);
        String wstr = DateUtils.formatDate(date, "yyyyMMdd");
        date = DateUtils.dateDayAdd(new Date(), 21);
        String wstr1 = DateUtils.formatDate(date, "yyyyMMdd");
        date = DateUtils.dateDayAdd(new Date(), 14);
        String wstr2 = DateUtils.formatDate(date, "yyyyMMdd");
        date = DateUtils.dateDayAdd(new Date(), 7);
        String wstr3 = DateUtils.formatDate(date, "yyyyMMdd");
        return  new String[]{mstr, wstr, wstr1, wstr2, wstr3};
    }

    public abstract String getSQL();

    public String getMessage() {
        return mesg;
    }

    public void setMessage(String mesg) {
        this.mesg = mesg;
    }

    public String getLoginnames() {
        return loginnames;
    }

    public void setLoginnames(String loginnames) {
        this.loginnames = loginnames;
    }

    public List<PTMessage> getPTMessages() {
       return mesglist;
    }

}
