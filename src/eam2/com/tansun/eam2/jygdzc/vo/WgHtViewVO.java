package com.tansun.eam2.jygdzc.vo;

import java.util.Date;

import com.tansun.eam2.jygdzc.JygdzcCommon;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 
 * 
 * @author lihuan
 *
 */
public class WgHtViewVO extends CommonBO{

	private String id;
	private String htbh;
	private String zcmc;
	private String zcbh;
	private String htlx;
	private Date htksrq;
	private Date htzzrq;
	private Date htdqrq;
	
	private String htlxName;
	
	public String getZcmc() {
		return zcmc;
	}
	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getHtbh() {
		return htbh;
	}
	public void setHtbh(String htbh) {
		this.htbh = htbh;
	}
	public String getZcbh() {
		return zcbh;
	}
	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}
	public String getHtlx() {
		return htlx;
	}
	public void setHtlx(String htlx) {
		this.htlx = htlx;
	}
	public Date getHtksrq() {
		return htksrq;
	}
	public void setHtksrq(Date ktksrq) {
		this.htksrq = ktksrq;
	}
	public Date getHtzzrq() {
		return htzzrq;
	}
	public void setHtzzrq(Date htzzrq) {
		this.htzzrq = htzzrq;
	}
	
	public String getHtlxName(){
		String value="";
		if(JygdzcCommon.CONTRACT_ZLHT.equals(htlx)){
			value="租赁合同";
		}else if(JygdzcCommon.CONTRACT_WGHT.equals(htlx)){
			value="委管合同";
		}else if(JygdzcCommon.CONTRACT_CXHT.equals(htlx)){
			value="车险合同";
		}else if(JygdzcCommon.CONTRACT_FCXHT.equals(htlx)){
			value="非车险合同";
		}
		return value;
	}
	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}
	public Date getHtdqrq() {
		return htdqrq;
	}
	public void setHtdqrq(Date htdqrq) {
		this.htdqrq = htdqrq;
	}
	
}
