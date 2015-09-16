package com.tansun.eam2.jygdzc.listener;


import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jbpm.api.listener.EventListener;
import org.jbpm.api.listener.EventListenerExecution;
import org.springframework.context.ApplicationContext;

import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.util.JbpmServlet;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.jygdzc.ucc.impl.AssetUCCImpl;
import com.tansun.eam2.jygdzc.ucc.impl.ContractUCCImpl;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.WgHtViewVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;

/**
 * 处理单重作废环节编号回收的监听器
 * @author 
 *
 */
public class ReleaseZzjzNumEventListener implements EventListener{
	
	

	protected Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 */
	private static final long serialVersionUID = -7184704191418901683L;

	private ICodeGenerator codeUCC;
	private AssetUCCImpl assetUCCImpl;
	private ContractUCCImpl contractUCCImpl;
	public static ApplicationContext ctx = JbpmServlet.ctx;
	
	public ReleaseZzjzNumEventListener() {
		this.assetUCCImpl = (AssetUCCImpl) ctx.getBean("assetUCCImpl");
		//this.codeUCC = (ICodeGenerator)ctx.getBean("ICodeGenerator");
		this.contractUCCImpl = (ContractUCCImpl)ctx.getBean("contractUCCImpl");
		if (logger.isDebugEnabled()) {
			logger.debug("ReleaseZzjzNumEventListener Started_________");
		}
	}

	/**
	 * 从arg0得到cldId. 然后调用业务提供的功能执行监听方法
	 */
	public void notify(EventListenerExecution arg0) throws Exception {
		codeUCC = (ICodeGenerator) SpringContextHelper
				.getBean(ICodeGenerator.class);
		String codeType = (String) arg0.getVariable("codeType");
		String generatedCode = (String) arg0.getVariable("generatedCode");
		String deptid = (String) arg0.getVariable("deptid");
		List<AssetBodyVO> zcbodyList = (List<AssetBodyVO>)arg0.getVariable("zcbodyList");
		List<WgHtViewVO>  htbodyList = (List<WgHtViewVO>)arg0.getVariable("htbodyList");
		if (generatedCode != null && generatedCode.length() > 0) {
			codeUCC.disableCurrentCode(codeType, generatedCode, deptid);
			//资产编号的删除
			JyzcHead head=assetUCCImpl.getJyzcHeadByHeadId(generatedCode);
			if(head != null && head.getSheettype() != null && "add".equals(head.getSheettype())){
				if(zcbodyList.size()>0){
					for(AssetBodyVO vo : zcbodyList){
						List<JyzcRiskLsb>	list = assetUCCImpl.getJyzcRiskLsbByZcId(vo.getId(), new Paginator());
						if(list!=null&&list.size()>0){
							for(int i=0;i<list.size();i++){
								JyzcRiskLsb jyzcRiskLsb = list.get(i);
								if(jyzcRiskLsb.getFxbh()!=null){
									codeUCC.disableCurrentCode("fxbh", jyzcRiskLsb.getFxbh(), "");
								}
							}
						}
						String[] code = vo.getZcbh().split("-");
						if(code != null){
							code[1] = "#1#";
							codeUCC.disableCurrentCode("zcbh", code[0]+"-"+code[1]+"-"+code[2], "");
							System.out.println("pass here");
						}
						
					}
				}
			}
		}
		if (generatedCode != null && generatedCode.length() > 0) {
			JjzcHtqsHead  HtqsHead = contractUCCImpl.getJjzcHtqsHeadById(generatedCode);
			if(HtqsHead!=null && HtqsHead.getYwlx()!=null && "0".equals(HtqsHead.getYwlx())){
				//合同编号的删除
				if(htbodyList.size()>0){
					for(WgHtViewVO vo : htbodyList){
						String[] code = vo.getHtbh().split("-");
						if(code != null){
						   if(code.equals("zlht"))
							   codeUCC.disableCurrentCode("zlht", code[0]+"-"+code[1]+"-"+code[2], "");
						   }else if(code.equals("wght")){
							   codeUCC.disableCurrentCode("wght", code[0]+"-"+code[1]+"-"+code[2], "");
						   }else if(code.equals("cxht")){
							   codeUCC.disableCurrentCode("cxht", code[0]+"-"+code[1]+"-"+code[2], "");
						   }else if(code.equals("fcxht")){
							   codeUCC.disableCurrentCode("fcxht", code[0]+"-"+code[1]+"-"+code[2], "");
						   }
					}
				}
			}
		}
		
		if (logger.isDebugEnabled()) {
			logger.debug("ReleaseZzjzNumEventListener Started_________");
		}
	}

}

	
	


