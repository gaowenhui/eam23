package com.tansun.eam2.zccz.ucc;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;

public interface IEntityDealHeadService {


	public List<DebtInfo> getDebtListByStid(String stId);
	
	public List<CzStcztz> getHisttoryHeadList(String id,String cldBianhao);
	
	public String saveHead(CzStcztz head);
	
	/**
	 * 草稿箱入口
	 */
	public CzStcztz viewDraft(String id);  
	
	//生成编号,在综合提交出部门的时候调用
	public CzStcztz generateBianhao(String cldId);
	
	//生成受理序号和申报日期,生成办理单的时候调用
	public CzStcztz generateShoulixuhaoShenbaoRQ(String cldId);
	
	//选择债权
	public void selectDebtList(String cldId, String stid, String ids) throws IllegalAccessException, InvocationTargetException;

    //查询实体处置中，未结案的，实体内资产。预计回收金额及收入明细
    double[] selectEDM(String stid);
	//删除债权
	public void delDebtList(String ids);
	
	//返回本次处置的债权列表的Json串
	public String getDebtListJsonByHeadId(String cldId);
	
	public void updateDept(String id, Double zrje);
	
	public void cleanStMessage(String cldId, String stid);
	
	public void endProcess(CzStcztz head);
}
