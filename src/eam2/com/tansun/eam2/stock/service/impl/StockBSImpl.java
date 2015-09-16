package com.tansun.eam2.stock.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.AssetChangeLog;
import com.tansun.eam2.common.model.orm.bo.CrtDccCicifci1;
import com.tansun.eam2.common.model.orm.bo.DebtWorklog;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.common.model.orm.bo.StockWorklog;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.eam2.stock.service.IStockBS;
import com.tansun.eam2.stock.vo.StockListVO;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;

@Service
public class StockBSImpl implements IStockBS {
	@Autowired
	public
	PublicDao publicDao;

	/**
	 * 删除附属信息
	 */
	public void deleteFsxx(String[] fsxxIds) {
		for (int i = 0; i < fsxxIds.length; i++) {
			if(StringUtils.isNotEmpty(fsxxIds[i])){
				StFsxx stFsxx = (StFsxx) publicDao.findSingleResult(
						"from StFsxx o where o.id =?", new Object[] { new String(
								fsxxIds[i]) });
				publicDao.delete(stFsxx);
			}
		}
	}

	
    /**
     * 删除表体信息
     * @param jbxxIds为一个存放附属信息Id的数组
     * @return
     */
    public void deleteStJbxx(String[] jbxxIds){
    	
    	for(int i=0; i < jbxxIds.length;i++){
    		if(StringUtils.isNotEmpty(jbxxIds[i])){
    			StJbxx stjbxx = (StJbxx) publicDao.findSingleResult("from StJbxx o where o.id=?", new Object[]{new String(jbxxIds[i])});
    			publicDao.delete(stjbxx);
    		}
    		
    	}
    }
	

	
	/**
	 * 债券日常维护清单查询
	 */
	@SuppressWarnings("unchecked")
	public List listStockRework(StockQueryVO stockVO){
		List<String> params = new ArrayList<String>();
	String sql =   "SELECT a.nf,"+
					    " a.zqmz,"+
					    " a.zqmz2,"+
						" b.id,"+
					    " b.jhfhmc,"+
					    " b.zqzlmc,"+
					    " b.zqmc,"+
					    " b.xm_id,"+
					    " b.xmmc,"+
					    " to_char(b.dqr, 'YYYY-MM-DD') as dqr"+
					" FROM stock_bookvalue a, stock_info b"+
					" WHERE b.ID = a.stockid(+)"+
					" AND (a.stockid || a.nf IN"+
					    "(SELECT stockid || MAX(nf) FROM stock_bookvalue GROUP BY stockid) OR "+
					    " a.stockid IS NULL)";
	
		if(StringUtils.isNotEmpty(stockVO.getBankName())){
			sql += " and b.jhfhmc like ?";
			params.add("%" + stockVO.getBankName() + "%");
		}
		 if(StringUtils.isNotEmpty(stockVO.getStockName())){
			sql += " and b.zqmc like ?";
			params.add("%" + stockVO.getStockName() + "%");
		}
		if(StringUtils.isNotEmpty(stockVO.getStockSort())){
			sql += " and b.zqzlmc like ?";
			params.add("%" + stockVO.getStockSort() + "%");
		}
		if(StringUtils.isNotEmpty(stockVO.getXmmc())){
			sql += " and b.xmmc like ?";
			params.add("%" + stockVO.getXmmc() + "%");
		}
		List list = publicDao.queryForList(sql, params);
		if(list == null)return new ArrayList();
		return list; 
	}
	
	
	/**
	 * 债券事项审批查询  债券信息列表
	 */
	@SuppressWarnings("unchecked")
	public String stockReworkList(StockQueryVO stockVO,String id,Paginator paginator){
		List<Object> params = new ArrayList<Object>();
		String sql = "SELECT a.nf,"
					+ " a.zqmz,"
					+ " a.zqmz2,"
					+ " b.id,"
					+ " b.jhfhmc,"
					+ " b.zqzlmc,"
					+ " b.zqmc,"
					+ " b.xm_id,"
					+ " b.xmmc,"
					+ " to_char(b.dqr, 'YYYY-MM-DD') as dqr"
					+ " FROM stock_bookvalue a, stock_info b"
					+ " WHERE b.ID = a.stockid(+)"
					+ " AND (a.stockid || a.nf IN"
					+ "(SELECT stockid || MAX(nf) FROM stock_bookvalue GROUP BY stockid) OR "
					+ " a.stockid IS NULL)";
		if(!"null".equals(id) && id.length()>31){
			sql =sql + " and b.id not in (select r.STOCK_ID from stock_sbody r where r.SHEAD_ID='"+id+"')";
		}
		if(StringUtils.isNotEmpty(stockVO.getBankName())){
			sql += " and b.jhfhmc like ?";
			params.add("%" + stockVO.getBankName() + "%");
		}
		 if(StringUtils.isNotEmpty(stockVO.getStockName())){
			sql += " and b.zqmc like ?";
			params.add("%" + stockVO.getStockName() + "%");
		}
		if(StringUtils.isNotEmpty(stockVO.getStockSort())){
			sql += " and b.zqzlmc like ?";
			params.add("%" + stockVO.getStockSort() + "%");
		}
		if(StringUtils.isNotEmpty(stockVO.getXmmc())){
			sql += " and b.xmmc like ?";
			params.add("%" + stockVO.getXmmc() + "%");
		}
		sql += "order by b.id asc ";
		PageableList pageableList = null;
		try{
			pageableList = this.publicDao.queryForList(sql, params, paginator);
		}catch (Exception e) {
			System.out.println(e);
		}
		List list = pageableList.getResults();
		List<StockListVO> resultList = new ArrayList<StockListVO>();
		for (int i = 0; i < list.size(); i++) {
			Map map = (Map) list.get(i);
			StockListVO slVO = new StockListVO();
			slVO.setStockid(String.valueOf(map.get("xm_id")));
			slVO.setXmmc(String.valueOf(map.get("xmmc")));
			slVO.setId(String.valueOf(map.get("id")));
			slVO.setDqr(String.valueOf(map.get("DQR")));
			slVO.setZqmc(String.valueOf(map.get("ZQMC")));
			slVO.setJhfhmc(String.valueOf(map.get("JHFHMC")));
			slVO.setZqzlmc(String.valueOf(map.get("ZQZLMC")));
			slVO.setZqmz(String.valueOf(map.get("zqmz")));
			resultList.add(slVO);
			System.out.println("---------项目Id-----"+slVO.getXmId());
		}	
		
		String json = BodyListToJSON.getJSON(resultList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}
	
	
	
	
	/**
	 * 新增记录
	 * @param stwork
	 */
	public void newEntity(StockWorklog stwork){
		publicDao.save(stwork);
	}

	
	/**
	 * 根据工作记录id查找工作记录
	 * @param id
	 * @return
	 */
	public StockWorklog viewStock(String id) {
		List param=new ArrayList();
		param.add(id);
		return  (StockWorklog)publicDao.findSingleResult("from StockWorklog where logid=? ",param);
	}
	
	/**
	 * 通过债券id查询 该id下所有工作记录
	 * @param id
	 * @return
	 */
	public String workLogList(String id,Paginator paginator){
		String hql = "from StockWorklog o where o.stockid='" + id + "'" + "and o.sfbc='"+ 1 +"' order by o.stockid desc";
		PageableList list = publicDao.queryByHQLWithPaginator(hql, new ArrayList(), paginator);
		List returnList = list.getResults();
		String json = BodyListToJSON.getJSON(returnList, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		return json;
		//		return (List<StockWorklog>)publicDao.find("from StockWorklog o where o.stockid='" + id + "'" + "and o.sfbc='"+ 1 +"'");
	}
	
	
	/**
	 * 通过债券id和催办人id查询 工作记录的详细信息
	 * @param stockId
	 * @param dunPersonId
	 * @return
	 */
	public StockWorklog workLogDetail(String stockId , String dunPersonId ){
		String[] param = new String[2];
		param[0] = stockId;
		param[1] = dunPersonId;
		return  (StockWorklog)publicDao.findSingleResult("from StockWorklog where logid=? ",param);
	}
	
	/**
	 * 保存记录
	 * @param stwork
	 */
	public void saveStock(StockWorklog stwork){
		publicDao.update(stwork);
	}
	
	
	/**
	 * 新增记录
	 * @param stwork
	 */
	public void newBookValue(StockBookvalue sb){
		publicDao.save(sb);
	}
	
	/**
	 * 保存
	 * @param sb
	 */
	public void saveBookValue(StockBookvalue sb){
		
		publicDao.update(sb);
	}
	
	/**
	 * 通过id查找bookValue表是否为新增
	 * @param id
	 * @return
	 */
	public StockBookvalue viewBookValue(String id){
		
		List param=new ArrayList();
		param.add(id);
		return  (StockBookvalue)publicDao.findSingleResult("from StockBookvalue where id=? ",param);
	}
	
	
	/**
	 * 通过id查找债券信息;
	 * @param id
	 * @return
	 */
	public StockInfo viewStockInfo(String id){
		String[] params = new String[1];
		params[0] = id;
		return (StockInfo)publicDao.findSingleResult("from StockInfo t where t.id = ?", params);
	}
	
	public StockInfo viewStockInfo1(String id){
		String[] params = new String[1];
		params[0] = id;
		return (StockInfo)publicDao.findSingleResult("from StockSbody t where t.id = ?", params);
	}
	
	/**
	 * 按年份查找工作记录
	 * @param cbrq
	 * @return
	 */
	public StockBookvalue viewbookValue(String nf ,String stockId){
		String[] params = new String[2];
		params[0] = nf;
		params[1] = stockId;
		return (StockBookvalue)publicDao.findSingleResult("from StockBookvalue t where t.nf=? and t.stockid=?", params);
	}
	
	/**
	 * 按stockId查找工作记录
	 * @param cbrq
	 * @return
	 */
	public StockBookvalue lookBookValue(String stockId){
		List params=new ArrayList();
		params.add(stockId);
		
		return (StockBookvalue)publicDao.findSingleResult("from StockBookvalue t where t.stockid=?", params);
	}
	
	
	/**
	 * 按照stockID查找工作记录列表
	 * @param stockId
	 * @return
	 */
	public List<StockBookvalue> bookValueList(String stockId){
		List params=new ArrayList();
		params.add(stockId);
		return (List<StockBookvalue>)publicDao.find("from StockBookvalue t where t.stockid=? order by t.nf desc", params);
	}
	
	/**
	 * 通过id查询债券投资详细信息
	 * @param id
	 * @return
	 */
	public StockList viewDetail(String id){
		List params = new ArrayList();
		params.add(id);
		String sql = "select a.fhmc, "+
						   " a.id," +
						   " a.xmmc," +
						   " a.xmmcqr," +
				//		   " to_char(a.ngrq,'YYYY-MM-DD') as ngrq," +
						   " t.shidian," +
						   " t.beizhu," +
						   " t.jzzb," +
						   " t.zmz" +
					 " from stock_list a," +
						  " STOCK_SDZMZ_XX t " +
					 " where a.id = t.xm_id "+
				    " and substr(to_char(t.shidian,'yyyy-mm-dd'),1,4) = '2006'"+
					" and a.id=?";
		
		return (StockList)publicDao.findSingleResult(sql, params);
	}
	
	
	
	/**
	 * 查看流程信息列表
	 * @param StockId
	 * @return
	 */
	public List listStockFlow(String StockId){
		String sql = "select a.shead_id, "+
						   " a.bdzt," +
						   " a.ngbmmc," +
						   " a.ngrmc," +
						   " to_char(a.ngrq,'YYYY-MM-DD') as ngrq," +
						   " t.zqmc," +
						   " t.stock_id" +
					 " from stock_sbody t," +
						  " stock_shead a " +
					 " where t.shead_id = a.shead_id " ;
		List<String> params = new ArrayList<String>();
		if(StockId != null){
			sql = sql + " and t.stock_id=?";
			params.add( StockId );
		}
		System.out.println(sql);
		System.out.println(params);
		List list = publicDao.queryForList(sql, params);
		
		return list;
	}
	
	
	
	/**
	 * 查看流程信息detail
	 * @param shead_id
	 * @return
	 */
	public StockShead viewStockSheadDetail(String shead_id){
		String[] str = new String[1];
		str[0] = shead_id;
		return (StockShead)publicDao.findSingleResult("from StockShead where shead_id ='", str);
	}
	
	
	//-------------------日志更新-----------------------
	
	
	public void saveSSchangeInfo(StockBookvalue stockBookvalue_old,
			StockBookvalue stockBookvalue_new,String opType,String yearData) {
		Map<String, Object> oldMap = null;
		Map<String, Object> newMap = null;
	
		String strObjnf = stockBookvalue_new.getNf();
		String strObjcode=stockBookvalue_new.getStockid();

		try {
			oldMap = org.apache.commons.beanutils.BeanUtils
					.describe(stockBookvalue_old);
			newMap = org.apache.commons.beanutils.BeanUtils
					.describe(stockBookvalue_new);
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
			} else if (valueNew != null && valueNew.equals(valueOld)) {
				continue;
			} else if ((valueNew == null && valueOld != null)
					|| (valueNew != null && !valueNew.equals(valueOld))) {
				String strUserName=UserThreadLocal.get().getUsername();
				Long strUserID=UserThreadLocal.get().getUserTid();
				AssetChangeLog assetChangeLog = new AssetChangeLog();
				assetChangeLog.setPersonId(strUserID.toString());
				assetChangeLog.setPersonName(strUserName);
				assetChangeLog.setUpdatedate(new Date());
				assetChangeLog.setUpdatetype(opType);//新增、修改
				assetChangeLog.setUpobjId(stockBookvalue_new.getStockid());//被修改对象的主键
				assetChangeLog.setUpobjcode(strObjnf + strObjcode);
				assetChangeLog.setUpsheet(stockBookvalue_new.getNf()+"债券面值信息");//修改的页签
				if("2".equals(yearData)){
					assetChangeLog.setUpproper(getPropNameByPropId_pro_end(property));//修改属性名称
				}else{
					assetChangeLog.setUpproper(getPropNameByPropId_pro_start(property));//修改属性名称
				}
				assetChangeLog.setUpaftervalue((String) valueNew);//修改后值
				assetChangeLog.setSubsys("4");
				if (valueOld == null) {// 改变前值
					assetChangeLog.setUpbefovalue(null);
				} else {
					assetChangeLog.setUpbefovalue(valueOld.toString());
				}
				if (valueNew != null) {
					publicDao.saveOrUpdateAttach(assetChangeLog);// 保存变动信息到
				}
			}
		}
	}
	
	/**
	 * 年初
	 * @param proId
	 * @return
	 */
	  public String getPropNameByPropId_pro_start(String proId){
			HashMap hashMap=new HashMap();
			hashMap.put("id","债券面值ID,UUID");
			hashMap.put("stockid","债券ID");
			hashMap.put("zqmc","债券名称,来自STOCK_INFO表");
			hashMap.put("nf","年份,格式为YYYY");
			hashMap.put("zqmz","债券面值_年初");
			hashMap.put("tzjczb","投资减持准备_年初");
			hashMap.put("zqtzje","债券投资净额_年初");
			hashMap.put("yslx","应收利息_年初");
			hashMap.put("yslxhzzb","应收利息坏账准备_年初");
			hashMap.put("yslxje","应收利息净额_年初");
//			hashMap.put("zqmz2","债券面值_年末");
//			hashMap.put("tzjczb2","投资减持准备_年末");
//			hashMap.put("zqtzje2","债券投资净额_年末");
//			hashMap.put("yslx2","应收利息_年末");
//			hashMap.put("yslxhzzb2","应收利息坏账准备_年末");
//			hashMap.put("yslxje2","应收利息净额_年末");
			hashMap.put("bz","备注");
			hashMap.put("tzsync","债券投资损益(年初)");
//			hashMap.put("tzsynm","债券投资损益(年末)");
			return (String) hashMap.get(proId);
		}
	
	  
	  
	  /**
	   * 年末
	   * @param proId
	   * @return
	   */
	  public String getPropNameByPropId_pro_end(String proId){
			HashMap hashMap=new HashMap();
			hashMap.put("id","债券面值ID,UUID");
			hashMap.put("stockid","债券ID");
			hashMap.put("zqmc","债券名称,来自STOCK_INFO表");
			hashMap.put("nf","年份,格式为YYYY");
//			hashMap.put("zqmz","债券面值_年初");
//			hashMap.put("tzjczb","投资减持准备_年初");
//			hashMap.put("zqtzje","债券投资净额_年初");
//			hashMap.put("yslx","应收利息_年初");
//			hashMap.put("yslxhzzb","应收利息坏账准备_年初");
//			hashMap.put("yslxje","应收利息净额_年初");
			hashMap.put("zqmz2","债券面值_年末");
			hashMap.put("tzjczb2","投资减持准备_年末");
			hashMap.put("zqtzje2","债券投资净额_年末");
			hashMap.put("yslx2","应收利息_年末");
			hashMap.put("yslxhzzb2","应收利息坏账准备_年末");
			hashMap.put("yslxje2","应收利息净额_年末");
			hashMap.put("bz","备注");
//			hashMap.put("tzsync","债券投资损益(年初)");
			hashMap.put("tzsynm","债券投资损益(年末)");
			return (String) hashMap.get(proId);
		}
	
}
