package com.tansun.eam2.zccz.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.vo.CztzfaXxVO;

public interface IAssetDealHeadUCC {

	/**
	 * 新建入口
	 */
	public void newHead(CzCztzfaXx disposeHead);    
	
	/**
	 * 保存VO对象
	 */	
	public CzCztzfaXx newHeadVO(CztzfaXxVO disposeHead);
	/**
	 * 保存或更新方法
	 */
	public void saveOrUpdateHead(CzCztzfaXx disposeHead);  
	
	public void saveOrUpdateHeadVO(CztzfaXxVO disposeHead);
	
	/**
	 * 根据id查询出处理单信息
	 * @return
	 */
	public CzCztzfaXx findHeadById(String cldId);
	
	public CztzfaXxVO findHeadVOById(String cldId);
	
	/**
	 * 根据处理单id计算预计处置费用总额
	 * @param cldId
	 */
	public Double fillDisposeExpense(String cldId);
	
	/**
	 * 根据处理单id查询出该处理单的历次办理情况
	 * @param cldId 处理单id
	 */
	public List<CzCztzfaXx> findHistoryBlInfo(String cldId);
	
	/**
	 * 查找当前流程在项目受理中的部门和人员,返回到页面，在合规审查提交会议组织时用
	 * @param taskId
	 * @return
	 */
	public String findXmslDept(String taskId, String taskp);
	
	public String getCzfsJson();
	
	//保存处理单的编号
	public void saveBianHao(CztzfaXxVO disposeHead);
	
	//保存受理序号、申报日期
	public void saveSlxh(CztzfaXxVO disposeHead);
	
	public CzStcztz findHeadById1(String cldId) ;
	
	public CzXmxxLsb findXmLsbById(String id);
}
