package com.tansun.eam2.common.model.orm.bo;

import java.util.Date;

/**
 * PTUser entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class EAMUser extends com.tansun.rdp4j.common.web.vo.CommonBO implements
		java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -9141829519759175579L;
	private Long tid;
	private String loginId;
	private String username;
	private String password;
	private String genderCd;
	private Date birthDate;
	private String idNumber;
	private String email;
	private String cellphone;
	private String homePhone;
	private String businessPhone;
	private String address;
	private String postcode;
	private String description;
	private String statusCd;
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
	private String rsvdStr7;
	private String rsvdStr8;
	private String rsvdStr9;
	private String rsvdStr10;

	// Constructors

	/** default constructor */
	public EAMUser() {
	}

	// Property accessors

	public Long getTid() {
		return this.tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

	public String getLoginId() {
		return this.loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGenderCd() {
		return this.genderCd;
	}

	public void setGenderCd(String genderCd) {
		this.genderCd = genderCd;
	}

	public Date getBirthDate() {
		return this.birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCellphone() {
		return this.cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getHomePhone() {
		return this.homePhone;
	}

	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}

	public String getBusinessPhone() {
		return this.businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostcode() {
		return this.postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStatusCd() {
		return this.statusCd;
	}

	public void setStatusCd(String statusCd) {
		this.statusCd = statusCd;
	}

	public String getDelFlagCd() {
		return this.delFlagCd;
	}

	public void setDelFlagCd(String delFlagCd) {
		this.delFlagCd = delFlagCd;
	}

	@Override
	public String getMid() {
		return super.genMid(tid);
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

	public String getRsvdStr7() {
		return this.rsvdStr7;
	}

	public void setRsvdStr7(String rsvdStr7) {
		this.rsvdStr7 = rsvdStr7;
	}

	public String getRsvdStr8() {
		return this.rsvdStr8;
	}

	public void setRsvdStr8(String rsvdStr8) {
		this.rsvdStr8 = rsvdStr8;
	}

	public String getRsvdStr9() {
		return this.rsvdStr9;
	}

	public void setRsvdStr9(String rsvdStr9) {
		this.rsvdStr9 = rsvdStr9;
	}

	public String getRsvdStr10() {
		return this.rsvdStr10;
	}

	public void setRsvdStr10(String rsvdStr10) {
		this.rsvdStr10 = rsvdStr10;
	}
	
	
	
@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result
				+ ((birthDate == null) ? 0 : birthDate.hashCode());
		result = prime * result
				+ ((businessPhone == null) ? 0 : businessPhone.hashCode());
		result = prime * result
				+ ((cellphone == null) ? 0 : cellphone.hashCode());
		result = prime * result
				+ ((delFlagCd == null) ? 0 : delFlagCd.hashCode());
		result = prime * result
				+ ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((genderCd == null) ? 0 : genderCd.hashCode());
		result = prime * result
				+ ((homePhone == null) ? 0 : homePhone.hashCode());
		result = prime * result
				+ ((idNumber == null) ? 0 : idNumber.hashCode());
		result = prime * result + ((loginId == null) ? 0 : loginId.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result
				+ ((postcode == null) ? 0 : postcode.hashCode());
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
				+ ((rsvdStr10 == null) ? 0 : rsvdStr10.hashCode());
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
				+ ((rsvdStr7 == null) ? 0 : rsvdStr7.hashCode());
		result = prime * result
				+ ((rsvdStr8 == null) ? 0 : rsvdStr8.hashCode());
		result = prime * result
				+ ((rsvdStr9 == null) ? 0 : rsvdStr9.hashCode());
		result = prime * result
				+ ((statusCd == null) ? 0 : statusCd.hashCode());
		result = prime * result + ((tid == null) ? 0 : tid.hashCode());
		result = prime * result
				+ ((username == null) ? 0 : username.hashCode());
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
		final EAMUser other = (EAMUser) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (birthDate == null) {
			if (other.birthDate != null)
				return false;
		} else if (!birthDate.equals(other.birthDate))
			return false;
		if (businessPhone == null) {
			if (other.businessPhone != null)
				return false;
		} else if (!businessPhone.equals(other.businessPhone))
			return false;
		if (cellphone == null) {
			if (other.cellphone != null)
				return false;
		} else if (!cellphone.equals(other.cellphone))
			return false;
		if (delFlagCd == null) {
			if (other.delFlagCd != null)
				return false;
		} else if (!delFlagCd.equals(other.delFlagCd))
			return false;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (genderCd == null) {
			if (other.genderCd != null)
				return false;
		} else if (!genderCd.equals(other.genderCd))
			return false;
		if (homePhone == null) {
			if (other.homePhone != null)
				return false;
		} else if (!homePhone.equals(other.homePhone))
			return false;
		if (idNumber == null) {
			if (other.idNumber != null)
				return false;
		} else if (!idNumber.equals(other.idNumber))
			return false;
		if (loginId == null) {
			if (other.loginId != null)
				return false;
		} else if (!loginId.equals(other.loginId))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (postcode == null) {
			if (other.postcode != null)
				return false;
		} else if (!postcode.equals(other.postcode))
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
		if (rsvdStr10 == null) {
			if (other.rsvdStr10 != null)
				return false;
		} else if (!rsvdStr10.equals(other.rsvdStr10))
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
		if (rsvdStr7 == null) {
			if (other.rsvdStr7 != null)
				return false;
		} else if (!rsvdStr7.equals(other.rsvdStr7))
			return false;
		if (rsvdStr8 == null) {
			if (other.rsvdStr8 != null)
				return false;
		} else if (!rsvdStr8.equals(other.rsvdStr8))
			return false;
		if (rsvdStr9 == null) {
			if (other.rsvdStr9 != null)
				return false;
		} else if (!rsvdStr9.equals(other.rsvdStr9))
			return false;
		if (statusCd == null) {
			if (other.statusCd != null)
				return false;
		} else if (!statusCd.equals(other.statusCd))
			return false;
		if (tid == null) {
			if (other.tid != null)
				return false;
		} else if (!tid.equals(other.tid))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

public String toString(){
	return "userName"+username;
}
}