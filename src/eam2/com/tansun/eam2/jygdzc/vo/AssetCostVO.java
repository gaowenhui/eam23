package com.tansun.eam2.jygdzc.vo;

import java.util.ArrayList;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.rdp4j.common.model.orm.PublicDao;

public class AssetCostVO extends JyzcHead {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3250542873243144384L;
	//费用种类
	private String cfyzl;
	//实际花费
	private Double sjhf;
	private Double sqje;
	private Double sdje;
	public Double getSqje() {
		return sqje;
	}
	public void setSqje(PublicDao publicDao) {
		String preparedHQL = "from JyzcSqsdfyXx j where j.zcId = ? and spzt='2'";
		List params = new ArrayList();
		params.add(this.getId());
		Double sqje = new Double(0);
		List<JyzcSqsdfyXx> jyzcSqsdfyXxList = (List<JyzcSqsdfyXx>) publicDao.find(preparedHQL, params);
		for(int i=0;i<jyzcSqsdfyXxList.size();i++){
			JyzcSqsdfyXx jyzcSqsdfyXx = new JyzcSqsdfyXx(); 
			jyzcSqsdfyXx = jyzcSqsdfyXxList.get(i);
			sqje += jyzcSqsdfyXx.getSqje();
		}
		this.sqje = sqje;
	}
	public Double getSdje() {
		return sdje;
	}
	public void setSdje(PublicDao publicDao) {
		String preparedHQL = "from JyzcSqsdfyXx j where j.zcId = ? and spzt='2'";
		List params = new ArrayList();
		params.add(this.getId());
		Double sdje = new Double(0);
		List<JyzcSqsdfyXx> jyzcSqsdfyXxList = (List<JyzcSqsdfyXx>) publicDao.find(preparedHQL, params);
		for(int i=0;i<jyzcSqsdfyXxList.size();i++){
			JyzcSqsdfyXx jyzcSqsdfyXx = new JyzcSqsdfyXx(); 
			jyzcSqsdfyXx = jyzcSqsdfyXxList.get(i);
			sdje += jyzcSqsdfyXx.getSqje();
		}
		this.sdje = sdje;
	}
	public String getCfyzl() {
		return cfyzl;
	}
	public void setCfyzl(String cfyzl) {
		this.cfyzl = cfyzl;
	}
	public Double getSjhf() {
		return sjhf;
	}
	public void setSjhf(Double sjhf) {
		this.sjhf = sjhf;
	}
}
