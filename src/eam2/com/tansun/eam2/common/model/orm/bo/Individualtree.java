package com.tansun.eam2.common.model.orm.bo;

import java.util.List;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * Individualtree entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class Individualtree extends CommonBO implements java.io.Serializable{

	// Fields

	private String categoryid;
	private String categoryname;
	private String activitystatus;
	private String rootnote;
	private String operatelevel;
	private String url;
	private String treetype;
	private Long nodeorder;
	private String nodevalue;
	private String haschild;
	private String colonizevalue;
	private Long leaf;
	private Individualtree individualtree;
	private List<Individualtree> individualtrees;
	// Constructors

	/** default constructor */
	public Individualtree() {
	}

	/** full constructor */
	public Individualtree( String categoryname,
			String activitystatus, String rootnote, String operatelevel, String url,
			String treetype, Long nodeorder, String nodevalue, String haschild,
			String colonizevalue, Long leaf) {
		this.categoryname = categoryname;
		this.activitystatus = activitystatus;
		this.rootnote = rootnote;
		this.operatelevel = operatelevel;
		this.url = url;
		this.treetype = treetype;
		this.nodeorder = nodeorder;
		this.nodevalue = nodevalue;
		this.haschild = haschild;
		this.colonizevalue = colonizevalue;
		this.leaf = leaf;
	}

	// Property accessors

	public String getCategoryid() {
		return this.categoryid;
	}

	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}

	public String getCategoryname() {
		return this.categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

	public String getActivitystatus() {
		return this.activitystatus;
	}

	public void setActivitystatus(String activitystatus) {
		this.activitystatus = activitystatus;
	}

	public String getOperatelevel() {
		return this.operatelevel;
	}

	public void setOperatelevel(String operatelevel) {
		this.operatelevel = operatelevel;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTreetype() {
		return this.treetype;
	}

	public void setTreetype(String treetype) {
		this.treetype = treetype;
	}

	public Long getNodeorder() {
		return this.nodeorder;
	}

	public void setNodeorder(Long nodeorder) {
		this.nodeorder = nodeorder;
	}

	public String getNodevalue() {
		return this.nodevalue;
	}

	public void setNodevalue(String nodevalue) {
		this.nodevalue = nodevalue;
	}

	public String getHaschild() {
		return this.haschild;
	}

	public void setHaschild(String haschild) {
		this.haschild = haschild;
	}

	public String getColonizevalue() {
		return this.colonizevalue;
	}

	public void setColonizevalue(String colonizevalue) {
		this.colonizevalue = colonizevalue;
	}

	public Long getLeaf() {
		return this.leaf;
	}

	public void setLeaf(Long leaf) {
		this.leaf = leaf;
	}

	public Individualtree getIndividualtree() {
		return individualtree;
	}

	public void setIndividualtree(Individualtree individualtree) {
		this.individualtree = individualtree;
	}

	public List<Individualtree> getIndividualtrees() {
		return individualtrees;
	}

	public void setIndividualtrees(List<Individualtree> individualtrees) {
		this.individualtrees = individualtrees;
	}

	public String getRootnote() {
		return rootnote;
	}

	public void setRootnote(String rootnote) {
		this.rootnote = rootnote;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}