package com.tansun.eam2.stgl.ucc;

import java.util.List;


/**
 * 实体查询及维护
 * @Title: ICEMEntityService.java 
 * @Package com.tansun.eam2.stgl.ucc 
 * @Description: TODO
 * @author <a href="mailto:gengxiaoli@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:29:12 PM 
 * @version V1.0
 */
public interface ICEMEntityLogService{

    List<?> listEntities();

    void newEntity();

    void saveEntity();

    Object viewEntity();
}
