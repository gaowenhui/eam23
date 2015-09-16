package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.StGlbt;
import com.tansun.eam2.common.model.orm.bo.StHead;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.ucc.ICEMEntityFormUcc;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stgl.vo.EntityDisplayVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTDraft;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.action.WorkflowAction;


/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 实体改制
 * @author <a href="mailto:gengxiaoli@gmail.com">gengxiaoli</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */

public class CEMChangeSystemHeadAction extends CommonAction{
	
    /**
     * 实体改制
     * @return
     */
	
	private StHead head;
	private String headId;
	private String zixuntype;
	private StGlbt stGlbt; 
	private EntityDisplayVO entityDisplayVO;
	private String stId;
	private String bianhao;
	StJbxx stJbxx;
	
    @Autowired
    IUserUCC userUCCimpl;
    @Autowired
    IDeptUCC deptUCCimpl;	
	@Autowired
	ICEMEntityService cEMEntityService;
	@Autowired
	ICEMEntityFormUcc cEMEntityFormUccImpl;
	@Autowired 
	ICodeService codeServiceImpl;	
	@Autowired 
	ICodeGenerator iCodeGenerator;	
	@Autowired
	WorkflowUtil workflowutil;	
	
	public String newHead() {
		head = new StHead();
		// 设置拟稿人

		IUser user=UserThreadLocal.get();
		head.setNgr(String.valueOf(user.getUserTid()));
		head.setNgrxm(user.getUsername());
		//得到人所在部门
		List<PTDeptBO> list=deptUCCimpl.getDeptByUserId(user.getUserTid());
		if(list!=null&&list.size()>0){
            PTDeptBO dept = list.get(0);
            head.setNgbm(dept.getRsvdNum1().toString());
			head.setNgbmmc(dept.getRsvdStr1());
		}
		//设置拟稿日期
		head.setNgrq(new Date());
		//设置该处理单所关联的实体类型
		zixuntype = (String)request.getParameter("zixunType");
		head.setZixuntype(zixuntype);
		//设置处理单审批状态
		head.setSpzt("0");
		//处理单流程
		head.setLcmc("实体改制");
		// 在数据库中插入一条空的head记录，得到处理单ID
		cEMEntityFormUccImpl.newEntityForm(head);
		request.setAttribute("headId", head.getId());
		request.setAttribute("ngrxm", head.getNgrxm());
		request.setAttribute("ngbmmc", head.getNgbmmc());
		return "tomodify";
	}
	
	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * @return
	 */
	public String modifyHead() {
		// 获得表头ID
		headId = (String) request.getAttribute("headId");
		// 在数据库中检索出表头信息，返回到页面表头
		head = cEMEntityFormUccImpl.viewEntityHead(headId);;
		//获得实体信息
		stId = head.getStId();
		if(stId != null&&"" != stId){
			stJbxx = cEMEntityService.viewEntityJbxx(stId);
			entityDisplayVO = new EntityDisplayVO();
			BeanUtils.copyProperties(stJbxx, entityDisplayVO);
			entityDisplayVO.setDiqu(codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", stJbxx.getCShengfen()));
			int perNum = cEMEntityService.selectFsxxCount(stId, StglCommon.ST_INFO_RENYUAN);
			entityDisplayVO.setRenshu(perNum);
			String reobj = generateLinkEntitiesRel(entityDisplayVO);
			request.setAttribute("reobj", reobj);
		}
		request.setAttribute("userTid", head.getNgr());
		return "start";
	}
	
	/**
	 * 将对象转换为json串
	 * @param vo
	 * @return
	 */
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
	 * 界面上有一个保存按钮,点击以后保存到数据库, 从request里面得到bo对象,然后更新到表头数据表去
	 * 
	 * @return
	 */
	public String saveHead() {
		//====================编号作废所需参数
		String taskId = (String)request.getParameter("taskId");
		//====================编号作废所需参数
		//保存表头信息
		cEMEntityFormUccImpl.saveEntityForm(head);
		request.setAttribute("headId", head.getId());		
		this.request.setAttribute(WorkflowAction.PT_DRAFT, 
				this.headToPTDraft(head)
			);
		this.request.setAttribute(WorkflowAction.PT_TODO, 
				this.headToPTTodo(head)
			);
		//====================编号作废所需参数	
		if(StringUtils.isNotEmpty(taskId)){
			workflowutil.putVariables(taskId, "codeType", "stgl_gaizhi");
			workflowutil.putVariables(taskId, "generatedCode", head.getBianhao());
			workflowutil.putVariables(taskId, "deptid", head.getNgbm());
		}
		//====================编号作废所需参数
		return "toWorkflow";
	}
	
	private PTTodo headToPTTodo(StHead head){
		PTTodo todo = new PTTodo();
		todo.setTitle(head.getBiaoti());
		todo.setSheetId(head.getBianhao());
		return todo;
	}
	
	private PTDraft headToPTDraft(StHead head){
		UserThreadLocal userThreadLocal = new UserThreadLocal();
		PTDraft draft = new PTDraft();
		draft.setHeadId(head.getId());
		draft.setHeadType("实体改制");
		draft.setTitle(head.getBiaoti());
		draft.setDeptId(Long.parseLong(head.getNgbm()));
		draft.setSubsystem(GlobalVariable.ENTITY_SUBSYSTEM);

		return draft;
	}
	
	/**
	 * 生成处理单编号
	 * @return
	 * 
	 */
	public String createNum(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		headId =request.getParameter("headId");
		head = cEMEntityFormUccImpl.viewEntityHead(headId);
		bianhao = head.getBianhao();
		if(bianhao==null||bianhao.length()==0){
			bianhao = iCodeGenerator.generateCurrentCode("stgl_gaizhi", head.getNgbm(), head.getNgbmmc());
			head.setBianhao(bianhao);
			cEMEntityFormUccImpl.newEntityForm(head);
		}else{
			bianhao=head.getBianhao();
		}

		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(bianhao);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 处理单办结
	 * @return
	 */
	public String completeHead(){
		headId = (String) request.getParameter("headId");
		cEMEntityFormUccImpl.updateStHead(headId, "spzt", "3");
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("success");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public StHead getHead() {
		return head;
	}

	public void setHead(StHead head) {
		this.head = head;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public StJbxx getStJbxx() {
		return stJbxx;
	}

	public void setStJbxx(StJbxx stJbxx) {
		this.stJbxx = stJbxx;
	}

	public StGlbt getStGlbt() {
		return stGlbt;
	}

	public void setStGlbt(StGlbt stGlbt) {
		this.stGlbt = stGlbt;
	}

	public EntityDisplayVO getEntityDisplayVO() {
		return entityDisplayVO;
	}

	public void setEntityDisplayVO(EntityDisplayVO entityDisplayVO) {
		this.entityDisplayVO = entityDisplayVO;
	}

	public String getStId() {
		return stId;
	}

	public void setStId(String stId) {
		this.stId = stId;
	}

	public IUserUCC getUserUCCimpl() {
		return userUCCimpl;
	}

	public void setUserUCCimpl(IUserUCC userUCCimpl) {
		this.userUCCimpl = userUCCimpl;
	}

	public IDeptUCC getDeptUCCimpl() {
		return deptUCCimpl;
	}

	public void setDeptUCCimpl(IDeptUCC deptUCCimpl) {
		this.deptUCCimpl = deptUCCimpl;
	}

	public ICEMEntityService getCEMEntityService() {
		return cEMEntityService;
	}

	public void setCEMEntityService(ICEMEntityService entityService) {
		cEMEntityService = entityService;
	}

	public ICEMEntityFormUcc getCEMEntityFormUccImpl() {
		return cEMEntityFormUccImpl;
	}

	public void setCEMEntityFormUccImpl(ICEMEntityFormUcc entityFormUccImpl) {
		cEMEntityFormUccImpl = entityFormUccImpl;
	}

	public ICodeService getCodeServiceImpl() {
		return codeServiceImpl;
	}

	public void setCodeServiceImpl(ICodeService codeServiceImpl) {
		this.codeServiceImpl = codeServiceImpl;
	}

	public String getZixuntype() {
		return zixuntype;
	}

	public void setZixuntype(String zixuntype) {
		this.zixuntype = zixuntype;
	}

	public String getBianhao() {
		return bianhao;
	}

	public void setBianhao(String bianhao) {
		this.bianhao = bianhao;
	}

}
