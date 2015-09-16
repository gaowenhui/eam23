package com.tansun.eam2.zyzc.service.impl;

import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype2;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype3;
import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.service.ImportExcelToOrclBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class ImportExcelToOrclBSImpl implements ImportExcelToOrclBS{    
	@Autowired
	private PublicDao publicDao;
	
	/**
	 * 根据Excel中的数据更新zy_pdxx表中的记录，并在更新前做一些检查工作，如果分类不对则提示用户
	 */
	public String UpdateExcelInfoToPdxx(List<String> pdxxInfo,int length){
		ZyPdxx newPdxx = new ZyPdxx();
		if(pdxxInfo.size() == 16 && StringUtils.isNotEmpty(pdxxInfo.get(pdxxInfo.size()-1))){
			List<ZyPdxx> pdxxList = (List<ZyPdxx>)publicDao.find("from ZyPdxx where id = '"+ pdxxInfo.get(pdxxInfo.size()-1) +"'");
			
			if(pdxxList.size() > 0){
				BeanUtils.copyProperties(pdxxList.get(0), newPdxx);
			}else{
				System.out.print("!#@!#!");
			}
		}else{
			String yjflbm = findYjflbm(pdxxInfo.get(0));
			if(yjflbm.length() > 20){
				return yjflbm;
			}else{
				newPdxx.setYjflbm(yjflbm);
			}
			
			String ejflbm = findEjflbm(pdxxInfo.get(1));
			if(ejflbm.length() > 20){
				return ejflbm;
			}else{
				newPdxx.setEjflbm(ejflbm);
			}
			
			String sjflbm = findSjflbm(pdxxInfo.get(2));
			if(sjflbm.length() > 20){
				return sjflbm;
			}else{
				newPdxx.setSjflbm(sjflbm);
			}
		}
		newPdxx.setYjflmc(pdxxInfo.get(0));
		newPdxx.setEjflmc(pdxxInfo.get(1));
		newPdxx.setSjflmc(pdxxInfo.get(2));
		newPdxx.setPdpc(pdxxInfo.get(3));
		newPdxx.setZcmc(pdxxInfo.get(4));
		newPdxx.setGg(pdxxInfo.get(5));
		newPdxx.setZcbh(pdxxInfo.get(6));
		newPdxx.setCfdd(pdxxInfo.get(7));
		newPdxx.setSyrmc(pdxxInfo.get(8));
		newPdxx.setSybmbmc(pdxxInfo.get(9));
		newPdxx.setJldw(pdxxInfo.get(10));
		newPdxx.setSl(Double.parseDouble(pdxxInfo.get(11)));
		newPdxx.setPdsl(Double.parseDouble(pdxxInfo.get(12)));
		newPdxx.setPdjg(pdxxInfo.get(13));
		newPdxx.setSheadId(pdxxInfo.get(14));
		publicDao.save(newPdxx);
		return "";
	}
	
	public String findYjflbm(String yjflmc){
		List<DicAppAssettype1> dicList = (List<DicAppAssettype1>)publicDao.find("from DicAppAssettype1 where TYPENAME = '"+ yjflmc +"'");
		if(dicList.size() == 0){
			return "您盘盈的资产的一级分类名称\""+ yjflmc +"\"填写不正确，请您核对修改正确后再次导入！";
		}else{
			return dicList.get(0).getAssettype1Id();
		}
	}
	
	public String findEjflbm(String ejflmc){
		List<DicAppAssettype2> dicList = (List<DicAppAssettype2>)publicDao.find("from DicAppAssettype2 where TYPENAME = '"+ ejflmc +"'");
		if(dicList.size() == 0){
			return "您盘盈的资产的二级分类名称\""+ ejflmc +"\"填写不正确，请您核对修改正确后再次导入！";
		}else{
			return dicList.get(0).getAssettype2Id();
		}
	}
	
	public String findSjflbm(String sjflmc){
		List<DicAppAssettype3> dicList = (List<DicAppAssettype3>)publicDao.find("from DicAppAssettype3 where TYPENAME = '"+ sjflmc +"'");
		if(dicList.size() == 0){
			return "您盘盈的资产的三级分类名称\""+ sjflmc +"\"填写不正确，请您核对修改正确后再次导入！";
		}else{
			return dicList.get(0).getAssettype3Id();
		}
	}
}