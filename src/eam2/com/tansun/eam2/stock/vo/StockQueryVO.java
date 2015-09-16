package com.tansun.eam2.stock.vo;

import java.io.Serializable;

import com.tansun.rdp4j.common.web.vo.CommonBO;



public class StockQueryVO extends CommonBO implements Serializable{

    private static final long serialVersionUID = 1L;
    
    private String itemName;//=======项目名称
    private String branch;//==========分行
    private Double debtValue;//账面值
    private Double originalValue;//原值
    
    private String stockSort;  //债券种类
    private String stockName;	//债券名称
    private String bankName;    //行名
    
    private String xmmc;		//项目名称;
    
    private String sign;   //标志
    private Double originalValue1;
    private String shidian;
    private String nf;
	public String getStockSort() {
		return stockSort;
	}

	public void setStockSort(String stockSort) {
		this.stockSort = stockSort;
	}

	public String getStockName() {
		return stockName;
	}

	public void setStockName(String stockName) {
		this.stockName = stockName;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}


	@Override
    public String toString(){
        return "实体查询条件:StockQueryVO [itemName=" + itemName + ", branch=" + branch + ", debtValue=" + debtValue + ", originalValue=" + originalValue +"]";
    }

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

	public Double getOriginalValue1() {
		return originalValue1;
	}

	public void setOriginalValue1(Double originalValue1) {
		this.originalValue1 = originalValue1;
	}

	public String getNf() {
		return nf;
	}

	public void setNf(String nf) {
		this.nf = nf;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public void setDebtValue(Double debtValue) {
		this.debtValue = debtValue;
	}

	public void setOriginalValue(Double originalValue) {
		this.originalValue = originalValue;
	}

	public Double getDebtValue() {
		return debtValue;
	}

	public Double getOriginalValue() {
		return originalValue;
	}

	public String getShidian() {
		return shidian;
	}

	public void setShidian(String shidian) {
		this.shidian = shidian;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
    
 
}
