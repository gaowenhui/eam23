package com.tansun.eam2.jiekou.erp.model.bo;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * ErpHistory generated by MyEclipse Persistence Tools
 */

public class ErpHistory extends CommonBO implements java.io.Serializable {

	// Fields

	private Long id;
	private Date senddate;
	private String eamcode;
	private String send;
	private String receive;
	private String wfconfigKey;
	private String sender;
	private String appperson;

	// Constructors

	/** default constructor */
	public ErpHistory() {
	}

	/** full constructor */
	public ErpHistory(Date senddate, String eamcode, String send,
			String receive, String wfconfigKey, String sender, String appperson) {
		this.senddate = senddate;
		this.eamcode = eamcode;
		this.send = send;
		this.receive = receive;
		this.wfconfigKey = wfconfigKey;
		this.sender = sender;
		this.appperson = appperson;
	}

	// Property accessors

	public Long getId() {
		return this.id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getSenddate() {
		return this.senddate;
	}

	public void setSenddate(Date senddate) {
		this.senddate = senddate;
	}

	public String getEamcode() {
		return this.eamcode;
	}

	public void setEamcode(String eamcode) {
		this.eamcode = eamcode;
	}

	public String getSend() {
		return this.send;
	}

	public void setSend(String send) {
		this.send = send;
	}

	public String getReceive() {
		return this.receive;
	}

	public void setReceive(String receive) {
		this.receive = receive;
	}

	public String getWfconfigKey() {
		return this.wfconfigKey;
	}

	public void setWfconfigKey(String wfconfigKey) {
		this.wfconfigKey = wfconfigKey;
	}

	public String getSender() {
		return this.sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getAppperson() {
		return this.appperson;
	}

	public void setAppperson(String appperson) {
		this.appperson = appperson;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}