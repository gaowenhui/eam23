package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.codeService.impl.CodeServiceImpl;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.ucc.ICEMEntityFormUcc;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stgl.ucc.impl.CEMEntityService;
import com.tansun.eam2.stgl.vo.EntityDisplayVO;
import com.tansun.eam2.stgl.vo.IncomeCostResultVO;
import com.tansun.eam2.stgl.vo.IncomeResultVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;
/**
 * 处理单关联实体
 * @author gengxiaoli
 *
 */

public class EMRelatedEntityDisplayAction extends CommonAction{
	private StGlbt stGlbt; 
	private String oldStid;
	private StJbxx stJbxx;
	private String stId;
	private EntityDisplayVO entityDisplayVO;
	@Autowired
	private CodeServiceImpl codeService;
	@Autowired
	ICEMEntityFormUcc cEMEntityFormUccImpl;
	@Autowired
	ICEMEntityService cEMEntityService;         
	@Autowired 
	ICodeService codeServiceImpl;	
	public String linkEntitiesRel(){
		String stId = (String) request.getParameter("stGlbt.stid");
		String oldStid = (String) request.getParameter("oldStid");
		if(stId != oldStid){
			stJbxx = cEMEntityService.viewEntityJbxx(stId);
			entityDisplayVO = new EntityDisplayVO();
			BeanUtils.copyProperties(stJbxx, entityDisplayVO);
			//设置地区
            // entityDisplayVO.setDiqu(codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", stJbxx.getCShengfen()));
			int perNum = cEMEntityService.selectFsxxCount(stId, StglCommon.ST_INFO_RENYUAN);
			//设置人数
			entityDisplayVO.setRenshu(perNum);
			//设置股权情况
			List<StFsxx> stFsxxs=cEMEntityService.viewEntityFsxx(stId, StglCommon.ST_INFO_GUQUAN);
			String strStFsxs = "";
			if(stFsxxs.size()>0){
				for(StFsxx stFsxx:stFsxxs){
					//股东名称
					String egdmc = stFsxx.getEgdmc()==null?"&nbsp;":stFsxx.getEgdmc();
					strStFsxs = strStFsxs+egdmc+"#%#";
					//股东性质
					String egdxz = stFsxx.getEgdxz()==null?"&nbsp;":stFsxx.getEgdxz();
					strStFsxs = strStFsxs+egdxz+"#%#";
					//持股比例
					String ecgbl;
					if(stFsxx.getEcgbl()==null){
						ecgbl = "&nbsp;";
					}else{
						ecgbl = stFsxx.getEcgbl().toString();
					}
//					String ecgbl = stFsxx.getEcgbl()==null?"&nbsp;":stFsxx.getEcgbl().toString();
					strStFsxs = strStFsxs+ecgbl+"#%#";
					//报告日期
					String ebgrq;
					if(stFsxx.getEbgrq() == null){
						ebgrq = "&nbsp;";
					}else{
						ebgrq =( new SimpleDateFormat("yyyy-MM-dd").format(stFsxx.getEbgrq())).toString();
					}
//					String ebgrq = stFsxx.getEbgrq().toString()==null?"&nbsp;":stFsxx.getEbgrq().toString();
//					if("&nbsp;".equals(ebgrq)){
//						ebgrq =( new SimpleDateFormat("yyyy-MM-dd").format(stFsxx.getEbgrq())).toString();
//					}
					strStFsxs = strStFsxs+ebgrq+"#%#";
					//持股数量
					String ecgsl;
					if(stFsxx.getEcgsl() == null){
						ecgsl = "&nbsp;";
					}else{
						ecgsl = stFsxx.getEcgsl().toString();
					}
					strStFsxs = strStFsxs+ecgsl+"#%#";
					//本部是否控股
					String ebbsfkg =stFsxx.getEbbsfkg();
					if("0".equals(ebbsfkg)){
						ebbsfkg =" 否";
					}else if("1".equals(ebbsfkg)){
						ebbsfkg = "是";
					}else if("2".equals(ebbsfkg)){
						ebbsfkg = "未知";
						
					}else{
						ebbsfkg = "&nbsp;";
					}
					strStFsxs = strStFsxs+ebbsfkg+"<#>";			
				}
				strStFsxs.substring(0,strStFsxs.length()-4);
			}
			entityDisplayVO.setGqgc(strStFsxs);
			List<Code> provienceList = codeService.findAllByCodeType("PROVIENCE");
			for(Code pn : provienceList){
				if(pn.getCodeKey().equals(entityDisplayVO.getCShengfen()))entityDisplayVO.setCShengfen(pn.getCodeValue());
			}
			//设置编码格式
			response.setCharacterEncoding("UTF-8");
			try {
				
				response.getWriter().write(generateLinkEntitiesRel(entityDisplayVO));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}	
	
	private String generateLinkEntitiesRel(EntityDisplayVO vo){
		StringBuffer sb = new StringBuffer();
		JsonConfig jsonConfig = new JsonConfig();
		
		//设置没有值，或者指定属性 不处理生成JSON串
		jsonConfig.setJsonPropertyFilter( new PropertyFilter(){   
			   public boolean apply( Object source, String name, Object value ){   
			      return name.equals("sysUpdateTime");   
			   }   
			});
		
		//特殊对象的数据进行转换，可以自行控制，如日期格式化。
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor(){

			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && value instanceof Date){
					str = new SimpleDateFormat("yyyy-MM-dd").format((Date)value);
				}
				return str;
			}
			
		});
		JSONObject jsonObject = JSONObject.fromObject(vo,jsonConfig); 
		sb.append("{\"LinkEntitiesRel\":[").append(jsonObject.toString()).append("]}");
		return sb.toString();
	}
	
	/**
	 * 进入查看实体股权信息的页面
	 * 
	 */
	public String startViewStock(){
		//String stId=request.getParameter("stId");
		return "viewStock";
	}
	
	/**
	 * 查询实体股权信息
	 * @return
	 */
	public String viewStock(){
		stId=request.getParameter("stId");
		List<StFsxx> stFsxxs=cEMEntityService.viewEntityFsxx(stId, StglCommon.ST_INFO_GUQUAN);
		String strStFsxs = "";
		if(stFsxxs.size()>0){
			for(StFsxx stFsxx:stFsxxs){
				strStFsxs = stFsxxs+stFsxx.getEgdmc()+"#%#";
				strStFsxs = stFsxxs+stFsxx.getEgdxz()+"#%#";
				strStFsxs = stFsxxs+stFsxx.getEcgbl().toString()+"#%#";
				strStFsxs = stFsxxs+stFsxx.getEbgrq().toString()+"#%#";
				strStFsxs = stFsxxs+stFsxx.getEcgsl().toString()+"#%#";
				strStFsxs = stFsxxs+stFsxx.getEbbsfkg().toString()+"@@@";			
			
		}
		strStFsxs.substring(0,strStFsxs.length()-4);	
		}
		String bodyJSON = BodyListToJSON.getJSON(stFsxxs, 1, 1, stFsxxs.size());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(bodyJSON);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		return null;
	}
	

	//展示树状部门
	public String toTree(){
		String type4jygdzc = request.getParameter("type4Jygdzc");
		//String nodeValue  = request.getParameter("nodeValue");
		//request.setAttribute("nodeValue", nodeValue);//卡片类型
		String isHUIQIAN = request.getParameter("isHUIQIAN");
		request.setAttribute("isHUIQIAN", isHUIQIAN);//是会签的多选
		request.setAttribute("type4Jygdzc", type4jygdzc);//弹出树的类型
		return "toTree";
	}
	
	
	/**
	 * 查询涉及到该实体的处理流程
	 * @return
	 */
	public String viewLcInfor(){
		String stId = request.getParameter("stid");
		String zixunType = request.getParameter("zixunType");
		List<StHead> headList = cEMEntityFormUccImpl.findHeadList(stId,zixunType);
		return null;
	}
	
	/**
	 * 查询某实体所涉及到的费用
	 * @return
	 */
	public String viewStCost(){
		String stId = request.getParameter("stid");
		String zixunType = request.getParameter("zixunType");
        List<IncomeCostResultVO> resultList = cEMEntityFormUccImpl.viewStIncomeCost(stId,zixunType);
        Double sqje = 0D;
        Double sdje = 0D;
        for(IncomeCostResultVO object:resultList){
        	sqje += object.getSqje() == null?0:object.getSqje();
        	sdje += object.getSdje() == null?0:object.getSdje();
        }
        String bodyJSON = BodyListToJSON.getJSON(resultList, 1, 1, resultList.size());
        bodyJSON = bodyJSON.substring(0, bodyJSON.length()-1);
		String ss = ",\"userdata\":{" +
		"\"sqje\":\"" + sqje + 
		"\",\"sdje\":\"" + sdje + 
		"\",\"stzwmc\":\"合计:\"}";
		bodyJSON = bodyJSON+ss;
		bodyJSON = bodyJSON+"}";
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 查询某实体所涉及到的收入（回款审批完成）
	 * @return
	 */
	public String viewStIncome(){
		String stId = request.getParameter("stid");
		List<IncomeResultVO> resultList= cEMEntityFormUccImpl.viewStIncome(stId);
        Double gq_hsxjje = 0D;
        for(int i=0;i<resultList.size();i++){
        	IncomeResultVO object = (IncomeResultVO)resultList.get(i);
        	gq_hsxjje += object.getGqHsxjje() == null?0:object.getGqHsxjje();
        }
        for(IncomeResultVO object:resultList){
        	if(object.getGqHsxjje() == null){
        		gq_hsxjje += 0;
        	}else{
        		gq_hsxjje += object.getGqHsxjje();
        	}
        }
        String bodyJSON = BodyListToJSON.getJSON(resultList, 1, 1, resultList.size());
        bodyJSON = bodyJSON.substring(0, bodyJSON.length()-1);
		String ss = ",\"userdata\":{" +
		"\"gq_hsxjje\":\"" + gq_hsxjje + 
		"\",\"stzwmc\":\"合计:\"}";
		bodyJSON = bodyJSON+ss;
		bodyJSON = bodyJSON+"}";
        response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public StGlbt getStGlbt() {
		return stGlbt;
	}
	public void setStGlbt(StGlbt stGlbt) {
		this.stGlbt = stGlbt;
	}
	public String getOldStid() {
		return oldStid;
	}
	public void setOldStid(String oldStid) {
		this.oldStid = oldStid;
	}
	public StJbxx getStJbxx() {
		return stJbxx;
	}
	public void setStJbxx(StJbxx stJbxx) {
		this.stJbxx = stJbxx;
	}
	public EntityDisplayVO getEntityDisplayVO() {
		return entityDisplayVO;
	}
	public void setEntityDisplayVO(EntityDisplayVO entityDisplayVO) {
		this.entityDisplayVO = entityDisplayVO;
	}

	public ICEMEntityService getCEMEntityService() {
		return cEMEntityService;
	}

	public void setCEMEntityService(ICEMEntityService entityService) {
		cEMEntityService = entityService;
	}

	public void setCEMEntityService(CEMEntityService entityService) {
		cEMEntityService = entityService;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

}
