package com.tansun.eam2.zyzc.vo;

import java.io.Serializable;

public class ZyzcToken implements Serializable {
	private static final long serialVersionUID = -344080401908172135L;
	String name;
	String loginname;
	String token;
	String auth;
	String status;
	String expire;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getExpire() {
		return expire;
	}

	public void setExpire(String expire) {
		this.expire = expire;
	}

	public String toString() {
		final String TAB = "####";

		String retValue = "";

		retValue = "name=" + this.name + TAB + "loginname=" + this.loginname
				+ TAB + "token=" + this.token + TAB + "auth=" + this.auth + TAB
				+ "status=" + this.status + TAB + "expire=" + this.expire;

		return retValue;
	}

}
