package com.tansun.eam2.jygdzc.ucc;

import java.util.List;

import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 投保申请查询
 * 
 * @author 陈煜霄
 * @date 2010-12-15
 */
public interface IAssuranceQueryUCC {

	/**
	 * 投保申请查询
	 * 
	 * @param queryVO
	 * @param paginator
	 * @return
	 */
	public String queryAssurance(AssuranceQueryVO queryVO, Paginator paginator);
	//根据id查出 属于该id下的数据以方便导出
	public List<AssuranceQueryVO> queryAssurance(String ids);

}
