package com.tansun.eam2.jiekou.erp.action;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * EAM定时取ERP反馈信息定时器
 * 
 * @author lantb 根据一期相关代码复制更改
 */
public class ReceiveERPFile extends CommonAction { 
	Logger log = Logger.getLogger(ReceiveERPFile.class); 
	@Autowired
	private PublicDao dao;
	@Autowired
	private PTTodoBS ptBs;  
	@Autowired
	private WorkflowBS workflowBS;
	@Autowired
	private IERPCommonUCC erpCommonUCC;			//erp相关
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	
	public PublicDao getDao() {
		return dao;
	}

	public void setDao(PublicDao dao) {
		this.dao = dao;
	}

	public void diaodu() {
		try {
			System.out.println("---------------------diaodu begin");
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String erpNotice = "财务会计部审核通过。@#_会计处@#_"
					+ format.format(new Date()).toString();
			 DaoCardaddSpd.diaodu(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl);
			 DaoCardaddSpd.getcardcode(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl);//获取新增卡片编号
			 DaoCardaddSpd.taizang(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl,erpNotice);
			 DaoCardReduceSpd.reducespdStatus(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl,erpNotice);//卡片减少
			 DaoCardChange.checkChange(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl,erpNotice); //卡片变动
			 DaoCardCf.QuerySpState(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl, erpNotice); //卡片拆分
			 DaoCardHb.QueryHbState(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl,erpNotice);//卡片合并
			 DaoSxSpd.QueryJs(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl);
			 Dobxje.bxje(dao,ptBs,workflowBS,erpCommonUCC,cardQueryUCCImpl);
			 System.out.println("---------------------diaodu end");
		}catch (Exception e){
			log.info(e.getMessage());
		}
	}
}
