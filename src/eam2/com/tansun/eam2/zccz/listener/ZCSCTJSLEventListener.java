package com.tansun.eam2.zccz.listener;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.IAssetDealWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * 资产处置流程中,合规审查提交项目受理事件的监听器
 * @author 刘贝贝
 *
 */
public class ZCSCTJSLEventListener implements EventListener{
	
	private static final long serialVersionUID = 3764411107934861680L;

	private ZcczWfBS zcczWfBS;	
	private IAssetDealWfBS assetDealWfBS;
	private ICommonOpinionUcc commonOpinionUcc;
	private static ApplicationContext ctx;
	
	public ZCSCTJSLEventListener(){
		System.out.println("_____________________ZCNGTJEventListner Started_________");
		ctx = JbpmServlet.ctx;
		zcczWfBS = ctx.getBean(ZcczWfBS.class);
		assetDealWfBS = ctx.getBean(IAssetDealWfBS.class);
		commonOpinionUcc = ctx.getBean(ICommonOpinionUcc.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("cldId");
		//备份处理单信息
		String historyCldId = assetDealWfBS.copyHeadHistory(cldId);
		//备份处置资产信息
		assetDealWfBS.copyBodysHistory(cldId, historyCldId);
		CzCztzfaXx czCztzfaXx = (CzCztzfaXx)assetDealWfBS.findById(CzCztzfaXx.class, cldId);
		
		//======================处置项目合规性审核信息表处理start=============================
		//克隆合规性审查意见到历史办理单上 
		assetDealWfBS.cloneHgxscToHistory(cldId, czCztzfaXx.getScczfaxxid()); 
		//清除本次的合规性审查
		assetDealWfBS.deleteHgscByCldId(cldId);
		//======================处置项目合规性审核信息表处理end=============================
		
		//======================处理单中意见域处理start=============================
		//备份处理单中意见
		commonOpinionUcc.cloneOpinionByBdId(cldId, czCztzfaXx.getScczfaxxid());
		Integer[] oldTypes = new Integer[]{
				new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_THYJ),
				new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY)};
		//办理单退回意见+审查意见拷贝到处理单上的合规审查意见域中 Updated by liubeibei.2011/3/12.
		commonOpinionUcc.cloneOpinionByBdId(cldId, cldId, oldTypes, new Integer(CommonGlobal.OPINION_YJYLX_CHECK));
		
		StringBuffer ids = new StringBuffer();
		//查询退回意见
		List<PTCommonOpinionBO> opList = commonOpinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_THYJ));
		//办理单过程意见
		opList.addAll(commonOpinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_GCYJ)));
		//办理单最终意见
		opList.addAll(commonOpinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_ZZYJ)));
		//审查意见
		opList.addAll(commonOpinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY)));
		for(int i = 0; i< opList.size(); i++){
			ids.append(opList.get(i).getId());
			if(i < opList.size() - 1){
				ids.append(",");
			}
		}
		commonOpinionUcc.deleteOpinionById(ids.toString());
		//======================处理单中意见域处理end=============================
		
		//======================资产处置报告处理start=============================
		//copy dispose report,set bdid = historyCldId;
		zcczWfBS.copyDisposeReport(cldId, historyCldId);
		//======================资产处置报告处理end=============================
		
		//======================合规审查最终附件和非最终附件处理=============================
		//拷贝最终附件,strsel：最终附件IDs，把合规审查最终附件拷贝一份作为历史
		String strsel = (String)arg0.getVariable("strsel");
		if(StringUtils.isNotEmpty(strsel)){
			if (strsel.startsWith(",")) {
				strsel = strsel.substring(1, strsel.length());
			}
			String strId[] = strsel.split(",");
			//设置合规审查最终附件
			for(String temp:strId){
				zcczWfBS.setZzfj(temp);
			}
			zcczWfBS.copyAttach(strId, historyCldId, "heguishencha");
		}		
		List list = zcczWfBS.findAttachment(cldId);
		int count = list.size();
		String fileID[] = new String[1];
		for(int i = 0; i < count; i++){
			Map map= (Map) list.get(i);
			fileID[0] = (String)map.get("id");
			String fjlx = (String)map.get("FJLX");
			zcczWfBS.copyAttach2(fileID, historyCldId, fjlx);
			
		}
//		if(count != 0){	
//			zcczWfBS.copyAttach(fileID, historyCldId, "1");
//		}
		//将合规审查非最终附件拷贝到历史合规审查办理单中，删除当前处理单对应的合规审查附件，即更新附件bdid
//		zcczWfBS.updateOtherFileToHistory(cldId, historyCldId);		
		//======================合规审查最终附件和非最终附件处理=============================
		System.out.println("_____________________ZCNGTJEventListner Finished_________");
	}
	
}
