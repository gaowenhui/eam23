package com.tansun.eam2.task;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.task.service.PTMessageBS;
import java.util.List;

/**
 *
 * @author Baitin.Fong
 */
public abstract class Eam2Task implements java.io.Serializable{

    public abstract List<PTMessage> getPTMessages();

    public abstract boolean execute();

    public void timer(){
        PTMessageBS mbs = (PTMessageBS) SpringContextHelper.getBean(PTMessageBS.class);
        if(execute()){
            for (PTMessage mesg : getPTMessages()) {
               mbs.SaveOrUpdate(mesg);
            }
        }
    }
}
