package com.tansun.eam2.zqgl.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.codeService.impl.CodeServiceImpl;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.DebtWorklog;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.zqgl.ucc.ICreditorService;
import com.tansun.eam2.zqgl.ucc.IOutEntityListService;
import com.tansun.eam2.zqgl.vo.CreditorQueryVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
public class creditorMaintainAction extends CommonAction {
	private Paginator paginator;
	private CreditorQueryVO cqVO;
	public DebtInfo di;
	private DebtWorklog dk;
	private StJbxx st;
	private String DebtInfoId;
	private Code cd ;
	@Autowired
	private ICreditorService creditorService; 
	@Autowired
	private IOutEntityListService outEntityListService; 
	@Autowired
	private CodeServiceImpl codeService;
	public String getDebtInfoId() {
		return DebtInfoId;
	}


	public void setDebtInfoId(String debtInfoId) {
		DebtInfoId = debtInfoId;
	}


	/**
	 * 查询列表
	 * @return
	 */
	public String debtList(){
	    String refershSign = request.getParameter("refershSign");
		if("1".equals(refershSign)){
			List<DebtInfo> list = null;
			list = creditorService.debtList(paginator,cqVO);
			List<DebtInfo> listNew = new ArrayList<DebtInfo>();
			for (DebtInfo di : list) {
				if("1".equals(di.getDjzr())){
					di.setDjzr("是");
				}else if("0".equals(di.getDjzr())){
					di.setDjzr("否");
				}
				if("1".equals(di.getFshx())){
					di.setFshx("是");
				}else if("0".equals(di.getFshx())){
					di.setFshx("否");
				}
				if("0".equals(di.getZqzl())){
					di.setZqzl("全部");
				}else if("1".equals(di.getZqzl())){
					di.setZqzl("信达转让");
				}else if("2".equals(di.getZqzl())){
					di.setZqzl("建银转让");
				}else if("3".equals(di.getZqzl())){
					di.setZqzl("其他");
				}
				listNew.add(di);
			}
			String jsonStr = BodyListToJSON.getJSON(listNew, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(jsonStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "debtList";
	}

	
	/**
	 * 新增
	 * @return
	 */
	public String newDebtInfo(){
		String newAdd = request.getParameter("newAdd");
		request.setAttribute("newAdd", newAdd);
		String look = request.getParameter("look");
		request.setAttribute("look", look);
		String rework = request.getParameter("rework");
		String diid = request.getParameter("diid");
		di = new DebtInfo();
		if("1".equals(newAdd)){
			creditorService.newDebtInfo(di);
		}
		if("1".equals(look) || "1".equals(rework)){
			di = creditorService.getDebtInfo(diid);
		}
		
		return "newDebtInfo";
	}
	
	
	/**
	 * 保存信息
	 * @return
	 */
	public String saveDebtInfo(){
		String diid = request.getParameter("diid");
		String newAdd = request.getParameter("newAdd");
		String rework = request.getParameter("rework");
//        List<Code> moneyBzList = codeService.findAllByCodeType("MONYE_TYPE");
//		for(Code bz : moneyBzList){
//			if(bz.getCodeKey().equals(di.getBzbm()))di.setBzmc(bz.getCodeValue());
//		}
		DebtInfo diy = creditorService.getDebtInfo(di.getId());
		String subSys = GlobalVariable.DEBT_SUBSYSTEM;
		if(StringUtils.isNotEmpty(diy.getZwrmc())){
			creditorService.saveSSchangePro(diy, di, "修改",subSys);
		}else{
			creditorService.saveSSchangePro(null, di, "新增",subSys);
		}
		if("0".equals(di.getBzbm())){
			di.setBzmc("人民币");
		}else if("1".equals(di.getBzbm())){
			di.setBzmc("美元");
		}else if("2".equals(di.getBzbm())){
			di.setBzmc("港元");
		}else if("3".equals(di.getBzbm())){
			di.setBzmc("欧元");
		}
		if(di.getGrzye() == null){
			di.setGrzye(new Double (0.0));
		}
		if(di.getDjzrje() == null){
			di.setDjzrje(new Double (0.0));
		}
		if(di.getDbhtje() == null){
			di.setDbhtje(new Double (0.0));
		}
		
//		if("1".equals(newAdd)){
//			creditorService.newDebtInfo(di);
//		}else{
			di.setSfbc("1");
			
			creditorService.saveDebtInfo(di);
//		}
		return null;
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String deleteDebtInfo(){
		if(DebtInfoId != null){
			String[] id = DebtInfoId.split(",");
			creditorService.deleteDebtInfo(id);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	/**
	 * 返回json串
	 * @return
	 */
	public String returnJson(){
		String stid = request.getParameter("stid");
		st = new StJbxx();
		st  = outEntityListService.getStJbxxInfo(stid);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(BodyListToJSON.bodyToJSON(st, getJsonConfig(), false));
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	
//	/**
//	 * 查看实体详细信息
//	 */
//	public String lookDebtDetail(){
//		String stid = request.getParameter("stid");
//		st = new StJbxx();
//		st  = outEntityListService.getStJbxxInfo(stid);
//		if("1".equals(st.getStlx())){
//			
//		}
//		return null;
//	}
	
//      ----------------办理依据---------------------	
	
	/**
	 * 查询列表    DebtWorklog
	 * @return
	 */
	public String debtWorklogList(){
		String diid = request.getParameter("diid");
		request.setAttribute("diid", diid);
		return "debtWorklogList";
	}
	
	public String viewList(){
	    String refershSign = request.getParameter("refershSign");
	    String diid = request.getParameter("diid");
		List<DebtWorklog> list = null;
		list = creditorService.getDebtWorklogList(diid);
		CommonBO[] commonBo = new CommonBO[list.size()];
		list.toArray(commonBo);
		String jsonStr = BodyListToJSON.getJSON(commonBo, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	
	/**
	 * 新增DebtWorklog
	 * @return
	 */
	public String newDebtWorklog(){
		String newAdd = request.getParameter("newAdd");
		request.setAttribute("newAdd", newAdd);
		String look = request.getParameter("look");
		request.setAttribute("look", look);
		String rework = request.getParameter("rework");
		String dkid = request.getParameter("dkid");
		String diid = request.getParameter("diid");
		request.setAttribute("diid", diid);
		dk = new DebtWorklog();
		if("1".equals(newAdd)){
			dk.setZqid(diid);
			creditorService.newDebtWorklog(dk);
		}
		if("1".equals(look) || "1".equals(rework)){
			dk = creditorService.getDebtWorklogInfo(dkid);
		}
		return "newDebtWorklog";
	}
	
	
	/**
	 * 保存DebtWorklog
	 * @return
	 */
	public String saveDebtWorklog(){
		
		String newAdd = request.getParameter("newAdd");
		String rework = request.getParameter("rework");
		String diid = request.getParameter("diid");
		String dkid = request.getParameter("dkid");
//		if("1".equals(newAdd)){
//			
//		}else{
//			dk = creditorService.getDebtWorklogInfo(dkid);
			dk.setSfbc("1");
			creditorService.saveDebtWorklog(dk);
//		}
		return null;
	}
	
	
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public CreditorQueryVO getCqVO() {
		return cqVO;
	}

	public void setCqVO(CreditorQueryVO cqVO) {
		this.cqVO = cqVO;
	}

	public DebtInfo getDi() {
		return di;
	}

	public void setDi(DebtInfo di) {
		this.di = di;
	}

	public ICreditorService getCreditorService() {
		return creditorService;
	}

	public void setCreditorService(ICreditorService creditorService) {
		this.creditorService = creditorService;
	}


	public Code getCd() {
		return cd;
	}


	public void setCd(Code cd) {
		this.cd = cd;
	}


	public CodeServiceImpl getCodeService() {
		return codeService;
	}


	public void setCodeService(CodeServiceImpl codeService) {
		this.codeService = codeService;
	}
	
	private JsonConfig getJsonConfig() {
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
		//指定某些属性如果为null则不转换成JSON串。
		jsonConfig.setExcludes( new String[]{ "Double", "Boolean"} );
		return jsonConfig;
	}


	public DebtWorklog getDk() {
		return dk;
	}


	public void setDk(DebtWorklog dk) {
		this.dk = dk;
	}


	public StJbxx getSt() {
		return st;
	}


	public void setSt(StJbxx st) {
		this.st = st;
	}


	public IOutEntityListService getOutEntityListService() {
		return outEntityListService;
	}


	public void setOutEntityListService(IOutEntityListService outEntityListService) {
		this.outEntityListService = outEntityListService;
	}
	
}
