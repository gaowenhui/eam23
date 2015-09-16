package com.tansun.eam2.stgl.service.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.service.ICEMEntityQueryService;
import com.tansun.eam2.stgl.vo.AssetQueryVO;
import com.tansun.eam2.stgl.vo.DebtQueryVO;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;
import com.tansun.eam2.stgl.vo.ZCXXQueryVO;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * @author Administrator
 * 
 */
@Service
public class CEMEntityQueryServiceImpl implements ICEMEntityQueryService {

	@Autowired
	PublicDao publicDao;
	@Autowired 
	ICodeService codeServiceImpl;	

	/*
	 * 
	 * 实体基本信息和实体附属信息进行查询和展示
	 * 
	 * @see com.tansun.eam2.stgl.service.ICEMEntityQueryService#queryAsset(com.tansun.eam2.stgl.vo.AssetQueryVO)
	 */
	public List<QueryResultVO> queryAsset(AssetQueryVO assetQueryVO,Paginator paginator) {
		String preparedHQL = "select a ";
		String countSQL = "from StFsxx a,StJbxx b   where a.stid=b.id and a.sfbc='1' and b.stlx=?  ";
		StringBuffer strWhere = new StringBuffer();
		List<Object> params = new ArrayList<Object>();
		List<StFsxx> tempList = new ArrayList<StFsxx>();
		List<QueryResultVO> resultList = new ArrayList<QueryResultVO>();
		
		//实体类型
		params.add(StglCommon.ST_TYPE_FEIZIXUN_CHUZHI);
		
		// 实体名称
		if (assetQueryVO.getStmc() != null
				&& assetQueryVO.getStmc().trim().length() > 0) {
			params.add("%"+assetQueryVO.getStmc()+"%");
			strWhere.append(" and b.stzwmc  like ? ");
		}
		// 资产类型

		if (assetQueryVO.getStnzcfl() != null
				&& assetQueryVO.getStnzcfl().trim().length() > 0) {
			params.add(assetQueryVO.getStnzcfl());
			strWhere.append(" and a.stnzcfl  = ? ");
		}
		// 账户
		if (assetQueryVO.getHzhanghu() != null
				&& assetQueryVO.getHzhanghu().trim().length() > 0) {
			params.add("%"+assetQueryVO.getHzhanghu()+"%");
			strWhere.append(" and a.hzhanghu  like ? ");
		}

		// 土地名称
		// private String jtdmc;

		if (assetQueryVO.getHzhanghu() != null
				&& assetQueryVO.getHzhanghu().trim().length() > 0) {
			params.add("%"+assetQueryVO.getHzhanghu()+"%");
			strWhere.append(" and a.jtdmc  like ?  ");
		}
		// 实际占有人
		// private String jsjzyr;

		if (assetQueryVO.getJsjzyr() != null
				&& assetQueryVO.getJsjzyr().trim().length() > 0) {
			params.add("%"+assetQueryVO.getJsjzyr()+"%");
			strWhere.append(" and a.jsjzyr  like  ?  ");
		}

		// 土地是否抵押

		if (assetQueryVO.getJtdsfdy() != null
				&& assetQueryVO.getJtdsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getJtdsfdy());
			strWhere.append(" and a.jtdsfdy  = ? ");
		}

		// 土地使用权证
		// private String jtdsyqz;
		if (assetQueryVO.getJtdsyqz() != null
				&& assetQueryVO.getJtdsyqz().trim().length() > 0) {
			params.add(assetQueryVO.getJtdsyqz());
			strWhere.append(" and a.jtdsyqz  = ? ");
		}
		// 房屋名称
		// private String kfwmc;
		if (assetQueryVO.getKfwmc() != null
				&& assetQueryVO.getKfwmc().trim().length() > 0) {
			params.add(assetQueryVO.getKfwmc());
			strWhere.append(" and a.kfwmc  = ? ");
		}
		// 房屋实际占有人
		// private String kfwsjzyr;
		if (assetQueryVO.getKfwsjzyr() != null
				&& assetQueryVO.getKfwsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getKfwsjzyr());
			strWhere.append(" and a.kfwsjzyr  = ? ");
		}
		// 有无房屋使用权证
		// private String kywfwsyqz;
		if (assetQueryVO.getKywfwsyqz() != null
				&& assetQueryVO.getKywfwsyqz().trim().length() > 0) {
			params.add(assetQueryVO.getKywfwsyqz());
			strWhere.append(" and a.kywfwsyqz  = ? ");
		}
		// 房屋是否抵押
		// private String ksfdy;
		if (assetQueryVO.getKsfdy() != null
				&& assetQueryVO.getKsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getKsfdy());
			strWhere.append(" and a.ksfdy  = ? ");
		}
		// 机器设备名称
		// private String msbmc;
		if (assetQueryVO.getMsbmc() != null
				&& assetQueryVO.getMsbmc().trim().length() > 0) {
			params.add(assetQueryVO.getMsbmc());
			strWhere.append(" and a.msbmc  = ? ");
		}
		// 机器设备权属
		// private String msbqs;
		if (assetQueryVO.getMsbqs() != null
				&& assetQueryVO.getMsbqs().trim().length() > 0) {
			params.add(assetQueryVO.getMsbqs());
			strWhere.append(" and a.msbqs  = ? ");
		}
		// 机器设备实际占有人
		// private String msbsjzyr;
		if (assetQueryVO.getMsbsjzyr() != null
				&& assetQueryVO.getMsbsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getMsbsjzyr());
			strWhere.append(" and a.msbsjzyr  = ? ");
		}
		// 机器设备是否抵押
		// private String msbsfdy;
		if (assetQueryVO.getMsbsfdy() != null
				&& assetQueryVO.getMsbsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getMsbsfdy());
			strWhere.append(" and a.msbsfdy  = ? ");
		}
		// 交通工具名称（车牌号）
		// private String lcph;
		if (assetQueryVO.getLcph() != null
				&& assetQueryVO.getLcph().trim().length() > 0) {
			params.add(assetQueryVO.getLcph());
			strWhere.append(" and a.lcph  = ? ");
		}
		// 交通工具权属
		// private String lqs;
		if (assetQueryVO.getLqs() != null
				&& assetQueryVO.getLqs().trim().length() > 0) {
			params.add(assetQueryVO.getLqs());
			strWhere.append(" and a.lqs  = ? ");
		}
		// 交通工具实际占有人
		// private String lsjzyr;
		if (assetQueryVO.getLsjzyr() != null
				&& assetQueryVO.getLsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getLsjzyr());
			strWhere.append(" and a.lsjzyr  = ? ");
		}
		// 交通工具是否抵押
		// private String lsfdy;
		if (assetQueryVO.getLsfdy() != null
				&& assetQueryVO.getLsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getLsfdy());
			strWhere.append(" and a.lsfdy  = ? ");
		}
		// 被投资企业名称
		// private String nbtqymc;
		if (assetQueryVO.getNbtqymc() != null
				&& assetQueryVO.getNbtqymc().trim().length() > 0) {
			params.add(assetQueryVO.getNbtqymc());
			strWhere.append(" and a.nbtqymc  = ? ");
		}
		// 投资方式
		// private String ntzfs;
		if (assetQueryVO.getNtzfs() != null
				&& assetQueryVO.getNtzfs().trim().length() > 0) {
			params.add(assetQueryVO.getNtzfs());
			strWhere.append(" and a.ntzfs  = ? ");
		}
		// 其他资产名称
		// private String pqtzcmc;
		if (assetQueryVO.getPqtzcmc() != null
				&& assetQueryVO.getPqtzcmc().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcmc());
			strWhere.append(" and a.pqtzcmc  = ? ");
		}
		// 其他资产权属
		// private String pqtzcqs;
		if (assetQueryVO.getPqtzcqs() != null
				&& assetQueryVO.getPqtzcqs().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcqs());
			strWhere.append(" and a.pqtzcqs  = ? ");
		}
		// 其他资产实际占有人
		// private String pqtzcsjzyr;
		if (assetQueryVO.getPqtzcsjzyr() != null
				&& assetQueryVO.getPqtzcsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcsjzyr());
			strWhere.append(" and a.pqtzcsjzyr  = ? ");
		}
		// 其他资产是否抵押
		// private String pqtzcsfdy;
		if (assetQueryVO.getPqtzcsfdy() != null
				&& assetQueryVO.getPqtzcsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcsfdy());
			strWhere.append(" and a.pqtzcsfdy  = ? ");
		}		
		strWhere.append(" and  a.leixing=? ");
		params.add(StglCommon.ST_INFO_ZICHAN);

		preparedHQL += countSQL + strWhere.toString() + " order by a.id DESC ";
		countSQL += strWhere.toString() + " order by a.id DESC ";
	 	tempList = (List<StFsxx>) publicDao.queryByHQLWithPaginator(preparedHQL, countSQL, params,paginator).getResults();
		for (int i = 0; i < tempList.size(); i++) {
			QueryResultVO queryResultVO = new QueryResultVO();
			StFsxx tempBO = tempList.get(i);
			StJbxx stJbxx = new StJbxx();
			BeanUtils.copyProperties(tempBO, queryResultVO);
			stJbxx = (StJbxx) publicDao.findSingleResult(
					"from StJbxx where id=?", new String[] { tempBO.getStid()});
			queryResultVO.setStmc(stJbxx.getStzwmc());
			resultList.add(queryResultVO);
		}
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

	public List<QueryResultVO> queryStaff(StaffQueryVO staffQueryVO,Paginator paginator) {
		
		String preparedHQL = "select a ";
		String countSQL = "from StFsxx a,StJbxx b   where a.stid=b.id and a.sfbc='1' and b.stlx=?  ";
//		String preparedHQL = "select a from StFsxx a, StJbxx b   where a.stid=b.id  and  b.stlx=?  ";
		StringBuffer strWhere = new StringBuffer();
		List<Object> params = new ArrayList <Object>();
		List<StFsxx> tempList = new ArrayList<StFsxx>();
		List<QueryResultVO> resultList = new ArrayList<QueryResultVO>();
		
		//实体类型
		params.add(StglCommon.ST_TYPE_FEIZIXUN_CHUZHI);
		// 实体名称
		if (staffQueryVO.getStmc() != null
				&& staffQueryVO.getStmc().trim().length() > 0) {
			params.add("%"+staffQueryVO.getStmc()+"%");
			strWhere.append(" and b.stzwmc  like  ? ");
		}

		// 人员类型

		if (staffQueryVO.getFcRylb() != null
				&& staffQueryVO.getFcRylb().trim().length() > 0) {
			params.add(staffQueryVO.getFcRylb());
			strWhere.append(" and a.fcRylb  = ? ");
		}

		// 姓名
		// String fxingming;
		if (staffQueryVO.getFxingming() != null
				&& staffQueryVO.getFxingming().trim().length() > 0) {
			params.add("%"+staffQueryVO.getFxingming()+"%");
			strWhere.append(" and a.fxingming  like ? ");
		}

		// 安置方式
		// String fazfs;

		if (staffQueryVO.getFazfs() != null
				&& staffQueryVO.getFazfs().trim().length() > 0) {
			params.add("%"+staffQueryVO.getFazfs()+"%");
			strWhere.append(" and a.fazfs  like ? ");
		}

		// 安置状态
		// String fazzt;

		if (staffQueryVO.getFazzt() != null
				&& staffQueryVO.getFazzt().trim().length() > 0) {
			params.add(staffQueryVO.getFazzt());
			strWhere.append(" and a.fazzt  = ? ");
		}

		// 工资发放单位
		// String fgzffdw;

		if (staffQueryVO.getFgzffdw() != null
				&& staffQueryVO.getFgzffdw().trim().length() > 0) {
			params.add("%"+staffQueryVO.getFgzffdw()+"%");
			strWhere.append(" and a.fgzffdw  like ? ");
		}

		strWhere.append(" and  a.leixing= ? ");
		params.add(StglCommon.ST_INFO_RENYUAN);
//		preparedHQL = preparedHQL + strWhere.toString();
//		preparedHQL = preparedHQL + "order by a.id desc";
		preparedHQL += countSQL + strWhere.toString() + " order by a.id DESC ";
		countSQL += strWhere.toString() + " order by a.id DESC ";
		System.out.println("---------------------"+countSQL);
	 	tempList = (List<StFsxx>) publicDao.queryByHQLWithPaginator(preparedHQL, countSQL, params,paginator).getResults();
//		tempList = (List<StFsxx>) publicDao.find(preparedHQL, params);
		for (int i = 0; i < tempList.size(); i++) {
			QueryResultVO queryResultVO = new QueryResultVO();
			StFsxx tempBO = tempList.get(i);
			StJbxx stJbxx = new StJbxx();
			BeanUtils.copyProperties(tempBO, queryResultVO);
			queryResultVO.setId(tempBO.getId());
			stJbxx = (StJbxx) publicDao
					.findSingleResult("from StJbxx where id=?",
							new String[] { tempBO.getStid() });
			queryResultVO.setStmc(stJbxx.getStzwmc());
			resultList.add(queryResultVO);
		}
		if (resultList.size() == 0) {
			return null;
		}
    	QueryResultVO object1 = null;
    	List listNew = new ArrayList<QueryResultVO>();
		for(QueryResultVO object:resultList){
			object1 = object.clone(object);
			String fcRylb = object.getFcRylb();
			if(fcRylb!=null&&""!=fcRylb){
				fcRylb = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("NOT_CONSULT_ENTITY_PERSON_TYPE",fcRylb );
			}
			object1.setFcRylb(fcRylb);
			if("0".equals(object.getFazzt())){
				object1.setFazzt("未安置");
			}else if("1".equals(object.getFazzt())){
				object1.setFazzt("安置审批中");
			}else if("2".equals(object.getFazzt())){
				object1.setFazzt("安置执行中");
			}else if("3".equals(object.getFazzt())){
				object1.setFazzt("已安置");
			}
			listNew.add(object1);		
		}
		return listNew;
	}


	/**
	 * 债权债务信息查询
	 */
	@SuppressWarnings("unchecked")
	public List<DebtInfo> queryDebt(DebtQueryVO debtQueryVO,Paginator paginator) {
		String preparedHQL;
		StringBuffer strWhere = new StringBuffer();
		List<Object> params = new ArrayList<Object>();
		List<DebtInfo> tempList = new ArrayList<DebtInfo>();
		PageableList pageableList = null;
		if("0".equalsIgnoreCase(debtQueryVO.getLeixing())){
			//preparedHQL = "select a.id,a.zwrmc  from DebtInfo  a, StJbxx b  where  a.zqrid = b.id  and (b.stlx ='0' or b.stlx ='1' or b.stlx ='3'  ) and   a.sfbc = '1' ";
			preparedHQL = "select a.zqrmc,a.zwrmc,a.dbfs ,a.bzrdsm ,a.sfss , a.zqqx, a.zqje,a.sssx, b.stzwmc from Debt_Info  a, St_Jbxx b  where  a.zqrid = b.id  and (b.stlx ='0' or b.stlx ='1' or b.stlx ='3'  ) and   a.sfbc = '1' ";
			strWhere.append("  order by a.id DESC");
			preparedHQL = preparedHQL+strWhere.toString();
			pageableList = publicDao.queryForList(preparedHQL, params, paginator);
		    List list= pageableList.getResults();
		    for (int i = 0; i < list.size(); i++) {
				Map tempBO = (Map) list.get(i);
				DebtQueryVO tempVO = new DebtQueryVO();
				tempVO.setZqrmc(String.valueOf(tempBO.get("ZQRMC")));
				tempVO.setZqrid(String.valueOf(tempBO.get("ZQRID")));
				tempVO.setZwrmc(String.valueOf(tempBO.get("ZWRMC")));
				tempVO.setZwrid(String.valueOf(tempBO.get("ZWRID")));
				tempVO.setDbfs(String.valueOf(tempBO.get("DBFS")));
				tempVO.setBzrdsm(String.valueOf(tempBO.get("BZRDSM")));
				tempVO.setSfss(String.valueOf(tempBO.get("SFSS")));
				tempVO.setZqqx(checkLong(tempBO.get("ZQQX")));
				tempVO.setZqje(checkDouble(tempBO.get("ZQJE")));
				tempVO.setSssx(String.valueOf(tempBO.get("SSSX")));
				tempVO.setStzwmc(String.valueOf(tempBO.get("STZWMC")));
				tempList.add(tempVO);
				System.out.println(tempVO.getSfss());
			}
		}else if("1".equalsIgnoreCase(debtQueryVO.getLeixing())){
			preparedHQL = "select a.zqrmc,a.zwrmc,a.dbfs ,a.bzrdsm ,a.sfss , a.zqqx, a.zqje,a.sssx,b.stzwmc from Debt_Info  a, St_Jbxx b  where  a.zwrid = b.id  and (b.stlx ='0' or b.stlx ='1' or b.stlx ='3'  ) and   a.sfbc = '1' ";
			//实体名称
			if (debtQueryVO.getStzwmc() != null
					&& debtQueryVO.getStzwmc().trim().length() > 0){
				strWhere.append(" and  a.zwrmc  like ? ");
				params.add("%"+debtQueryVO.getStzwmc()+"%");
			} 
			
			//债权最小期限
			if (debtQueryVO.getZqqxMin() != null){
				strWhere.append(" and a.zqqx > ?");
				params.add(debtQueryVO.getZqqxMin());
			} 
			//债权最大期限
			if (debtQueryVO.getZqqxMax() != null){
				strWhere.append(" and a.zqqx > ?");
				params.add(debtQueryVO.getZqqxMax());
			} 
			if(debtQueryVO.getSfss() != null
					&& debtQueryVO.getSfss().trim().length() > 0){
				strWhere.append(" and a.sfss = ?");
				params.add(debtQueryVO.getSfss());
			}
			strWhere.append(" order by a.id DESC ");
			preparedHQL = preparedHQL+strWhere.toString();
			System.out.println("========================ddddddd============="+preparedHQL);
			pageableList= (PageableList) publicDao.queryForList(preparedHQL, params, paginator);
			    
			    List  list= pageableList.getResults();
			    for (int i = 0; i < list.size(); i++) {
			    	Map tempBO = (Map) list.get(i);
					DebtQueryVO tempVO = new DebtQueryVO();
					tempVO.setZqrmc(String.valueOf(tempBO.get("ZQRMC")));
					tempVO.setZqrid(String.valueOf(tempBO.get("ZQRID")));
					tempVO.setZwrmc(String.valueOf(tempBO.get("ZWRMC")));
					tempVO.setZwrid(String.valueOf(tempBO.get("ZWRID")));
					tempVO.setDbfs(String.valueOf(tempBO.get("DBFS")));
					tempVO.setBzrdsm(String.valueOf(tempBO.get("BZRDSM")));
					tempVO.setSfss(String.valueOf(tempBO.get("SFSS")));
					tempVO.setZqqx(checkLong(tempBO.get("ZQQX")));
					tempVO.setZqje(checkDouble(tempBO.get("ZQJE")));
					tempVO.setSssx(String.valueOf(tempBO.get("SSSX")));
					tempVO.setStzwmc(String.valueOf(tempBO.get("STZWMC")));
					tempList.add(tempVO);
				}
		}
		
		return tempList;
	}
	
	
	/**
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Double checkDouble(Object obj) {
		Double dou = 0D;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0D;
		} else {
			dou = Double.valueOf(String.valueOf(obj));
		}
		return dou;
	}
	
	/**
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Long checkLong(Object obj) {
		Long dou = 0L;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0L;
		} else {
			dou = Long.valueOf(String.valueOf(obj));
		}
		return dou;
	}
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public List<QueryResultVO> queryAsset(ZCXXQueryVO assetQueryVO,Paginator paginator) {
		String preparedHQL = "select a ";
		String countSQL = "from StFsxx a,StJbxx b   where a.sfbc='1' and a.stid=b.id   and b.stlx=?  ";
		StringBuffer strWhere = new StringBuffer();
		List<Object> params = new ArrayList<Object>();
		List<StFsxx> tempList = new ArrayList<StFsxx>();
		List<QueryResultVO> resultList = new ArrayList<QueryResultVO>();
		
		//实体类型
		params.add(StglCommon.ST_TYPE_FEIZIXUN_CHUZHI);
		
		// 实体名称
		if (assetQueryVO.getStmc() != null
				&& assetQueryVO.getStmc().trim().length() > 0) {
			params.add("%"+assetQueryVO.getStmc()+"%");
			strWhere.append(" and b.stzwmc  like ? ");
		}
		// 资产类型

		if (assetQueryVO.getStnzcfl() != null
				&& assetQueryVO.getStnzcfl().trim().length() > 0) {
			params.add(assetQueryVO.getStnzcfl());
			strWhere.append(" and a.stnzcfl  = ? ");
		}
		// 账户
		if (assetQueryVO.getHzhanghu() != null
				&& assetQueryVO.getHzhanghu().trim().length() > 0) {
			params.add("%"+assetQueryVO.getHzhanghu()+"%");
			strWhere.append(" and a.hzhanghu  like ? ");
		}

		// 土地名称
		// private String jtdmc;

		if (assetQueryVO.getHzhanghu() != null
				&& assetQueryVO.getHzhanghu().trim().length() > 0) {
			params.add("%"+assetQueryVO.getHzhanghu()+"%");
			strWhere.append(" and a.jtdmc  like ?  ");
		}
		// 实际占有人
		// private String jsjzyr;

		if (assetQueryVO.getJsjzyr() != null
				&& assetQueryVO.getJsjzyr().trim().length() > 0) {
			params.add("%"+assetQueryVO.getJsjzyr()+"%");
			strWhere.append(" and a.jsjzyr  like  ?  ");
		}

		// 土地是否抵押

		if (assetQueryVO.getJtdsfdy() != null
				&& assetQueryVO.getJtdsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getJtdsfdy());
			strWhere.append(" and a.jtdsfdy  = ? ");
		}

		// 土地使用权证
		// private String jtdsyqz;
		if (assetQueryVO.getJtdsyqz() != null
				&& assetQueryVO.getJtdsyqz().trim().length() > 0) {
			params.add(assetQueryVO.getJtdsyqz());
			strWhere.append(" and a.jtdsyqz  = ? ");
		}
		// 房屋名称
		// private String kfwmc;
		if (assetQueryVO.getKfwmc() != null
				&& assetQueryVO.getKfwmc().trim().length() > 0) {
			params.add(assetQueryVO.getKfwmc());
			strWhere.append(" and a.kfwmc  = ? ");
		}
		// 房屋实际占有人
		// private String kfwsjzyr;
		if (assetQueryVO.getKfwsjzyr() != null
				&& assetQueryVO.getKfwsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getKfwsjzyr());
			strWhere.append(" and a.kfwsjzyr  = ? ");
		}
		// 有无房屋使用权证
		// private String kywfwsyqz;
		if (assetQueryVO.getKywfwsyqz() != null
				&& assetQueryVO.getKywfwsyqz().trim().length() > 0) {
			params.add(assetQueryVO.getKywfwsyqz());
			strWhere.append(" and a.kywfwsyqz  = ? ");
		}
		// 房屋是否抵押
		// private String ksfdy;
		if (assetQueryVO.getKsfdy() != null
				&& assetQueryVO.getKsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getKsfdy());
			strWhere.append(" and a.ksfdy  = ? ");
		}
		// 机器设备名称
		// private String msbmc;
		if (assetQueryVO.getMsbmc() != null
				&& assetQueryVO.getMsbmc().trim().length() > 0) {
			params.add(assetQueryVO.getMsbmc());
			strWhere.append(" and a.msbmc  = ? ");
		}
		// 机器设备权属
		// private String msbqs;
		if (assetQueryVO.getMsbqs() != null
				&& assetQueryVO.getMsbqs().trim().length() > 0) {
			params.add(assetQueryVO.getMsbqs());
			strWhere.append(" and a.msbqs  = ? ");
		}
		// 机器设备实际占有人
		// private String msbsjzyr;
		if (assetQueryVO.getMsbsjzyr() != null
				&& assetQueryVO.getMsbsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getMsbsjzyr());
			strWhere.append(" and a.msbsjzyr  = ? ");
		}
		// 机器设备是否抵押
		// private String msbsfdy;
		if (assetQueryVO.getMsbsfdy() != null
				&& assetQueryVO.getMsbsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getMsbsfdy());
			strWhere.append(" and a.msbsfdy  = ? ");
		}
		// 交通工具名称（车牌号）
		// private String lcph;
		if (assetQueryVO.getLcph() != null
				&& assetQueryVO.getLcph().trim().length() > 0) {
			params.add(assetQueryVO.getLcph());
			strWhere.append(" and a.lcph  = ? ");
		}
		// 交通工具权属
		// private String lqs;
		if (assetQueryVO.getLqs() != null
				&& assetQueryVO.getLqs().trim().length() > 0) {
			params.add(assetQueryVO.getLqs());
			strWhere.append(" and a.lqs  = ? ");
		}
		// 交通工具实际占有人
		// private String lsjzyr;
		if (assetQueryVO.getLsjzyr() != null
				&& assetQueryVO.getLsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getLsjzyr());
			strWhere.append(" and a.lsjzyr  = ? ");
		}
		// 交通工具是否抵押
		// private String lsfdy;
		if (assetQueryVO.getLsfdy() != null
				&& assetQueryVO.getLsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getLsfdy());
			strWhere.append(" and a.lsfdy  = ? ");
		}
		// 被投资企业名称
		// private String nbtqymc;
		if (assetQueryVO.getNbtqymc() != null
				&& assetQueryVO.getNbtqymc().trim().length() > 0) {
			params.add(assetQueryVO.getNbtqymc());
			strWhere.append(" and a.nbtqymc  = ? ");
		}
		// 投资方式
		// private String ntzfs;
		if (assetQueryVO.getNtzfs() != null
				&& assetQueryVO.getNtzfs().trim().length() > 0) {
			params.add(assetQueryVO.getNtzfs());
			strWhere.append(" and a.ntzfs  = ? ");
		}
		// 其他资产名称
		// private String pqtzcmc;
		if (assetQueryVO.getPqtzcmc() != null
				&& assetQueryVO.getPqtzcmc().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcmc());
			strWhere.append(" and a.pqtzcmc  = ? ");
		}
		// 其他资产权属
		// private String pqtzcqs;
		if (assetQueryVO.getPqtzcqs() != null
				&& assetQueryVO.getPqtzcqs().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcqs());
			strWhere.append(" and a.pqtzcqs  = ? ");
		}
		// 其他资产实际占有人
		// private String pqtzcsjzyr;
		if (assetQueryVO.getPqtzcsjzyr() != null
				&& assetQueryVO.getPqtzcsjzyr().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcsjzyr());
			strWhere.append(" and a.pqtzcsjzyr  = ? ");
		}
		// 其他资产是否抵押
		// private String pqtzcsfdy;
		if (assetQueryVO.getPqtzcsfdy() != null
				&& assetQueryVO.getPqtzcsfdy().trim().length() > 0) {
			params.add(assetQueryVO.getPqtzcsfdy());
			strWhere.append(" and a.pqtzcsfdy  = ? ");
		}		
		strWhere.append(" and  a.leixing=? ");
		params.add(StglCommon.ST_INFO_ZICHAN);

		preparedHQL += countSQL + strWhere.toString() + " order by a.id DESC ";
		countSQL += strWhere.toString() + " order by a.id DESC ";
	 	tempList = (List<StFsxx>) publicDao.queryByHQLWithPaginator(preparedHQL, countSQL, params, paginator).getResults();
		for (int i = 0; i < tempList.size(); i++) {
			QueryResultVO queryResultVO = new QueryResultVO();
			StFsxx tempBO = tempList.get(i);
			StJbxx stJbxx = new StJbxx();
			BeanUtils.copyProperties(tempBO, queryResultVO);
			stJbxx = (StJbxx) publicDao.findSingleResult(
					"from StJbxx where id=?", new String[] { tempBO.getStid()});
			queryResultVO.setStmc(stJbxx.getStzwmc());
			resultList.add(queryResultVO);
		}
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

}
