package com.tansun.eam2.zyzc.service;

import java.util.List;

import com.tansun.eam2.zyzc.vo.ZyzcToken;

/**
 * 令牌Service.
 * @author ibm
 *
 */
public interface ITokenService {
	/**
	 * 返回结果需要，
	 * @param status
	 * @param tokenSN
	 * @param user 作为使用人和登录名的查询条件，做or连接。
	 * @return
	 */
	List<ZyzcToken> queryToken(String status, String tokenSN, String user);
	
	/**
	 * 根据status及tokenSN修改当前使用人，登录名等信息。
	 * 
	 * @param tokenSN
	 * @param useUser
	 * @param loginname
	 * @param auth
	 * @param status
	 * @param expireDate
	 * @return
	 */
	boolean updateToken(String tokenSN, String useUser, 
			String loginname, String auth, String status, String expireDate);
}
