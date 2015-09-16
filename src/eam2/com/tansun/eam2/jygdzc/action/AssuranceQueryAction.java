package com.tansun.eam2.jygdzc.action;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssuranceQueryUCC;
import com.tansun.eam2.jygdzc.ucc.impl.AssuranceQueryUCCImpl;
import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;


public class AssuranceQueryAction extends CommonAction implements IExport{
	
	private Paginator paginator;
    private AssuranceQueryVO assQueryVO;
    public String headId = null;
    @Autowired
	PTEndBS  PTEndBSImpl ;
    @Autowired
    IAssuranceQueryUCC assuranceQueryUCCImpl;
	/**
	 * 导出excel
	 */
	public String exportexcel() throws Exception {
		if (assQueryVO == null) {
			assQueryVO = new AssuranceQueryVO();
		}
		if(assuranceQueryUCCImpl==null){
			assuranceQueryUCCImpl=(IAssuranceQueryUCC)SpringContextHelper.getBean(AssuranceQueryUCCImpl.class);
		}
		String bodyJSON ="";
		bodyJSON = assuranceQueryUCCImpl.queryAssurance(assQueryVO,
				paginator);
 		return bodyJSON;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.assQueryVO = (AssuranceQueryVO)excelVO;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	
}
