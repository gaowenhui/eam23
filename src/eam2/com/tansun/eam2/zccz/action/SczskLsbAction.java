package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskLsb;
import com.tansun.eam2.zccz.ucc.ICzSczskUCC;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class SczskLsbAction extends CommonAction{
    //知识库临时表
	public CzSczskLsb lsb=new CzSczskLsb();
	//根据cld和 datatype 查出来的数据需要存放的位置
	public List<CzSczskLsb> lsbList=new ArrayList<CzSczskLsb>();
	@Autowired
	public ICzSczskUCC czSczskUCCImpl;
	//需要传来的参数
	public String dataType;
	public String cldId;
	//变动信息表
	public CzSczskBdxx  czSczskBdxx=new CzSczskBdxx();
	public String id;
	public String sheettype;

	public String query(){
		cldId=request.getParameter("cldId");
		//可能是变更前 变更后 审批后的
		sheettype=request.getParameter("sheettype");
		return sheettype;
	}
	
	
	
	//查找修改前的数据
	public String query4View(){
		lsbList=czSczskUCCImpl.getCzSczskByDataType(lsb, dataType,cldId );
		String bodyJSON = BodyListToJSON.getJSON(lsbList, 1, 1, 1);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	/**
	 * 项目名称
	 * @return
	 */
	public String bussiness;
	public String xmmc(){
	  bussiness=(String) request.getParameter("bussiness");
		id=request.getParameter("id");
		lsb=czSczskUCCImpl.getSingle(id);
		System.out.println("---------------------------------------------mmcccc-------"+bussiness);
		return bussiness;
	}
	
	/**
	 * 更改项目名称
	 * @return
	 */
	public String saveOrUpdateXmmc(){
		
			czSczskUCCImpl.saveCzSczskBdxx(czSczskBdxx);
		
		
		return "";
	}
	
	
	
}
