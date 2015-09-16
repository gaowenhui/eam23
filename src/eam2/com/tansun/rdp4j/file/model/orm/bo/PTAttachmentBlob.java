package com.tansun.rdp4j.file.model.orm.bo;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * PTAttachmentBlob entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class PTAttachmentBlob extends CommonBO  implements java.io.Serializable {

	// Fields

	private String id;
	private byte[] content;

	// Constructors

	/** default constructor */
	public PTAttachmentBlob() {
	}

	/** minimal constructor */
	public PTAttachmentBlob(String id) {
		this.id = id;
	}

	/** full constructor */
	public PTAttachmentBlob(String id, byte[] content) {
		this.id = id;
		this.content = content;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public byte[] getContent() {
		return this.content;
	}

	public void setContent(byte[] content) {
		this.content = content;
	}

	@Override
	public String getMid() {
		return null;
	}

}