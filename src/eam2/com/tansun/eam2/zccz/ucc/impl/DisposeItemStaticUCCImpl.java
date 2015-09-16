package com.tansun.eam2.zccz.ucc.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zccz.service.IDisposeItemStaticBS;
import com.tansun.eam2.zccz.ucc.IDisposeItemStaticUCC;
import com.tansun.eam2.zccz.vo.DisposeItemStaticVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 统计查询
 * 
 * @author 陈煜霄
 * @date 2010-12-31
 */
@Service
public class DisposeItemStaticUCCImpl implements IDisposeItemStaticUCC {

	@Autowired
	private IDisposeItemStaticBS disposeItemStaticBSImpl;

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String query(Paginator paginator, DisposeItemStaticVO queryVO) {
		return disposeItemStaticBSImpl.query(paginator, queryVO);
	}

	/**
	 * 查找实体的处置方式
	 * 
	 * @return
	 */
	public Map findSTczfs() {
		return disposeItemStaticBSImpl.findSTczfs();
	}

	/**
	 * 查找资产的处置方式
	 * 
	 * @return
	 */
	public Map findZCczfs() {
		return disposeItemStaticBSImpl.findZCczfs();
	}

	public String querykp(DisposeItemStaticVO queryVO) {
		// TODO Auto-generated method stub
		return disposeItemStaticBSImpl.querykp(queryVO); 
	}

}
