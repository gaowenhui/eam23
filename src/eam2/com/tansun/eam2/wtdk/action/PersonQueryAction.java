package com.tansun.eam2.wtdk.action;

import java.io.IOException;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.WdLnDptInfo;
import com.tansun.eam2.wtdk.ucc.IPersonQueryUCC;
import com.tansun.eam2.wtdk.vo.OrgQueryVO;
import com.tansun.eam2.wtdk.vo.RiskQueryVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

/**
 * 人员机构信息
 * 
 * @author 陈煜霄
 * @date 2010-12-06
 */
public class PersonQueryAction extends CommonAction {

	private OrgQueryVO orgVO;
	private Paginator paginator;
	private WdLnDptInfo perVO;
	@Autowired
	private IPersonQueryUCC personQueryUCCImpl;
	@Autowired
	private IUserUCC iUserUCCimpl;
	
	/**
	 * 进入人员信息页面
	 * 
	 * @return
	 */
	public String perInit() {
		return "perInit";
	}

	/**
	 * 进入机构信息页面
	 * 
	 * @return
	 */
	public String orgInit() {
		return "orgInit";
	}

	/**
	 * 根据机构编号查找机构名称
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findDeptByNo() throws IOException {
		String cmCod = request.getParameter("cmCod");
		String cmName = personQueryUCCImpl.findDeptByNo(cmCod);
		perVO.setDkjgbm(cmCod);
		perVO.setDkjgmc(cmName);
		if (perVO.getId() == null || "".equals(perVO.getId())) {
			request.setAttribute("saveORupdate", "save");
		} else {
			request.setAttribute("saveORupdate", "update");
		}
		request.setAttribute("isDisable", "false");
		return "addPerson";
	}

	/**
	 * 查询机构信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String orgQuery() throws IOException {
		if (orgVO == null) {
			orgVO = new OrgQueryVO();
		}
		String orgJSON = personQueryUCCImpl.orgQuery(orgVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(orgJSON);
		return null;
	}

	/**
	 * 查询人员信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String perQuery() throws IOException {
		if (perVO == null) {
			perVO = new WdLnDptInfo();
		}
		String orgJSON = personQueryUCCImpl.perQuery(perVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(orgJSON);
		return null;
	}

	/**
	 * 打开添加/修改页面
	 * 
	 * @return
	 */
	public String addPerson() {
		String id = request.getParameter("id");
		String saveupdate = request.getParameter("saveupdate");
		if (id != null && !"".equals(id)) {
			perVO = personQueryUCCImpl.findPerInfoById(id);
			Long userId = UserThreadLocal.get().getUserTid();
			PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
			String ngrmc = userBo.getUsername();
			perVO.setLrr(ngrmc);
			perVO.setLrrq(new Date());
			request.setAttribute("isDisable", "false");
		} else {
			perVO = new WdLnDptInfo();
			Long userId = UserThreadLocal.get().getUserTid();
			PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
			String ngrmc = userBo.getUsername();
			perVO.setLrr(ngrmc);
			perVO.setLrrq(new Date());
			request.setAttribute("isDisable", "true");
		}
		request.setAttribute("saveupdate", saveupdate);
		return "addPerson";
	}

	/**
	 * 添加人员信息
	 * 
	 * @return
	 */
	public String savePer() {
		personQueryUCCImpl.savePer(perVO);
		request.setAttribute("message", "保存成功！");
		return "addPerson";
	}

	/**
	 * 修改人员信息
	 * 
	 * @return
	 */
	public String updatePer() {
		personQueryUCCImpl.updatePer(perVO);
		request.setAttribute("message", "修改成功！");
		return "addPerson";
	}

	/**
	 * 删除人员机构信息
	 * 
	 * @return
	 */
	public String deletePerson() {
		String id = request.getParameter("id");
		if (id.startsWith(",")) {
			id = id.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] ids = id.split(",");
		personQueryUCCImpl.deletePerson(ids);
		return null;
	}

	/**
	 * 以下为用到的getter setter
	 * 
	 * @return
	 */
	public OrgQueryVO getOrgVO() {
		return orgVO;
	}

	public void setOrgVO(OrgQueryVO orgVO) {
		this.orgVO = orgVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public WdLnDptInfo getPerVO() {
		return perVO;
	}

	public void setPerVO(WdLnDptInfo perVO) {
		this.perVO = perVO;
	}

}
