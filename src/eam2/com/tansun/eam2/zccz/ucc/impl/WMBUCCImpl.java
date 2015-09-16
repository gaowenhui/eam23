package com.tansun.eam2.zccz.ucc.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zccz.ucc.IWNBUCC;
import com.tansun.eam2.zccz.service.*;
import com.tansun.eam2.common.model.orm.bo.CzWnb;
import com.tansun.eam2.common.model.orm.bo.CzWnbcol;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 万能表数据访问的UCC具体实现.
 * @author Administrator
 *
 */
@Service
public class WMBUCCImpl implements IWNBUCC {
	@Autowired
	private IWNBBS wnbBS;
	public void save(CommonBO commonBO){
		wnbBS.save(commonBO);
	}
	public void update(CommonBO commonBO){
		wnbBS.update(commonBO);
	}
	public void delete(CommonBO commonBO){
		wnbBS.delete(commonBO);
	}
	/**
	 * 万能表查询列表的数据接口
	 * @param xm_id	项目编号
	 * @param zc_id	资产编号
	 * @param zd_code　虚拟表编号
	 * @return 一个由String组成的List,其中每个String都由chr(9)分割
	 */
	public List queryWNBList(String xm_id, String zc_id, String zd_code) {
		List colList = wnbBS.getColList(zd_code);
		List wnbList = wnbBS.getWNBList(xm_id, zc_id, zd_code);
		List retList = new ArrayList();
		int i=0;
		int j=0;
		int colislist[]=new int[100];	//记录col是否在list之中
		
		String tablehead="";//表头
		String tablebody="";//表体
		for(i=0;i<colList.size();i++){
			
			//得到COLBO对象
			//如果COLBO的isList=1,则加入到tableHead中，并设置colislist=1
			CzWnbcol bo = (CzWnbcol)colList.get(i);
			if (bo.getIslist().trim().equals("1")){
				if (tablehead.length()>0){
					tablehead = tablehead + "\t"+bo.getColName();
				}else{
					tablehead ="id"+"\t" +bo.getColName();
				}
				colislist[i]=1;
			}else{
				colislist[i]=0;
			}
		}
		retList.add(tablehead);	//加入表头
		//
		
		for(i=0;i<wnbList.size();i++){
			tablebody="";
			CzWnb bo2 = (CzWnb)wnbList.get(i);
			for(j=0;j<colList.size();j++){
				if(colislist[j]>0){
					if (tablebody.length()>0){
						tablebody = tablebody + "\t" +getBoCol(bo2,j+1);
					}else{
						tablebody= bo2.getWnbId()+"\t"+ getBoCol(bo2,j+1);
					}
				}
			}
			retList.add(tablebody); //加入表体的数据
		}
		return retList;
	}
	public List modifyWNBList(String wnb_id, String zd_code) {
		List colList = wnbBS.getColList(zd_code);
		List retList = new ArrayList();
		int i=0;
		int j=0;
		String tablehead="";//表头
		String tablebody="";//表体
		for(i=0;i<colList.size();i++){
			
			//得到COLBO对象
			//如果COLBO的isList=1,则加入到tableHead中，并设置colislist=1
			CzWnbcol bo = (CzWnbcol)colList.get(i);
				if (tablehead.length()>0){
					tablehead = tablehead + "\t"+bo.getColName();
				}else{
					tablehead = bo.getColName();
				}
		}
		retList.add(tablehead);	//加入表头
		//
		if(null!=wnb_id&&!"".equals(wnb_id)){
			CzWnb czWnb = (CzWnb) this.retrieveWNBBO(wnb_id);
			for(i=0;i<colList.size();i++){
				tablebody="";
				for(j=0;j<colList.size();j++){
					if (tablebody.length()>0){
						tablebody = tablebody + "\t" +getBoCol(czWnb,j+1);
					}else{
						tablebody=getBoCol(czWnb,j+1);
					}
				}
				retList.add(tablebody); //加入表体的数据
			}
		}
		return retList;
	}
	private String getBoCol(CzWnb bo ,int i){
		switch(i){
		case 1:	return bo.getCol1();
		case 2:	return bo.getCol2();
		case 3:	return bo.getCol3();
		case 4:	return bo.getCol4();
		case 5:	return bo.getCol5();
		case 6:	return bo.getCol6();
		case 7:	return bo.getCol7();
		case 8:	return bo.getCol8();
		case 9:	return bo.getCol9();
		case 10:	return bo.getCol10();
		case 11:	return bo.getCol11();
		case 12:	return bo.getCol12();
		case 13:	return bo.getCol13();
		case 14:	return bo.getCol14();
		case 15:	return bo.getCol15();
		case 16:	return bo.getCol16();
		case 17:	return bo.getCol17();
		case 18:	return bo.getCol18();
		case 19:	return bo.getCol19();
		case 20:	return bo.getCol20();

		default: 
		}
		return "";
	}
	public void setBoCol(CzWnb bo ,String col, int i ){
		switch(i){
		case 1:		bo.setCol1(col);
		case 2:		bo.setCol2(col);
		case 3:		bo.setCol3(col);
		case 4:		bo.setCol4(col);
		case 5:		bo.setCol5(col);
		case 6:		bo.setCol6(col);
		case 7:		bo.setCol7(col);
		case 8:		bo.setCol8(col);
		case 9:		bo.setCol9(col);
		case 10:	bo.setCol10(col);
		case 11:	bo.setCol11(col);
		case 12:	bo.setCol12(col);
		case 13:	bo.setCol13(col);
		case 14:	bo.setCol14(col);
		case 15:	bo.setCol15(col);
		case 16:	bo.setCol16(col);
		case 17:	bo.setCol17(col);
		case 18:	bo.setCol18(col);
		case 19:	bo.setCol19(col);
		case 20:	bo.setCol20(col);

		default: 
		}
	}


	//-----------------------------------------------------------//
	//------------- 程序自动生成的GetSet方法 -----------------------//
	public IWNBBS getWnbBS() {
		return wnbBS;
	}
	public void setWnbBS(IWNBBS wnbBS) {
		this.wnbBS = wnbBS;
	}
	public List getWNBList(String xm_id, String zc_id, String zd_code) {
		// TODO Auto-generated method stub
		return wnbBS.getWNBList(xm_id, zc_id, zd_code);
	}
	public CommonBO retrieveWNBBO(String wnb_id) {
		// TODO Auto-generated method stub
		return wnbBS.retrieveWNBBO(wnb_id);
	}
	

}
