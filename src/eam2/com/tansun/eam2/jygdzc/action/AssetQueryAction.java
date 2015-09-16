package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.AeMachineEquipment;
import com.tansun.eam2.common.model.orm.bo.AeRealEstate;
import com.tansun.eam2.common.model.orm.bo.AeVehicle;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.impl.AssetUCCImpl;
import com.tansun.eam2.jygdzc.vo.JyzcExmineVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.eam2.jygdzc.vo.QueryVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

public class AssetQueryAction extends CommonAction implements IExport {
	
	  public String sheettype;	
	  public List<JyzcXxVO> list=new ArrayList<JyzcXxVO>();
	  private QueryVO queryVO;
	  private JyzcExmineVO jyzcExmineVO;
	  @Autowired
	  public IAssetUCC assetUCCImpl;
	  @Autowired
	  public IUserUCC iUserUCCImpl;
	  @Autowired
	  public IDeptUCC iDeptUCCImpl;
	  public Paginator paginator ;
	  //资产信息表
	  private JyzcXx jyzcXx;
	  private AeRealEstate aeRealEstate;
	  private AeVehicle aeVehicle;
	  private AeMachineEquipment aeMachineEquipment;
	  private JyzcXxVO jyzcXxVO;
	  public String check;
	  private QueryBO queryBO;
	 // 资产Id
	  public String zcId;
	 // 处理单业务类型 用来判断添加资产资产状态
	  public String ywlx;
	  
//	  public String  addAsset(){
//			ywlx = request.getParameter("ywlx");
//			zcId  = request.getParameter("zcId");
//			String result = assetUCCImpl.addAsset(zcId, ywlx);
//			try {
//				response.setCharacterEncoding("UTF-8");
//				response.getWriter().write(result);
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			return null;
//		}
	/**
	 * init 是资产台账查询界面的入口方法，不做任何操作，直接返回init.
	 * @return 
	 */
	public String init() {
		
		String isModal = request.getParameter("isModal");
		String isForCard = request.getParameter("isForCard");
		String returnValue = request.getParameter("returnValue");
		String mulSelect = request.getParameter("mulSelect");
		String ywlx = request.getParameter("ywlx");
		String headId = request.getParameter("cldId"); 
		String ejbm = request.getParameter("bmbh");
//		if(!"".equals(bmbh)&&bmbh!=null&&!"null".equals(bmbh)){
//			PTDeptBO bm = iDeptUCCImpl.getSingleById(Long.parseLong(bmbh));
//			ejbm = String.valueOf(bm.getParId());
//		}
		IUser user = UserThreadLocal.get();
		String erwtgljg = null;
		String erwtgljgName = null;
		String yjwtgljg = null;
		//得到人所在部门7
		List<PTDeptBO> list = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
		if(list != null && list.size()>0){
			for(int i = 0;i < list.size();i++){
				PTDeptBO dept = list.get(i);
				//如果是代理机构，一级委托管理机构是其他实体
	            if(dept.getRsvdNum1() != null && "11262".equals(dept.getRsvdNum1().toString())){
	            	yjwtgljg = "11262"; 
	            	erwtgljg = dept.getTid().toString();
	            	erwtgljgName = dept.getDeptName();
	            }
				//如果是建银实业，或者建投登录，一级委托管理机构是建银实业,二级委托管理机构是其他实体
	            if(dept.getRsvdNum1() != null && ("113".equals(dept.getRsvdNum1().toString()) || "10775".equals(dept.getRsvdNum1().toString()))){
	            	yjwtgljg = "113";
	            	erwtgljg = "11262";
	            }
			}
		}
		request.setAttribute("isModal", isModal);
		request.setAttribute("returnValue", returnValue);
		request.setAttribute("isForCard", isForCard);
		request.setAttribute("mulSelect", mulSelect);
		request.setAttribute("ejbm", ejbm);
		//一级委托管理机构
		request.setAttribute("yjwtgljg", yjwtgljg);
		//二级委托管理机构
		request.setAttribute("erwtgljg", erwtgljg);
		request.setAttribute("erwtgljgName", erwtgljgName);
		request.setAttribute("ywlx", ywlx);
		request.setAttribute("headId", headId);
		sheettype = request.getParameter("sheettype");
		return "query";
	}
	public String cardQuery(){
		String headId = request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "checkQuery";
	}
	public String initForZccz() {
		return "queryForZccz";
	}

	/**
	 * query 是资产台账查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询
	 * 按输入元素进行组合查询,目前实现资产编号和资产名称,
	 * 查询结果变成一个BO的List集合,提供给界面
	 * @return
	 * @throws IOException 
	 */
	public String query() throws IOException {
		//String ejbmbh = request.getParameter("ejbmbh");
		String bodyJSON =null;
		if(queryBO==null){
			queryBO = new QueryBO();
		}
		//if(ejbmbh!=null&&!"".equals(ejbmbh)&&!"null".equals(ejbmbh)){
		//	queryBO.setEjwtgljg(ejbmbh);
		//}
		//资产查询
		list=assetUCCImpl.getJyzcXxVOByCondition(queryBO, paginator);
		for(JyzcXxVO vo : list){
			if(vo.getCardinfo() == null){
				vo.setCardinfo(new Cardinfo());
			}
		}
		try{
			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}catch(Exception e){
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	public String query4Elect() throws IOException{
		String params = request.getParameter("idStr");
		String bodyJSON =null;
		//资产查询
		list=assetUCCImpl.getJyzcXxVOByCondition(params);
		for(JyzcXxVO vo : list){
			if(vo.getCardinfo() == null){
				vo.setCardinfo(new Cardinfo());
			}
		}
		try{
			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}catch(Exception e){ 
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	public String queryExamine(){
		String kpbh = request.getParameter("kpbh");
		String hcpgnf = request.getParameter("hcpgnf");
		String zclx = request.getParameter("zclx");
		String sheettype2 = request.getParameter("sheettype2");
		if("change".equals(sheettype2)&&zcId!=null&&!"".equals(zcId)){
			jyzcXx = assetUCCImpl.getJyzcXxByLsbZcid(zcId);
			if(jyzcXx!=null){
				zcId = jyzcXx.getId();
			}
			zclx = zclx+"Info";
		}
		String bodyJSON = null;
		List list = null;
	try{	
		list = assetUCCImpl.getjyzcExmineVOByCondition(zcId,kpbh,hcpgnf,zclx);
		bodyJSON = BodyListToJSON.getJSON(list, 2, 1, 24);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
	} catch (IOException e) {
		e.printStackTrace();
	}
		return null;
	}
	public String viewExamine(){
		String hcpgId = request.getParameter("hcpgId");
		String zclx = request.getParameter("zclx");
		String result =zclx+"hcpg" ;
		if(zclx!=null&&("buildingInfo".equals(zclx.trim())||"building".equals(zclx.trim()))){
			 aeRealEstate = assetUCCImpl.findAeRealEstateById(hcpgId);
		}else if(zclx!=null&&("vehicleInfo".equals(zclx.trim())||"vehicle".equals(zclx.trim()))){
			 aeVehicle = assetUCCImpl.findAeVehicleById(hcpgId);
		}else if(zclx!=null&&("elseInfo".equals(zclx.trim())||"else".equals(zclx.trim()))){
			 aeMachineEquipment = assetUCCImpl.findAeMachineEquipmentById(hcpgId);
		}
		return result;
	}
	/**
	 * 选择初始化
	 * @return
	 */
	public String selectinit(){
		//入口，这个入口代表要选择一个经营型固定资产，界面上要显示一个选择按钮
		// step1:得到查询对象
		// step2:调用后台Service,得到资产对应的列表
		// step3:将List对象传递到前台去
		
		// step4:结束工作，转到相关页面
		
		 //step5: 返回选中记录的Id值
		return "query";
	}
//展示树状部门
	public String toTree(){
		String type4jygdzc = request.getParameter("type4Jygdzc");
		String nodeValue  = request.getParameter("nodeValue");
		request.setAttribute("nodeValue", "0"+nodeValue);
		String isHUIQIAN = request.getParameter("isHUIQIAN");
		request.setAttribute("isHUIQIAN", isHUIQIAN);//是会签的多选
		request.setAttribute("type4Jygdzc", type4jygdzc);//弹出树的类型
		return "toTree";
	}
	
	public String toTree1(){

		// 得到登录人的信息
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCImpl.getSingleById(userId);
		// 得到人所在部门  
		//根据部门看是属于建银实业的 还是属于中国建投的 用来判断出现的是
		List<PTDeptBO> list = iDeptUCCImpl.getDeptByUserId(userBo.getTid());
		//循环出现所有的树   一级的树父部门是0 二级的父父部门是0的
		//de
		List<PTDeptBO> listBo = iDeptUCCImpl.getChildrensAndSelf(1l);
		List<PTDeptBO> rezult = new ArrayList<PTDeptBO>();
		
		for(PTDeptBO bo:listBo){
			if(bo.getParId().equals(0)){
				rezult.add(bo);
			}
		
		}
		return "";
	}
	
	
	// 将数据添加到临时表里 判断看是否重复
	public String queryForSingle(){
		
		String cldId = request.getParameter("headId");
		String zcIds = request.getParameter("zcIds");
		
		String returnValue = assetUCCImpl.queryForSingle(cldId, zcIds);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(returnValue);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public JyzcXx getJyzcXx() {
		return jyzcXx;
	}

	public void setJyzcXx(JyzcXx jyzcXx) {
		this.jyzcXx = jyzcXx;
	}

	public JyzcXxVO getJyzcXxVO() {
		return jyzcXxVO;
	}

	public void setJyzcXxVO(JyzcXxVO jyzcXxVO) {
		this.jyzcXxVO = jyzcXxVO;
	}

	public QueryBO getQueryBO() {
		return queryBO;
	}

	public void setQueryBO(QueryBO queryBO) {
		this.queryBO = queryBO;
	}

	public QueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(QueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	public String getSheettype() {
		return sheettype;
	}
	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}
	public String getZcId() {
		return zcId;
	}
	public void setZcId(String zcId) {
		this.zcId = zcId;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public IAssetUCC getAssetUCCImpl() {
		return assetUCCImpl;
	}
	public void setAssetUCCImpl(IAssetUCC assetUCCImpl) {
		this.assetUCCImpl = assetUCCImpl;
	}
	public JyzcExmineVO getJyzcExmineVO() {
		return jyzcExmineVO;
	}
	public void setJyzcExmineVO(JyzcExmineVO jyzcExmineVO) {
		this.jyzcExmineVO = jyzcExmineVO;
	}
	public AeRealEstate getAeRealEstate() {
		return aeRealEstate;
	}
	public void setAeRealEstate(AeRealEstate aeRealEstate) {
		this.aeRealEstate = aeRealEstate;
	}
	public AeVehicle getAeVehicle() {
		return aeVehicle;
	}
	public void setAeVehicle(AeVehicle aeVehicle) {
		this.aeVehicle = aeVehicle;
	}
	public AeMachineEquipment getAeMachineEquipment() {
		return aeMachineEquipment;
	}
	public void setAeMachineEquipment(AeMachineEquipment aeMachineEquipment) {
		this.aeMachineEquipment = aeMachineEquipment;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.queryBO = (QueryBO)excelVO;
	}
	public String exportexcel() throws Exception {
		if(queryBO==null){
			queryBO = new QueryBO();
		}else{
			if(queryBO.getParentid()!=null&&"0".equals(queryBO.getParentid())){
				queryBO.setParentid(null);
			}
		}
		if(assetUCCImpl==null){
			assetUCCImpl=(IAssetUCC)SpringContextHelper.getBean(AssetUCCImpl.class);
		}
		list=assetUCCImpl.getJyzcXxVOByCondition(queryBO, paginator);
		System.out.println(list.size());
		for(JyzcXxVO vo : list){
			if(vo.getCardinfo() == null){
				vo.setCardinfo(new Cardinfo());
			}
		}
		String bodyJSON ="";
			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		return bodyJSON;
	}
	
}
