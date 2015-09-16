package com.tansun.eam2.zccz.service.impl;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzSczsk;
import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.service.ICzSczskBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.vo.CommonBO;
@Service
public class CzSczskBSImpl implements ICzSczskBS{
   @Autowired
	public PublicDao publicDao;
	public List<CzSczsk> getCzSczskByCondition(CzSczsk czSczsk) {
//		StringBuffer buffer=new StringBuffer();
//		List params = new ArrayList();
//		String sql="select o.ID,o.SCXMBH,o.SCXM,o.SCYDBH,o.SCYD,o.JTYJBH,o.JTYJ from  cz_sczsk o where 1=1";
//	  
//	  if(czSczsk.getJtyj()!=null&&czSczsk.getJtyj().trim().length()>0){
//		  params.add("%"+czSczsk.getJtyj()+"%");
//		  buffer.append(" and  o.JTYJ like ? "  );
//	  }
//	  if(czSczsk.getScxm()!=null&&czSczsk.getScxm().trim().length()>0){
//		  params.add("%"+czSczsk.getScxm()+"%");
//		  buffer.append(" and o.SCXM like ?");
//	  }
//	  if(czSczsk.getScyd()!=null&&czSczsk.getScyd().trim().length()>0){
//		  params.add("%"+czSczsk.getScyd()+"%");
//		  buffer.append(" and o.SCYD like ?");
//	  }
//	  
//	  List listTemp = new ArrayList();
//	  sql=sql+buffer.toString()+" order by o.id ";
//	  StringBuffer buffer1=new StringBuffer();
//	  buffer1.append(sql);
//	  buffer1.append(buffer);
//	  List<CzSczsk> listD=new ArrayList<CzSczsk>();
//	  listTemp = publicDao.queryForList(sql.toString(),params);
//	  for (int i = 0; i < listTemp.size(); i++) {
//			Map map = (Map) listTemp.get(i);
//			CzSczsk zc=new CzSczsk();
//			zc.setId(String.valueOf(map.get("ID")));
//			zc.setJtyj(String.valueOf(map.get("JTYJ")));
//			zc.setScyd(String.valueOf(map.get("SCYD")));
//			zc.setScydbh(String.valueOf(map.get("SCYDBH")));
//			zc.setScxm(String.valueOf(map.get("SCXM")));
//			zc.setJtyjbh(String.valueOf(map.get("JTYJBH")));
//			zc.setScxmbh(String.valueOf(map.get("SCXMBH")));
//			listD.add(zc);
//		}
//	  
//	  System.out.println(listD.size());
//		return listD;
		return null;
	}
	
	public List<CzSczskLsb> getCzSczskByDataType(CzSczskLsb lsb,String dataType,String headId) {
//		StringBuffer buffer=new StringBuffer();
//		List params = new ArrayList();
//		params.add(dataType);
//		params.add(headId);
//		String sql="select o.ID,o.CLD_ID,o.DTYPE,o.SCXMBH,o.SCYDBH,o.SCXM,o.SCYD,o.JTYJBH,o.ZSK_ID  from  cz_sczsk_lsb o where o.DTYPE=? and o.CLD_ID=?";
//		
//		 if(lsb.getJtyj()!=null&&lsb.getJtyj().trim().length()>0){
//			  params.add("%"+lsb.getJtyj()+"%");
//			  buffer.append("  and  o.JTYJ like ? "  );
//		  }
//		  if(lsb.getScxm()!=null&&lsb.getScxm().trim().length()>0){
//			  params.add("%"+lsb.getScxm()+"%");
//			  buffer.append("  and o.SCXM like ?");
//		  }
//		  if(lsb.getScyd()!=null&&lsb.getScyd().trim().length()>0){
//			  params.add("%"+lsb.getScyd()+"%");
//			  buffer.append("  and o.SCYD like ?");
//		  }
//        
//		List listTemp = new ArrayList();
//		  sql=sql+buffer.toString()+" order by o.id ";
//		  List<CzSczskLsb> listD=new ArrayList<CzSczskLsb>();
//		  listTemp = publicDao.queryForList(sql.toString(),params);
//		  for (int i = 0; i < listTemp.size(); i++) {
//				Map map = (Map) listTemp.get(i);
//				CzSczskLsb zc=new CzSczskLsb();
//				zc.setId(String.valueOf(map.get("ID")));
//				zc.setJtyj(String.valueOf(map.get("JTYJ")));
//				zc.setScyd(String.valueOf(map.get("SCYD")));
//				zc.setScydbh(String.valueOf(map.get("SCYDBH")));
//				zc.setScxm(String.valueOf(map.get("SCXM")));
//				zc.setJtyjbh(String.valueOf(map.get("JTYJBH")));
//				zc.setScxmbh(String.valueOf(map.get("SCXMBH")));
//				zc.setDtype(String.valueOf(map.get("DTYPE")));
//				listD.add(zc);
//			}
//	  
//		return listD;
		return null;
	}

	
	
	public CzSczskLsb getSingle(String id){
//		String preparedHQL=" from CzSczskLsb o where o.id=? ";
//		List<Object> list=new ArrayList<Object>();
//		list.add(id);
//		publicDao.find(preparedHQL, list);
//		return (CzSczskLsb) publicDao.find(preparedHQL, list).get(0);
		return null;
	}
	
	
	///////////////////getter setter////////////////////////////////////////////////////////////////////
	public PublicDao getPublicDao() {
		return publicDao;
	}
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public void saveCzSczskBdxx(CzSczskBdxx czSczskBdxx) {

		publicDao.save(czSczskBdxx);
	}

	public void updatCzSczskBdxx(CzSczskBdxx czSczskBdxx) {
		publicDao.update(czSczskBdxx);
	}

	public void deleteXm(CzSczskLsb lsb) {
		
	}

	public void CopyCzSczsk(String cldId) {
//		List list = new ArrayList();
//		List params = new ArrayList();
//		if(cldId!=null&&!"".equals(cldId)){
//			String preparedHQL="from CzSczsk zsk where zsk.delflag = 0"; 
//			list = publicDao.find(preparedHQL);
//			for(int i=0;i<list.size();i++){
//				CzSczskLsb zskLsb= new CzSczskLsb();
//				CzSczsk zsk =(CzSczsk) list.get(i);
//				try {
//					BeanUtils.copyProperties(zskLsb,zsk );
//				} catch (IllegalAccessException e) {
//					e.printStackTrace();
//				} catch (InvocationTargetException e) {
//					e.printStackTrace();
//				}
//				zskLsb.setCldId(cldId);
//				zskLsb.setDelflag("0");
//				zskLsb.setDtype("1");
//				zskLsb.setId("");
//				zskLsb.setZskId(zsk.getId());
//				publicDao.save(zskLsb);
//			}
//		}
		
		
	}

	public String delete(CommonBO commonBO) {
		publicDao.delete(commonBO);
		return null;
	}

	public CommonBO findById(Class cls, String id) {
		return  (CommonBO) publicDao.findById(cls, id);
	}

	public List<CzSczskBdxx> getCzSczskBdxxBycldId(String cldId) {
		List list = new ArrayList();
//		List params = new ArrayList();
//		params.add(cldId);
//		String preparedHQL="from CzSczskBdxx zskBdxx where zskBdxx.cldId = ?";
//		
//		list=publicDao.find(preparedHQL, params);
		
		return list;
	}
	public String save(CommonBO commonBO) {
		publicDao.save(commonBO);
		return null;
	}

	public String update(CommonBO commonBO) {
		publicDao.update(commonBO);
		return null;
	}
	
}
