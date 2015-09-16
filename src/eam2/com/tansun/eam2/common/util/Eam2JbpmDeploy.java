package com.tansun.eam2.common.util;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.NewDeployment;
import org.jbpm.api.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;

@Service
public class Eam2JbpmDeploy{
	private static final Log logger = LogFactory.getLog(Eam2JbpmDeploy.class);
	
	@Autowired
	public WorkflowUtil workflowutil;
	
	public static String deploymentId;
	
	public void deploy() {
		if (logger.isDebugEnabled()) {
			logger.debug("Invoking deploy() method on JbpmDeploy class");
		}
		
		RepositoryService repositoryService = workflowutil.processEngine.getRepositoryService();
		NewDeployment deployment = repositoryService.createDeployment();
		deployment
//			.addResourceFromClasspath("counter_sign.jpdl.xml")
//			.addResourceFromClasspath("zyzc_purchase.jpdl.xml")
//			.addResourceFromClasspath("zyzc_tostock.jpdl.xml")
//			.addResourceFromClasspath("zyzc_borrow.jpdl.xml")
//			.addResourceFromClasspath("zyzc_reborrow.jpdl.xml")
//			.addResourceFromClasspath("zyzc_consuming.jpdl.xml")
//			.addResourceFromClasspath("zyzc_discard.jpdl.xml")
//			.addResourceFromClasspath("zyzc_change.jpdl.xml")
//			.addResourceFromClasspath("zyzc_renewal.jpdl.xml")
//			.addResourceFromClasspath("zyzc_deploy.jpdl.xml")
//			.addResourceFromClasspath("zyzc_tocheckobject.jpdl.xml")
//			.addResourceFromClasspath("zyzc_tocheckstock.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpzj.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpjs.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpbd.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpcf.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kphb.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpjz.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kptp.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpxg.jpdl.xml")
//			.addResourceFromClasspath("kpgl_kpzj.jpdl.xml")
//			.addResourceFromClasspath("jyzc_add.jpdl.xml")
//			.addResourceFromClasspath("jyzc_change.jpdl.xml")
//			.addResourceFromClasspath("jyzc_check.jpdl.xml")
//			.addResourceFromClasspath("jyzc_check_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_manager.jpdl.xml")
//			.addResourceFromClasspath("jyzc_manager_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_scrapt.jpdl.xml")
//			.addResourceFromClasspath("jyzc_scrapt_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_contract.jpdl.xml")
//			.addResourceFromClasspath("jyzc_contract_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_tenancy.jpdl.xml")
//			.addResourceFromClasspath("jyzc_tenancy_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_liquidate.jpdl.xml")
//			.addResourceFromClasspath("jyzc_liquidate_agent.jpdl.xml")
//			.addResourceFromClasspath("jyzc_assurance.jpdl.xml")
//			.addResourceFromClasspath("stgl_zengjianzi.jpdl.xml")
//			.addResourceFromClasspath("stgl_yonggongjihua.jpdl.xml")
//			.addResourceFromClasspath("stgl_farendaibiao.jpdl.xml")
//			.addResourceFromClasspath("stgl_caiwu.jpdl.xml")
//			.addResourceFromClasspath("stgl_quequan.jpdl.xml")
//			.addResourceFromClasspath("stgl_qita.jpdl.xml")
//			.addResourceFromClasspath("stgl_gaizhi.jpdl.xml")
//			.addResourceFromClasspath("wtdk_funcBack.jpdl.xml")
//			.addResourceFromClasspath("wtdk_endInfo.jpdl.xml")
//			.addResourceFromClasspath("hkgl_huikuandan.jpdl.xml")
//			.addResourceFromClasspath("approve_newhead.jpdl.xml")
//			.addResourceFromClasspath("zccz_persondeal.jpdl.xml")
//			.addResourceFromClasspath("zccz_assetdeal.jpdl.xml")
//			.addResourceFromClasspath("zccz_assetdisposal.jpdl.xml")
//			.addResourceFromClasspath("zccz_assetdisposalsubproc.jpdl.xml")
//			.addResourceFromClasspath("stgl_qita.jpdl.xml")
			.deploy();
	}
	
	public void clear(){
		if (logger.isDebugEnabled()) {
			logger.debug("Invoking clear() method on JbpmDeploy class");
		}

//		RepositoryService repositoryService = processEngine.getRepositoryService();
//		List<Deployment> dpList = repositoryService.createDeploymentQuery().list();
//		for (int i = 0; i < dpList.size(); i++) {
//			Deployment dp = (Deployment) dpList.get(i);
//			repositoryService.deleteDeploymentCascade(dp.getId());
//		}
	}
}