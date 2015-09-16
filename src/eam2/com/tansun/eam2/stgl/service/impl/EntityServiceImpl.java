package com.tansun.eam2.stgl.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ec.module.define.Bean;
import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StSkjnXx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.service.IEntityService;
import com.tansun.eam2.stgl.vo.CzxxVO;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.IDealToDoBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
@Service
public class EntityServiceImpl implements IEntityService {
	@Autowired
	PublicDao publicDao;
	@Autowired
	IDealToDoBS dealToDoBS;
	@Autowired 
	ICodeService codeServiceImpl;	
	/**
	 * 删除附属信息
	 */
	public void deleteFsxx(String[] fsxxIds) {
		for (int i = 0; i < fsxxIds.length; i++) {
			if(StringUtils.isNotEmpty(fsxxIds[i])){
				String sql = "UPDATE ST_FSXX SET SFBC = '0'  WHERE ID = ? ";
				List params = new ArrayList();
				params.add(fsxxIds[i]);
				publicDao.updateBySql(sql, params);
			}
		}
		
	}
	
    /**
     * 删除表体信息
     * @param jbxxIds为一个存放附属信息Id的数组
     * @return
     */
//    public void deleteStJbxx(String[] jbxxIds){
//    	
//    	for(int i=0; i < jbxxIds.length;i++){
//    		if(StringUtils.isNotEmpty(jbxxIds[i])){
//    			StJbxx stjbxx = (StJbxx) publicDao.findSingleResult("from StJbxx o where o.id=?", new Object[]{new String(jbxxIds[i])});
//    			publicDao.delete(stjbxx);
//    		}
//    		
//    	}
//    }
    
    public void deleteStJbxx(String[] jbxxIds) {
		for (int i = 0; i < jbxxIds.length; i++) {
			if(StringUtils.isNotEmpty(jbxxIds[i])){
				String sql = "UPDATE St_Jbxx SET SFBC = '0'  WHERE ID = ? ";
				List params = new ArrayList();
				params.add(jbxxIds[i]);
				publicDao.updateBySql(sql, params);
				StJbxx stjbxx_old = (StJbxx) publicDao.findSingleResult("from StJbxx o where o.id=?", new Object[]{new String(jbxxIds[i])});
				this.saveEntityLog(stjbxx_old, null, "删除");
			}
		}
		
	}
    
	
	/**
	 * 咨询实体查询
	 */
	@SuppressWarnings("unchecked")
	public List<StJbxx> listEntities(EntityQueryVO entity) {
		
		
		
		return (List<StJbxx>)publicDao.find("from StJbxx o  where ((o.zcbh like '%" + entity.getAssertNumber()+"%' or '"+ entity.getAssertNumber()+"' is null)"
													     + " and (o.stzwmc like '%" + entity.getEntityName()+"%' or '"+ entity.getEntityName()+"' is null)"
														 + " and (o.jyfl ='" + entity.getJyfl()+"' or '"+entity.getJyfl()+"' is null)"
														 + " and (o.CGlbm like '%" + entity.getCGlbm()+"%' or '"+entity.getCGlbm()+"' is null)"
														 + " and (o.CWtgljg like'%" + entity.getCWtgljg()+"%' or '"+entity.getCWtgljg()+"' is null)"
														 + " and (o.CShengfen like '%" + entity.getProvince()+"%' or '' is null)"
														 + " and (o.CDijishi like '%"+ entity.getArea()+"%' or '' is null)) and o.stlx = '0' ");
	
	}
	/**
	 * 非咨询实体查询
	 */
	@SuppressWarnings("unchecked")
	public List<StJbxx> listNonEntities(EntityQueryVO entity) {
		// TODO: 待确定 
		return (List<StJbxx>)publicDao.find("from StJbxx o  where ((o.zcbh like '%" + entity.getAssertNumber()+"%' or '"+ entity.getAssertNumber()+"' is null)"
													     + " and (o.stzwmc like '%" + entity.getEntityName()+"%' or '"+ entity.getEntityName()+"' is null)"
														 + " and (o.CGlbm like '%" + entity.getCGlbm()+"%' or '"+entity.getCGlbm()+"' is null)"
														 + " and (o.ywlsylwt like'%" + entity.getTypeCode()+"%' or '"+entity.getTypeCode()+"' is null)"
														 + " and (o.CShengfen like '%" + entity.getProvince()+"%' or '' is null)"
														 + " and (o.CDijishi like '%"+ entity.getArea()+"%' or '' is null)) and o.stlx = '1' ");
	
	}
	
	@SuppressWarnings("unchecked")
	public List<StJbxx> listEntities(Paginator paginator,EntityQueryVO entity, String type) throws IllegalAccessException, InvocationTargetException {
		List<String> params = new ArrayList<String>();
		StringBuffer hql = new StringBuffer();
		hql.append("from StJbxx o where 1=1 and o.sfbc='1' ");
		if(StringUtils.isNotEmpty(entity.getEntityName())){
			hql.append(" and o.stzwmc like ? ");
			params.add("%" + entity.getEntityName() + "%");
		}
		if(StringUtils.isNotEmpty(entity.getCWtgljg())){
			hql.append(" and o.CWtgljg like ? ");
			params.add("%" + entity.getCWtgljg() + "%");
		}
		if(StringUtils.isNotEmpty(entity.getCGlbm())){
			hql.append(" and o.CGlbm = ? ");
			params.add(entity.getCGlbm());
		}
		if(StringUtils.isNotEmpty(entity.getAssertNumber())){
			hql.append(" and o.zcbh like ? ");
			params.add("%" + entity.getAssertNumber() + "%");
		}
		if(StringUtils.isNotEmpty(entity.getJyfl())){
			hql.append(" and o.jyfl=? ");
			params.add(entity.getJyfl());
		}
		if(StringUtils.isNotEmpty(entity.getProvince())){
			hql.append(" and o.CShengfen=? ");
			params.add(entity.getProvince());
		}
		if(StringUtils.isNotEmpty(entity.getCStzt())){
			hql.append(" and o.CStzt=? ");
			params.add(entity.getCStzt());
		}
		if(StringUtils.isNotEmpty(entity.getC_czfs())){
			hql.append(" and o.c_czfs=? ");
			params.add(entity.getC_czfs());
		}
		if(StringUtils.isNotEmpty(type)){
			hql.append(" and o.stlx=? ");
			params.add(type);
		}
		hql.append(" order by o.id");
		List<StJbxx> boList = (List<StJbxx>)publicDao.queryByHQLWithPaginator(hql.toString(), params,paginator).getResults();
		List<StJbxx> voList = new ArrayList<StJbxx>();
		for(StJbxx st : boList){
			StJbxx vo = new StJbxx();
			BeanUtils.copyProperties(vo, st);
			voList.add(vo);
		}
		return voList;
	}
	
	
	
	public void newEntity(StJbxx jbxx) {
		StJbxx st = this.viewEntityJbxx(jbxx.getId());
		if(st ==null ){
			publicDao.save(jbxx);
		}else{
			StJbxx o = new StJbxx();
			try {
				BeanUtils.copyProperties(o, st);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			publicDao.update(o);
		}
		
	}

	public void newEntityFsxx(StFsxx fsxx) {
//		if(fsxx.getId() != null){
//			//记录实体日志基本信息
//			StFsxx old = (StFsxx) publicDao.findSingleResult(
//					"from StFsxx o where o.id =?", new Object[] { fsxx.getId()});
//			saveEntityFsxxLog(old, fsxx, "修改");
//		}
		publicDao.saveOrUpdate(fsxx);
	}
	//记录实体附属信息日志
	@SuppressWarnings("unchecked")
	public void saveEntityFsxxLog(StFsxx fsxx_old,StFsxx fsxx_new,String opType) {
		//各类编号（人员编号、房屋编号、土地等）
		String strObjcode = null;
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = BeanUtils.describe(fsxx_old);
				newMap = BeanUtils.describe(fsxx_new);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			Set<String> newSet = newMap.keySet();
			Iterator ite = newSet.iterator();
			while (ite.hasNext()) {
				String property = (String) ite.next();
				if ("id".equals(property) || "class".equals(property) || "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)) {
					continue;
				}else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
					//出生日期
					if("fcsny".equals(property)){
						if(fsxx_new.getFcsny()!= null){
							valueNew = DateUtils.formatDate(fsxx_new.getFcsny());
						}
						if(fsxx_old.getFcsny() != null){
							valueOld = DateUtils.formatDate(fsxx_old.getFcsny());
						}
					}
					//任职时间
					if("frzsj".equals(property)){
						if(fsxx_new.getFrzsj()!= null){
							valueNew = DateUtils.formatDate(fsxx_new.getFrzsj());
						}
						if(fsxx_old.getFrzsj() != null){
							valueOld = DateUtils.formatDate(fsxx_old.getFrzsj());
						}
					}
					//离职时间
					if("flzsj".equals(property)){
						if(fsxx_new.getFlzsj()!= null){
							valueNew = DateUtils.formatDate(fsxx_new.getFlzsj());
						}
						if(fsxx_old.getFlzsj() != null){
							valueOld = DateUtils.formatDate(fsxx_old.getFlzsj());
						}
					}
					//报告日期
					if("ebgrq".equals(property)){
						if(fsxx_new.getEbgrq()!= null){
							valueNew = DateUtils.formatDate(fsxx_new.getEbgrq());
						}
						if(fsxx_old.getEbgrq() != null){
							valueOld = DateUtils.formatDate(fsxx_old.getEbgrq());
						}
					}
					//大事发生日期
					if("gdsfsrq".equals(property)){
						if(fsxx_new.getGdsfsrq()!= null){
							valueNew = DateUtils.formatDate(fsxx_new.getGdsfsrq());
						}
						if(fsxx_old.getGdsfsrq() != null){
							valueOld = DateUtils.formatDate(fsxx_old.getGdsfsrq());
						}
					}
					
					//性别
					if("fxingbie".equals(property)){
						if(fsxx_new.getFxingbie() != null){
							if("1".equals(fsxx_new.getFxingbie())){
								valueNew = "男";
							}else if("2".equals(fsxx_new.getFxingbie())){
								valueNew = "女";
							}
						}
						if(fsxx_old.getFxingbie() != null){
							if("1".equals(fsxx_old.getFxingbie())){
								valueOld = "男";
							}else if("2".equals(fsxx_old.getFxingbie())){
								valueOld = "女";
							}						
						}
					}	
					//婚姻状况
					if("fcHyzk".equals(property)){
						if(fsxx_new.getFcHyzk() != null){
							if("1".equals(fsxx_new.getFcHyzk())){
								valueNew = "未婚";
							}else if("2".equals(fsxx_new.getFcHyzk())){
								valueNew = "已婚";
							}
						}
						if(fsxx_old.getFcHyzk() != null){
							if("1".equals(fsxx_old.getFcHyzk())){
								valueOld = "未婚";
							}else if("2".equals(fsxx_old.getFcHyzk())){
								valueOld = "已婚";
							}						
						}
					}	
					
					//人员类型
					if("fcRylx".equals(property)){
						if(fsxx_new.getFcRylx() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("CONSULT_ENTITY_PERSON_TYPE",fsxx_new.getFcRylx());
						}
						if(fsxx_old.getFcRylx() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("CONSULT_ENTITY_PERSON_TYPE",fsxx_old.getFcRylx() );
						}
					}	
					//是否法人代表
					if("fsffr".equals(property)){
						if(fsxx_new.getFsffr() != null){
							if(fsxx_new.getFsffr() == 0){
								valueNew = "否";
							}else if(fsxx_new.getFsffr() == 1){
								valueNew = "是";
							}
						}
						if(fsxx_old.getFsffr() != null){
							if(fsxx_old.getFsffr() == 0){
								valueOld = "否";
							}else if(fsxx_old.getFsffr() == 1){
								valueOld = "是";
							}						
						}
					}
					
					//本部是否控股
					if("ebbsfkg".equals(property)){
						if(fsxx_new.getEbbsfkg() != null){
							if("0".equals(fsxx_new.getEbbsfkg())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getEbbsfkg())){
								valueNew = "是";
							}else if("2".equals(fsxx_new.getEbbsfkg())){
								valueNew = "未知";
							}
						}
						if(fsxx_old.getEbbsfkg() != null){
							if("0".equals(fsxx_old.getEbbsfkg())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getEbbsfkg())){
								valueOld = "是";
							}	else if("2".equals(fsxx_old.getEbbsfkg())){
								valueOld = "未知";
							}					
						}
					}	
					
					//报表类型
					if("dcBbfl".equals(property)){
						if(fsxx_new.getDcBbfl()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EVENT_TYPE",fsxx_new.getDcBbfl());
						}
						if(fsxx_old.getDcBbfl() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EVENT_TYPE",fsxx_old.getDcBbfl() );
						}
					}	
					//报表分类
					if("dcBblx".equals(property)){
						if(fsxx_new.getDcBblx()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("REPORT_FORM_TYPE",fsxx_new.getDcBblx());
						}
						if(fsxx_old.getDcBblx() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("REPORT_FORM_TYPE",fsxx_old.getDcBblx() );
						}
					}			
					
					//事件类型
					if("gcSjlx".equals(property)){
						if(fsxx_new.getGcSjlx()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EVENT_TYPE",fsxx_new.getGcSjlx());
						}
						if(fsxx_old.getGcSjlx() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EVENT_TYPE",fsxx_old.getGcSjlx() );
						}
					}
					
					//《土地使用权证》
					if("jtdsyqz".equals(property)){
						if(fsxx_new.getJtdsyqz()!= null){
							if("1".equals(fsxx_new.getJtdsyqz())){
								valueNew = "有";
							}else if("2".equals(fsxx_new.getJtdsyqz())){
								valueNew = "无";
							}else if("3".equals(fsxx_new.getJtdsyqz())){
								valueNew = "下落不明";
							}
						}
						if(fsxx_old.getJtdsyqz() != null){
							if("1".equals(fsxx_old.getJtdsyqz())){
								valueOld = "有";;
							}else if("2".equals(fsxx_old.getJtdsyqz())){
								valueOld = "无";
							}	else if("3".equals(fsxx_old.getJtdsyqz())){
								valueOld = "下落不明";
							}					
						}
					}	
					//土地是否抵押
					if("jtdsfdy".equals(property)){
						if(fsxx_new.getJtdsfdy() != null){
							if("0".equals(fsxx_new.getJtdsfdy())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getJtdsfdy())){
								valueNew = "是";
							}
						}
						if(fsxx_old.getJtdsfdy() != null){
							if("0".equals(fsxx_old.getJtdsfdy())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getJtdsfdy())){
								valueOld = "是";
							}					
						}
					}	
					//出资方式
					if("qcCzfs".equals(property)){
						if(fsxx_new.getQcCzfs()!= null){
							if("1".equals(fsxx_new.getQcCzfs())){
								valueNew = "货币";
							}else if("2".equals(fsxx_new.getQcCzfs())){
								valueNew = "实物";
							}else if("3".equals(fsxx_new.getQcCzfs())){
								valueNew = "土地（含房屋）";
							}else if("4".equals(fsxx_new.getQcCzfs())){
								valueNew = "无形资产";
							}else if("5".equals(fsxx_new.getQcCzfs())){
								valueNew = "其他（见备注）";
							}
						}
						if(fsxx_new.getQcCzfs() != null){
							if("1".equals(fsxx_new.getQcCzfs())){
								valueOld = "货币";
							}else if("2".equals(fsxx_new.getQcCzfs())){
								valueOld = "实物";
							}else if("3".equals(fsxx_new.getQcCzfs())){
								valueOld = "土地（含房屋）";
							}else if("4".equals(fsxx_new.getQcCzfs())){
								valueOld = "无形资产";
							}else if("5".equals(fsxx_new.getQcCzfs())){
								valueOld = "其他（见备注）";
							}					
						}
					}
 					//出资情况
					if("qcCzqk".equals(property)){
						if(fsxx_new.getQcCzqk()!= null){
							if("1".equals(fsxx_new.getQcCzqk())){
								valueNew = "出资到位";
							}else if("2".equals(fsxx_new.getQcCzqk())){
								valueNew = "出资不实但达到最低出资额";
							}else if("3".equals(fsxx_new.getQcCzqk())){
								valueNew = "出资不实未达到最低出资额";
							}else if("4".equals(fsxx_new.getQcCzqk())){
								valueNew = "未出资";
							}
						}
						if(fsxx_new.getQcCzqk() != null){
							if("1".equals(fsxx_old.getQcCzqk())){
								valueOld = "出资到位";
							}else if("2".equals(fsxx_old.getQcCzqk())){
								valueOld = "出资不实但达到最低出资额";
							}else if("3".equals(fsxx_old.getQcCzqk())){
								valueOld = "出资不实未达到最低出资额";
							}else if("4".equals(fsxx_old.getQcCzqk())){
								valueOld = "未出资";
							}				
						}
					}
 					//抽逃出资
					if("qcCtcz".equals(property)){
						if(fsxx_new.getQcCtcz()!= null){
							if("1".equals(fsxx_new.getQcCtcz())){
								valueNew = "存在";
							}else if("2".equals(fsxx_new.getQcCtcz())){
								valueNew = "不存在";
							}else if("3".equals(fsxx_new.getQcCtcz())){
								valueNew = "无资料";
							}
						}
						if(fsxx_old.getQcCzqk() != null){
							if("1".equals(fsxx_old.getQcCtcz())){
								valueOld = "存在";
							}else if("2".equals(fsxx_old.getQcCtcz())){
								valueOld = "不存在";
							}else if("3".equals(fsxx_old.getQcCtcz())){
								valueOld = "无资料";
							}			
						}
					}
					//土地处置方式
					if("jcCzfs".equals(property)){
						if(fsxx_new.getJcCzfs() != null){
							if("0".equals(fsxx_new.getJcCzfs())){
								valueNew = "公开拍卖";
							}else if("1".equals(fsxx_new.getJcCzfs())){
								valueNew = "协议转让";
							}
						}
						if(fsxx_old.getJcCzfs() != null){
							if("0".equals(fsxx_old.getJcCzfs())){
								valueOld = "公开拍卖";
							}else if("1".equals(fsxx_old.getJcCzfs())){
								valueOld = "协议转让";
							}					
						}
					}	
					
					//土地状态
					if("jtdzt".equals(property)){
						if(fsxx_new.getJtdzt()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_new.getJtdzt());
						}
						if(fsxx_old.getJtdzt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_old.getJtdzt() );
						}
					}		
					
					
					//《房屋使用权证》
					if("kywfwsyqz".equals(property)){
						if(fsxx_new.getKywfwsyqz()!= null){
							if("1".equals(fsxx_new.getKywfwsyqz())){
								valueNew = "有";
							}else if("2".equals(fsxx_new.getKywfwsyqz())){
								valueNew = "无";
							}else if("3".equals(fsxx_new.getKywfwsyqz())){
								valueNew = "下落不明";
							}
						}
						if(fsxx_old.getKywfwsyqz() != null){
							if("1".equals(fsxx_old.getKywfwsyqz())){
								valueOld = "有";;
							}else if("2".equals(fsxx_old.getKywfwsyqz())){
								valueOld = "无";
							}	else if("3".equals(fsxx_old.getKywfwsyqz())){
								valueOld = "下落不明";
							}					
						}
					}				
					//房屋是否抵押
					if("ksfdy".equals(property)){
						if(fsxx_new.getKsfdy() != null){
							if("0".equals(fsxx_new.getKsfdy())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getKsfdy())){
								valueNew = "是";
							}
						}
						if(fsxx_old.getKsfdy() != null){
							if("0".equals(fsxx_old.getKsfdy())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getKsfdy())){
								valueOld = "是";
							}					
						}
					}						
					
					//房屋处置方式
					if("kcCzfs".equals(property)){
						if(fsxx_new.getKcCzfs() != null){
							if("0".equals(fsxx_new.getKcCzfs())){
								valueNew = "公开拍卖";
							}else if("1".equals(fsxx_new.getKcCzfs())){
								valueNew = "协议转让";
							}
						}
						if(fsxx_old.getKcCzfs() != null){
							if("0".equals(fsxx_old.getKcCzfs())){
								valueOld = "公开拍卖";
							}else if("1".equals(fsxx_old.getKcCzfs())){
								valueOld = "协议转让";
							}					
						}
					}	
					
					//机器设备是否抵押
					if("msbsfdy".equals(property)){
						if(fsxx_new.getMsbsfdy() != null){
							if("0".equals(fsxx_new.getMsbsfdy())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getMsbsfdy())){
								valueNew = "是";
							}
						}
						if(fsxx_old.getMsbsfdy() != null){
							if("0".equals(fsxx_old.getMsbsfdy())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getMsbsfdy())){
								valueOld = "是";
							}					
						}
					}	
					//机器设备状态
					if("msbzt".equals(property)){
						if(fsxx_new.getMsbzt()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_new.getMsbzt());
						}
						if(fsxx_old.getMsbzt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_old.getMsbzt() );
						}
					}					

					//机器设备处置方式
					if("mcCzfs".equals(property)){
						if(fsxx_new.getMcCzfs() != null){
							if("0".equals(fsxx_new.getMcCzfs())){
								valueNew = "公开拍卖";
							}else if("1".equals(fsxx_new.getMcCzfs())){
								valueNew = "协议转让";
							}
						}
						if(fsxx_old.getMcCzfs() != null){
							if("0".equals(fsxx_old.getMcCzfs())){
								valueOld = "公开拍卖";
							}else if("1".equals(fsxx_old.getMcCzfs())){
								valueOld = "协议转让";
							}					
						}
					}					
					//交通工具是否抵押
					if("lsfdy".equals(property)){
						if(fsxx_new.getLsfdy() != null){
							if("0".equals(fsxx_new.getLsfdy())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getLsfdy())){
								valueNew = "是";
							}
						}
						if(fsxx_old.getLsfdy() != null){
							if("0".equals(fsxx_old.getLsfdy())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getLsfdy())){
								valueOld = "是";
							}					
						}
					}	
					
					//交通工具状态
					if("ljtgjzt".equals(property)){
						if(fsxx_new.getLjtgjzt()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_new.getLjtgjzt());
						}
						if(fsxx_old.getLjtgjzt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_old.getLjtgjzt() );
						}
					}		
					
					//交通工具处置方式
					if("lcCzfs".equals(property)){
						if(fsxx_new.getLcCzfs() != null){
							if("0".equals(fsxx_new.getLcCzfs())){
								valueNew = "公开拍卖";
							}else if("1".equals(fsxx_new.getLcCzfs())){
								valueNew = "协议转让";
							}
						}
						if(fsxx_old.getLcCzfs() != null){
							if("0".equals(fsxx_old.getLcCzfs())){
								valueOld = "公开拍卖";
							}else if("1".equals(fsxx_old.getLcCzfs())){
								valueOld = "协议转让";
							}					
						}
					}	
					
					//其他资产是否抵押
					if("pqtzcsfdy".equals(property)){
						if(fsxx_new.getPqtzcsfdy() != null){
							if("0".equals(fsxx_new.getPqtzcsfdy())){
								valueNew = "否";
							}else if("1".equals(fsxx_new.getPqtzcsfdy())){
								valueNew = "是";
							}
						}
						if(fsxx_old.getPqtzcsfdy() != null){
							if("0".equals(fsxx_old.getPqtzcsfdy())){
								valueOld = "否";
							}else if("1".equals(fsxx_old.getPqtzcsfdy())){
								valueOld = "是";
							}					
						}
					}	
					
					//其他资产状态
					if("pzczt".equals(property)){
						if(fsxx_new.getPzczt()!= null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_new.getPzczt());
						}
						if(fsxx_old.getPzczt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ASSET_STATUS",fsxx_old.getPzczt() );
						}
					}						
					
					//其他资产处置方式
					if("pcCzfs".equals(property)){
						if(fsxx_new.getPcCzfs() != null){
							if("0".equals(fsxx_new.getPcCzfs())){
								valueNew = "公开拍卖";
							}else if("1".equals(fsxx_new.getPcCzfs())){
								valueNew = "协议转让";
							}
						}
						if(fsxx_old.getPcCzfs() != null){
							if("0".equals(fsxx_old.getPcCzfs())){
								valueOld = "公开拍卖";
							}else if("1".equals(fsxx_old.getPcCzfs())){
								valueOld = "协议转让";
							}					
						}
					}				
					
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					assetChangeLog.setUpobjId(fsxx_old.getStid());//被修改对象的主键
					//修改的页签
					getUpSheet(fsxx_new, assetChangeLog,"修改");				
					assetChangeLog.setUpproper(getFsxxPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
					if (valueOld == null) {// 改变前值
						assetChangeLog.setUpbefovalue(null);
					} else {
						assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
					}
					if (valueNew != null) {
						publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
					}
				}
			}			
		}else if("新增".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(fsxx_new.getStid());//被修改对象的主键
			//修改的页签
			getUpSheet(fsxx_new, assetChangeLog,"新增");	
			assetChangeLog.setUpobjId(fsxx_new.getStid());//被修改对象的主键
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统	
			publicDao.saveOrUpdateAttach(assetChangeLog);
		}else if("删除".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(fsxx_old.getStid());//,被修改对象的主键
			//修改的页签
			getUpSheet(fsxx_old, assetChangeLog,"删除");	
			assetChangeLog.setUpobjId(fsxx_old.getStid());//被修改对象的主键
			assetChangeLog.setUpobjcode(strObjcode);
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统	
			publicDao.saveOrUpdateAttach(assetChangeLog);
		}

	}


	private void getUpSheet(StFsxx fsxx_new, AssetChangeLog assetChangeLog,String opType) {
		//各类编号（人员编号、房屋编号、土地编号等）
		String strObjcode = null;
		if(StglCommon.ST_INFO_SHITIRENYUAN.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getFrybh();
			assetChangeLog.setUpsheet("实体人员信息列表");
		}else if(StglCommon.ST_INFO_GAOGUANRENYUAN.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("高管人员信息");
		}else if(StglCommon.ST_INFO_SHITIGUQUAN.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("实体股权结构");
		}else if(StglCommon.ST_INFO_SHITIDASHIJI.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getGdsjbh();
			assetChangeLog.setUpsheet("实体大事记");
		}else if(StglCommon.ST_INFO_CAIWUBAOBIAO.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getGdsjbh();
			assetChangeLog.setUpsheet("实体财务报表");
		}else if(StglCommon.ST_INFO_JINE.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("(实体资产)现金");
		}else if(StglCommon.ST_INFO_TUDI.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getJtdbh();
			assetChangeLog.setUpsheet("(实体资产)土地");
		}else if(StglCommon.ST_INFO_FANGWU.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getKfwbh();
			assetChangeLog.setUpsheet("(实体资产)房屋");
		}else if(StglCommon.ST_INFO_JIXIESHEBE.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getMsbbh();
			assetChangeLog.setUpsheet("(实体资产)机械设备");
		}else if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getLjtgjbh();
			assetChangeLog.setUpsheet("(实体资产)交通运输");
		}else if(StglCommon.ST_INFO_QITAZICHAN.equals(fsxx_new.getStnzcfl())){
			strObjcode = fsxx_new.getLjtgjbh();
			assetChangeLog.setUpsheet("(实体资产)其他资产");
		}else if(StglCommon.ST_INFO_XIANGMUCHUZI.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("项目企业出资情况");
		}else if(StglCommon.ST_INFO_ZHIQINGRENYUAN.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("(实体人员信息)知情人员");
		}else if(StglCommon.ST_INFO_ANZHIRENYUAN.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("(实体人员信息)安置人员");
		}else if(StglCommon.ST_INFO_WENJIANCUNFANG.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("文件及公章存放情况");
		}else if(StglCommon.ST_INFO_DUIWAITOUZI.equals(fsxx_new.getStnzcfl())){
			assetChangeLog.setUpsheet("(实体资产)对外投资");
		}
		if("新增".equals(opType)){
			if(StglCommon.ST_INFO_SHITIRENYUAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("姓名");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getFxingming());//修改后值
			}else if(StglCommon.ST_INFO_GAOGUANRENYUAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("姓名");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getFxingming());//修改后值
			}else if(StglCommon.ST_INFO_SHITIGUQUAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("股东名称");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getEgdmc());//修改后值
			}else if(StglCommon.ST_INFO_SHITIDASHIJI.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("大事记编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getGdsjbh());//修改后值
			}else if(StglCommon.ST_INFO_CAIWUBAOBIAO.equals(fsxx_new.getStnzcfl())){
//				strObjcode = fsxx_new.getGdsjbh();
//				assetChangeLog.setUpsheet("实体财务报表");
			}else if(StglCommon.ST_INFO_JINE.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("现金编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getHxjbh());//修改后值
			}else if(StglCommon.ST_INFO_TUDI.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("土地编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getJtdbh());//修改后值
			}else if(StglCommon.ST_INFO_FANGWU.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("房屋编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getKfwbh());//修改后值
			}else if(StglCommon.ST_INFO_JIXIESHEBE.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("机器设备编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getMsbbh());//修改后值
			}else if(StglCommon.ST_INFO_DUIWAITOUZI.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("对外投资编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getNdwtzbh());//修改后值
			}else if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("交通工具编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getLjtgjbh());//修改后值
			}else if(StglCommon.ST_INFO_QITAZICHAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("其他资产编号");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getPqtzcbh());//修改后值
			}else if(StglCommon.ST_INFO_XIANGMUCHUZI.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("股东名称");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getQgdmc());//修改后值
			}else if(StglCommon.ST_INFO_ZHIQINGRENYUAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("姓名");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getFxingming());//修改后值
			}else if(StglCommon.ST_INFO_ANZHIRENYUAN.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("姓名");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getFxingming());//修改后值
			}else if(StglCommon.ST_INFO_WENJIANCUNFANG.equals(fsxx_new.getStnzcfl())){
				assetChangeLog.setUpproper("存放地点");//修改属性名称
				assetChangeLog.setUpaftervalue(fsxx_new.getAcfdd());//修改后值
			}
		}
	}
	
	@SuppressWarnings({ "unchecked", "unchecked" })
	public String getFsxxPropNameByPropId_base(String proId){
		HashMap hashMap=new HashMap();
		//实体人员信息
		hashMap.put("fxingming", "姓名");
		hashMap.put("fxingbie", "性别");
		hashMap.put("fnianling", "年龄");
		hashMap.put("fsfzh", "身份证号");
		hashMap.put("fcHyzk", "婚姻状况");
		hashMap.put("fminzu", "民族");
		hashMap.put("fjiguan", "籍贯");
		hashMap.put("fcsny", "出生年月");
		hashMap.put("fcZhiwu", "职务");
		hashMap.put("fbyxx", "毕业学校");
		hashMap.put("fzhuanye", "专业");
		hashMap.put("fcXueli", "学历");
		hashMap.put("fshouji", "手机");
		hashMap.put("fjtzz", "家庭住址");
		hashMap.put("fyzbm", "邮政编码");
		hashMap.put("fdianhua", "单位电话");
		hashMap.put("fdzyx", "电子邮箱");
		hashMap.put("frzsj", "任职时间");
		hashMap.put("flzsj", "离职时间");
		hashMap.put("fshouru", "收入");
		hashMap.put("fgzffdw", "工资发放单位");
		hashMap.put("fcRylx", "人员类型");
		hashMap.put("stxz", "档案存放单位");
		hashMap.put("fzyzgqk", "执业资格情况");
		hashMap.put("fsffr", "是否法人");
		//(实体人员信息)知情人员
		hashMap.put("fyddh", "移动电话");
		hashMap.put("fgddh", "固定电话");
		hashMap.put("fgzffdw", "工作单位");
		//(实体人员信息)安置人员
		hashMap.put("fazfs", "安置方式");
		hashMap.put("fazfy", "安置费用(元)");
		hashMap.put("fazzt", "安置状态");
		hashMap.put("fsfyst", "是否有收条");
		hashMap.put("fsfyazxy", "是否有安置协议");
		hashMap.put("gdsjbz", "备注");
		//高管人员信息
		hashMap.put("fxingming", "姓名");
		hashMap.put("fcZhiwu", "职务");
		hashMap.put("frzsj", "聘任时间");
		hashMap.put("flzsj", "离职时间");
		//股权结构
		hashMap.put("egdmc", "股东名称");
		hashMap.put("egdxz", "股东性质");
		hashMap.put("ecgbl", "持股比例(%)");
		hashMap.put("ebgrq", "报告日期");
		hashMap.put("ecgsl", "持股数量(股)");
		hashMap.put("ebbsfkg", "本部是否控股");
		//实体大事记
		hashMap.put("gdsfsrq", "大事发生日期");
		hashMap.put("gcSjlx", "事件类型");
		hashMap.put("gdsnr", "大事内容");
		hashMap.put("gdsjbz", "备注");
		//实体财务报表
		hashMap.put("dcBbfl", "报表分类");
		hashMap.put("dcBblx", "报表类型");
		hashMap.put("dhylx", "行业类型");
		hashMap.put("dbbrq", "报表日期");
		hashMap.put("dbbscrq", "报表上传日期");
		//实体内资产（现金）
		hashMap.put("hjine", "金额(元)");
		hashMap.put("hzhanghu", "账户");
		hashMap.put("hzhmc", "账户名称");
		//实体内资产（土地）
		hashMap.put("jtdmc", "土地名称");
		hashMap.put("jtdqdfs", "土地取得方式");
		hashMap.put("jtdsyqz", "《土地使用权证》");
		hashMap.put("jsjzyr", "实际占有人");
		hashMap.put("jxlbmyy", "《土地使用权证》没有及下落不明的原因");
		hashMap.put("jtdsfdy", "土地是否抵押");
		hashMap.put("jtddyqkjs", "抵押情况介绍");
		hashMap.put("jtdmj", "面积（平方米）");
		hashMap.put("jtdsyqr", "土地使用权人");
		hashMap.put("jtdpgz", "评估值(元)");
		hashMap.put("jbxe", "变现额(元)");
		hashMap.put("jtdms", "土地描述");
		hashMap.put("jtdzt", "资产状态");
		hashMap.put("jcCzfs", "处置方式");
		//实体内资产（房屋）
		hashMap.put("kfwdz", "地址");
		hashMap.put("kfwsyqr", "房屋所有权人");		
		hashMap.put("kfwsjzyr", "实际占有人");
		hashMap.put("kywfwsyqz", "有无房屋使用权证");
		hashMap.put("kxlbmyy", "《房屋使用权证》没有及下落不明的原因");
		hashMap.put("ksfdy", "房屋是否抵押");
		hashMap.put("kdyqk", "抵押情况介绍");
		hashMap.put("kfwmj", "面积(平方米)");
		hashMap.put("ksyqr", "房屋使用权人");
		hashMap.put("kfwpgz", "评估值(元)");	
		hashMap.put("kfwbxe", "变现额(元)");		
		hashMap.put("kfwms", "房屋描述");		
		hashMap.put("kfwzt", "房屋 资产状态");		
		hashMap.put("kcCzfs", "处置方式");	
		//实体内资产（机器设备）
		hashMap.put("msbmc", "名称");
		hashMap.put("msbcfwz", "存放何处");	
		hashMap.put("msbqs", "权属");		
		hashMap.put("msbsjzyr", "实际占有人");	
		hashMap.put("msbsfdy", "机器是否抵押");
		hashMap.put("msbdyjs", "抵押情况介绍");
		hashMap.put("msbpgz", "评估值(元)");	
		hashMap.put("msbbxe", "变现额(元)");
		hashMap.put("msbms", "机器设备描述");
		hashMap.put("msbzt", "机器设备状态");	
		hashMap.put("mcCzfs", "处置方式");	
		//实体内资产（交通运输工具）
		hashMap.put("lcph", "车牌号");
		hashMap.put("ljtgjcfwz", "存放何处");
		hashMap.put("lqs", "权属");
		hashMap.put("lsjzyr", "实际占有人");
		hashMap.put("lsfdy", "交通工具是否抵押");
		hashMap.put("ldyjs", "抵押情况介绍");
		hashMap.put("lpgz", "评估值(元)");
		hashMap.put("lbxe", "变现额(元)");
		hashMap.put("ljtgjms", "交通运输工具描述");
		hashMap.put("ljtgjzt", "交通工具状态");
		hashMap.put("lcCzfs", "处置方式");
		//实体内资产（对外投资）
		hashMap.put("nbtqymc", "被投资企业名称");
		hashMap.put("ntze", "投资额(元)");
		hashMap.put("ntzfs", "投资方式");
		hashMap.put("ntzqkms", "投资情况描述");
		//实体内资产（其他资产）
		hashMap.put("pqtzcqs", "权属");
		hashMap.put("pqtzcsjzyr", "实际占有人");
		hashMap.put("pqtzcsfdy", "其他资产是否抵押");
		hashMap.put("pdyjs", "抵押情况介绍");
		hashMap.put("ppgz", "评估值(元)");
		hashMap.put("pbxe", "变现额(元)");
		hashMap.put("pzcms", "其他资产描述");
		//非咨询实体项目企业出资情况
		hashMap.put("qgdmc", "股东名称");
		hashMap.put("qkgbl", "持股比例（%");
		hashMap.put("qzczb", "注册资本（万元)");
		hashMap.put("qcCzfs", "出资方式");
		hashMap.put("qcCzqk", "出资情况");
		hashMap.put("qczbsse", "出资不实的数额(元)");
		hashMap.put("qcCtcz", "抽逃出资");
		hashMap.put("qctse", "抽逃数额(元)");
		hashMap.put("qdlfrzg", "独立法人资格");
		
		return (String) hashMap.get(proId);
	}
	@SuppressWarnings("unchecked") 
	public List<StFsxx> viewEntityFsxx(String stid, String leixing) {
		return (List<StFsxx>)publicDao.find("from StFsxx o  where o.sfbc='1' and o.stid='" + stid + "' and o.leixing='" + leixing + "'");
	}
	@SuppressWarnings("unchecked")
	public List<StFsxx> viewEntityFsxxPop(String stid, String leixing,String pop) {
		return (List<StFsxx>)publicDao.find("from StFsxx o where o.sfbc='1' and o.stid = '" + stid + "' and o.leixing = '" + leixing + "' and o.stnzcfl = '"+ pop +"'" );
	}
	
	/**
     * 贷款抵制压物查询 add by chenyuxiao 
     * @param loansId
     * @param leixing
     * @param pop
     * @return
     */
    @SuppressWarnings("unchecked")
	public List<StFsxx> viewEntityFsxxLoans(String loansId,String leixing,String pop){
		return (List<StFsxx>)publicDao.find("from StFsxx o where o.sfbc='1' and o.cdkzh = '" + loansId + "' and o.leixing = '" + leixing + "' and o.stnzcfl = '"+ pop +"'" );
    }
	
	public StJbxx viewEntityJbxx(String stid) {
		List param=new ArrayList();
		param.add(stid);
		return  (StJbxx)publicDao.findSingleResult("from StJbxx where id=? ",param);
	}


	/**
	 * 保存实体信息
	 */
	public void saveEntity(StJbxx jbxx) {

//		SsProc o = publicDao.findById(SsProc.class, ssproc.getId());
//		try {
//			BeanUtils.copyProperties(o, ssproc);
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
//		publicDao.update(o);
	
		
		if(jbxx.getId() != null){
			StJbxx	jbxxN = publicDao.findById(StJbxx.class, jbxx.getId());
			try {
				BeanUtils.copyProperties(jbxxN, jbxx);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			publicDao.update(jbxxN);
		}else if(jbxx.getId() == null){
			publicDao.save(jbxx);
		}
		
		 
	}
//记录实体日志
	@SuppressWarnings("unchecked")
	public void saveEntityLog(StJbxx jbxx_old,StJbxx jbxx_new,String opType) {
		 if("修改".equals(opType)){
			 //资产编号
			String strObjcode = jbxx_new.getZcbh();
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = BeanUtils.describe(jbxx_old);
				newMap = BeanUtils.describe(jbxx_new);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			Set<String> newSet = newMap.keySet();
			Iterator ite = newSet.iterator();
			while (ite.hasNext()) {
				String property = (String) ite.next();
				if ("id".equals(property) || "class".equals(property) || "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)) {
					continue;
				}else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
					//注册日期（成立时间）
					if("clsj".equals(property)){
						if(jbxx_new.getClsj()!= null){
							valueNew = DateUtils.formatDate(jbxx_new.getClsj());
						}
						if(jbxx_old.getClsj() != null){
							valueOld = DateUtils.formatDate(jbxx_old.getClsj());
						}
					}
					//原建行投资日期
					if("yjhtzrq".equals(property)){
						if(jbxx_new.getYjhtzrq() != null){
							valueNew = DateUtils.formatDate(jbxx_new.getYjhtzrq());
						}
						if(jbxx_old.getYjhtzrq() != null){
							valueOld = DateUtils.formatDate(jbxx_old.getYjhtzrq());
						}
					}
					//实体性质
					if("stxz".equals(property)){
						if(jbxx_new.getStxz() != null){
							if("0".equals(jbxx_new.getStxz())){
								valueNew = "非上市实体";
							}else if("1".equals(jbxx_new.getStxz())){
								valueNew = "上市实体";
							}
						}
						if(jbxx_old.getStxz() != null){
							if("0".equals(jbxx_old.getStxz())){
								valueOld = "非上市实体";
							}else if("1".equals(jbxx_old.getStxz())){
								valueOld = "上市实体";
							}							
						}
					}
					
					//行业
					if("CHangye".equals(property)){
						if(jbxx_new.getCHangye() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_TRADE",jbxx_new.getCHangye() );
						}
						if(jbxx_old.getCHangye() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_TRADE",jbxx_old.getCHangye() );
						}
					}
					
					//实体状态
					if("CStzt".equals(property)){
						if(jbxx_new.getCStzt() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_STATUS",jbxx_new.getCHangye() );
						}
						if(jbxx_old.getCStzt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_STATUS",jbxx_old.getCHangye() );
						}
					}	
					//地区（省份）
					if("CShengfen".equals(property)){
						if(jbxx_new.getCShengfen() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("PROVIENCE",jbxx_new.getCShengfen() );
						}
						if(jbxx_old.getCStzt() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("PROVIENCE",jbxx_old.getCShengfen() );
						}
					}	
					//实体处置方式
					if("CCzfs".equals(property)){
						if(jbxx_new.getCCzfs() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_DISPOSE_METHOD",jbxx_new.getCCzfs() );
						}
						if(jbxx_old.getCCzfs() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_DISPOSE_METHOD",jbxx_old.getCCzfs() );
						}
					}	
					//管理部门
					if("CGlbm".equals(property)){
						if(jbxx_new.getCGlbm() != null){
							if("1".equals(jbxx_new.getCGlbm())){
								valueNew = "委托代理业务部";
							}else if("2".equals(jbxx_new.getCGlbm())){
								valueNew = "资产管理处置部";
							}
						}
						if(jbxx_old.getCGlbm() != null){
							if("1".equals(jbxx_new.getCGlbm())){
								valueOld = "委托代理业务部";
							}else if("2".equals(jbxx_new.getCGlbm())){
								valueOld = "资产管理处置部";
							}						
						}
					}	

					//经营分类
					if("jyfl".equals(property)){
						if(jbxx_new.getJyfl() != null){
							if("0".equals(jbxx_new.getJyfl())){
								valueNew = "持续经营类";
							}else if("1".equals(jbxx_new.getJyfl())){
								valueNew = "处置类";
							}
						}
						if(jbxx_old.getJyfl() != null){
							if("0".equals(jbxx_old.getJyfl())){
								valueOld = "持续经营类";
							}else if("1".equals(jbxx_old.getJyfl())){
								valueOld = "处置类";
							}							
						}
					}	
					
					//经济性质
					if("jjxz".equals(property)){
						if(jbxx_new.getJjxz() != null){
							valueNew = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_PROPERTY",jbxx_new.getJjxz());
						}
						if(jbxx_old.getJjxz() != null){
							valueOld = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_PROPERTY",jbxx_old.getJjxz());
						}
					}						
					
					//实体现状（非咨询）
					if("stxz2".equals(property)){
						if(jbxx_new.getStxz2() != null){
							if("1".equals(jbxx_new.getJyfl())){
								valueNew = "正常年检";
							}else if("2".equals(jbxx_new.getStxz2())){
								valueNew = "停业";
							}else if("3".equals(jbxx_new.getStxz2())){
								valueNew = "吊销未清算";
							}else if("4".equals(jbxx_new.getStxz2())){
								valueNew = "吊销清算中";
							}else if("5".equals(jbxx_new.getStxz2())){
								valueNew = "注销";
							}else if("6".equals(jbxx_new.getStxz2())){
								valueNew = "破产中";
							}else if("7".equals(jbxx_new.getStxz2())){
								valueNew = "其他（见备注）";
							}
						}
						if(jbxx_old.getStxz2() != null){
							if("1".equals(jbxx_old.getJyfl())){
								valueOld = "正常年检";
							}else if("2".equals(jbxx_old.getStxz2())){
								valueOld = "停业";
							}else if("3".equals(jbxx_old.getStxz2())){
								valueOld = "吊销未清算";
							}else if("4".equals(jbxx_old.getStxz2())){
								valueOld = "吊销清算中";
							}else if("5".equals(jbxx_old.getStxz2())){
								valueOld = "注销";
							}else if("6".equals(jbxx_old.getStxz2())){
								valueOld = "破产中";
							}else if("7".equals(jbxx_old.getStxz2())){
								valueOld = "其他（见备注）";
							}
						}
					}
					//经营分类
					if("jyfl".equals(property)){
						if(jbxx_new.getJyfl() != null){
							if("0".equals(jbxx_new.getJyfl())){
								valueNew = "持续经营类";
							}else if("1".equals(jbxx_new.getJyfl())){
								valueNew = "处置类";
							}
						}
						if(jbxx_old.getJyfl() != null){
							if("0".equals(jbxx_old.getJyfl())){
								valueOld = "持续经营类";
							}else if("1".equals(jbxx_old.getJyfl())){
								valueOld = "处置类";
							}							
						}
					}	
					//有无历史遗留问题
					if("ywlsylwt".equals(property)){
						if(jbxx_new.getYwlsylwt() != null){
							if("0".equals(jbxx_new.getYwlsylwt())){
								valueNew = "否";
							}else if("1".equals(jbxx_new.getYwlsylwt())){
								valueNew = "有";
							}
						}
						if(jbxx_old.getYwlsylwt() != null){
							if("0".equals(jbxx_old.getYwlsylwt())){
								valueOld = "否";
							}else if("1".equals(jbxx_old.getYwlsylwt())){
								valueOld = "有";
							}
						}
					}
					//对建投是否有负债
					if("djtsfyfz".equals(property)){
						if(jbxx_new.getDjtsfyfz() != null){
							if("0".equals(jbxx_new.getDjtsfyfz())){
								valueNew = "无";
							}else if("1".equals(jbxx_new.getDjtsfyfz())){
								valueNew = "是";
							}
						}
						if(jbxx_old.getDjtsfyfz() != null){
							if("0".equals(jbxx_old.getDjtsfyfz())){
								valueOld = "无";
							}else if("1".equals(jbxx_old.getDjtsfyfz())){
								valueOld = "是";
							}
						}
					}
					//账面内是否有预计负债
					if("zmnsfyyjfz".equals(property)){
						if(jbxx_new.getZmnsfyyjfz() != null){
							if("0".equals(jbxx_new.getZmnsfyyjfz())){
								valueNew = "无";
							}else if("1".equals(jbxx_new.getZmnsfyyjfz())){
								valueNew = "是";
							}
						}
						if(jbxx_old.getZmnsfyyjfz() != null){
							if("0".equals(jbxx_old.getZmnsfyyjfz())){
								valueOld = "无";
							}else if("1".equals(jbxx_old.getZmnsfyyjfz())){
								valueNew = "是";
							}
						}
					}
								
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					assetChangeLog.setUpobjId(jbxx_old.getId());//被修改对象的主键
					assetChangeLog.setUpobjcode(strObjcode);
					assetChangeLog.setUpsheet("基本信息");//修改的页签
					assetChangeLog.setUpproper(getPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
					if (valueOld == null) {// 改变前值
						assetChangeLog.setUpbefovalue(null);
					} else {
						assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
					}
					if (valueNew != null) {
						publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
					}
				}
				}			 
		 }else if("新增".equals(opType)){
			String strObjcode = jbxx_new.getZcbh();	
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(jbxx_new.getId());//被修改对象的主键
			assetChangeLog.setUpobjcode(strObjcode);
			assetChangeLog.setUpsheet("基本信息");//修改的页签
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
		 }else if("删除".equals(opType)){
			 	String strObjcode = jbxx_old.getZcbh();	
				String strUserName=UserThreadLocal.get().getUsername();
				Long strUserID=UserThreadLocal.get().getUserTid();
				AssetChangeLog assetChangeLog = new AssetChangeLog();
				assetChangeLog.setPersonId(strUserID.toString());
				assetChangeLog.setPersonName(strUserName);
				assetChangeLog.setUpdatedate(new Date());
				assetChangeLog.setUpsheet("基本信息");//修改的页签
				assetChangeLog.setUpdatetype(opType);//新增、修改、删除
				assetChangeLog.setUpobjId(jbxx_old.getId());//,被修改对象的主键
				assetChangeLog.setUpobjcode(strObjcode);
				assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统	
				publicDao.saveOrUpdateAttach(assetChangeLog);
			}
	}

	@SuppressWarnings("unchecked")
	public String getPropNameByPropId_base(String proId){
		//咨询
		HashMap hashMap=new HashMap();
		hashMap.put("stxz", "实体性质");
		hashMap.put("stzwmc","实体中文名称");
		hashMap.put("stywmc", "实体英文名称");
		hashMap.put("CHangye", "行业");
		hashMap.put("CStzt", "实体状态");
		hashMap.put("CShengfen", "地区");
		hashMap.put("c_czfs", "实体处置方式");
		hashMap.put("CGlbm", "管理部门");
		hashMap.put("CWtgljg", "委托管理机构");
		hashMap.put("jyfl", "经营分类");
		hashMap.put("mqjyzt","目前经营状态");
		hashMap.put("sjkzdw","实际控制单位");
		hashMap.put("frdb","法人代表");
		hashMap.put("clsj","注册日期");
		hashMap.put("zcdz","注册地址");
		hashMap.put("zczj","注册资金");
		hashMap.put("mycyr","名义持有人");
		hashMap.put("zjl","总经理");
		hashMap.put("khyh","开户银行");
		hashMap.put("yezxh","营业执照号");
		hashMap.put("yezzyxq","营业执照有效期");
		hashMap.put("swdjbh","税务登记编号");
		hashMap.put("gpdm","股票代码");
		hashMap.put("yjhtzrq","原建行投资日期");
		hashMap.put("ytzgs","原投资公司");
		hashMap.put("zmtz","账面投资（万元）");
		hashMap.put("sjtz","实际投资（万元）");
		hashMap.put("lxr","联系人");
		hashMap.put("lxdh","联系电话");
		hashMap.put("chuanzhen","传真");
		hashMap.put("zydz","主页地址");
		hashMap.put("bgdz","办公地址");
		hashMap.put("yzbm","邮政编码");
		hashMap.put("jjxz","经济性质");
		hashMap.put("yzbm","邮政编码");
		hashMap.put("zyyw","主营业务");
		hashMap.put("jyyw","兼营业务");
		hashMap.put("zzqk","资质情况");
		hashMap.put("czygsnsqk","出资与工商年审情况");
		hashMap.put("stjj","实体简介");
		//非咨询实体基本信息
		hashMap.put("stxz2","实体现状");
		hashMap.put("syrys","尚有人员数");
		hashMap.put("ywlsylwt","有无历史遗留问题");
		hashMap.put("lsylwtms","历史遗留问题描述");
		hashMap.put("yuanzhi","原值(万元)");
		hashMap.put("jingzhi","净值(万元）");
		hashMap.put("jzzb","减值准备(万元)");
		hashMap.put("djtsfyfz","对建投是否有负债");
		hashMap.put("fzje","负债金额(万元)");
		hashMap.put("zmnsfyyjfz","账面内是否有预计负债");
		hashMap.put("yjfzje","预计负债金额(万元)");
		hashMap.put("zmzcze","账面资产总额(万元)");
		hashMap.put("zmzcfz","账面资产负债(万元)");
		hashMap.put("beizhu","备注");
		return (String) hashMap.get(proId);
	}
	
	public int selectFsxxCount(String stid, String stlx) {
		List<Long> countList=(List<Long>) publicDao.find("select count(*) from StFsxx o where  o.stid = ?  and o.leixing = ?   and o.sfbc = '1'   ", new Object[]{stid,stlx});
		System.out.println(countList.get(0).intValue());
		return countList.get(0).intValue();
	}

	//------------------------实体资产评估信息----------------------------
	
	/**
	 * 插入一条数据
	 */
	 public void saveZcPgXx(ZcPgXx zc){
		 publicDao.save(zc);
	 }
	
	/**
	 * 保存一条数据
	 */
	 public void updateZcPgXx(ZcPgXx zc){
//			 publicDao.update(zc);
//		 	ZcPgXx o = new ZcPgXx();
//			try {
//				BeanUtils.copyProperties(o, zc);
//			} catch (IllegalAccessException e) {
//				e.printStackTrace();
//			} catch (InvocationTargetException e) {
//				e.printStackTrace();
//			}
//			publicDao.update(o);
		 	ZcPgXx	pgxxN = publicDao.findById(ZcPgXx.class, zc.getId());
			try {
				BeanUtils.copyProperties(pgxxN, zc);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			publicDao.update(pgxxN);
	 }
	/**
	 * 保存一条数据
	 */
	 public void saveOrUpdateZcPgXx(ZcPgXx zc){
			List param=new ArrayList();
			param.add(zc.getId());
		 	ZcPgXx zcpgxx = (ZcPgXx)publicDao.findSingleResult("from ZcPgXx where id=? ",param);
			if(zcpgxx ==null ){
				publicDao.save(zc);
			}else{
				ZcPgXx o = new ZcPgXx();
				try {
					BeanUtils.copyProperties(o, zc);
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InvocationTargetException e) {
					e.printStackTrace();
				}
				publicDao.update(o);
			}
	 }
	 
	
	/**
	 * 根据主键查找ZcPgXx 信息
	 */
	public ZcPgXx getZcPgXx(String id){
		String[]params = new String[1];
		params[0] = id;
		return (ZcPgXx)publicDao.findSingleResult("from ZcPgXx where id=?", params);
	}
	
	
	/**
	 * 根据stfsxxid查找ZcPgXx 信息
	 */
	public ZcPgXx viewZcPgXx(String stfsxxid){
		String[]params = new String[1];
		params[0] = stfsxxid;
		return (ZcPgXx)publicDao.findSingleResult("from ZcPgXx where stfsxxid=?", params);
	}
	
	/**
	 * 根据stfsxxid查找ZcPgXx列表 信息
	 */
	public List<ZcPgXx> getZcPgXxList(String stfsxxid,String ispgsc){
		String[]params = new String[1];
		params[0] = stfsxxid;
		if("1".equals(ispgsc)){
			return (List<ZcPgXx>)publicDao.find("from ZcPgXx o where o.stfsxxid=? ", params);
		}else{
			return (List<ZcPgXx>)publicDao.find("from ZcPgXx o where o.stfsxxid=?  and o.sfbc='1' ", params);
		}
	}
	
	/**
	 * 删除评估信息
	 */
	public void deleteZcPgXx(String[] ZcPgXxIds) {
		for (int i = 0; i < ZcPgXxIds.length; i++) {
			if(StringUtils.isNotEmpty(ZcPgXxIds[i])){
//				ZcPgXx zcPgXx = (ZcPgXx) publicDao.findSingleResult(
//						"from ZcPgXx o where o.id =?", new Object[] { new String(
//								ZcPgXxIds[i]) });
//				publicDao.delete(zcPgXx);
				String sql = "UPDATE ZC_PG_XX SET SFBC = '0'  WHERE ID = ? ";
				List params = new ArrayList();
				params.add(ZcPgXxIds[i]);
				publicDao.updateBySql(sql, params);
				
			}
		}
	}
	//---------------------债权  债务------------------------
	
	/**
	 * 插入一条DebtInfo
	 * @param st
	 */
	public void newDebtInfo(DebtInfo di){
		publicDao.save(di);
	}
	
	/**
	 * 保存一条DebtInfo
	 * @param st
	 */
	public void saveDebtInfo(DebtInfo di){
		publicDao.update(di);
	}
	
	/**
	 * 根据id查找DebtInfo
	 * @param id
	 * @return
	 */
	public DebtInfo getDebtInfo(String id){
		String[]params = new String[1];
		params[0] = id;
		return (DebtInfo)publicDao.findSingleResult("from DebtInfo where id=?", params);
	}
	
	/**
	 * 删除DebtInfo
	 * @param id
	 */
	public void deleteDebtInfo(String[] id){
		for(int i = 0;i<id.length;i++){
			if(StringUtils.isNotEmpty(id[i])){
				DebtInfo di = (DebtInfo)publicDao.findSingleResult("from DebtInfo where id=?", new Object[] {new String(id[i])});
				publicDao.delete(di);
			}
		}
	}
	
	/**
	 * 根据zwrid 查找 债务列表
	 * @param id
	 * @return
	 */
	public List<DebtInfo> getDebtInfoList(String id) {
		List<DebtInfo> debtList = (List<DebtInfo>)publicDao.find("from DebtInfo o where o.zwrid='" + id + "'"+"and o.sfbc='1'");
		if(debtList == null)return new ArrayList<DebtInfo>();
		return debtList;
	}
	
	/**
	 *   根据zqrid 查找债权 列表
	 * @param id
	 * @return
	 */
	public List<DebtInfo> getDebtList(String id) {
		List<DebtInfo> debtList = (List<DebtInfo>)publicDao.find("from DebtInfo o where o.zqrid='" + id + "'"+"and o.sfbc='1'");
		if(debtList == null)return new ArrayList<DebtInfo>();
		return debtList;
	}
	
	//-----------------------税务------------------------
	/**
	 * 根据stid 查找 税务 列表
	 * @param id
	 * @return
	 */
	public List<StSkjnXx> getTaxList(String id) {
		List<StSkjnXx> taxList = (List<StSkjnXx>)publicDao.find("from StSkjnXx o where o.stId='" + id + "'"+"and o.sfbc='1'");
		if(taxList == null)return new ArrayList<StSkjnXx>();
		return taxList;
	}
	
	/**
	 * 插入一条StSkjnXx
	 * @param st
	 */
	public void newTaxInfo(StSkjnXx dk){
		publicDao.save(dk);
	}
	
	/**
	 * 保存一条StSkjnXx
	 * @param st
	 */
	public void saveTaxInfo(StSkjnXx dk){
		publicDao.update(dk);
	}
	
	/**
	 * 根据id查找StSkjnXx
	 * @param id
	 * @return
	 */
	public StSkjnXx getTaxInfo(String id){
		String[]params = new String[1];
		params[0] = id;
		return (StSkjnXx)publicDao.findSingleResult("from StSkjnXx where id=?", params);
	}
	
	/**
	 * 删除StSkjnXx
	 * @param id
	 */
	public void deleteTaxInfo(String[] id){
		for(int i = 0;i<id.length;i++){
			if(StringUtils.isNotEmpty(id[i])){
				StSkjnXx dk = (StSkjnXx)publicDao.findSingleResult("from StSkjnXx where id=?", new Object[] {new String(id[i])});
				publicDao.delete(dk);
			}
		}
	}
	
	//-----------------------------诉讼查询-----------------------
	
	/**
	 * 诉讼  被诉  查询
	 * @param stid            实体id
	 * @param litigationType  诉讼/被诉
	 */
	public List<SsBaseinfo> getLitigationList(String stid,String litigationType){
		
		List<SsBaseinfo> list = (List<SsBaseinfo>)publicDao.find("from SsBaseinfo where sazcid ='"+ stid + "' and sslxid ='"+ litigationType +"'");
		if(list == null){
			return new ArrayList<SsBaseinfo>();
		}
		return list;
	}
	
	//更新实体状态
	public void updateEntityState(String stid, String state){
		StJbxx st = this.viewEntityJbxx(stid);
		st.setCStzt(state);
		publicDao.update(st);
	}


	public StFsxx viewEntityFsxx(String id) {
		StFsxx stFsxx = (StFsxx) publicDao.findSingleResult(
				"from StFsxx o where o.id =?", new Object[] { id});
		return stFsxx;
	}
	public List<PTEnd> queryEndList_page(String strSTID ,Paginator paginator, String title) {
		List<PTEnd> resultList = new ArrayList();
		List templist = new ArrayList();
		StringBuffer stringbuffer = new StringBuffer();
		String strSQL = "";
		stringbuffer
				.append("select id from p_t_end where ( head_id in (select a.id from st_head a, ST_GLBT b where a.id = b.cld_id and b.st_id = '"+strSTID+"') or head_id in (select id from cz_stcztz where stid = '"+strSTID+"') or head_id in (select cld_id from cz_zc_xx where bstid = '"+strSTID+"'))");
		if (title != null) {
			stringbuffer.append(" and title like '%" + title + "%'");
		}
		stringbuffer.append(" order by id desc");
		
		templist = publicDao.queryForList(stringbuffer.toString(), new ArrayList());
		strSQL = stringbuffer.toString();
		//System.out.println("查询的SQL：===" + strSQL + "===");
		for (int i = 0; i < templist.size(); i++) {
			Map tempMap = (Map) templist.get(i);
			PTEnd ptend = publicDao.findById(PTEnd.class,new Long( tempMap
					.get("ID").toString()));
			resultList.add(ptend);
		}
		return resultList;
	}

	/**
	 * 保存实体内资产评估信息变动日志
	 */
	public void saveEntityZcPgXxLog(ZcPgXx zcPgXx_old, ZcPgXx zcPgXx_new,
			String opType) {
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = BeanUtils.describe(zcPgXx_old);
				newMap = BeanUtils.describe(zcPgXx_new);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			Set<String> newSet = newMap.keySet();
			Iterator ite = newSet.iterator();
			while (ite.hasNext()) {
				String property = (String) ite.next();
				if ("id".equals(property) || "class".equals(property) || "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)) {
					continue;
				}else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
					//评估基准日
					if("pgjzr".equals(property)){
						if(zcPgXx_new.getPgjzr()!= null){
							valueNew = DateUtils.formatDate(zcPgXx_new.getPgjzr());
						}
						if(zcPgXx_old.getPgjzr() != null){
							valueOld = DateUtils.formatDate(zcPgXx_old.getPgjzr());
						}
					}
					
					//评估方法
					if("CJzlx".equals(property)){
						if(zcPgXx_new.getCJzlx() != null){
							if("0".equals(zcPgXx_new.getCJzlx())){
								valueNew = "市场法";
							}else if("1".equals(zcPgXx_new.getCJzlx())){
								valueNew = "成本法";
							}else if("2".equals(zcPgXx_new.getCJzlx())){
								valueNew = "收益法";
							}
						}
						if(zcPgXx_old.getCJzlx() != null){
							if("0".equals(zcPgXx_old.getCJzlx())){
								valueOld = "市场法";
							}else if("1".equals(zcPgXx_old.getCJzlx())){
								valueOld = "成本法";
							}else if("2".equals(zcPgXx_old.getCJzlx())){
								valueOld = "收益法";
							}
						}
					}
					//价值类型
					if("CJzlx".equals(property)){
						if(zcPgXx_new.getCJzlx() != null){
							if("1".equals(zcPgXx_new.getCJzlx())){
								valueNew = "市场价值";
							}else if("2".equals(zcPgXx_new.getCJzlx())){
								valueNew = "清算价值";
							}else if("3".equals(zcPgXx_new.getCJzlx())){
								valueNew = "在用价值";
							}else if("4".equals(zcPgXx_new.getCJzlx())){
								valueNew = "残余价值";
							}else if("5".equals(zcPgXx_new.getCJzlx())){
								valueNew = "投资价值";
							}
						}
						if(zcPgXx_old.getCJzlx() != null){
							if("1".equals(zcPgXx_old.getCJzlx())){
								valueOld = "市场价值";
							}else if("2".equals(zcPgXx_old.getCJzlx())){
								valueOld = "清算价值";
							}else if("3".equals(zcPgXx_old.getCJzlx())){
								valueOld = "在用价值";
							}else if("4".equals(zcPgXx_old.getCJzlx())){
								valueOld = "残余价值";
							}else if("5".equals(zcPgXx_old.getCJzlx())){
								valueOld = "投资价值";
							}
						}
					}
					
					
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					assetChangeLog.setUpobjId(zcPgXx_old.getStid());//被修改对象的主键
					//修改的页签
					if("土地".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(土地)评估信息");
					}else if("房屋".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
					}else if("机械设备".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(机械设备)评估信息");
					}else if("交通工具".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(交通工具)评估信息");
					}else if("房屋".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
					}else if("其他资产".equals(zcPgXx_old.getSttzclx())){
						assetChangeLog.setUpsheet("实体内资产(其他资产)评估信息");
					}
					assetChangeLog.setUpproper(getZcPgXxPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
					if (valueOld == null) {// 改变前值
						assetChangeLog.setUpbefovalue(null);
					} else {
						assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
					}
					if (valueNew != null) {
						publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
					}
				}
			}
						
		}else if("新增".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(zcPgXx_new.getStid());//被修改对象的主键
			//修改的页签
			if("土地".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(土地)评估信息");
			}else if("房屋".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
			}else if("机械设备".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(机械设备)评估信息");
			}else if("交通工具".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(交通工具)评估信息");
			}else if("房屋".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
			}else if("其他资产".equals(zcPgXx_new.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(其他资产)评估信息");
			}
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}else if("删除".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(zcPgXx_old.getStid());//被修改对象的主键
			//修改的页签
			if("土地".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(土地)评估信息");
			}else if("房屋".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
			}else if("机械设备".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(机械设备)评估信息");
			}else if("交通工具".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(交通工具)评估信息");
			}else if("房屋".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(房屋)评估信息");
			}else if("其他资产".equals(zcPgXx_old.getSttzclx())){
				assetChangeLog.setUpsheet("实体内资产(其他资产)评估信息");
			}
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}

	}	
	@SuppressWarnings("unchecked")
	public String getZcPgXxPropNameByPropId_base(String proId){
		//资产评估信息
		HashMap hashMap=new HashMap();
		hashMap.put("pgff", "评估方法");
		hashMap.put("pgjzr","评估基准日");
		hashMap.put("pingguzhi", "评估值(元)");
		hashMap.put("jzrzmjz", "基准日账面价值(元)");
		hashMap.put("jingzhi", "净值(元)");
		hashMap.put("CJzlx", "价值类型");
		hashMap.put("beizhu", "备注");
		return (String) hashMap.get(proId);
	}

/**
 * 债权债务日志
 */
	public void saveDebtClaimsLog(DebtInfo debtInfo_old, DebtInfo debtInfo_new,
			String opType, String debtInfo) {
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = BeanUtils.describe(debtInfo_old);
				newMap = BeanUtils.describe(debtInfo_new);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			Set<String> newSet = newMap.keySet();
			Iterator ite = newSet.iterator();
			while (ite.hasNext()) {
				String property = (String) ite.next();
				if ("id".equals(property) || "class".equals(property) || "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)|| "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
//					//评估基准日
//					if("pgjzr".equals(property)){
//						if(zcPgXx_new.getPgjzr()!= null){
//							valueNew = DateUtils.formatDate(zcPgXx_new.getPgjzr());
//						}
//						if(zcPgXx_old.getPgjzr() != null){
//							valueOld = DateUtils.formatDate(zcPgXx_old.getPgjzr());
//						}
//					}
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					if("1".equals(debtInfo)){
						assetChangeLog.setUpobjId(debtInfo_new.getZwrid());//被修改对象的主键
						assetChangeLog.setUpsheet("债务信息");//修改的页签
					}else{
						assetChangeLog.setUpobjId(debtInfo_new.getZqrid());//被修改对象的主键
						assetChangeLog.setUpsheet("债权信息");//修改的页签
					}
					assetChangeLog.setUpproper(getDeptinfoPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
					if (valueOld == null) {// 改变前值
						assetChangeLog.setUpbefovalue(null);
					} else {
						assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
					}
					if (valueNew != null) {
						publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
					}
				}
			}
						
		}else if("新增".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			if("1".equals(debtInfo)){
				assetChangeLog.setUpobjId(debtInfo_new.getZwrid());//被修改对象的主键
				assetChangeLog.setUpsheet("债务信息");//修改的页签
				assetChangeLog.setUpproper("债权人名称");//修改属性名称
				assetChangeLog.setUpaftervalue(debtInfo_new.getZqrmc());//修改后值
			}else{
				assetChangeLog.setUpobjId(debtInfo_new.getZwrid());//被修改对象的主键
				assetChangeLog.setUpsheet("债权信息");//修改的页签
				assetChangeLog.setUpproper("债务人名称");//修改属性名称
				assetChangeLog.setUpaftervalue(debtInfo_new.getZwrmc());//修改后值
			}
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}else if("删除".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			if("1".equals(debtInfo)){
				assetChangeLog.setUpobjId(debtInfo_old.getZwrid());//被修改对象的主键
				assetChangeLog.setUpsheet("债务信息");//修改的页签
				assetChangeLog.setUpproper("债权人名称");//修改属性名称
				assetChangeLog.setUpaftervalue(debtInfo_old.getZqrmc());//修改后值
			}else{
				assetChangeLog.setUpobjId(debtInfo_old.getZwrid());//被修改对象的主键
				assetChangeLog.setUpsheet("债权信息");//修改的页签
				assetChangeLog.setUpproper("债务人名称");//修改属性名称
				assetChangeLog.setUpaftervalue(debtInfo_new.getZwrmc());//修改后值
			}
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}
		
	}


	private String getDeptinfoPropNameByPropId_base(String proId) {
		HashMap hashMap=new HashMap();
		//债权债务
		hashMap.put("zwrmc", "债务人名称");
		hashMap.put("htbh", "合同编号");
		hashMap.put("dbfs", "担保方式");
		hashMap.put("zqje", "债权金额(元)");
		hashMap.put("sfss", "是否提起诉讼");
		hashMap.put("zqqx", "债权期限(天)");
		hashMap.put("dyzycc", "抵押财产");
		hashMap.put("bzrdsm", "保证人等说明");
		hashMap.put("zwrqkjs", "债务人情况介绍");
		hashMap.put("zqrmc", "债权人名称");
		hashMap.put("beizhu", "备注");
		
		return (String) hashMap.get(proId);
	}


	public void saveTaxInfoLog(StSkjnXx stSkjnXx_old, StSkjnXx stSkjnXx_new,
			String opType) {
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = BeanUtils.describe(stSkjnXx_old);
				newMap = BeanUtils.describe(stSkjnXx_new);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			} catch (NoSuchMethodException e) {
				e.printStackTrace();
			}
			Set<String> newSet = newMap.keySet();
			Iterator ite = newSet.iterator();
			while (ite.hasNext()) {
				String property = (String) ite.next();
				if ("id".equals(property) || "class".equals(property) || "sysUpdateTime".equals(property) || "sysUpdateUser".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)) {
					continue;
				}else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
//					//评估基准日
//					if("pgjzr".equals(property)){
//						if(zcPgXx_new.getPgjzr()!= null){
//							valueNew = DateUtils.formatDate(zcPgXx_new.getPgjzr());
//						}
//						if(zcPgXx_old.getPgjzr() != null){
//							valueOld = DateUtils.formatDate(zcPgXx_old.getPgjzr());
//						}
//					}
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					assetChangeLog.setUpobjId(stSkjnXx_new.getStId());//被修改对象的主键
					assetChangeLog.setUpsheet("税款缴纳情况");//修改的页签
					assetChangeLog.setUpproper(getTaxPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
					if (valueOld == null) {// 改变前值
						assetChangeLog.setUpbefovalue(null);
					} else {
						assetChangeLog.setUpbefovalue((String) valueOld);//修改后值
					}
					if (valueNew != null) {
						publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
					}
				}
			}
						
		}else if("新增".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(stSkjnXx_new.getStId());//被修改对象的主键
			assetChangeLog.setUpsheet("税款缴纳情况");//修改的页签
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}else if("删除".equals(opType)){
			String strUserName=UserThreadLocal.get().getUsername();
			Long strUserID=UserThreadLocal.get().getUserTid();
			AssetChangeLog assetChangeLog = new AssetChangeLog();
			assetChangeLog.setPersonId(strUserID.toString());
			assetChangeLog.setPersonName(strUserName);
			assetChangeLog.setUpdatedate(new Date());
			assetChangeLog.setUpdatetype(opType);//新增、修改
			assetChangeLog.setUpobjId(stSkjnXx_old.getStId());//被修改对象的主键
			assetChangeLog.setUpsheet("税款缴纳情况");//修改的页签
			assetChangeLog.setSubsys(GlobalVariable.ENTITY_SUBSYSTEM);//所属子系统
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到		
		}
		
	}
	private String getTaxPropNameByPropId_base(String proId) {
		HashMap hashMap=new HashMap();
		//税款缴纳
		hashMap.put("skmc", "税款名称");
		hashMap.put("sfasjn", "是否按时交纳");
		hashMap.put("tqskse", "拖欠税款数额(元)");
		hashMap.put("tqsj", "拖欠时间");
		hashMap.put("swjgsfkjm", "税务机关是否可以减免");
		return (String) hashMap.get(proId);
	}
	
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList(String stId){
		StringBuffer sb = new StringBuffer("")
				.append(" select a.id,a.fenlei,c.id as lsbid, a.czxmmc,a.zhuangtai,b.c_czfs as czfs,d.hycs ")
				.append(" from CZ_XM_XX a ,CZ_STCZTZ b,CZ_XMXX_LSB c,CZ_HYXX d  ")
				.append(" where a.cld_id = b.id  ")
				.append(" and a.xmlsb = c.id ")
				.append(" and c.hy_id = d.id ")
				.append(" and b.cldzt = '2' and b.stid = ? ");
		String jsonStr = "";
		List list = this.publicDao.queryForList(sb.toString(), new Object[]{stId});
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			CzxxVO vo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				vo = new CzxxVO();
				vo.setId(String.valueOf(map.get("id")));
				vo.setFenlei(String.valueOf(map.get("fenlei")));
				vo.setLsbId(String.valueOf(map.get("lsbid")));
				vo.setCzxmmc(String.valueOf(map.get("czxmmc")));
				vo.setCzfs(findCodeByKey(String.valueOf(map.get("czfs")),"ENTITY_DISPOSE_METHOD"));
				String zt = String.valueOf(map.get("zhuangtai"));
				if(ZcczCommon.PROJECT_TYPE_WZX.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_WZX_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_YJA.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_YJA_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_ZXZ.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_ZXZ_ZH;
				}else{
					zt = "";
				}
				vo.setZhuangtai(zt);
				vo.setHycs(String.valueOf(map.get("hycs")));
				List spwyList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_SPWY);//查询审批委员
				StringBuffer name = new StringBuffer("");
				for(int j=0;j<spwyList.size();j++){
					CzXmSpwYj spwy = (CzXmSpwYj) spwyList.get(j);
					name.append(spwy.getSpwyxm());
					if(j != spwyList.size()-1){
						name.append(",");
					}
				}
				List zcrList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_ZCR);//查询审批委员
				vo.setSpwy(name.toString());
				if(zcrList!=null&&zcrList.size()>0){
					CzXmSpwYj zcr = (CzXmSpwYj) zcrList.get(0);
					vo.setZcr(String.valueOf(zcr.getSpwyxm()));
				}
				returnList.add(vo);
			}
		}
		jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		return jsonStr;
	}
	/**
	 * 根据项目id查询主持人，或审批委员 
	 * @param id
	 * @return
	 */
	public List findSpwyByLsbId(String id,String isZcrOrSpwy) {
		
		String sql = "from CzXmSpwYj x where x.sfwzcr = ? and x.xmId = ?";
		List list = publicDao.find(sql, new Object[]{isZcrOrSpwy,id});
		return list;
	}
	
	/**
	 * 查询code表的value字段
	 * @param codeKey
	 * @param codeType
	 * @return
	 */
	public String findCodeByKey(String codeKey,String codeType){
		String sql = "from Code e where e.codeKey = ? and e.codeType = ? ";
		String value = "";
		Code code = (Code) publicDao.findSingleResult(sql, new Object[]{codeKey,codeType});
		if(code !=null){
			value  = code.getCodeValue();
		}
		return value;
	}
	
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList2(String stId){
		StringBuffer sb = new StringBuffer("")
				.append(" select a.id,a.fenlei,a.cld_id,c.id as lsbid, a.czxmmc,a.zhuangtai,d.hycs  ")
				.append(" from CZ_XM_XX a ,CZ_XMXX_LSB c,CZ_HYXX d  ")
				.append(" where a.xmlsb = c.id  ")
				.append(" and c.hy_id = d.id ")
				.append(" and a.cld_id in ")
				.append(" (select distinct b.cld_id ")
				.append(" from  CZ_ZC_XX b where b.bstid = ? ")
				.append(" and b.zhuangtai = '2') ");
		String jsonStr = "";
		List list = this.publicDao.queryForList(sb.toString(), new Object[]{stId});
		List returnList = new ArrayList();
		if(list!=null&&list.size()>0){
			CzxxVO vo = null;
			for (int i = 0; i < list.size(); i++) {
				Map map = (Map) list.get(i);
				vo = new CzxxVO();
				vo.setId(String.valueOf(map.get("id")));
				vo.setFenlei(String.valueOf(map.get("fenlei")));
				vo.setLsbId(String.valueOf(map.get("lsbid")));
				vo.setCzxmmc(String.valueOf(map.get("czxmmc")));
				vo.setCldId(String.valueOf(map.get("cld_id")));
				String zt = String.valueOf(map.get("zhuangtai"));
				if(ZcczCommon.PROJECT_TYPE_WZX.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_WZX_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_YJA.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_YJA_ZH;
				}else if(ZcczCommon.PROJECT_TYPE_ZXZ.equals(zt)){
					zt = ZcczCommon.PROJECT_TYPE_ZXZ_ZH;
				}else{
					zt = "";
				}
				vo.setZhuangtai(zt);
				vo.setHycs(String.valueOf(map.get("hycs")));
				List spwyList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_SPWY);//查询审批委员
				StringBuffer name = new StringBuffer("");
				for(int j=0;j<spwyList.size();j++){
					CzXmSpwYj spwy = (CzXmSpwYj) spwyList.get(j);
					name.append(spwy.getSpwyxm());
					if(j != spwyList.size()-1){
						name.append(",");
					}
				}
				List zcrList = this.findSpwyByLsbId(vo.getLsbId(),ZcczCommon.DEALTODO_ZCR);//查询审批委员
				vo.setSpwy(name.toString());
				if(zcrList!=null&&zcrList.size()>0){
					CzXmSpwYj zcr = (CzXmSpwYj) zcrList.get(0);
					vo.setZcr(String.valueOf(zcr.getSpwyxm()));
				}
				returnList.add(vo);
			}
		}
		jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		return jsonStr;
	}
	
	/**
	 * 根据选择的项目得到项目下的资产列表
	 * @return
	 */
	public String findAssetByCzXxList(String stId,String cldId,String xmId){
		String sql = "from CzZcXx x where x.bstid = ? and x.cldId = ?";
		List list = publicDao.find(sql, new Object[]{stId,cldId});
		List returnList = new ArrayList();
		CzZcXx xx = null;
		CzxxVO vo = null;
		for(int i=0;i<list.size();i++){
			xx=(CzZcXx) list.get(i);
			vo = new CzxxVO();
			try {
				BeanUtils.copyProperties(vo, xx);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			String zclx = xx.getBstzclx();
			if(StglCommon.ST_INFO_JINE.equals(zclx)){
				zclx = "金额";
			}else if(StglCommon.ST_INFO_TUDI.equals(zclx)){
				zclx = "土地";
			}else if(StglCommon.ST_INFO_FANGWU.equals(zclx)){
				zclx = "房屋";
			}else if(StglCommon.ST_INFO_JIXIESHEBE.equals(zclx)){
				zclx = "机械设备";
			}else if(StglCommon.ST_INFO_JIAOTONGYUNSHU.equals(zclx)){
				zclx = "交通运输";
			}else if(StglCommon.ST_INFO_DUIWAITOUZI.equals(zclx)){
				zclx = "对外投资";
			}else if(StglCommon.ST_INFO_QITAZICHAN.equals(zclx)){
				zclx = "其他资产";
			}else{
				zclx = "";
			}
			vo.setBstzclx(zclx);
			vo.setXmId(xmId);
			vo.setCzfs(findCodeByKey(xx.getCCzfs(),"ASSET_DISPOSE_METHOD"));
			returnList.add(vo);
		}
		String jsonStr = BodyListToJSON.getJSON(returnList, 1, 1, 10000);
		
		return jsonStr;
	}

	/**
	 * 删除债权信息
	 * @return
	 */
	public void claimsdeleList(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isNotEmpty(ids[i])){
				String sql = "UPDATE DEBT_INFO SET SFBC = '0'  WHERE ID = ? ";
				List params = new ArrayList();
				params.add(ids[i]);
				publicDao.updateBySql(sql, params);
			}
		}
		
	}


	public void deleTaxPayment(String[] taxPaymentIds) {
		for (int i = 0; i < taxPaymentIds.length; i++) {
			if(StringUtils.isNotEmpty(taxPaymentIds[i])){
				String sql = "UPDATE ST_SKJN_XX SET SFBC = '0'  WHERE ID = ? ";
				List params = new ArrayList();
				params.add(taxPaymentIds[i]);
				publicDao.updateBySql(sql, params);
			}
		}
		
	}

	/**
	 * 取得实体List
	 * @param ids StJbxx.id[]
	 * return List<StJbxx>
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<StJbxx> getEntityListByIds(String[] ids) throws IllegalAccessException, InvocationTargetException {
		List<StJbxx> stList = new ArrayList<StJbxx>();
		for(String stId : ids){
			StJbxx bo = publicDao.findById(StJbxx.class, stId);
			StJbxx vo = new StJbxx();
			BeanUtils.copyProperties(vo, bo);
			stList.add(vo);
		}
		return stList;
	}

	/**
	 * 根据附属信息id取得附属信息List
	 * @param ids : StFsxx.id[]
	 * @return List<StFsxx>
	 * @throws InvocationTargetException 
	 * @throws IllegalAccessException 
	 */
	public List<StFsxx> getFsxxListByIds(String[] ids) throws IllegalAccessException, InvocationTargetException {
		List<StFsxx> fsxxList = new ArrayList<StFsxx>();
		for(String fsxxId : ids){
			StFsxx bo = publicDao.findById(StFsxx.class, fsxxId);
			StFsxx vo = new StFsxx();
			BeanUtils.copyProperties(vo, bo);
			fsxxList.add(vo);
		}
		return fsxxList;
	}
}
