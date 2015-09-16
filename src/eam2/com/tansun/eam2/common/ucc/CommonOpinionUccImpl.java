package com.tansun.eam2.common.ucc;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;

@Service("commonOpinionUcc")
public class CommonOpinionUccImpl implements ICommonOpinionUcc {

	@Autowired
	private PublicDao publicDao;
	
	@SuppressWarnings("unchecked")
	public List<PTCommonOpinionBO> query4View(String bdid, Integer type) {
		List<PTCommonOpinionBO> list = (List<PTCommonOpinionBO>)publicDao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? AND o.yjylx=? order by o.tjrq desc", new Object[]{bdid, type});
		return list;
	}

    @SuppressWarnings("unchecked")
	public List<PTCommonOpinionBO> query4View(String bdid) {
		List<PTCommonOpinionBO> list = (List<PTCommonOpinionBO>)publicDao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? order by o.tjrq desc", new Object[]{bdid});
		return list;
	}

	public Map<String, List<PTCommonOpinionBO>> queryBybdid(String bdid,
			String... param) {
		return null;
	}

	public void saveOrUpdateOpinion(PTCommonOpinionBO opinion) {
		if(opinion != null && !StringUtils.equals(opinion.getYjnr(), "")&&opinion.getYjnr() != null){
			publicDao.save(opinion);			
		}
	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public void deleteOpinionById(String ids) {
        ids = ids.replace(",", "','");
        ids = "'" + ids + "'";
        String sql = "delete from p_t_common_opinion t where t.id in (" + ids + ")";
		publicDao.updateBySql(sql);		
	}

	public void updateOpinionByTaskId(String taskid) {
		publicDao.updateBySql("update p_t_common_opinion o set o.yjlx=" + CommonGlobal.OPINION_YJLX_RETRIEVE + " where o.taskid='" + taskid + "' ");
	}

    public void cloneOpinionByBdId(String oldBdid, String newBdid) {
       List<PTCommonOpinionBO> list = query4View(oldBdid);
       cloneEntity(list, newBdid, null);
    }

    public void cloneOpinionByBdId(String oldBdid, String newBdid,  Integer oldType, Integer newType) {
        List<PTCommonOpinionBO> list = query4View(oldBdid, oldType);
        cloneEntity(list, newBdid, newType);
    }

    public void cloneOpinionByBdId(String oldBdid, String newBdid,  Integer[] oldTypes, Integer newType) {
        if(oldTypes == null || oldTypes.length == 0){
        	return;
        }else{
        	List<PTCommonOpinionBO> list = new ArrayList<PTCommonOpinionBO>();
        	for(Integer temp : oldTypes){
        		list.addAll(query4View(oldBdid, temp));
        	}
        	cloneEntity(list, newBdid, newType);
        }
    }
    
    private void cloneEntity(List<PTCommonOpinionBO> list, String newBdid, Integer newType){
       for (PTCommonOpinionBO co : list) {
            try {
                PTCommonOpinionBO bo = new PTCommonOpinionBO();
                BeanUtils.copyProperties(bo, co);
                bo.setBdid(newBdid);
                if(newType != null){
                	if(bo.getYjylx()==CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY){
                		long bm = 11310L;
                		bo.setYjbm(bm);
                		bo.setTjr("");
                	}
                	bo.setYjylx(newType);
                }
                bo.setId(null);
                saveOrUpdateOpinion(bo);
            } catch (IllegalAccessException ex) {
                Logger.getLogger(CommonOpinionUccImpl.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(CommonOpinionUccImpl.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

	public PTCommonOpinionBO getOpinionByTaskId(String taskid, Integer newType) {
		List<PTCommonOpinionBO> list = (List<PTCommonOpinionBO>)publicDao.find("FROM PTCommonOpinionBO o WHERE o.taskId=? and o.yjlx<>5 and o.yjlx<>4 and o.yjylx=? order by o.tjrq desc", new Object[]{taskid, newType});
		return list != null && list.size() == 1 ? list.get(0) : new PTCommonOpinionBO();
	}

}
