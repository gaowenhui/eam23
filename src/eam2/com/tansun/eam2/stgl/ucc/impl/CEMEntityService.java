package com.tansun.eam2.stgl.ucc.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StSkjnXx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.workflow.common.model.PTEnd;

@Service
public class CEMEntityService implements ICEMEntityService {

    PublicDao publicDao;
    @Autowired
    IEntityService eService;

    /**
     * 资讯类实体查询
     */
    public List<StJbxx> listEntities(EntityQueryVO entity) {
        List<StJbxx> jbxx = eService.listEntities(entity);
        return jbxx;
    }

    /**
     * 非咨询实体查询
     */
    @SuppressWarnings("unchecked")
    public List<StJbxx> listNonEntities(EntityQueryVO entity) {
        List<StJbxx> jbxx = eService.listNonEntities(entity);
        return jbxx;
    }

    public void newEntity(StJbxx jbxx) {
        eService.newEntity(jbxx);
    }

    public List<StFsxx> viewEntityFsxx(String stid, String leixing) {
        return eService.viewEntityFsxx(stid, leixing);
    }

    public StJbxx viewEntityJbxx(String stid) {
        return eService.viewEntityJbxx(stid);
    }

    public StFsxx viewFsxx(String id) {
        String[] str = new String[1];
        str[0] = id;
        return (StFsxx) publicDao.findSingleResult("from StFsxx t where t.id = ? ", str);
    }

    /**
     * 实体查询  进入修改页面
     * @param id
     * @param stlx
     * @return
     */
    public StJbxx viewStJbxx(String id, String stlx) {

        String[] str = new String[2];
        str[0] = id;
        str[1] = stlx;
        return (StJbxx) publicDao.findSingleResult("from StFsxx t where t.id=? and t.stlx=?", str);
    }

    /*
     *实体查询  
     *通过实体ID查询实体内的全部信息 
     * 
     */
    public StJbxx viewStJbxx1(String id){
    	String[] str = new String[1];
    	str[0] = id;
		return (StJbxx) publicDao.findSingleResult("from StJbxx t where t.id=? ",str);
    }
    
    
    
    
    /**
     * 查看 实体内部  每个列表内部数据 具体信息
     */
    public StFsxx viewFsxxPop(String id, String pop) {
        String[] str = new String[2];
        str[0] = id;
        str[1] = pop;
        return (StFsxx) publicDao.findSingleResult("from StFsxx t where t.id = ? and t.stnzcfl = ?", str);
    }

    public void newEntityFsxx(StFsxx fsxx) {
        eService.newEntityFsxx(fsxx);
    }

    /**
     * 删除附属信息；
     * @param fsxxIds为一个存放附属信息Id的数组
     * @return
     */
    public void deleteFsxx(String[] fsxxIds) {
        eService.deleteFsxx(fsxxIds);
    }

    /**
     * 删除表体信息
     * @param jbxxIds为一个存放附属信息Id的数组
     * @return
     */
    public void deleteStJbxx(String[] jbxxIds) {
        eService.deleteStJbxx(jbxxIds);
    }

    /**
     * 保存附属信息
     */
    public void saveEntity(StFsxx fsxxs) {
    	StFsxx o = publicDao.findById(StFsxx.class, fsxxs.getId());
		try {
			BeanUtils.copyProperties(o, fsxxs);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
        publicDao.saveOrUpdate(o);

    }

    /**
     * 查询实体资产内部 列表信息
     */
    public List<StFsxx> viewEntityFsxxPop(String stid, String leixing, String pop) {
        return eService.viewEntityFsxxPop(stid, leixing, pop);
    }

    public PublicDao getPublicDao() {
        return publicDao;
    }

    @Autowired
    public void setPublicDao(PublicDao publicDao) {
        this.publicDao = publicDao;
    }

    public List<StJbxx> listEntities(Paginator paginator, EntityQueryVO entity, String type) throws IllegalAccessException, InvocationTargetException {
        List<StJbxx> jbxx = eService.listEntities(paginator, entity, type);
        return jbxx;
    }

    /**
     * 保存实体信息
     */
    public void saveEntity(StJbxx jbxx) {
        eService.saveEntity(jbxx);
    }

    public int selectFsxxCount(String stid, String stlx) {
        //TODO complete this method, select count from StFsxx where id = stid and stlx = stlx.
        return eService.selectFsxxCount(stid, stlx);
    }

    /**
     * 贷款抵制压物查询 add by chenyuxiao 
     * @param loansId
     * @param leixing
     * @param pop
     * @return
     */
    public List<StFsxx> viewEntityFsxxLoans(String loansId, String leixing, String pop) {
        return eService.viewEntityFsxxLoans(loansId, leixing, pop);
    }

    //---------------------实体资产 评估---------------------------
    /**
     * 插入一条数据
     */
    public void saveZcPgXx(ZcPgXx zc) {
        eService.saveZcPgXx(zc);
    }

    /**
     * 保存一条数据
     */
    public void updateZcPgXx(ZcPgXx zc) {
        eService.updateZcPgXx(zc);
    }

    /**
     * 根据主键查找ZcPgXx 信息
     */
    public ZcPgXx getZcPgXx(String id) {
        return eService.getZcPgXx(id);
    }

    /**
     * 根据stfsxxid查找ZcPgXx 信息
     */
    public ZcPgXx viewZcPgXx(String stfsxxid) {
        return eService.viewZcPgXx(stfsxxid);
    }

    /**
     * 根据stfsxxid查找ZcPgXx列表 信息
     */
    public List<ZcPgXx> getZcPgXxList(String stfsxxid,String ispgsc) {
        return eService.getZcPgXxList(stfsxxid,ispgsc);
    }

    /**
     * 删除评估信息
     */
    public void deleteZcPgXx(String[] ZcPgXxIds) {
        eService.deleteZcPgXx(ZcPgXxIds);
    }
    //-------------------债权---------------------------
	/**
	 * 删除债权信息
	 * @return
	 */
	public void claimsdeleList(String[] ids) {
		eService.claimsdeleList(ids);
		
	}

    /**
     * 插入一条DebtInfo
     * @param st
     */
    public void newDebtInfo(DebtInfo di) {
        eService.newDebtInfo(di);
    }

    /**
     * 保存一条DebtInfo
     * @param st
     */
    public void saveDebtInfo(DebtInfo di) {
        eService.saveDebtInfo(di);
    }
    
	/**
	 * 删除税款缴纳信息
	 * @return
	 */
	public void deleTaxPayment(String[] taxPaymentIds) {
		eService.deleTaxPayment(taxPaymentIds);
	}
    /**
     * 根据id查找DebtInfo
     * @param id
     * @return
     */
    public DebtInfo getDebtInfo(String id) {

        return eService.getDebtInfo(id);
    }

    /**
     * 删除DebtInfo
     * @param id
     */
    public void deleteDebtInfo(String[] id) {
        eService.deleteDebtInfo(id);
    }

    /**
     * 根据zqrid 查找债务 列表
     * @param id
     * @return
     */
    public List<DebtInfo> getDebtInfoList(String id) {
        return eService.getDebtInfoList(id);
    }

    /**
     * 根据zwrid 查找债权 列表
     * @param id
     * @return
     */
    public List<DebtInfo> getDebtList(String id) {
        return eService.getDebtList(id);
    }

    //-----------------------税务--------------------------------
    /**
     * 根据stid 查找 税务 列表
     * @param id
     * @return
     */
    public List<StSkjnXx> getTaxList(String id) {
        return eService.getTaxList(id);
    }

    /**
     * 插入一条StSkjnXx
     * @param st
     */
    public void newTaxInfo(StSkjnXx dk) {
        eService.newTaxInfo(dk);
    }

    /**
     * 保存一条StSkjnXx
     * @param st
     */
    public void saveTaxInfo(StSkjnXx dk) {
        eService.saveTaxInfo(dk);
    }

    /**
     * 根据id查找StSkjnXx
     * @param id
     * @return
     */
    public StSkjnXx getTaxInfo(String id) {
        return eService.getTaxInfo(id);
    }

    /**
     * 删除StSkjnXx
     * @param id
     */
    public void deleteTaxInfo(String[] id) {
        eService.deleteTaxInfo(id);
    }

    //-------------------------诉讼---------------------------
    /**
     * 诉讼  被诉  查询
     * @param stid            实体id
     * @param litigationType  诉讼/被诉
     */
    public List<SsBaseinfo> getLitigationList(String stid, String litigationType) {
        return eService.getLitigationList(stid,litigationType);
    }
    public void saveEntityLog(StJbxx jbxx_old,StJbxx jbxx_new,String opType){
    	eService.saveEntityLog(jbxx_old, jbxx_new, opType);
    }
    public void saveEntityFsxxLog(StFsxx fsxx_old,StFsxx fsxx_new,String opType){
    	eService.saveEntityFsxxLog(fsxx_old, fsxx_new, opType);
    }

	public void saveEntityZcPgXxLog(ZcPgXx zcPgXx_old, ZcPgXx zcPgXx_new,
			String opType) {
		eService.saveEntityZcPgXxLog(zcPgXx_old, zcPgXx_new, opType);
		
	}
	public void saveDebtClaimsLog(DebtInfo debtInfo_old, DebtInfo debtInfo_new,
			String opType, String debtInfo) {
		eService.saveDebtClaimsLog(debtInfo_old, debtInfo_new, opType,debtInfo);
		
	}
	public StFsxx viewEntityFsxx(String id) {
		return eService.viewEntityFsxx(id);
	}
    
	public List<PTEnd> queryEndList_page(String strSTID,Paginator paginator, String title) {
		return eService.queryEndList_page(strSTID,paginator,title);
	}

	public void saveTaxInfoLog(StSkjnXx stSkjnXx_old, StSkjnXx stSkjnXx_new,
			String opType) {
		eService.saveTaxInfoLog(stSkjnXx_old,stSkjnXx_new,opType);
		
	}
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList(String stId){
		return this.eService.findCzXxList(stId);
	}

	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList2(String stId){
		return this.eService.findCzXxList2(stId);
	}
	/**
	 * 根据选择的项目得到项目下的资产列表
	 * @return
	 */
	public String findAssetByCzXxList(String stId,String cldId,String xmId){
		return this.eService.findAssetByCzXxList(stId,cldId,xmId);
	}

	public void saveOrUpdateZcPgXx(ZcPgXx zc) {
		eService.saveOrUpdateZcPgXx(zc);
	}
	/**
	 * 根据名称查询
	 * @return
	 */
	public StJbxx viewStJbxx2(String stzwmc) {
		String[] str = new String[2];
		str[0] = stzwmc;
		str[1] = "1" ;
		return (StJbxx)publicDao.findSingleResult("from StJbxx t where t.stzwmc=? and t.sfbc=?",str);
	}


}
