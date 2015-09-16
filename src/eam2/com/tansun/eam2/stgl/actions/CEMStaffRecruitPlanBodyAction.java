package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.ucc.ICEMEntityFormUcc;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 用工计划
 * @author <a href="mailto:gengxiaoli@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class CEMStaffRecruitPlanBodyAction extends CommonAction{
    
    /**
     * 用工计划
     * @return
     */
	private String headId;
	private StHead head; 	
	private StGlbt stGlbt;  
	private String delBtIds;
	private StFsxx StFsxx;
	private String zcbh;
	private String stId;
	private String checkIds;
	
	@Autowired 
	ICodeService codeServiceImpl;	
	@Autowired
	ICEMEntityFormUcc cEMEntityFormUccImpl;  
	@Autowired
	ICEMEntityService cEMEntityService;
    public String listEntities(){
        
        return null;
    }

	public String linkEntitiesRel(){
		return null;
	}
	public String viewEntity(){
		return null;
	}
	
	/**
	 * 查询当前人员列表
	 * @return
	 * @throws IOException
	 */
	public String listCurrStaff() throws IOException{
		stId=request.getParameter("stId");
		List<StFsxx> list=new ArrayList<StFsxx> () ;
		List<StFsxx> listNew = new ArrayList<StFsxx>();
		list=cEMEntityService.viewEntityFsxx(stId, StglCommon.ST_INFO_RENYUAN);	
		
		for(StFsxx object:list){
			String fcRylx = object.getFcRylx();
			String fxingbie = object.getFxingbie();
			if("1".equals(fxingbie)){
				object.setFxingbie("男");
			}else if("2".equals(fxingbie)){
				object.setFxingbie("女");
			};
			if(fcRylx!=null&&""!=fcRylx){
				fcRylx = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("CONSULT_ENTITY_PERSON_TYPE",fcRylx );
			}
			object.setFcRylx(fcRylx);
			listNew.add(object);		
			
		}
		String bodyJSON = BodyListToJSON.getJSON(list, 1, 1, listNew.size());
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(bodyJSON);	
		return null;
	}
	/**
	 * 查看用工岗位列表
	 * @return
	 * @throws IOException
	 */
	public String listRecruitStaff (){
		return null;
	}
	
	/**
	 * 进入新增用工岗位页面
	 * @return
	 */
	public String newRecruitStaff (){
		return "newRecruitStaff";
	}
	
	/**
	 * 保存用工岗位
	 * @return
	 */
	public String saveRecruitStaff (){
		if(stGlbt == null){
			stGlbt = new StGlbt();
		}
		headId = request.getParameter("headId");
		stId = request.getParameter("stId");
		stGlbt.setStId(stId);
		stGlbt.setCldId(headId);
		cEMEntityFormUccImpl.newEntityForm(stGlbt);	
		response.setCharacterEncoding("UTF-8");
		request.setAttribute("message", "操作成功！");
		return "newRecruitStaff";
	}
 	//查看某条用工岗位详细信息
 	public String checkChangeRep(){
		if(checkIds != null){
			if(checkIds.startsWith(",")){
				checkIds = checkIds.substring(1);
			}
			String[] btIds = checkIds.split(",");
			String btId = btIds[0];
			stGlbt = cEMEntityFormUccImpl.findBody(btId);
			//request.setAttribute("stGlbt", stGlbt);
		}else{
			return null;
		}
 		return "newRecruitStaff";
 	}	
	
	
	/**
	 * 查询用工岗位
	 * @return
	 */
	public String viewRecruitStaff () throws IOException{
		List<StGlbt> list = new ArrayList<StGlbt>();
		list=cEMEntityFormUccImpl.viewEntityBody(headId);
		List<StGlbt> listNew = new ArrayList<StGlbt>();
		StGlbt object1 = null;
		for(StGlbt object:list){
			object1 = object.clone(object);
			String Cxueli = object1.getCXueli();
			if(Cxueli!=null&&""!=Cxueli){
				Cxueli = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EDUCATION_BACKGROUND",Cxueli );
			}
			object1.setCXueli(Cxueli);
			listNew.add(object1);		
			
		}
		String bodyJSON = BodyListToJSON.getJSON(listNew, 1, 1, listNew.size());
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);	
		return null;
	}
	
	/**
	 * 删除用工岗位
	 * @return
	 */
	public String deleteRecruitStaff (){
		if(delBtIds != null){
			if(delBtIds.startsWith(",")){
				delBtIds = delBtIds.substring(1);
			}
			String[] btIds = delBtIds.split(",");
			cEMEntityFormUccImpl.deleteStGlbt(btIds);
		}
		try {
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public String getHeadId() {
		return headId;
		}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public StHead getHead() {
		return head;
	}

	public void setHead(StHead head) {
		this.head = head;
	}

	public StGlbt getStGlbt() {
		return stGlbt;
	}

	public void setStGlbt(StGlbt stGlbt) {
		this.stGlbt = stGlbt;
	}

	public String getDelBtIds() {
		return delBtIds;
	}

	public void setDelBtIds(String delBtIds) {
		this.delBtIds = delBtIds;
	}

	public StFsxx getStFsxx() {
		return StFsxx;
	}

	public void setStFsxx(StFsxx stFsxx) {
		StFsxx = stFsxx;
	}

	public String getZcbh() {
		return zcbh;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public ICEMEntityFormUcc getCEMEntityFormUccImpl() {
		return cEMEntityFormUccImpl;
	}

	public void setCEMEntityFormUccImpl(ICEMEntityFormUcc entityFormUccImpl) {
		cEMEntityFormUccImpl = entityFormUccImpl;
	}

	public ICEMEntityService getCEMEntityService() {
		return cEMEntityService;
	}

	public void setCEMEntityService(ICEMEntityService entityService) {
		cEMEntityService = entityService;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

	public String getCheckIds() {
		return checkIds;
	}

	public void setCheckIds(String checkIds) {
		this.checkIds = checkIds;
	}


}
