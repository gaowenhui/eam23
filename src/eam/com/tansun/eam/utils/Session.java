package com.tansun.eam.utils;

import javax.servlet.http.HttpSession;

import com.tansun.rdp4j.common.util.IUser;

public class Session {
	public static final String USER = "user";
	
	public static HttpSession session;

	public static HttpSession getSession() {
		return session;
	}

	public static void setSession(HttpSession session) {
		Session.session = session;
	}
	
	public static IUser getUser(){
		return (IUser)Session.session.getAttribute(Session.USER);
	}
}
