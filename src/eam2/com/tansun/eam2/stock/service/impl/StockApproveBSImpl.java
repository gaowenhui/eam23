package com.tansun.eam2.stock.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.stock.service.IStockApproveBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
@Service
public class StockApproveBSImpl implements IStockApproveBS {
	@Autowired
	PublicDao publicDao;
	@Autowired
	private ICodeGenerator codeGenerator;

	
	/**
	 * 新增记录
	 * @param stwork
	 */
	public void newHead(StockShead ss){
		publicDao.save(ss);
	}
	
	/**
	 * 保存
	 * @param sb
	 */
	public void saveHead(StockShead ss){
		
//		StockShead i =publicDao.findById(StockShead.class, ss.getSheadId());
//		try {
//			BeanUtils.copyProperties(i, ss);
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
		publicDao.update(ss);
	}
	
	/**
	 * 通过id查找StockShead表是否为新增
	 * @param id
	 * @return
	 */
	public StockShead viewStockShead(String id){
		
		List param=new ArrayList();
		param.add(id);
		return  (StockShead)publicDao.findSingleResult("from StockShead where sheadId = ? ",param);
	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	@SuppressWarnings("unchecked")
	//与
	public StockInfo getStockSbodyById(String stockId,String id){
		List param=new ArrayList();
		param.add(stockId);
		param.add(id);
		return  (StockInfo)publicDao.findSingleResult("select s from  StockSbody o ,StockInfo s where o.stockId  = s.id  and o.stockId = ? and o.id = ? ",param);
		
	}
	
	/**
	 * 保存所选债券信息
	 * @param StockIds
	 * @param sheadId
	 */
	public void saveStockList(String[] StockIds,String sheadId) {
		for (int i = 0; i < StockIds.length; i++) {
			String sql =  "SELECT a.nf,"+
							    " a.zqmz,"+
							    " a.zqmz2,"+
							    " a.stockid,"+
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
			
				if(StringUtils.isNotEmpty(StockIds[i])){
					sql += " and b.id =?";
				
//				StockSbody sbody = (StockSbody) publicDao.queryForList(sql, new Object[] {new String(StockIds[i])}).get(0);
				List listMap=new ArrayList();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				listMap=publicDao.queryForList(sql, new Object[] {new String(StockIds[i])});
//				for(int j =0;j<listMap.size();j++){
					Map map = (Map)listMap.get(0);
					StockSbody sbody = new StockSbody();
					try {
						if(map.get("dqr") == null )
						{
							sbody.setDqr(null);
						}
						else{
							sbody.setDqr(sdf.parse(String.valueOf(map.get("dqr"))));
						}
					} catch (ParseException e) {
						e.printStackTrace();
					}
					//债券最新年初面值
					if(map.get("zqmz") != null){
						sbody.setZqzxmznc(new Double(map.get("zqmz").toString()));
					}
//					sbody.setStockId(map.get("stockid").toString());
					sbody.setStockId(StockIds[i]);
					//建行分行编码
					if(map.get("jhfhmc") != null){
						sbody.setJhfhmc(String.valueOf(map.get("jhfhmc")));
					}
					//债券名称
					if(map.get("zqmc") != null){
						sbody.setZqmc(map.get("zqmc").toString());
					}
					//债券种类名称
					if(map.get("zqzlmc") != null){
						sbody.setZqzlmc(map.get("zqzlmc").toString());
					}
					//债券最新年末面值
					if(sbody.getZqzxmznm() != null){
						sbody.setZqzxmznm(new Double(map.get("zqmz2").toString()));
					}
					sbody.setSheadId(sheadId);
					publicDao.save(sbody);
//				}
				
				}
			}
		}

	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public List<StockSbody> viewStockList(String id){
		List<StockSbody> list = (List<StockSbody>)publicDao.find("from StockSbody o where o.sheadId='" + id + "'");
		return list;
	}
	
	
	/**
	 * 删除表体
	 */
	public void deleteStockSbody(String[] Id) {
		for (int i = 0; i < Id.length; i++) {
			if(StringUtils.isNotEmpty(Id[i])){
				StockSbody sbody = (StockSbody) publicDao.findSingleResult(
						"from StockSbody o where o.id =?", new Object[] { new String(
								Id[i]) });
				publicDao.delete(sbody);
			}
		}
	}
	
	
	
	//债券审批作废时释放编号
	public void releaseStockSheadBianhao(String stockId){
		StockShead stockShead = publicDao.findById(StockShead.class, stockId);
		List<StockShead> stockSheadList = (List<StockShead>)publicDao.find("from StockShead o where o.sheetId=?", new String[]{stockShead.getSheetId()});
		codeGenerator.disableCurrentCode("zqglspbh", stockShead.getSheetId(), stockShead.getNgbmbh());
		for(StockShead st : stockSheadList){
			st.setSheetId(st.getSheetId() + "(作废)");
		}
	}

	public ICodeGenerator getCodeGenerator() {
		return codeGenerator;
	}

	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}
	
}
