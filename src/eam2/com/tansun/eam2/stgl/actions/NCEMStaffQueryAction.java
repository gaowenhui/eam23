package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.stgl.ucc.ICEMEntityQueryUcc;
import com.tansun.eam2.stgl.ucc.impl.CEMEntityQueryUccImpl;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.stgl.vo.StaffQueryVO;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.FuncQueryUCCImpl;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 人员信息查询
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class NCEMStaffQueryAction extends CommonAction implements IExport{
	
	    
    /**
     * 人员信息查询的入口，根据返回结果进入人员信息查询的界面
     * @return
     */
	
	private StaffQueryVO  staffQueryVO;
	private QueryResultVO queryResultVO;
	public Paginator paginator;
	public List<QueryResultVO> resultList=new ArrayList<QueryResultVO>();
	@Autowired
	ICEMEntityQueryUcc cEMEntityQueryUccImpl;
	@Autowired 
	ICodeService codeServiceImpl;	
	/**
	 * 通过查询结果返回的字段，进入人员信息查询的页面
	 * @return
	 */
    public String listStaff(){
        
        return "start";
    }
  
    /**
     * 人员信息查询
     * @return
     * @throws IOException 
     */
    public String viewStaff() throws IOException{ 
    	if(paginator == null){
    		paginator = new Paginator();
    	}
    	resultList=cEMEntityQueryUccImpl.queryStaff(staffQueryVO,paginator);
    	List<QueryResultVO> listNew = new ArrayList<QueryResultVO>();
		String bodyJSON = BodyListToJSON.getJSON(listNew, 1, 1, listNew.size());
    	if(resultList==null){
    		response.getWriter().print(bodyJSON);
    		return null;
    	}
    	QueryResultVO object1 = null;
		for(QueryResultVO object:resultList){
			object1 = object.clone(object);
			String fcRylb = object.getFcRylb();
			if(fcRylb!=null&&""!=fcRylb){
				fcRylb = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("NOT_CONSULT_ENTITY_PERSON_TYPE",fcRylb );
			}
			object1.setFcRylb(fcRylb);
			if("0".equals(object.getFazzt())){
				object1.setFazzt("未安置");
			}else if("1".equals(object.getFazzt())){
				object1.setFazzt("安置审批中");
			}else if("2".equals(object.getFazzt())){
				object1.setFazzt("安置执行中");
			}else if("3".equals(object.getFazzt())){
				object1.setFazzt("已安置");
			}
			listNew.add(object1);		
		}
		bodyJSON = BodyListToJSON.getJSON(resultList, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//		bodyJSON = BodyListToJSON.getJSON(listNew, 1, 1, listNew.size());
		response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
    }

	public StaffQueryVO getStaffQueryVO() {
		return staffQueryVO;
	}





	public void setStaffQueryVO(StaffQueryVO staffQueryVO) {
		this.staffQueryVO = staffQueryVO;
	}





	public QueryResultVO getQueryResultVO() {
		return queryResultVO;
	}





	public void setQueryResultVO(QueryResultVO queryResultVO) {
		this.queryResultVO = queryResultVO;
	}





	public ICEMEntityQueryUcc getCEMEntityQueryUccImpl() {
		return cEMEntityQueryUccImpl;
	}





	public void setCEMEntityQueryUccImpl(ICEMEntityQueryUcc entityQueryUccImpl) {
		cEMEntityQueryUccImpl = entityQueryUccImpl;
	}





	public Paginator getPaginator() {
		return paginator;
	}





	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}





	public List<QueryResultVO> getResultList() {
		return resultList;
	}





	public void setResultList(List<QueryResultVO> resultList) {
		this.resultList = resultList;
	}

	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if(cEMEntityQueryUccImpl==null){
			cEMEntityQueryUccImpl=(ICEMEntityQueryUcc)SpringContextHelper.getBean(CEMEntityQueryUccImpl.class);
		}
		List<QueryResultVO> list=new ArrayList<QueryResultVO>();
		list = cEMEntityQueryUccImpl.queryStaff(staffQueryVO, paginator);
//		List<QueryResultVO> listNew = new ArrayList<QueryResultVO>();
//		QueryResultVO object1 = null;
//		for(QueryResultVO object:list){
//			object1 =(QueryResultVO) object.clone(object);
//			String fcRylb = object1.getFcRylb();
//			if(fcRylb!=null&&""!=fcRylb){
//				fcRylb = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("NOT_CONSULT_ENTITY_PERSON_TYPE",fcRylb );
//			}
//			object1.setFcRylb(fcRylb);
//			if("0".equals(object1.getFazzt())){
//				object1.setFazzt("未安置");
//			}else if("1".equals(object1.getFazzt())){
//				object1.setFazzt("安置审批中");
//			}else if("2".equals(object1.getFazzt())){
//				object1.setFazzt("安置执行中");
//			}else if("3".equals(object1.getFazzt())){
//				object1.setFazzt("已安置");
//			}
//			listNew.add((QueryResultVO) object1);		
//		}		
		String bodyJSON = BodyListToJSON.getJSON(list, 1, 1, list.size());
		return bodyJSON;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.staffQueryVO = (StaffQueryVO)excelVO;
		
	}

}
