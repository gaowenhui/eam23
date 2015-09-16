package com.tansun.eam2.ssgl.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.SsProc;
import com.tansun.eam2.ssgl.SsglCommon;
import com.tansun.eam2.ssgl.service.ISsglBS;
import com.tansun.eam2.ssgl.vo.SsBaseinfoQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;

@Service
public class SsglBSImpl implements ISsglBS,CommonGlobal {
	@Autowired
	public PublicDao publicDao;

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public SsBaseinfo getSsById(String id) {
		return publicDao.findById(SsBaseinfo.class, id);
	}

	@SuppressWarnings("unchecked")
	public List<SsBaseinfo> getSsList() {
		List<SsBaseinfo> list = (List<SsBaseinfo>) publicDao
				.find("from SsBaseinfo order by id desc");
		return list;
	}

	public void save(SsBaseinfo ssBaseinfo) {
		if (ssBaseinfo.getId() != null) {
			ssBaseinfo.setSslxmc(getSslx(ssBaseinfo.getSslxid()));// 设置诉讼类型名称
			ssBaseinfo.setSfmc(getSfmc(ssBaseinfo.getSfid()));// 省份省份名称
			ssBaseinfo.setSazclbmc(getSaZcLbMc(ssBaseinfo.getSazcid()));// 涉案资产名称
			ssBaseinfo.setAjlbmc(getAjlb(ssBaseinfo.getAjlbid(), ssBaseinfo
					.getSslxid()));// 案件类别名稱
			ssBaseinfo.setSazclbmc(getSaZcLbMc(ssBaseinfo.getSazclbid()));
			publicDao.save(ssBaseinfo);

		} else {

			publicDao.save(ssBaseinfo);
		}
	}

	@SuppressWarnings("unchecked")
	public List<SsBaseinfo> getSsList2(Paginator paginator,
			SsBaseinfoQueryVO ssBaseinfoQueryVO) {
		if (paginator == null || ssBaseinfoQueryVO == null) {
			return null;
		}
		List<Object> params = new ArrayList<Object>();
		StringBuffer strWhere = new StringBuffer();

		String preparHQL = "from SsBaseinfo o where 1=1 and  o.ssztid !='1'  ";
		// 省份ID
		if (ssBaseinfoQueryVO.getSfid() != null
				&& ssBaseinfoQueryVO.getSfid().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getSfid());
			strWhere.append(" and o.sfid = ? ");
		}

		// 资产类别ID
		if (ssBaseinfoQueryVO.getSazclbid() != null
				&& ssBaseinfoQueryVO.getSazclbid().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getSazclbid());
			System.out.println("---------sss---"+ssBaseinfoQueryVO.getSazclbid());
			strWhere.append(" and o.sazclbid = ? ");
		}

		if (ssBaseinfoQueryVO.getSazcmc() != null
				&& ssBaseinfoQueryVO.getSazcmc().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getSazcmc());
			System.out.println("---------sss---"+ssBaseinfoQueryVO.getSazcmc());
			strWhere.append(" and o.sazcmc = ? ");
		}

		if (ssBaseinfoQueryVO.getSslxid() != null
				&& ssBaseinfoQueryVO.getSslxid().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getSslxid());
			strWhere.append(" and o.sslxid = ? ");
		}
		if (ssBaseinfoQueryVO.getSsztid() != null
				&& ssBaseinfoQueryVO.getSsztid().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getSsztid());
			strWhere.append(" and o.jaztid = ? ");
		}
		if (ssBaseinfoQueryVO.getQssjbegin() != null) {

			params.add(ssBaseinfoQueryVO.getQssjbegin());
			strWhere.append(" and o.qssj >= ? ");
		}
		if (ssBaseinfoQueryVO.getQssjend() != null) {
			params.add(ssBaseinfoQueryVO.getQssjend());
			strWhere.append(" and o.qssj <=? ");
		}

		if (ssBaseinfoQueryVO.getQisu() != null
				&& ssBaseinfoQueryVO.getQisu().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getQisu());
			strWhere.append(" and o.ajlbid = ? ");
		}

		if (ssBaseinfoQueryVO.getBeisu() != null
				&& ssBaseinfoQueryVO.getBeisu().trim().length() > 0) {
			params.add(ssBaseinfoQueryVO.getBeisu());
			strWhere.append(" and o.ajlbid = ? ");
		}
		preparHQL = preparHQL + strWhere.toString() + " order by  o.id ";
		System.out.println("----prepalHql--------------"+preparHQL );
		List<SsBaseinfo> list = (List<SsBaseinfo>) publicDao
				.queryByHQLWithPaginator(preparHQL, params, paginator)
				.getResults();

		return list;
	}

	public void delete(String id) {
		if (id.startsWith(",")) {
			id = id.substring(1, id.length());
		}
		if (id.endsWith(",")) {
			id = id.substring(0, id.length() - 1);
		}
		String ids[] = id.split(",");
		for (int i = 0; i < ids.length; i++) {
			SsBaseinfo commonBO = publicDao.findById(SsBaseinfo.class, ids[i]);
			publicDao.delete(commonBO);
		}
	}

	public void savepro(SsProc ssproc) {
		publicDao.save(ssproc);
	}

	public SsProc getSsprocById(String id) {
		List<String> params = new ArrayList<String>();
		params.add(id);
		SsProc ssProc = new SsProc();
		ssProc = (SsProc) publicDao.findSingleResult("from SsProc where id=?",
				params);
		return ssProc;
	}

	/**
	 * 获取过程信息
	 * 
	 */
	public SsProc getSsprocById2(String ssjbxxid, String type) {
		List<String> params = new ArrayList<String>();
		params.add(ssjbxxid);
		params.add(type);
		SsProc ssProc = new SsProc();
		ssProc = (SsProc) publicDao.findSingleResult(
				"from SsProc o  where  o.ssjbxxId=? and o.ssjdid = ? ", params);
		return ssProc;
	}

	/**
	 * 获取诉讼类型
	 * 
	 * @param strKey
	 * @return
	 */
	public String getSslx(String strKey) {
		String strReturn = "";
		Map<String,String> hashMap = new HashMap<String,String>();
		hashMap.put(SsglCommon.SS_SSLX_QS, "起诉");
		hashMap.put(SsglCommon.SS_SSLX_BS, "被诉");
		strReturn = (String) hashMap.get(strKey);
		if (strReturn == null) {
			strReturn = "";
		}
		return strReturn;
	}

	/**
	 * 涉案资产类别名称
	 * 
	 * @param strZcLbId
	 * @return
	 */
	public String getSaZcLbMc(String strZcLbId) {
		String strReturn = "";
		Map<String,String> hashMap = new HashMap<String,String>();
		// //涉案资产类别 1： 固定资产类 2：实体类 3：委托贷款类 4：债券类 5：债权类 6：其他
		hashMap.put(SsglCommon.SS_SAZCLB_GDZC, "固定资产类");
		hashMap.put(SsglCommon.SS_SAZCLB_STL, "实体类");
		hashMap.put(SsglCommon.SS_SAZCLB_WTDK, "委托贷款类");
		hashMap.put(SsglCommon.SS_SAZCLB_ZQ1, "债券类");
		hashMap.put(SsglCommon.SS_SAZCLB_ZQ2, "债权类");
		hashMap.put(SsglCommon.SS_SAZCLB_OTHER, "其他");
		strReturn = (String) hashMap.get(strZcLbId);
		if (strReturn == null) {
			strReturn = "";
		}
		return strReturn;

	}

	@SuppressWarnings("unchecked")
	public String getAjlb(String ajlbid, String sslx) {
		Map hashMap1 = new HashMap();
		Map hashMap2 = new HashMap();
		String sql1 = "select  code_name,code_key,CODE_VALUE from code where code_type='ACCUSE_CASE_TYPE'  "; // 被訴1
		String sql2 = "select  code_name,code_key,CODE_VALUE from code where code_type='CHARGE_CASE_TYPE'  "; // 起訴0
		List<Object> params = new ArrayList<Object>();
		List list1 = publicDao.queryForList(sql1, params);// (sql1);
		List list2 = publicDao.queryForList(sql2, params);// (sql1);

		if (SsglCommon.SS_SSLX_BS.equals(sslx)) {
			for (int i = 0; i < list1.size(); i++) {
				Map map = (Map) list1.get(i);
				hashMap1.put((String) map.get("CODE_KEY"), (String) map
						.get("CODE_VALUE"));
			}
			return (String) hashMap1.get(ajlbid);

		} else if (SsglCommon.SS_SSLX_QS.equals(sslx)) {
			for (int i = 0; i < list2.size(); i++) {
				Map map = (Map) list2.get(i);
				hashMap2.put((String) map.get("CODE_KEY"), (String) map
						.get("CODE_VALUE"));
			}
			return (String) hashMap2.get(ajlbid);
		} else {
			return "未定义的类型";
		}
	}

	/**
	 * 根据省份ID获取省份名称
	 * 
	 * @param strZcLbId
	 * @return
	 */
	public String getSfmc(String strSfid) {
		return findCoteNameByCoteKey("PROVIENCE", strSfid);
	}

	/**
	 * 通过codeKey查找codename
	 * 
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String coteType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = coteType;
			str[1] = codeKey;
			com.tansun.eam2.common.model.orm.bo.Code tree = new com.tansun.eam2.common.model.orm.bo.Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if (tree != null) {
				String codeValue = tree.getCodeValue();
				return codeValue;
			} else {
				return "";
			}
		} else {
			return "";
		}
	}

	public void update(SsBaseinfo ssBaseinfo) throws IllegalAccessException, InvocationTargetException {
		ssBaseinfo.setSslxmc(getSslx(ssBaseinfo.getSslxid()));// 设置诉讼类型名称
		ssBaseinfo.setSfmc(getSfmc(ssBaseinfo.getSfid()));// 省份省份名称
		ssBaseinfo.setSazclbmc(getSaZcLbMc(ssBaseinfo.getSazcid()));// 涉案资产名称
		ssBaseinfo.setAjlbmc(getAjlb(ssBaseinfo.getAjlbid(), ssBaseinfo
				.getSslxid()));// 案件类别名稱
		ssBaseinfo.setSazclbmc(getSaZcLbMc(ssBaseinfo.getSazclbid()));
		SsBaseinfo o = publicDao.findById(SsBaseinfo.class, ssBaseinfo.getId());
		BeanUtils.copyProperties(o, ssBaseinfo);
		
		publicDao.update(o);
		
		
	}

	public void updatePro(SsProc ssproc) {
		SsProc o = publicDao.findById(SsProc.class, ssproc.getId());
		try {
			BeanUtils.copyProperties(o, ssproc);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		publicDao.update(o);
	}

	public Date getDate(String strDate) {
		Date date = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	public List<SsBaseinfo> getSsBaseinfoByzcId(String zcId) {
		List list = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		String preparedHQL = "from SsBaseinfo ss where ss.sazcid = ?";
		list = publicDao.find(preparedHQL, params);
		return list;
	}
	public List<SsBaseinfo> getSsBaseinfoByzcLsbId(String zcId,Paginator paginator) {
		List list = new ArrayList();
		List params = new ArrayList();
		params.add(zcId);
		String preparHQL = "from SsBaseinfo ss where ss.sazcid = ? order by ss.id";
		list = this.publicDao.queryByHQLWithPaginator(preparHQL, params, paginator).getResults();
		//list = publicDao.find(preparedHQL, params);
		return list;
	}
	public List<SsBaseinfo> getSsBaseinfoByzcZsbId(String zcZsbId,Paginator paginator) {
		List list = new ArrayList();
		List params = new ArrayList();
		params.add(zcZsbId);
		String preparHQL = "from SsBaseinfo ss where ss.zczsbId  = ? and ss.jaztid= '2' order by ss.id";
		list = this.publicDao.queryByHQLWithPaginator(preparHQL, params, paginator).getResults();
		//list = publicDao.find(preparedHQL, params);
		return list;
	}
	public Code findCodeDetail(String codeType, String codeKey) {
		String[] params = new String[2];
		params[0] = codeType;
		params[1] = codeKey;
		return (Code) publicDao.findSingleResult(
				"from Code c where c.codeType=? and c.codeKey=?", params);
	}

	public Map<String, String> findCityCodeDetail(String id) {

		Map<String, String> tempMap = new LinkedHashMap<String, String>();
		List<Code> listCode = new ArrayList();
		listCode = (List<Code>) publicDao
				.find("from Code c where c.codeTag = '" + id + "'");
		for (Code code : listCode) {
			tempMap.put(code.getCodeKey(), code.getCodeValue());
		}
		return tempMap;
	}
    
	
	//保存日志
	@SuppressWarnings("unchecked")
	public void saveSSchangeInfo(SsBaseinfo ssBaseinfo_old,SsBaseinfo ssBaseinfo_new,String opType) {
		String strObjcode=ssBaseinfo_old.getSazcid();  //涉案资产ID
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = org.apache.commons.beanutils.BeanUtils
						.describe(ssBaseinfo_old);
				newMap = org.apache.commons.beanutils.BeanUtils
						.describe(ssBaseinfo_new);
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
				}
				else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if(("".equals(valueNew)&&valueOld==null) || ("".equals(valueOld)&&valueNew==null)){
						continue;
					}
					//录入时间
					if("lrsj".equals(property)){
						if(ssBaseinfo_new.getLrsj() != null){
							valueNew = DateUtils.formatDate(ssBaseinfo_new.getLrsj(),"yyyy-MM-dd");
						}
						if(ssBaseinfo_old.getLrsj() != null){
							valueOld = DateUtils.formatDate(ssBaseinfo_old.getLrsj(),"yyyy-MM-dd");
						}
					}else
					//立案时间
					if("larq".equals(property)){
						if(ssBaseinfo_new.getLarq() != null){
							valueNew = DateUtils.formatDate(ssBaseinfo_new.getLarq(),"yyyy-MM-dd");
						}
						if(ssBaseinfo_old.getLarq() != null){
							valueOld = DateUtils.formatDate(ssBaseinfo_old.getLarq(),"yyyy-MM-dd");
						}
					}else
					//起诉时间
					if("qssj".equals(property)){
						if(ssBaseinfo_new.getQssj() != null){
							valueNew = DateUtils.formatDate(ssBaseinfo_new.getQssj(),"yyyy-MM-dd");
						}
						if(ssBaseinfo_old.getQssj() != null){
							valueOld = DateUtils.formatDate(ssBaseinfo_old.getQssj(),"yyyy-MM-dd");
						}
					}else
					//收案时间
					if("sarq".equals(property)){
						if(ssBaseinfo_new.getSarq() != null){
							valueNew = DateUtils.formatDate(ssBaseinfo_new.getSarq(),"yyyy-MM-dd");
						}
						if(ssBaseinfo_old.getSarq() != null){
							valueOld = DateUtils.formatDate(ssBaseinfo_old.getSarq(),"yyyy-MM-dd");
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
					assetChangeLog.setUpobjId(ssBaseinfo_new.getSazcid());//被修改对象的主键
					assetChangeLog.setUpobjcode("");
					assetChangeLog.setUpsheet("基本信息");//修改的页签
					assetChangeLog.setUpproper(getPropNameByPropId_base(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys("3");
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
			assetChangeLog.setUpdatetype("新增");//新增、修改
			assetChangeLog.setUpobjId(ssBaseinfo_new.getSazcid());//被修改对象的主键
			assetChangeLog.setUpobjcode("");
			assetChangeLog.setUpsheet("基本信息");//修改的页签
			assetChangeLog.setUpproper("新增诉讼基本信息");//修改属性名称
			assetChangeLog.setUpaftervalue("新增诉讼基本信息");//修改后值
			assetChangeLog.setSubsys("3");
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
		}
	}
		
	public void saveSSchangePro(SsProc ssproc_old, SsProc ssproc_new,String opType,String sheet){
		
		
		String strObjcode=ssproc_new.getSsjdmc();
		if("修改".equals(opType)){
			Map<String, Object> oldMap = null;
			Map<String, Object> newMap = null;
			try {
				oldMap = org.apache.commons.beanutils.BeanUtils
						.describe(ssproc_old);
				newMap = org.apache.commons.beanutils.BeanUtils
						.describe(ssproc_new);
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
				if ("id".equals(property) || "class".equals(property)) {
					continue;
				}
				Object valueNew = newMap.get(property);
				Object valueOld = oldMap.get(property);
				if (valueNew == null && valueOld == null) {
					continue;
				} else 	if (valueNew != null && valueNew.equals(valueOld)) {
					continue;
				}
				else if ((valueNew == null && valueOld != null)
						|| (valueNew != null && !valueNew.equals(valueOld))) {
					if("".equals(valueNew)&&valueOld==null){
						continue;
					}
	
					if("lrrq".equals(property)){
						if(ssproc_new.getLrrq() != null){
							valueNew = DateUtils.formatDate(ssproc_new.getLrrq(),"yyyy-MM-dd");
						}
						if(ssproc_old.getLrrq() != null){
							valueOld = DateUtils.formatDate(ssproc_old.getLrrq(),"yyyy-MM-dd");
						}
					}else
					//susongshijian
					if("sssj".equals(property)){
						if(ssproc_new.getSssj() != null){
							valueNew = DateUtils.formatDate(ssproc_new.getSssj(),"yyyy-MM-dd");
						}
						if(ssproc_old.getSssj() != null){
							valueOld = DateUtils.formatDate(ssproc_old.getSssj(),"yyyy-MM-dd");
						}
					}else
					//getCpsxsj
					if("cpsxsj".equals(property)){
						if(ssproc_new.getCpsxsj() != null){
							valueNew = DateUtils.formatDate(ssproc_new.getCpsxsj(),"yyyy-MM-dd");
						}
						if(ssproc_old.getCpsxsj() != null){
							valueOld = DateUtils.formatDate(ssproc_old.getCpsxsj(),"yyyy-MM-dd");
						}
					}
					if(valueNew !=null && valueOld != null && valueNew.equals(valueOld)){
						continue;
					}else{
						
					}
					String strUserName=UserThreadLocal.get().getUsername();
					Long strUserID=UserThreadLocal.get().getUserTid();
					AssetChangeLog assetChangeLog = new AssetChangeLog();
					assetChangeLog.setPersonId(strUserID.toString());
					assetChangeLog.setPersonName(strUserName);
					assetChangeLog.setUpdatedate(new Date());
					assetChangeLog.setUpdatetype(opType);//新增、修改
					assetChangeLog.setUpobjId(ssproc_old.getSsjbxxId());//被修改对象的主键
					assetChangeLog.setUpobjcode(strObjcode);
					assetChangeLog.setUpsheet(sheet);//修改的页签
					assetChangeLog.setUpproper(getPropNameByPropId_pro(property));//修改属性名称
					assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
					assetChangeLog.setSubsys("10");
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
			assetChangeLog.setUpdatetype("新增");//新增、修改
			assetChangeLog.setUpobjId(ssproc_new.getId());//被修改对象的主键
			assetChangeLog.setUpobjcode("[诉讼]-"+strObjcode);
			assetChangeLog.setUpsheet("过程信息");//修改的页签
			assetChangeLog.setUpproper("新增诉讼基本信息");//修改属性名称
			assetChangeLog.setUpaftervalue("新增诉讼基本信息");//修改后值
			assetChangeLog.setSubsys("10");
			publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
		}
	}
	
	public String getPropNameByPropId_base(String proId){
		HashMap hashMap=new HashMap();
		hashMap.put("id","编号");
		hashMap.put("ajbh","案件编号");
		hashMap.put("sfid","省份编号");
		hashMap.put("sfbm","省份编码");
		hashMap.put("sfmc","省份名称");
		hashMap.put("sazclbid","涉案资产ID");
		hashMap.put("sazclbbm","涉案资产编码");
		hashMap.put("sazclbmc","涉案资产名称");
		hashMap.put("sazcid","涉案资产ID");
		hashMap.put("sazcmc","涉案资产名称");
		hashMap.put("larq","立案日期");
		hashMap.put("qssj","起诉日期");
		hashMap.put("sslxid","诉讼类型ID");
		hashMap.put("sslxbm","诉讼类型编码");
		hashMap.put("sslxmc","诉讼类型名称");
		hashMap.put("yg","原告");
		hashMap.put("bg","被告");
		hashMap.put("dsr","第三人");
		hashMap.put("ay","案由");
		hashMap.put("bde","标的额");
		hashMap.put("zxhk","执行回款");
		hashMap.put("ssqq","诉讼请求");
		hashMap.put("bhglh","建行(本行关联行)");
		hashMap.put("jaztid","结案状态ID");
		hashMap.put("jaztbm","结案状态编码");
		hashMap.put("jaztmc","结案状态名称");
		hashMap.put("jtsfwdsr","中国建投是否为当事人");
		hashMap.put("jbr","经办人");
		hashMap.put("aqjs","案情简述");
		hashMap.put("lrrid","录入人ID");
		hashMap.put("lrr","录入人");
		hashMap.put("lrsj","录入时间");
		hashMap.put("ssztid","诉讼状态ID");
		hashMap.put("ssztbm","诉讼状态编码");
		hashMap.put("ssztmc","诉讼状态名称");
		hashMap.put("bz","备注");
		hashMap.put("dlr","代理人");
		hashMap.put("ajlbid","案件类别id");
		hashMap.put("ajlbmc","案件类别名称");
		hashMap.put("ajlbbm","案件类别编码");
		hashMap.put("sarq","收案日期");
		hashMap.put("djsbm","地级市编码");
		hashMap.put("djsmc","地级市名称");
		return (String) hashMap.get(proId);
	}

	
	public String getPropNameByPropId_pro(String proId){
		HashMap hashMap=new HashMap();
		hashMap.put("id","编号");
		hashMap.put("ssjbxxId","诉讼基本信息");
		hashMap.put("ssjdid","诉讼阶段ID");
		hashMap.put("ssjdbm","诉讼阶段代码");
		hashMap.put("ssjdmc","诉讼阶段名称");
		hashMap.put("ssjdms","诉讼阶段描述");
		hashMap.put("sssj","诉讼时间");
		hashMap.put("zct","管辖/法院/仲裁庭");
		hashMap.put("cpsxsj","裁判生效时间");
		hashMap.put("sxpjjg","生效判决结果");
		hashMap.put("dlr","代理人");
		hashMap.put("acys","案程要述");
		hashMap.put("lrrid","录入人ID");
		hashMap.put("lrr","录入人");
		hashMap.put("lrrq","录入日期");
		hashMap.put("bz","备注");
		return (String) hashMap.get(proId);
	}
	public String getDjsmcById(String strID) {
		return findCoteNameByCoteKey("CITY", strID);
	}
}
