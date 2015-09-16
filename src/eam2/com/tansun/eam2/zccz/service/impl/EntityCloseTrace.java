/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.zccz.service.impl;

import com.tansun.eam2.zccz.service.IEntityCloseTrace;
import com.tansun.eam2.zccz.vo.EntityDisposeVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baitin.Fong
 */
@Service
public class EntityCloseTrace implements IEntityCloseTrace{

    private PublicDao publicDao;

    @Autowired
    public void setPublicDao(PublicDao publicDao) {
        this.publicDao = publicDao;
    }

    public EntityDisposeVO queryTrace(String stid) {
        String hsql = "select new EntityDisposeVO(t.id, m.id, m.bianhao, m.ngbm, m.ngrxm, m.CCzfs, c.spwyxm, t.czxmmc, h.hycs, t.zhuangtai) from CzXmXx t,"
                + " CzStcztz m, CzHyxx h, CzXmSpwYj c where t.cldId = m.id and t.hyId=h.id "
                + "and t.id=c.xmId and c.sfwzcr=1 and (t.fenlei=3 or t.fenlei=4) and m.stid=? ";
        EntityDisposeVO vo = (EntityDisposeVO)publicDao.findSingleResult(hsql, new String[]{stid});
        if(vo != null){
            String spwy = querySpwyxm(vo.getId());
            vo.setSpwyxm(spwy);
        }
        return vo;
    }

    public String querySpwyxm(String xmid){
        String hsql = "select c.spwyxm from CzXmSpwYj c where c.xmId=? ";
        List<Map<String, Object>> list = publicDao.queryForList(hsql, new String[]{xmid});
        String spwyxm = "";
        if(list != null && list.size() > 0){
            for (int i = 0; i < list.size(); i++) {
                Map<String, Object> map = list.get(i);
                String s = (String)map.get("spwyxm");
                if(s != null){
                    spwyxm += s;
                    if(i < list.size() - 1){
                        spwyxm += ",";
                    }
                }
            }

        }
        return spwyxm;
    }
}
