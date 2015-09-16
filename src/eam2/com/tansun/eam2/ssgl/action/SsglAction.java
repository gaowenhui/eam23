package com.tansun.eam2.ssgl.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.ssgl.ucc.ISsglUCC;
import com.tansun.eam2.ssgl.ucc.impl.SsglUCCImpl;
import com.tansun.eam2.ssgl.vo.SsBaseinfoQueryVO;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class SsglAction extends CommonAction implements IExport {

	private SsBaseinfo ssBaseinfo;
	private List<SsBaseinfo> ssBaseinfoList; // 基本信息列表
	private SsBaseinfoQueryVO ssBaseinfoQueryVO; // 查询参数传递；
	private Paginator paginator = new Paginator(); // 分页器
	private StJbxx st;
	@Autowired
	private ISsglUCC ssglUCCImpl;
	@Autowired
	private ICEMEntityService cemService;
	@Autowired
	public IAssetUCC assetUCCImpl;
	private String sheettype2;//用来判断资产中展示诉讼信息属于哪种表单类型
	private String id;
	private Code cd;
	private String sfid;
	private String zcgl;
	//省份id
	public String getSfid() {
		return sfid;
	}

	public void setSfid(String sfid) {
		this.sfid = sfid;
	}

	public Code getCd() {
		return cd;
	}

	public void setCd(Code cd) {
		this.cd = cd;
	}

	// 简单跳转
	/**
	 * 进入日志查询界面
	 * 
	 * @return
	 */
	public String log() {
		
		return "log";
	}

	/**
	 * 首页
	 * 
	 * @return
	 */
	public String index() {
		return newHead();
	}

	/**
	 * 查询跳转
	 * 
	 * @return
	 */
	public String query() {
		return "query";

	}

	/**
	 * 删除信息
	 * 
	 * @return
	 */
	public String delete() {
		ssglUCCImpl.delete(request.getParameter("id"));
		return "query";
	}

	/**
	 * 查询的结果列表
	 * 
	 * @return
	 */
	public String queryString() {
		String zcId = request.getParameter("zcId");
		String spzt = request.getParameter("spzt"); 
		String 	josnStr = null;
		if(zcId!=null&&!"".equals(zcId)){
			List<SsBaseinfo> list = new ArrayList<SsBaseinfo>();
			if("pass".equals(spzt)){
				if("change".equals(sheettype2)){
					JyzcXx jyzcXx= assetUCCImpl.getJyzcXxByzclsbId(zcId);
					String zczsbId = jyzcXx.getId();
					 list  = ssglUCCImpl.getSsBaseinfoByzcZsbId(zczsbId, paginator);
				}else{
				 list  = ssglUCCImpl.getSsBaseinfoByzcZsbId(zcId, paginator);
				}
			}else if("asset".equals(spzt)){
				 list =  ssglUCCImpl.getSsBaseinfoByzcLsbId(zcId, paginator);
			}else{
				 list  = ssglUCCImpl.getSsBaseinfoByzcId(zcId);
			}
			josnStr = BodyListToJSON.getJSON(list, paginator
					.getPageCount(), paginator.getCurrentPage(), paginator
					.getCount());
		}else{
			ssBaseinfoList = ssglUCCImpl.getSsList2(paginator, ssBaseinfoQueryVO);
			josnStr = BodyListToJSON.getJSON(ssBaseinfoList, paginator
					.getPageCount(), paginator.getCurrentPage(), paginator
					.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

	/**
	 * 进入页面后的初始列表
	 * 
	 * @return
	 */
	public String getString() {
		ssBaseinfoList = ssglUCCImpl.getSsList();
		String josnStr = BodyListToJSON.getJSON(ssBaseinfoList, paginator.getCount(),
				paginator.getCurrentPage(), ssBaseinfoList.size());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 获取信息
	 * 
	 * @return
	 */
	public String modifySs() {
		String look = request.getParameter("look");      //实体管理 查看标志
		request.setAttribute("look", look);				
		String stgl = request.getParameter("stgl");			//实体管理标志
		request.setAttribute("stgl", stgl);
		String rework = request.getParameter("rework");		//实体管理修改
		request.setAttribute("rework", rework);
		String stid = request.getParameter("stid");
		request.setAttribute("stid", stid);
		String sazclbbm = request.getParameter("sazclbbm");
		request.setAttribute("sazclbbm", sazclbbm);
		ssBaseinfo = ssglUCCImpl.getSsById(id);
		request.setAttribute("draftDate", ssBaseinfo.getLrsj());
		request.setAttribute("userdeptname", ssBaseinfo.getLrr());
		
		Map<String,String> djsMap = new LinkedHashMap<String, String>();
		if(StringUtils.isNotEmpty(ssBaseinfo.getSfid())){
			Code code = ssglUCCImpl.findCodeDetail("PROVIENCE", ssBaseinfo.getSfid());
			djsMap = ssglUCCImpl.findCityCodeDetail(code.getId());
		}
		request.setAttribute("djsMap", djsMap);
		
		return "add";
	}

	/**
	 * 保存信息
	 * 
	 * @return
	 */
	public String saveHead() {
		String stgl = request.getParameter("stgl");
		request.setAttribute("stgl", stgl);
		String rework = request.getParameter("rework");
		request.setAttribute("rework", rework);
		if ("1".equals(stgl)) {
			String stid = request.getParameter("stid");
			request.setAttribute("stid", stid);
			String ifSave = request.getParameter("ifSave");
			request.setAttribute("ifSave", ifSave);
			// String sslxid = request.getParameter("sslxid");
			String sazclbbm = request.getParameter("sazclbbm");
			request.setAttribute("sazclbbm", sazclbbm);
			// ssBaseinfo.setSslxid(sslxid);
			if(!"1".equals(rework)){
				ssBaseinfo.setSazclbbm(sazclbbm);
				
				ssBaseinfo.setSazcid(stid);
			}
		}
		if (id == null || "".equals(id)) {
			ssBaseinfo.setDjsmc(getDjsmcById(ssBaseinfo.getDjsbm()));
			ssglUCCImpl.save(ssBaseinfo);
			SsBaseinfo ssBaseinfo_old = null;
			ssglUCCImpl.saveSSchangeInfo(ssBaseinfo_old, ssBaseinfo,"新增");
		} else {
			ssBaseinfo.setDjsmc(getDjsmcById(ssBaseinfo.getDjsbm()));
			SsBaseinfo ssBaseinfo_old = new SsBaseinfo();
			try {
				BeanUtils.copyProperties(ssBaseinfo_old, ssglUCCImpl.getSsById(ssBaseinfo.getId()));
				ssBaseinfo_old.setId(null);
			} catch (IllegalAccessException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (InvocationTargetException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				ssglUCCImpl.update(ssBaseinfo);
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				e.printStackTrace();
			}
			ssglUCCImpl.saveSSchangeInfo(ssBaseinfo_old, ssBaseinfo,"修改");
		}
		id = ssBaseinfo.getId();
		request.setAttribute("id", ssBaseinfo.getId());
		request.setAttribute("userdeptname", ssBaseinfo.getLrr());
		return "tomodify";
	}
	
	public String  getDjsmcById(String strID){
		//System.out.println("////////"+ssglUCCImpl.getDjsmcById(strID)+"/////////"+strID);
		return ssglUCCImpl.getDjsmcById(strID);
	}

	/**
	 * 新建信息
	 * 
	 * @return
	 */
	public String newHead() {

		ssBaseinfo = new SsBaseinfo();
		// ----------------从实体页面 添加诉讼 被诉begin------------------------
		String stgl = request.getParameter("stgl");
		String zcId = request.getParameter("zcId");
		request.setAttribute("stgl", stgl);
		if ("1".equals(stgl)) {
			String stid = request.getParameter("stid");
			request.setAttribute("stid", stid);
			String rework = request.getParameter("rework");		//实体管理修改
			request.setAttribute("rework", rework);
			// String sslxid = request.getParameter("sslxid");
			// request.setAttribute("sslxid", sslxid);
			String sazclbbm = request.getParameter("sazclbbm");
			request.setAttribute("sazclbbm", sazclbbm);
			st = new StJbxx();
			st = cemService.viewEntityJbxx(stid);
			ssBaseinfo.setSazcmc(st.getStzwmc());
			ssBaseinfo.setSfid(st.getCShengfen());
			// ssBaseinfo.setSslxid(sslxid);
			ssBaseinfo.setSazclbid(sazclbbm);
		}else if(zcId!=null&&"asset".equals(zcgl)){
			ssBaseinfo.setSazcid(zcId);
			JyzcXxLsb jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
			ssBaseinfo.setSazcmc(jyzcXxLsb.getZcmc());
			ssBaseinfo.setSazclbid("1");
			request.setAttribute("zcgl", "asset");
		}
		
		
		// -------------------从实体页面 添加诉讼 被诉 end-------------------------
		ssBaseinfo.setLrr(UserThreadLocal.get().getUsername());
		ssBaseinfo.setSsztid("3");
		request.setAttribute("id", ssBaseinfo.getId());
		String strUserName = "";

		strUserName = UserThreadLocal.get().getUsername();
		Map<String,String> djsMap = new LinkedHashMap<String, String>();
		if(StringUtils.isNotEmpty(ssBaseinfo.getSfid())){
			Code code = ssglUCCImpl.findCodeDetail("PROVIENCE", ssBaseinfo.getSfid());
			djsMap = ssglUCCImpl.findCityCodeDetail(code.getId());
		}
		request.setAttribute("djsMap", djsMap);
		request.setAttribute("draftDate", new Date());
		request.setAttribute("userdeptname", strUserName);
		return "add";

	}

	/**
	 * 修改信息
	 * 
	 * @return
	 */
	public String modifyHead() {
		String sheadID = request.getAttribute("id").toString();
		ssBaseinfo = ssglUCCImpl.getSsById(sheadID);
		Map<String,String> djsMap = new LinkedHashMap<String, String>();
		if(StringUtils.isNotEmpty(ssBaseinfo.getSfid())){
			Code code = ssglUCCImpl.findCodeDetail("PROVIENCE", ssBaseinfo.getSfid());
			if(code!=null){
				djsMap = ssglUCCImpl.findCityCodeDetail(code.getId());
			}
		}
		request.setAttribute("djsMap", djsMap);
		return "add";
	}
	
	
	//------------------省市联动----------------
	
	public String provienceCity(){
		try {
		cd = ssglUCCImpl.findCodeDetail("PROVIENCE", sfid);
		Map<String,String> returnMap = ssglUCCImpl.findCityCodeDetail(cd.getId());
		String josnStr = JSONObject.fromObject(returnMap).toString();
		response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	// 系统生成的get set 方法

	public SsBaseinfo getSsBaseinfo() {
		return ssBaseinfo;
	}

	public void setSsBaseinfo(SsBaseinfo ssBaseinfo) {
		this.ssBaseinfo = ssBaseinfo;
	}

	public List<SsBaseinfo> getSsBaseinfoList() {
		return ssBaseinfoList;
	}

	public void setSsBaseinfoList(List<SsBaseinfo> ssBaseinfoList) {
		this.ssBaseinfoList = ssBaseinfoList;
	}

	public SsBaseinfoQueryVO getSsBaseinfoQueryVO() {
		return ssBaseinfoQueryVO;
	}

	public void setSsBaseinfoQueryVO(SsBaseinfoQueryVO ssBaseinfoQueryVO) {
		this.ssBaseinfoQueryVO = ssBaseinfoQueryVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public ISsglUCC getSsglUCCImpl() {
		return ssglUCCImpl;
	}

	public void setSsglUCCImpl(ISsglUCC ssglUCCImpl) {
		this.ssglUCCImpl = ssglUCCImpl;
	}

	public ICEMEntityService getCemService() {
		return cemService;
	}

	public void setCemService(ICEMEntityService cemService) {
		this.cemService = cemService;
	}

	public StJbxx getSt() {
		return st;
	}

	public void setSt(StJbxx st) {
		this.st = st;
	}

	public String getZcgl() {
		return zcgl;
	}

	public void setZcgl(String zcgl) {
		this.zcgl = zcgl;
	}

	public String getSheettype2() {
		return sheettype2;
	}

	public void setSheettype2(String sheettype2) {
		this.sheettype2 = sheettype2;
	}

	public String exportexcel() throws Exception {
		if(ssBaseinfoQueryVO==null){
			ssBaseinfoQueryVO = new SsBaseinfoQueryVO();
		}else{
			if("Thu Jan 01 00:00:00 CST 1970".equals(ssBaseinfoQueryVO.getQssjbegin().toString())){
				ssBaseinfoQueryVO.setQssjbegin(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(ssBaseinfoQueryVO.getQssjend().toString())){
				ssBaseinfoQueryVO.setQssjend(null);
			}
		}
		if(ssglUCCImpl==null){
			ssglUCCImpl=(ISsglUCC)SpringContextHelper.getBean(SsglUCCImpl.class);
		}
		String bodyJSON ="";
		ssBaseinfoList = ssglUCCImpl.getSsList2(paginator, ssBaseinfoQueryVO);
		bodyJSON = BodyListToJSON.getJSON(ssBaseinfoList, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return bodyJSON;
	}

	public void setExcelVO(CommonBO excelVO) {
		
		this.ssBaseinfoQueryVO = (SsBaseinfoQueryVO)excelVO;
	}
}
