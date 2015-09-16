package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;
import java.util.List;

/**
 * PTDept entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class EAMDept extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -692364855346906915L;
	// Fields

	private Long tid;
	private String deptCode;
	private String deptName;
	private String deptDesc;
	private String deptTypeCd;
	private Long sortOrder;
	private String delFlagCd;
	private Date rsvdDate1;
	private Date rsvdDate2;
	private Long rsvdNum1;
	private Long rsvdNum2;
	private String rsvdStr1;
	private String rsvdStr2;
	private String rsvdStr3;
	private String rsvdStr4;
	private String rsvdStr5;
	private String rsvdStr6;
	private EAMDept dept;
	private List<EAMDept> depts;
	private List<EAMUser> users;
	// Constructors

	/** default constructor */
	public EAMDept() {
	}

	// Property accessors

	public Long getTid() {
		return this.tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}
	
	public String getDeptCode() {
		return this.deptCode;
	}

	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}

	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptDesc() {
		return this.deptDesc;
	}

	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}

	public String getDeptTypeCd() {
		return this.deptTypeCd;
	}

	public void setDeptTypeCd(String deptTypeCd) {
		this.deptTypeCd = deptTypeCd;
	}

	public Long getSortOrder() {
		return this.sortOrder;
	}

	public void setSortOrder(Long sortOrder) {
		this.sortOrder = sortOrder;
	}

	public String getDelFlagCd() {
		return this.delFlagCd;
	}

	public void setDelFlagCd(String delFlagCd) {
		this.delFlagCd = delFlagCd;
	}

	public Date getRsvdDate1() {
		return this.rsvdDate1;
	}

	public void setRsvdDate1(Date rsvdDate1) {
		this.rsvdDate1 = rsvdDate1;
	}

	public Date getRsvdDate2() {
		return this.rsvdDate2;
	}

	public void setRsvdDate2(Date rsvdDate2) {
		this.rsvdDate2 = rsvdDate2;
	}

	public Long getRsvdNum1() {
		return this.rsvdNum1;
	}

	public void setRsvdNum1(Long rsvdNum1) {
		this.rsvdNum1 = rsvdNum1;
	}

	public Long getRsvdNum2() {
		return this.rsvdNum2;
	}

	public void setRsvdNum2(Long rsvdNum2) {
		this.rsvdNum2 = rsvdNum2;
	}

	public String getRsvdStr1() {
		return this.rsvdStr1;
	}

	public void setRsvdStr1(String rsvdStr1) {
		this.rsvdStr1 = rsvdStr1;
	}

	public String getRsvdStr2() {
		return this.rsvdStr2;
	}

	public void setRsvdStr2(String rsvdStr2) {
		this.rsvdStr2 = rsvdStr2;
	}

	public String getRsvdStr3() {
		return this.rsvdStr3;
	}

	public void setRsvdStr3(String rsvdStr3) {
		this.rsvdStr3 = rsvdStr3;
	}

	public String getRsvdStr4() {
		return this.rsvdStr4;
	}

	public void setRsvdStr4(String rsvdStr4) {
		this.rsvdStr4 = rsvdStr4;
	}

	public String getRsvdStr5() {
		return this.rsvdStr5;
	}

	public void setRsvdStr5(String rsvdStr5) {
		this.rsvdStr5 = rsvdStr5;
	}

	public String getRsvdStr6() {
		return this.rsvdStr6;
	}

	public void setRsvdStr6(String rsvdStr6) {
		this.rsvdStr6 = rsvdStr6;
	}

	@Override
	public String getMid() {
		return super.genMid(tid);
	}

	public EAMDept getDept() {
		return dept;
	}

	public void setDept(EAMDept dept) {
		this.dept = dept;
	}

	public List<EAMDept> getDepts() {
		return depts;
	}

	public void setDepts(List<EAMDept> depts) {
		this.depts = depts;
	}

	public List<EAMUser> getUsers() {
		return users;
	}

	public void setUsers(List<EAMUser> users) {
		this.users = users;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((delFlagCd == null) ? 0 : delFlagCd.hashCode());
		result = prime * result
				+ ((deptCode == null) ? 0 : deptCode.hashCode());
		result = prime * result
				+ ((deptDesc == null) ? 0 : deptDesc.hashCode());
		result = prime * result
				+ ((deptName == null) ? 0 : deptName.hashCode());
		result = prime * result
				+ ((deptTypeCd == null) ? 0 : deptTypeCd.hashCode());
		result = prime * result
				+ ((rsvdDate1 == null) ? 0 : rsvdDate1.hashCode());
		result = prime * result
				+ ((rsvdDate2 == null) ? 0 : rsvdDate2.hashCode());
		result = prime * result
				+ ((rsvdNum1 == null) ? 0 : rsvdNum1.hashCode());
		result = prime * result
				+ ((rsvdNum2 == null) ? 0 : rsvdNum2.hashCode());
		result = prime * result
				+ ((rsvdStr1 == null) ? 0 : rsvdStr1.hashCode());
		result = prime * result
				+ ((rsvdStr2 == null) ? 0 : rsvdStr2.hashCode());
		result = prime * result
				+ ((rsvdStr3 == null) ? 0 : rsvdStr3.hashCode());
		result = prime * result
				+ ((rsvdStr4 == null) ? 0 : rsvdStr4.hashCode());
		result = prime * result
				+ ((rsvdStr5 == null) ? 0 : rsvdStr5.hashCode());
		result = prime * result
				+ ((rsvdStr6 == null) ? 0 : rsvdStr6.hashCode());
		result = prime * result
				+ ((sortOrder == null) ? 0 : sortOrder.hashCode());
		result = prime * result + ((tid == null) ? 0 : tid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		final EAMDept other = (EAMDept) obj;
		if (delFlagCd == null) {
			if (other.delFlagCd != null)
				return false;
		} else if (!delFlagCd.equals(other.delFlagCd))
			return false;
		if (deptCode == null) {
			if (other.deptCode != null)
				return false;
		} else if (!deptCode.equals(other.deptCode))
			return false;
		if (deptDesc == null) {
			if (other.deptDesc != null)
				return false;
		} else if (!deptDesc.equals(other.deptDesc))
			return false;
		if (deptName == null) {
			if (other.deptName != null)
				return false;
		} else if (!deptName.equals(other.deptName))
			return false;
		if (deptTypeCd == null) {
			if (other.deptTypeCd != null)
				return false;
		} else if (!deptTypeCd.equals(other.deptTypeCd))
			return false;
		if (rsvdDate1 == null) {
			if (other.rsvdDate1 != null)
				return false;
		} else if (!rsvdDate1.equals(other.rsvdDate1))
			return false;
		if (rsvdDate2 == null) {
			if (other.rsvdDate2 != null)
				return false;
		} else if (!rsvdDate2.equals(other.rsvdDate2))
			return false;
		if (rsvdNum1 == null) {
			if (other.rsvdNum1 != null)
				return false;
		} else if (!rsvdNum1.equals(other.rsvdNum1))
			return false;
		if (rsvdNum2 == null) {
			if (other.rsvdNum2 != null)
				return false;
		} else if (!rsvdNum2.equals(other.rsvdNum2))
			return false;
		if (rsvdStr1 == null) {
			if (other.rsvdStr1 != null)
				return false;
		} else if (!rsvdStr1.equals(other.rsvdStr1))
			return false;
		if (rsvdStr2 == null) {
			if (other.rsvdStr2 != null)
				return false;
		} else if (!rsvdStr2.equals(other.rsvdStr2))
			return false;
		if (rsvdStr3 == null) {
			if (other.rsvdStr3 != null)
				return false;
		} else if (!rsvdStr3.equals(other.rsvdStr3))
			return false;
		if (rsvdStr4 == null) {
			if (other.rsvdStr4 != null)
				return false;
		} else if (!rsvdStr4.equals(other.rsvdStr4))
			return false;
		if (rsvdStr5 == null) {
			if (other.rsvdStr5 != null)
				return false;
		} else if (!rsvdStr5.equals(other.rsvdStr5))
			return false;
		if (rsvdStr6 == null) {
			if (other.rsvdStr6 != null)
				return false;
		} else if (!rsvdStr6.equals(other.rsvdStr6))
			return false;
		if (sortOrder == null) {
			if (other.sortOrder != null)
				return false;
		} else if (!sortOrder.equals(other.sortOrder))
			return false;
		if (tid == null) {
			if (other.tid != null)
				return false;
		} else if (!tid.equals(other.tid))
			return false;
		return true;
	}
	
	

}