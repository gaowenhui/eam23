package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IIntentionUCC;
import com.tansun.eam2.jygdzc.ucc.impl.IntentionUCCImpl;
import com.tansun.eam2.jygdzc.vo.JyzlLedgerVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;

/**
 * 清单查询
 * @author lihuan
 *
 */

public class IntentionLedgerAction extends CommonAction implements IExport{
	
	private Paginator paginator = new Paginator() ;
	private JyzlLedgerVO jyzlLedgerVO;
	public String sheettype;
	@Autowired
	PTEndBS  PTEndBSImpl ;
    @Autowired
    IIntentionUCC intentionUCCImpl;
	/**
     * 查询信息初识化
     * @return
     */
    public String init(){
    	return sheettype;
     }
    public String  query(){
    	if (jyzlLedgerVO == null) {
    		jyzlLedgerVO = new JyzlLedgerVO();
		}

		List<JyzlLedgerVO> list = new ArrayList();
		list = intentionUCCImpl.getJyzlLedgerVOByCondition(jyzlLedgerVO,paginator);
		String bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
        response.setCharacterEncoding("UTF-8");
 		try {
 			response.getWriter().print(bodyJSON);
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
 		return null;
    }
	/**
	 * 导出excel
	 */
	public String exportexcel() throws Exception {
		if (jyzlLedgerVO == null) {
			jyzlLedgerVO = new JyzlLedgerVO();
		}else{
			if("Thu Jan 01 00:00:00 CST 1970".equals(jyzlLedgerVO.getBegintime1().toString())){
				jyzlLedgerVO.setBegintime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(jyzlLedgerVO.getBegintime2().toString())){
				jyzlLedgerVO.setBegintime2(null);
			}
			if("Thu Jan 01 00:00:00 CST 1970".equals(jyzlLedgerVO.getEndtime1().toString())){
				jyzlLedgerVO.setEndtime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(jyzlLedgerVO.getEndtime2().toString())){
				jyzlLedgerVO.setEndtime2(null);
			}
		}
		if(intentionUCCImpl==null){
			intentionUCCImpl=(IIntentionUCC)SpringContextHelper.getBean(IntentionUCCImpl.class);
		}
		List<JyzlLedgerVO> list = intentionUCCImpl.getJyzlLedgerVOByCondition(jyzlLedgerVO,paginator);
		String bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
 		return bodyJSON;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.jyzlLedgerVO = (JyzlLedgerVO)excelVO;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator=paginator;
	}
	public JyzlLedgerVO getJyzlLedgerVO() {
		return jyzlLedgerVO;
	}
	public void setJyzlLedgerVO(JyzlLedgerVO jyzlLedgerVO) {
		this.jyzlLedgerVO = jyzlLedgerVO;
	}
	public String getSheettype() {
		return sheettype;
	}
	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}
	public PTEndBS getPTEndBSImpl() {
		return PTEndBSImpl;
	}
	public void setPTEndBSImpl(PTEndBS endBSImpl) {
		PTEndBSImpl = endBSImpl;
	}
	public IIntentionUCC getIntentionUCCImpl() {
		return intentionUCCImpl;
	}
	public void setIntentionUCCImpl(IIntentionUCC intentionUCCImpl) {
		this.intentionUCCImpl = intentionUCCImpl;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	
}
