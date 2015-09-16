package com.tansun.eam2.user.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.generalapps.util.PswToMd5;

public class UserAction {

	private String oldpassword;
	private String newpassword;
	private String confirmpassword;

	public PTUserBO ptuserbo;
	public String errormsg;

	@Autowired
	IUserUCC UserUCCimpl;
	
	
	@Autowired
	PublicDao publicDao;

	public String index() {
		return "index";
	}

	public String changepass() {
		String strUserId = UserThreadLocal.get().getUserLoginId();
		System.out.println("\n\n\n\n" + strUserId);

		//IUser iUser = UserUCCimpl.getUser(strUserId, oldpassword);
		IUser iUser = UserUCCimpl.getUser(strUserId, PswToMd5.StringToMid(oldpassword));
		if (iUser != null) {
			if (confirmpassword.equals(newpassword)) {
				ptuserbo = publicDao.findById(PTUserBO.class, iUser
						.getUserTid());
				ptuserbo.setPassword(PswToMd5.StringToMid(newpassword));
				System.out.println("\n\n\n"+ptuserbo.getMid());
				publicDao.update(ptuserbo);
				errormsg = "密码修改成功！";
			} else {
				errormsg = "两次密码不匹配！";
			}
		} else {
			errormsg = "密码错误！";

		}
		return index();
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public PTUserBO getPtuserbo() {
		return ptuserbo;
	}

	public void setPtuserbo(PTUserBO ptuserbo) {
		this.ptuserbo = ptuserbo;
	}

	public String getErrormsg() {
		return errormsg;
	}

	public void setErrormsg(String errormsg) {
		this.errormsg = errormsg;
	}

	public IUserUCC getUserUCCimpl() {
		return UserUCCimpl;
	}

	public void setUserUCCimpl(IUserUCC userUCCimpl) {
		UserUCCimpl = userUCCimpl;
	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
}