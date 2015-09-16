package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.stgl.ucc.ICEMEntityQueryUcc;
import com.tansun.eam2.stgl.ucc.impl.CEMEntityQueryUccImpl;
import com.tansun.eam2.stgl.vo.DebtQueryVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 债权债务信息查询
 * @author <a href="mailto:gengxiaoli@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class NCEMClaimsDebtQueryAction extends CommonAction implements IExport{
    
    /**
     * 债权债务信息查询
     * @return
     */
	private DebtQueryVO debtQueryVO;
	private DebtInfo debtInfo;
	private List<DebtInfo> resultList=new ArrayList<DebtInfo>();
	private Paginator paginator ;
	
	@Autowired
	ICEMEntityQueryUcc cEMEntityQueryUccImpl;

	public String listClaimsDebt(){
    
		return "start";
    }

    public String query(){
    	if(paginator == null){
    		paginator = new Paginator();
    	}
    	resultList = cEMEntityQueryUccImpl.queryDebt(debtQueryVO,paginator);
    	String bodyJSON = BodyListToJSON.getJSON(resultList,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
       System.out.println("jjjj"+bodyJSON);
    	//   	String bodyJSON = BodyListToJSON.getJSON(resultList, 1, 1, resultList.size());
    	Double zqje = 0D;
    	for(DebtInfo entity:resultList){
    		zqje += entity.getZqje() == null?0:entity.getZqje();
    	}
    	bodyJSON = bodyJSON.substring(0, bodyJSON.length()-1);
		String ss = ",\"userdata\":{" +
		"\"zqje\":\"" + zqje + 
		"\",\"zwrmc\":\"合计:\"}";
		bodyJSON = bodyJSON+ss;
     	bodyJSON += "}";
    	response.setCharacterEncoding("UTF-8");
    	try {
    		
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return null;
    }
	
    public DebtQueryVO getDebtQueryVO() {
		return debtQueryVO;
	}

	public void setDebtQueryVO(DebtQueryVO debtQueryVO) {
		this.debtQueryVO = debtQueryVO;
	}

	public DebtInfo getDebtInfo() {
		return debtInfo;
	}

	public void setDebtInfo(DebtInfo debtInfo) {
		this.debtInfo = debtInfo;
	}

	public List<DebtInfo> getResultList() {
		return resultList;
	}

	public void setResultList(List<DebtInfo> resultList) {
		this.resultList = resultList;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String exportexcel() throws Exception {
		if(paginator == null){
    		paginator = new Paginator();
    	}
		paginator.setPageSize(100000);
		if(cEMEntityQueryUccImpl==null){
			cEMEntityQueryUccImpl=(ICEMEntityQueryUcc)SpringContextHelper.getBean(CEMEntityQueryUccImpl.class);
		}
    	resultList = cEMEntityQueryUccImpl.queryDebt(debtQueryVO,paginator);
    	String bodyJSON = BodyListToJSON.getJSON(resultList,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
     
		return bodyJSON;
	}

	public void setExcelVO(CommonBO excelVO) {
		// TODO Auto-generated method stub
		this.debtQueryVO = (DebtQueryVO)excelVO;
	}
}

