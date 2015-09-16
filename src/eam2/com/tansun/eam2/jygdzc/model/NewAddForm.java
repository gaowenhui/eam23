package com.tansun.eam2.jygdzc.model;

import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;

public class NewAddForm {

	/**
	 * 标题
	 */
	private String title;
	
	/**
	 * 编码
	 */
	private String number;
	
	/**
	 * 拟稿人
	 */
	private PTUserBO draftPerson;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public PTUserBO getDraftPerson() {
		return draftPerson;
	}

	public void setDraftPerson(PTUserBO draftPerson) {
		this.draftPerson = draftPerson;
	}
}
