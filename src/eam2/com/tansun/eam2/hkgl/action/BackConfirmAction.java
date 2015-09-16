package com.tansun.eam2.hkgl.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.BizBackCashInfo;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmBody;
import com.tansun.eam2.common.model.orm.bo.BizBackConfirmHead;
import com.tansun.eam2.hkgl.ucc.IHkglUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

/**
 * 回款管理办理单action
 * 
 * @author 陈煜霄
 * @date 2011-03-07
 */
public class BackConfirmAction extends CommonAction {

	private BizBackCashInfo head;
	private BizBackConfirmBody confirmBody;
	private BizBackConfirmHead confirmHead;
	@Autowired
	private IUserUCC iUserUCCimpl;
	@Autowired
	private IHkglUCC hkglUCCImpl;
	@Autowired
	private IDeptUCC deptUCCimpl;

	/**
	 * 进入回款表头页面保存一条数据
	 * 
	 * @return
	 */
	public String newHead() {
		head = new BizBackCashInfo();
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String ngrmc = userBo.getUsername();
		head.setNgrmc(ngrmc);
		head.setNgrq(new Date());
		head.setNgrbh(String.valueOf(userBo.getTid()));
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
				.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		hkglUCCImpl.saveHead(head);
		request.setAttribute("headId", head.getId());
		return "tomodify";
	}

	/**
	 * 修改表头
	 * 
	 * @return
	 */
	public String saveHead() {
		hkglUCCImpl.updateHead(head);
		return "tomodify";
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示, 以及后续的修改等操作. 直接返回
	 * 
	 * @return
	 */
	public String modifyHead() {
		String headId = (String) request.getAttribute("headId");
		if (headId == null) {
			headId = request.getParameter("headId");
		}
		head = hkglUCCImpl.findHeadByHeadId(headId);
		return "biaodan";
	}

	/**
	 * 打开确认页面
	 * 
	 * @return
	 */
	public String openConfirm() {
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String qrrbh = String.valueOf(userBo.getTid()); // 确认人编号
		String qrrmc = userBo.getUsername(); // 确认人名称
		String qrbmbh = request.getParameter("deptId"); // 确认部门编号
		String qrbmmc = request.getParameter("deptName"); // 确认部门名称
		String headId = request.getParameter("headId"); // 对应回款处理单或办理单的id
		String dzje = request.getParameter("dzje"); // 到账金额
		Date qrrq = new Date(); // 确认日期
		String qrdlx = "";
		String type = request.getParameter("type");
		if ("chuzhi".equals(type)) { // 确认单类型
			qrdlx = "1";
		} else if ("qingsuan".equals(type)) {
			qrdlx = "2";
		} else if ("zhaiquan".equals(type)) {
			qrdlx = "3";
		} else if ("shiti".equals(type)) {
			qrdlx = "4";
		} else if ("qita".equals(type)) {
			qrdlx = "5";
		}
		String sfzzhk = "否"; // 是否最终回款
		if (headId != null && headId != "") {
			confirmHead = hkglUCCImpl.findConfirmHeadByHeadIdandUserCode(
					headId, qrrbh);
			if (confirmHead == null) {
				confirmHead = new BizBackConfirmHead();
				confirmHead.setCashid(headId);
				confirmHead.setQrbmbh(qrbmbh);
				confirmHead.setQrbmmc(qrbmmc);
				confirmHead.setQrdlx(qrdlx);
				confirmHead.setQrrbh(qrrbh);
				confirmHead.setQrrmc(qrrmc);
				confirmHead.setQrrq(qrrq);
				confirmHead.setSfzzhk(sfzzhk);
				hkglUCCImpl.saveConfirmHead(confirmHead);
			}
			if("5".equals(qrdlx)){
				confirmBody = hkglUCCImpl
				.findConfirmBodyByConfirmHeadIdQT(confirmHead.getId());
				if (confirmBody == null) {
					confirmBody = new BizBackConfirmBody();
					confirmBody.setHeadid(confirmHead.getId());
					confirmBody.setSfybc("是");
					hkglUCCImpl.saveQTtoConfirmBody(confirmBody);
				}
			}
			request.setAttribute("qrrbh", qrrbh);
			request.setAttribute("confirmHeadId", confirmHead.getId());
			request.setAttribute("dzje", dzje);
			return type;
		} else {
			return null;
		}
	}

	public String checkBodyByLx() throws IOException {
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String qrrbh = String.valueOf(userBo.getTid()); // 确认人编号
		String headId = request.getParameter("headId"); // 对应回款处理单或办理单的id
		String radioValue = request.getParameter("radioValue"); // 类型
		response.setCharacterEncoding("UTF-8");
		confirmHead = hkglUCCImpl.findConfirmHeadByHeadIdandUserCode(headId,
				qrrbh);
		if (confirmHead == null && headId != "") {
			response.getWriter().write("yes");
		} else {
			String returnStr = hkglUCCImpl.checkBodyByLx(confirmHead.getId(),
					radioValue);
			response.getWriter().write(returnStr);
		}
		return null;
	}

	/**
	 * 查询确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmBodyByConfirmHeadId() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String qrrbh = request.getParameter("qrrbh");
		String type = request.getParameter("type");
		String json = hkglUCCImpl.findConfirmBodyByConfirmHeadId(confirmHeadId,
				type, qrrbh);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 将处置项目信息存入到body里面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveCZtoConfirmBody() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String ids = request.getParameter("ids");
		hkglUCCImpl.saveCZtoConfirmBody(confirmHeadId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 将清算信息保存到body里面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveQStoConfirmBody() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String ids = request.getParameter("ids");
		hkglUCCImpl.saveQStoConfirmBody(confirmHeadId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 将债券信息保存到body里面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveZQtoConfirmBody() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String ids = request.getParameter("ids");
		hkglUCCImpl.saveZQtoConfirmBody(confirmHeadId, ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 将实体信息保存到body里面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveSTtoConfirmBody() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String ids = request.getParameter("ids");
		String stlx = request.getParameter("stlx");
		hkglUCCImpl.saveSTtoConfirmBody(confirmHeadId, ids, stlx);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 将其他信息保存到body里面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveQTtoConfirmBody() throws IOException {
		hkglUCCImpl.saveQTtoConfirmBody(confirmBody);
		return "qita";
	}

	/**
	 * 删除确认表体信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String deleteConfirmBody() throws IOException {
		String ids = request.getParameter("ids");
		String confirmHeadId = request.getParameter("confirmHeadId");
		hkglUCCImpl.deleteConfirmBody(ids,confirmHeadId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("删除成功！");
		return null;
	}

	/**
	 * 修改处置项目表体
	 * 
	 * @return
	 */
	public String updataCZtoConfirmBody() {
		String czSfwb = request.getParameter("czSfwb");
		String czCzsr = request.getParameter("czCzsr");
		String czYkczfy = request.getParameter("czYkczfy");
		String czFycpje = request.getParameter("czFycpje");
		String czCpqr = request.getParameter("czCpqr");
		String czSfjs = request.getParameter("czSfjs");
		String id = request.getParameter("id");
		hkglUCCImpl.updateCZtoConfirmBody(czSfwb, czCzsr, czYkczfy, czFycpje,
				czCpqr, czSfjs, id);
		return null;
	}

	/**
	 * 修改债券表体
	 * 
	 * @return
	 */
	public String updataZQtoConfirmBody() {
		String zqHszjxz = request.getParameter("zqHszjxz");
		String zqDyyz = request.getParameter("zqDyyz");
		String zqHxsr = request.getParameter("zqHxsr");
		String zqHxfy = request.getParameter("zqHxfy");
		String zqHswb = request.getParameter("zqHswb");
		String zaLxhsje = request.getParameter("zaLxhsje");
		String zqLxqj = request.getParameter("zqLxqj");
		String id = request.getParameter("id");
		hkglUCCImpl.updateZQtoConfirmBody(zqHszjxz, zqDyyz, zqHxsr, zqHxfy,
				zqHswb, zaLxhsje, zqLxqj, id);
		return null;
	}

	/**
	 * 修改实体表体
	 * 
	 * @return
	 */
	public String updateSTtoConfirmBody() {
		String gqHkxz = request.getParameter("gqHkxz");
		String gqQlzt = request.getParameter("gqQlzt");
		String gqHsxjje = request.getParameter("gqHsxjje");
		String id = request.getParameter("id");
		hkglUCCImpl.updateSTtoConfirmBody(gqHkxz, gqQlzt, gqHsxjje, id);
		return null;
	}

	/**
	 * 修改其他表体
	 * 
	 * @return
	 */
	public String updataQTtoConfirmBody() {
		hkglUCCImpl.updateQTtoConfirmBody(confirmBody);
		return "qita";
	}

	/**
	 * 确认表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String confirmThisBody() throws IOException {
		String ids = request.getParameter("ids");
		hkglUCCImpl.confirmThisBody(ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 查找部门内的确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmInfoInDept() throws IOException {
		String headId = request.getParameter("headId");
		String deptId = request.getParameter("deptId");
		String json = hkglUCCImpl.findConfirmInfoInDept(headId, deptId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 查找出了部门以后的确认信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findConfirmInfoOutDept() throws IOException {
		String headId = request.getParameter("headId");
		String json = hkglUCCImpl.findConfirmInfoOutDept(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 查看确认信息的详细信息
	 * 
	 * @return
	 */
	public String queryConfirmInfoOutDept() {
		String confirmHeadId = request.getParameter("id");
		String qrdlx = request.getParameter("qrdlx");
		String qrrbh = request.getParameter("qrrbh");
		if (confirmHeadId == null) {
			return null;
		} else {
			if ("固定资产处置确认单".equals(qrdlx)) {
				qrdlx = "chuzhi";
			} else if ("固定资产租赁确认单".equals(qrdlx)) {
				qrdlx = "qingsuan";
			} else if ("承继债券投资回收款确认单".equals(qrdlx)) {
				qrdlx = "zhaiquan";
			} else if ("承继股权投资回收款确认单".equals(qrdlx)) {
				qrdlx = "shiti";
			} else if ("其他业务收款确认单".equals(qrdlx)) {
				qrdlx = "qita";
			}
			request.setAttribute("qrrbh", qrrbh);
			request.setAttribute("confirmHeadId", confirmHeadId);
			request.setAttribute("isQuery", "true");
			return qrdlx;
		}
	}

	/**
	 * 确认为部门内最终回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String confirmDept() throws IOException {
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String fzrbh = String.valueOf(userBo.getTid()); // 部门负责人编号
		String fzrmc = userBo.getUsername(); // 负责人名称
		String qrbmbh = request.getParameter("qrbmbh");
		String cashid = request.getParameter("headId");
		String confirmHeadId = request.getParameter("confirmHeadId");
		String flag = hkglUCCImpl.checkDeptEnd(cashid, qrbmbh, confirmHeadId,
				fzrbh, fzrmc);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(flag);
		return null;
	}

	/**
	 * 取消确认部门回款
	 * 
	 * @return
	 * @throws IOException
	 */
	public String cancleConfirmDept() throws IOException {
		String confirmHeadId = request.getParameter("confirmHeadId");
		String flag = hkglUCCImpl.cancleConfirmDept(confirmHeadId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(flag);
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */
	public BizBackCashInfo getHead() {
		return head;
	}

	public void setHead(BizBackCashInfo head) {
		this.head = head;
	}

	public BizBackConfirmBody getConfirmBody() {
		return confirmBody;
	}

	public void setConfirmBody(BizBackConfirmBody confirmBody) {
		this.confirmBody = confirmBody;
	}

	public BizBackConfirmHead getConfirmHead() {
		return confirmHead;
	}

	public void setConfirmHead(BizBackConfirmHead confirmHead) {
		this.confirmHead = confirmHead;
	}

}
