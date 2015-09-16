package com.tansun.eam2.zccz.listener;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.zccz.service.CzStcztzWfBS;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * 实体整体处置合规审查退回到项目受理监听器
 * @author 赵贤义 
 */
public class STHGSCBACKEventListener implements EventListener{
	
	protected Log logger = LogFactory.getLog(this.getClass());
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 209786857091156091L;

	private ZcczWfBS zcczWfBS;
	private CzStcztzWfBS wfBS;
	private ICommonOpinionUcc opinionUcc;
	
	public static ApplicationContext ctx;

	public STHGSCBACKEventListener(){
		if(logger.isDebugEnabled()){
			logger.debug("_____________________STHGSCBACKEventListener Started_________");
		}
		ctx = JbpmServlet.ctx;
		wfBS = ctx.getBean(CzStcztzWfBS.class);
		zcczWfBS = ctx.getBean(ZcczWfBS.class);
		opinionUcc = ctx.getBean(ICommonOpinionUcc.class);
	}
	
	/**
	 * 从arg0得到cldId.
	 * 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		String cldId = (String)arg0.getVariable("headId");
		String historyCldId = wfBS.returnCzStcztzBackToXmsl(cldId);
		//======================处理单中意见域处理start=============================
		//备份处理单中意见
		opinionUcc.cloneOpinionByBdId(cldId, historyCldId);
		//克隆退回意见、审查意见到合规审查意见
		opinionUcc.cloneOpinionByBdId(cldId, cldId, new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_THYJ), new Integer(CommonGlobal.OPINION_YJYLX_CHECK));
		opinionUcc.cloneOpinionByBdId(cldId, cldId, new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY), new Integer(CommonGlobal.OPINION_YJYLX_CHECK));
		//======================处理单中意见域处理end=======================================
		
		//======================处置项目合规性审核信息表处理start=============================
		//转移合规性审查意见到历史办理单上
		wfBS.cloneHgxscToHistory(cldId, historyCldId);
		//清除本次的合规性审查
		wfBS.deleteHgscByCldId(cldId);
		//======================处置项目合规性审核信息表处理end=============================
		
		StringBuffer ids = new StringBuffer();
		//查询退回意见
		List<PTCommonOpinionBO> opList = opinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_THYJ));
		//办理单过程意见
		opList.addAll(opinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_GCYJ)));
		//办理单最终意见
		opList.addAll(opinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_BLYJ_ZZYJ)));
		//审查意见
		opList.addAll(opinionUcc.query4View(cldId,new Integer(CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY)));
		for(int i = 0; i< opList.size(); i++){
			ids.append(opList.get(i).getId());
			if(i < opList.size() - 1){
				ids.append(",");
			}
		}
		opinionUcc.deleteOpinionById(ids.toString());
		
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
		//将合规审查非最终附件拷贝到历史合规审查办理单中，删除当前处理单对应的合规审查附件，即更新附件bdid
		//zcczWfBS.updateOtherFileToHistory(cldId, historyCldId);		
		//======================合规审查最终附件和非最终附件处理=============================

		/**拷贝最终附件到处理单
		String strsel = (String)arg0.getVariable("strsel");
		if(StringUtils.isNotEmpty(strsel)){
			if (strsel.startsWith(",")) {
				strsel = strsel.substring(1, strsel.length());
			}
			String strId[] = strsel.split(",");
			zcczWfBS.copyAttach(strId, cldId, "heguishencha");
		}
		//跟新办理单附件到历史办理单上
		zcczWfBS.updateFileToHistory(cldId, historyCldId);
		
		if(logger.isDebugEnabled()){
			logger.debug("_____________________STHGSCBACKEventListener Started_________");
		}
		**/
	}
}
