package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzAzryXx;
import com.tansun.eam2.common.model.orm.bo.CzFysrMx;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.zccz.ucc.IPersonDealBodyService;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;


public class PersonDealBodyAction extends CommonAction {

	private CzAzryXx body;
	private String ids;
	private String sidx = "id";//排序字段名称
	private String sord = "asc";//排序规则
	
	private IPersonDealBodyService bodyService;

	/**sidx	fgddh
	 *	sord	asc
	 * 待安置人员列表
	 * @return
	 */
	public String allPerson(){
		try {
			List<StFsxx> fsxxList = bodyService.getAllAnZhiPerson(body.getStId(), sidx, sord);
			String jsonStr = BodyListToJSON.getJSON(fsxxList, 1, 1, 99999);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 安置人员列表
	 * @return
	 */
	public String anzhiPerson(){
		try{
			List<CzAzryXx> azryList = bodyService.getAzryByHeadId(body.getCldId(), sidx, sord);
			String jsonStr = BodyListToJSON.getJSON(azryList, 1, 1, 99999);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr);
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 安置费用
	 * @return
	 */
	public String anzhiFeiyong(){
		try{
			List<CzFysrMx> azfyList = bodyService.getAzfyByHeadId(body.getCldId(), sidx, sord);
			String jsonStr = BodyListToJSON.getJSON(azfyList, 1, 1, 99999);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(jsonStr);
		} catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 添加安置人员
	 * @return
	 */
	public String addAnZhiPerson(){
		response.setCharacterEncoding("UTF-8");
		try{
			bodyService.addAnZhiPerson(body.getCldId(), ids.split(","), body.getStId());
			response.getWriter().print("success");
		}catch (Exception e){
			e.printStackTrace();
			try {
				response.getWriter().print("添加安置人员失败,请与管理人员联系!");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 删除安置人员
	 * @return
	 */
	public String delAnZhiPerson(){
		response.setCharacterEncoding("UTF-8");
		String returnStr = null;
		try{
			bodyService.delAnZhiPerson(body.getCldId(), ids);
			returnStr = "success";
		}catch (Exception e){
			e.printStackTrace();
			returnStr = "删除安置人员失败,请联系管理员!";
		}
		try {
			response.getWriter().print(returnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 安置方式\安置费用
	 * @return
	 */
	public String setPersonAnZhiInfo(){
		try{
			String personId = request.getParameter("id");
			String fazfs = request.getParameter("fazfs");
			String fazfy = request.getParameter("fazfy");
			bodyService.setPersonAnZhiInfo(personId, fazfs, fazfy);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("success");
		}catch (Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public String saveOrUpdataFeiyong(){
		response.setCharacterEncoding("UTF-8");
		try{
			String oper = request.getParameter("oper");
			String fyzl = request.getParameter("fyzl");
			Double yjhf = Double.valueOf(request.getParameter("yjhf")==null?"0":request.getParameter("yjhf"));
			String beizhu = request.getParameter("beizhu");
			String id = request.getParameter("id");
			if(StringUtils.equals("add", oper)){
				String returnId = bodyService.addAnZhiFeiyong(body.getCldId(), fyzl, yjhf, beizhu);
				response.getWriter().print("{\"STATU\":\"SUCCESS\",\"ID\":\"" + returnId + "\"}");
			}else{
				bodyService.updateAnZhiFeiyong(id, body.getCldId(),fyzl, yjhf, beizhu);
				response.getWriter().print("{\"STATU\":\"SUCCESS\"}");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String delFeiyong(){
		try{
			String ids = request.getParameter("id");
			bodyService.delAnZhiFeiyong(ids);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("success");
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 保存表体
	 * @return
	 */
	public String saveBody(){
		return null;
	}
	
	
	/**
	 * 增加表体记录
	 * @return
	 */
	public String addBody(){
		return "addBody";
	}
	
	
	
	/**
	 * 删除表体记录
	 * @return
	 */
	public String deleteBody(){
		return null;
	}
	
	
	
	/**
	 * 修改表体记录入口
	 * @return
	 */
	public String modifyBody(){
		return null;
	}
	
	
	
	/**
	 * 查看表体记录入口(只读)
	 * @return
	 */
	public String vidwBody(){
		return null;
	}

	@Autowired
	public void setBodyService(IPersonDealBodyService bodyService) {
		this.bodyService = bodyService;
	}

	public void setBody(CzAzryXx body) {
		this.body = body;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public CzAzryXx getBody() {
		return body;
	}

	public void setSidx(String sidx) {
		this.sidx = sidx;
	}

	public void setSord(String sord) {
		this.sord = sord;
	}
	
}
