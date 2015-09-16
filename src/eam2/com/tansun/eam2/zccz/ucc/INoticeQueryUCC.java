package com.tansun.eam2.zccz.ucc;

import com.tansun.eam2.zccz.vo.STZCqueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 处置公告查询
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
public interface INoticeQueryUCC {

	/**
	 * 查询处置实体
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryST(STZCqueryVO queryVO, Paginator paginator);

	/**
	 * 查询处置资产
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZC(STZCqueryVO queryVO, Paginator paginator);

	/**
	 * 查询处置债券
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZQ(STZCqueryVO queryVO, Paginator paginator);

}
