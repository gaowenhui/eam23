package com.tansun.eam2.zqgl.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.zqgl.ucc.IOutEntityListService;
import com.tansun.eam2.zqgl.vo.OutEntityVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
public class OutEntityAction extends CommonAction {
		
	private OutEntityVO oeVO;
	@Autowired
	private IOutEntityListService outEntityService;
	private Paginator paginator = new Paginator();
	private StJbxx st;
	private String StJbxxId;
	private ICodeGenerator codeGenerator;
	
	
	public String query(){
		return "";
	}
	/**
	 * 查询列表
	 * @return
	 */
	public String outEntityList(){
		String zixunType = request.getParameter("zixunType");
		request.setAttribute("zixunType", zixunType);
	    request.getSession().setAttribute("stlx", zixunType);
	    String refershSign = request.getParameter("refershSign");
	    String debtSign = request.getParameter("debtSign");
	    request.setAttribute("debtSign", debtSign);
		if("1".equals(refershSign)){
			List<StJbxx> list = null;
				list = outEntityService.outEntityList(paginator,oeVO,zixunType);
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
		return "outEntityList";
	}
	
	/**
	 * 新增外部实体
	 * @return
	 */
	public String newEntity(){
		String newAdd = request.getParameter("newAdd");
		request.setAttribute("newAdd", newAdd);
		String look = request.getParameter("look");
		request.setAttribute("look", look);
		String rework = request.getParameter("rework");
		String stid = request.getParameter("stid");
		st = new StJbxx();
		if("1".equals(newAdd)){
			outEntityService.newEntity(st);
		}
		if("1".equals(look) || "1".equals(rework)){
			st = outEntityService.getStJbxxInfo(stid);
		}
		return "newAdd";
	}
	
	
	/**
	 * 保存实体外部信息
	 * @return
	 */
	public String saveEntity(){
		String stid = request.getParameter("stid");
//		sf = outEntityService.getStJbxxInfo(stid);
		String newAdd = request.getParameter("newAdd");
		String rework = request.getParameter("rework");
		StJbxx stold = outEntityService.getStJbxxInfo(st.getId());
		if(StringUtils.isNotEmpty(stold.getStzwmc())){
			outEntityService.saveSSchangePro(stold, st, "修改");
		}else{
			outEntityService.saveSSchangePro(null, st, "新增");
		}
		st.setStlx((String)request.getSession().getAttribute("stlx"));
//		if("1".equals(newAdd)){
//			outEntityService.newEntity(st);
//		}else{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(date);
		if(st.getZcbh() == null || st.getZcbh().length() == 0){
			String code = codeGenerator.generateCurrentCode("wbstzcbh", "", "");
//			String code2 = code.replace("#1#", year);
//			st.setZcbh(code2);
			st.setZcbh(code);
		}
			st.setSfbc("1");
			outEntityService.saveEntity(st);
//		}
		return null;
	}
	
	
	
	public String deleteEntity(){
		if(StJbxxId != null){
			String[] id = StJbxxId.split(",");
			outEntityService.deleteStJbxx(id);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	public OutEntityVO getOeVO() {
		return oeVO;
	}

	public void setOeVO(OutEntityVO oeVO) {
		this.oeVO = oeVO;
	}

	public IOutEntityListService getOutEntityService() {
		return outEntityService;
	}

	public void setOutEntityService(IOutEntityListService outEntityService) {
		this.outEntityService = outEntityService;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public StJbxx getSt() {
		return st;
	}

	public void setSt(StJbxx st) {
		this.st = st;
	}

	public String getStJbxxId() {
		return StJbxxId;
	}

	public void setStJbxxId(String stJbxxId) {
		StJbxxId = stJbxxId;
	}

	public ICodeGenerator getCodeGenerator() {
		return codeGenerator;
	}

	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}
	

	
}
