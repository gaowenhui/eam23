package com.tansun.eam2.oa;

/**
 * EAM给OA调用的接口
 * @author Baitin.Fong
 *
 */
public interface IOAInter {
	/**
	 * 获得EAM系统的办理依据
	 * @param userid
	 * @param labname
	 * @param beginnum
	 * @param endnum
	 * @param keyword
	 * @param docstatus
	 * @return
	 */
	public String getEAMBLYJ(String userid, String labname, String beginnum,
			String endnum, String keyword, String docstatus);

	/**
	 * 启动EAM系统的一个流程（1月7日：未启动）
	 * @param OAmsgid
	 * @param ngr
	 * @param ngbm
	 * @param ngrq
	 * @param title
	 * @param flowname
	 * @param url
	 * @param bz
	 * @param blyjTitle
	 * @param blyjWh
	 * @param blyjNgr
	 * @param blyjNgrq
	 * @param blyjMkmc
	 * @param blyjLcmc
	 * @return
	 */
	public String startEAMFlow(String OAmsgid, String ngr, String ngbm,	String ngrq, String title, 
			String workflow, String url, String bz,	String blyj_title, String blyj_wh, 
			String blyj_ngr, String blyj_ngrq, String blyj_mkmc, String blyj_lcmc,
			// mzq add
			String sendUserName, String workflowid);

	/**
	 * 
	 * @return
	 */
	public String queryUsingEAMFlow();
	
	/**
	 * 根据流程ID查询EAM系统的流程状态（1月7日：未启动）
	 * @param lcid
	 * @return
	 */
	public String queryEAMFlow(String lcid);

	/**
	 * 办结流程，（1月7日：未启动）
	 * 是否应用待定
	 * @param lcid
	 * @param lczt
	 * @param ngyj
	 * @param qfyj
	 * @param hqyj
	 * @param hgyj
	 * @param jdyj
	 * @param bz
	 * @return
	 */
	public String finishEAMFlow(String lcid, String lczt, String ngyj,
			String qfyj, String hqyj, String hgyj, String jdyj, String bz);
	
	/**
	 * 根据状态查询令牌，（在用，在库），根据人名查询， 根据令牌号查询。
	 * command = byStatus, byUserName, byNo, updateByTokenId
	 * @param command
	 * @param tokenSN
	 * @param useUser
	 * @param loginname
	 * @param auth
	 * @param status
	 * @param expireDate
	 * @return
	 */
	public String token(String command, String tokenSN, String useUser,
			String loginname, String auth, String status, String expireDate);
}
