package com.tansun.eam2.zccz.service;

import java.util.Map;

import com.tansun.eam2.zccz.vo.DisposeItemStaticVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 统计查询
 * 
 * @author 陈煜霄
 * @date 2010-12-31
 */
public interface IDisposeItemStaticBS {

	/**
	 * 查询
	 * 
	 * @return
	 */
	public String query(Paginator paginator, DisposeItemStaticVO queryVO);

	/**
	 * 查找实体的处置方式
	 * 
	 * @return
	 */
	public Map findSTczfs();

	/**
	 * 查找资产的处置方式
	 * 
	 * @return
	 */
	public Map findZCczfs();

	public String querykp(DisposeItemStaticVO queryVO);

}
