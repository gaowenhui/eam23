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
 * @Description: 法人代表变更
 * @author <a href="gengxiaolig@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class CEMLegalRepChangeBodyAction2 extends CommonAction{
	
    /**
     * 法人代表变更
     * @return
     */
		
	private String headId;
	private StHead head; 	
	private StGlbt stGlbt;  
	private String delBtIds;
	private String checkIds;
	private StFsxx StFsxx;
	private String stId;
    private String bodyId;
	@Autowired
	ICEMEntityFormUcc cEMEntityFormUccImpl;  
	@Autowired
	ICEMEntityService cEMEntityService;
	@Autowired 
	ICodeService codeServiceImpl;	
	
	/**
	 * 查询当前法人列表
	 * @return
	 * @throws IOException 
	 */
	public String listCurrReps(){
		List<StFsxx> list;
		stId = request.getParameter("stId");
		list=cEMEntityService.viewEntityFsxx(stId, StglCommon.ST_INFO_RENYUAN);	
		List<StFsxx> resultList = new ArrayList<StFsxx>();
		StFsxx object1 = null;
		for(StFsxx object:list){
			try{
			if("1".equals(String.valueOf((object.getFsffr()))))
			{
				object1 = object.clone(object);
				String fcRylx = object1.getFcRylx();
				String fxingbie = object1.getFxingbie();
				if("1".equals(fxingbie)){
					object1.setFxingbie("男");
				}else if("2".equals(fxingbie)){
					object1.setFxingbie("女");
				};
				if(fcRylx!=null&&""!=fcRylx){
					fcRylx = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("CONSULT_ENTITY_PERSON_TYPE",fcRylx );
				}
				object1.setFcRylx(fcRylx);
				
				resultList.add(object1);
			}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		String bodyJSON = BodyListToJSON.getJSON(resultList, 1, 1, resultList.size());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return null;
	}
	
	/**
	 * 新增变更法人
	 * @return
	 */
	public String newChangeRep(){
		String stId = request.getParameter("stId");
		String headId = request.getParameter("headId");
		stGlbt = new StGlbt();
		stGlbt.setStId(stId);
		stGlbt.setCldId(headId);
		cEMEntityFormUccImpl.newEntityForm(stGlbt);	
		bodyId = stGlbt.getId();
		request.setAttribute("bodyId", bodyId);
		return "toModify";
	}
	
	public String modifyChangeRep(){
		bodyId = (String) request.getAttribute("bodyId");
		stGlbt = cEMEntityFormUccImpl.findBody(bodyId);
		return "newChangeRep";
	}
	
	/**
	 * 保存变更法人
	 * @return
	 */
	public String saveChangeRep (){
		if(stGlbt == null){
			stGlbt = new StGlbt();
		}
    	String[] zsbh = request.getParameterValues("zsbh");
    	String[] zsmc = request.getParameterValues("zsmc");
    	String[] fzsj = request.getParameterValues("fzsj");
    	String[] fzjg = request.getParameterValues("fzjg");
    	stGlbt.setFzyzgqk(stGlbt.setFzyzgqkString(zsmc, fzsj, fzjg, zsbh));
		stGlbt.setSffrdb(1l);	
		cEMEntityFormUccImpl.newEntityForm(stGlbt);	
		return null;
	}
	
	/**
	 * 查询变更法人列表
	 * @return
	 * @throws IOException 
	 */
	public String viewChangeRep () throws IOException{
		//headId=request.getParameter("headId");
		List<StGlbt> listStGlbt=cEMEntityFormUccImpl.viewEntityBody(headId);
		List<StGlbt> listNew = new ArrayList<StGlbt>();
		StGlbt object1 = null;
		for(StGlbt object:listStGlbt){
			object1 = object.clone(object);
			String fxingbie = object1.getCXingbie();
			String Cxueli = object1.getCXueli();
			if(Cxueli!=null&&""!=Cxueli){
				Cxueli = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("EDUCATION_BACKGROUND",Cxueli );
			}
			if("1".equals(object1.getCXingbie())){
				object1.setCXingbie("男");
			}else if("2".equals(object1.getCXingbie())){
				object1.setCXingbie("女");
			};
			object1.setCXueli(Cxueli);
			listNew.add(object1);		
		}
		String bodyJSON = BodyListToJSON.getJSON(listNew, 1, 1, listNew.size());
		System.out.println(bodyJSON);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(bodyJSON);
		return null;	
	}
	
	
	/**
	 * 删除变更法人
	 * @return
	 */
 	public String deleteChangeRep (){
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
 	
 	//查看某条变更法人信息
 	public String checkChangeRep(){
		if(checkIds != null){
			if(checkIds.startsWith(",")){
				checkIds = checkIds.substring(1);
			}
			String[] btIds = checkIds.split(",");
			String btId = btIds[0];
			stGlbt = cEMEntityFormUccImpl.findBody(btId);
			String zyzgqk = stGlbt.getFzyzgqkString(stGlbt.getFzyzgqk());
			request.setAttribute("zyzgqk", zyzgqk);
		}else{
			return null;
		}
 		return "newChangeRep";
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

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}



	public StFsxx getStFsxx() {
		return StFsxx;
	}

	public void setStFsxx(StFsxx stFsxx) {
		StFsxx = stFsxx;
	}

	public ICEMEntityFormUcc getCEMEntityFormUccImpl() {
		return cEMEntityFormUccImpl;
	}

	public void setCEMEntityFormUccImpl(ICEMEntityFormUcc entityFormUccImpl) {
		cEMEntityFormUccImpl = entityFormUccImpl;
	}

	public StHead getHead() {
		return head;
	}

	public void setHead(StHead head) {
		this.head = head;
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

	public String getBodyId() {
		return bodyId;
	}

	public void setBodyId(String bodyId) {
		this.bodyId = bodyId;
	}



}
