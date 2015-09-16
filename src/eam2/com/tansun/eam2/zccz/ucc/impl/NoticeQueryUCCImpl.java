package com.tansun.eam2.zccz.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zccz.service.INoticeQueryBS;
import com.tansun.eam2.zccz.ucc.INoticeQueryUCC;
import com.tansun.eam2.zccz.vo.STZCqueryVO;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class NoticeQueryUCCImpl implements INoticeQueryUCC {

	@Autowired
	private INoticeQueryBS noticeQueryBSImpl;

	/**
	 * 查询处置实体
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryST(STZCqueryVO queryVO, Paginator paginator) {
		return noticeQueryBSImpl.queryST(queryVO, paginator);
	}

	/**
	 * 查询处置资产
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZC(STZCqueryVO queryVO, Paginator paginator) {
		return noticeQueryBSImpl.queryZC(queryVO, paginator);
	}

	/**
	 * 查询处置债券
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryZQ(STZCqueryVO queryVO, Paginator paginator) {
		return noticeQueryBSImpl.queryZQ(queryVO, paginator);
	}
}
