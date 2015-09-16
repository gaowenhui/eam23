package com.tansun.eam2.wtdk.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.ucc.ILoansQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.LoansQueryUCCImpl;
import com.tansun.eam2.wtdk.vo.FuncQueryVO;
import com.tansun.eam2.wtdk.vo.LoansQueryVO;
import com.tansun.eam2.wtdk.vo.LoansRiskVO;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;

/**
 * 
 * @author 陈煜霄
 * @date 2010-12-04
 */
public class LoansQueryAction extends CommonAction implements IExport {

	private LoansQueryVO queryVO;
	private FuncQueryVO funcVO;
	private Paginator paginator;
	private LoansRiskVO riskVO;
	@Autowired
	private ILoansQueryUCC loansQueryUCCImpl;
	@Autowired
	private IFuncQueryUCC funcQueryUCCImpl;
	@Autowired
	private IUserUCC iUserUCCimpl;

	/**
	 * 进入贷款查询页面
	 * 
	 * @return
	 */
	public String init() {
		// Added by liubeibei.
		String cldId = this.request.getParameter("cldId");
		this.request.setAttribute("zcczCldId", cldId);
		String ctlButton = this.request.getParameter("ctlButton");
		String assetType = this.request.getParameter("assetType");
		this.request.setAttribute("assetType", assetType);
		this.request.setAttribute("ctlButton", ctlButton);
		// ---------End---- liubeibei.
		String zcczpg = request.getParameter("zcczpg");
		String ispgsc = request.getParameter("ispgsc");
		request.setAttribute("zcczpg", zcczpg);
		request.setAttribute("ispgsc", ispgsc);
		return "init";
	}

	/**
	 * 贷款查询功能
	 * 
	 * @return
	 * @throws IOException
	 * @throws UnsupportedEncodingException
	 */
	public String query() throws IOException {
		if (queryVO == null) {
			queryVO = new LoansQueryVO();
		} else {
			if (queryVO.getFirstBranch() != null
					&& !"".equals(queryVO.getFirstBranch())) {
				String first = queryVO.getFirstBranch();
				first = first.substring(1, 4);
				queryVO.setFirstBranch(first);
			}
		}
		String cusomersJSON = loansQueryUCCImpl.query(queryVO, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cusomersJSON);
		return null;
	}

	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if (queryVO == null) {
			queryVO = new LoansQueryVO();
		} else {
			if (queryVO.getFirstBranch() != null
					&& !"".equals(queryVO.getFirstBranch())) {
				String first = queryVO.getFirstBranch();
				first = first.substring(1, 4);
				queryVO.setFirstBranch(first);
			}
		}
		if (loansQueryUCCImpl == null) {
			loansQueryUCCImpl = (ILoansQueryUCC) SpringContextHelper
					.getBean(LoansQueryUCCImpl.class);
		}
		String cusomersJSON = loansQueryUCCImpl.query(queryVO, paginator);
		return cusomersJSON;
	}

	/**
	 * 贷款详细信息
	 * 
	 * @return
	 */
	public String loansInfo() {
		String lnNo = request.getParameter("lnNo");
		queryVO = loansQueryUCCImpl.findLoansInfoByLnNo(lnNo);
		String funcNo = loansQueryUCCImpl.findRiskInfoByLnNo(lnNo)
				.getSaSysAcctNo();
		String mingxiJSON = loansQueryUCCImpl.bjMxQuery(lnNo);
		if (!"".equals(funcNo) && funcNo != null) {
			funcVO = funcQueryUCCImpl.findFuncInfoByFuncNo(funcNo);
		}
		request.setAttribute("mingxiJSON", mingxiJSON);
		return "loansInfo";
	}

	public String loansInfoNew() {
		String ispgsc = request.getParameter("ispgsc");
		String lnNo = request.getParameter("lnNo");
		String newAdd = request.getParameter("newAdd");
		String fslx = request.getParameter("fslx");
		String ctlButton = request.getParameter("ctlButton");
		String assetType = request.getParameter("assetType");
		String zcczpg = request.getParameter("zcczpg");
		String zcczCldId = request.getParameter("zcczCldId");
		request.setAttribute("ispgsc", ispgsc);
		request.setAttribute("newAdd", newAdd);
		request.setAttribute("fslx", fslx);
		request.setAttribute("ctlButton", ctlButton);
		request.setAttribute("assetType", assetType);
		request.setAttribute("zcczpg", zcczpg);
		request.setAttribute("zcczCldId", zcczCldId);
		request.setAttribute("lnNo", lnNo);
		return "loansInfoNew";
	}

	/**
	 * 基本信息
	 * 
	 * @return
	 */
	public String jibenxinxi() {
		String lnNo = request.getParameter("lnNo");
		queryVO = loansQueryUCCImpl.findLoansInfoByLnNo(lnNo);
		return "jibenxinxi";
	}

	/**
	 * 贷款明细
	 * 
	 * @return
	 */
	public String daikuanbenjinmingxi() {
		String lnNo = request.getParameter("lnNo");
		String mingxiJSON = loansQueryUCCImpl.bjMxQuery(lnNo);
		request.setAttribute("mingxiJSON", mingxiJSON);
		return "daikuanbenjinmingxi";
	}

	/**
	 * 关联基金
	 * 
	 * @return
	 */
	public String guanlianjijin() {
		String lnNo = request.getParameter("lnNo");
		String funcNo = loansQueryUCCImpl.findRiskInfoByLnNo(lnNo)
				.getSaSysAcctNo();
		if (!"".equals(funcNo) && funcNo != null) {
			funcVO = funcQueryUCCImpl.findFuncInfoByFuncNo(funcNo);
		}
		return "guanlianjijin";
	}

	/**
	 * 打开担险页面
	 * 
	 * @return
	 */
	public String loansRisk() {
		String lnNo = request.getParameter("lnNo");
		riskVO = loansQueryUCCImpl.findRiskInfoByLnNo(lnNo);
		if (riskVO.getLnAcctNo() == null || "".equals(riskVO.getLnAcctNo())) {
			queryVO = loansQueryUCCImpl.findLoansInfoByLnNo(lnNo);
			riskVO = new LoansRiskVO();
			Date date = new Date();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd").format(date);
			riskVO.setRiskDate(dateStr);
			riskVO.setLnAcctNo(queryVO.getLnLnAcctNo());
			riskVO.setMagDpt(queryVO.getFirstBranch());// 管理部门
			riskVO.setCCustName(queryVO.getLnCustName());// 贷款方名称
			riskVO.setCCustId(queryVO.getLnCustNo());// 贷款方客户编号
			riskVO.setDAcctNo(queryVO.getDAcctNo());// 委托方客户编号
			riskVO.setCAcctNo(queryVO.getLnCAcctNo());// 客户贷款账号
			request.setAttribute("saveORupdate", "save");
		} else {
			// if (("".equals(riskVO.getRiskReason()) || riskVO.getRiskReason()
			// == null)
			// && (riskVO.getLnAcctNo() != null || !"".equals(riskVO
			// .getLnAcctNo()))) {
			// queryVO = loansQueryUCCImpl.findLoansInfoByLnNo(lnNo);
			// Date date = new Date();
			// String dateStr = new SimpleDateFormat("yyyy-MM-dd")
			// .format(date);
			// riskVO.setRiskDate(dateStr);
			// riskVO.setLnAcctNo(queryVO.getLnLnAcctNo());
			// riskVO.setMagDpt(queryVO.getFirstBranch());// 管理部门
			// riskVO.setCCustName(queryVO.getLnCustName());// 贷款方名称
			// riskVO.setCCustId(queryVO.getLnCustNo());// 贷款方客户编号
			// riskVO.setDAcctNo(queryVO.getDAcctNo());// 委托方客户编号
			// riskVO.setCAcctNo(queryVO.getLnCAcctNo());// 客户贷款账号
			// request.setAttribute("saveORupdate", "update");
			// } else {
			request.setAttribute("saveORupdate", "update");
			// }
		}
		return "loansRisk";
	}

	/**
	 * 保存或修改担险信息
	 * 
	 * @return
	 */
	public String saveOrUpdateWdDXInfor() {
		String type = request.getParameter("type");
		if ("save".equals(type)) {
			if (riskVO.getVerLostJe() == null) {
				riskVO.setVerLostJe(0D);
			}
			if (riskVO.getLostJe() == null) {
				riskVO.setLostJe(0D);
			}
			if (riskVO.getVerLostRate() == null) {
				riskVO.setVerLostRate(0D);
			}
			if (riskVO.getLostRate() == null) {
				riskVO.setLostRate(0D);
			}

			loansQueryUCCImpl.saveWdDXInfo(riskVO);
		} else {
			loansQueryUCCImpl.updateWdDXInfo(riskVO);
		}
		request.setAttribute("message", "保存成功");
		return "loansRisk";
	}

	/**
	 * 点击关联执行
	 * 
	 * @return
	 * @throws IOException
	 */
	public String relate() throws IOException {
		String funcNo = request.getParameter("funcNo");
		String saveORupdate = request.getParameter("saveORupdate");
		FuncQueryVO func = new FuncQueryVO();
		func = funcQueryUCCImpl.findFuncInfoByFuncNo(funcNo);
		String saNo = func.getSaAcctNo();// 系统基金账号
		String saCust = func.getSaCustAcctNo();// 客户基金账号
		// riskVO.setSaSysAcctNo(saNo);
		// riskVO.setSavCustAcctNo(saCust);
		// request.setAttribute("saveORupdate", saveORupdate);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(saNo + "=" + saCust);
		return null;
	}

	/**
	 * 打开关联页面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String loansRelateToFunc() throws IOException {
		String loansId = request.getParameter("loansId");
		String json = loansQueryUCCImpl.findRelate(loansId);
		request.setAttribute("loansId", loansId);
		request.setAttribute("json", json);
		return "loansAndFunc";
	}

	/**
	 * 查找关联
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryRelate() throws IOException {
		String loansId = request.getParameter("loansId");
		String json = loansQueryUCCImpl.findRelate(loansId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 打开贷款基金关联的添加页面
	 * 
	 * @return
	 */
	public String loansRelateToFuncAdd() {
		String loansId = request.getParameter("loansId");
		queryVO = loansQueryUCCImpl.findLoansInfoByLnNo(loansId);
		riskVO = new LoansRiskVO();
		riskVO.setLnAcctNo(queryVO.getLnLnAcctNo());// 贷款系统账号
		riskVO.setMagDpt(queryVO.getFirstBranch());// 管理部门
		riskVO.setCCustName(queryVO.getLnCustName());// 贷款方名称
		riskVO.setCCustId(queryVO.getLnCustNo());// 贷款方客户编号
		riskVO.setDAcctNo(queryVO.getDAcctNo());// 委托方客户编号
		riskVO.setCAcctNo(queryVO.getLnCAcctNo());// 贷款客户账号
		Long userId = UserThreadLocal.get().getUserTid();
		PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
		String ngrmc = userBo.getUsername();
		riskVO.setFundAccountsTaster(ngrmc);
		request.setAttribute("saveORupdate", "save");
		return "relateAdd";
	}

	/**
	 * 贷款基金关联的修改页面
	 * 
	 * @return
	 */
	public String loansRelateToFuncEdit() {
		String xulie = request.getParameter("xulie");
		riskVO = loansQueryUCCImpl.findRelateInfoByXuLie(xulie);
		riskVO.setXulie(xulie);
		request.setAttribute("saveORupdate", "update");
		return "relateAdd";
	}

	/**
	 * 通过序列删除关联
	 * 
	 * @return
	 * @throws IOException
	 */
	public String loansRelateToFuncDelete() throws IOException {
		String xulie = request.getParameter("xulie");
		loansQueryUCCImpl.deleteRelateInfoByXuLie(xulie);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("删除成功！");
		return null;
	}

	/**
	 * 保存或修改关联信息
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveOrUpdateRenateInfor() throws IOException {
		String type = request.getParameter("type");
		String cAcctNo = request.getParameter("cAcctNo");
		String fundAccountsTaster = request.getParameter("fundAccountsTaster");
		String magDpt = request.getParameter("magDpt");
		String CCustName = request.getParameter("CCustName");
		String lnAcctNo = request.getParameter("lnAcctNo");
		String CCustId = request.getParameter("CCustId");
		String saSysAcctNo = request.getParameter("saSysAcctNo");
		String savCustAcctNo = request.getParameter("savCustAcctNo");
		String xulieget = request.getParameter("xulie");
		riskVO = new LoansRiskVO();
		riskVO.setCAcctNo(cAcctNo);
		riskVO.setFundAccountsTaster(fundAccountsTaster);
		riskVO.setMagDpt(magDpt);
		riskVO.setCCustName(CCustName);
		riskVO.setLnAcctNo(lnAcctNo);
		riskVO.setCCustId(CCustId);
		riskVO.setSaSysAcctNo(saSysAcctNo);
		riskVO.setSavCustAcctNo(savCustAcctNo);
		if ("save".equals(type)) {
			String xulie = java.util.UUID.randomUUID().toString();
			xulie = xulie.replace("-", "");
			riskVO.setXulie(xulie);
			loansQueryUCCImpl.saveRenateInfo(riskVO);
		} else {
			riskVO.setXulie(xulieget);
			loansQueryUCCImpl.updateRenateInfo(riskVO);
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("保存成功！");
		return null;
	}

	/**
	 * 打开抵质押物信息页面
	 * 
	 * @return
	 */
	public String dizhiyawu() {
		String newAdd = request.getParameter("newAdd");
		String fslx = request.getParameter("fslx");
		String loansId = request.getParameter("loansId");
		String ctlButton = request.getParameter("ctlButton");
		String assetType = request.getParameter("assetType");
		String zcczpg = request.getParameter("zcczpg");
		String zcczCldId = request.getParameter("zcczCldId");
		request.setAttribute("newAdd", newAdd);
		request.setAttribute("fslx", fslx);
		request.setAttribute("loansId", loansId);
		request.setAttribute("ctlButton", ctlButton);
		request.setAttribute("assetType", assetType);
		request.setAttribute("zcczpg", zcczpg);
		request.setAttribute("zcczCldId", zcczCldId);
		return "dizhiyawu";
	}

	/**
	 * 打开处置信息页面
	 * 
	 * @return
	 */
	public String chuzhixinxi() {
		String loansId = request.getParameter("loansId");
		request.setAttribute("loansId", loansId);
		return "zhuzhixinxi";
	}

	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * 
	 * @return
	 */
	public String findCzXxList() {
		String loansId = request.getParameter("loansId");
		String jsonStr = this.loansQueryUCCImpl.findCzXxList(loansId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 根据选择的项目得到项目下的资产列表
	 * 
	 * @return
	 */
	public String findAssetByCzXxList() {
		String loansId = request.getParameter("loansId");
		String cldId = request.getParameter("cldId");
		String xmId = request.getParameter("xmId");
		String jsonStr = this.loansQueryUCCImpl.findAssetByCzXxList(loansId,
				cldId, xmId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * excel勾选导出
	 * 
	 * @return
	 * @throws IOException
	 */
	public String excelCheck() throws IOException {
		String params = request.getParameter("idStr");
		String json = loansQueryUCCImpl.query4excel(params);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 以下为用到的getter setter
	 */
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public LoansQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(LoansQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public LoansRiskVO getRiskVO() {
		return riskVO;
	}

	public void setRiskVO(LoansRiskVO riskVO) {
		this.riskVO = riskVO;
	}

	public FuncQueryVO getFuncVO() {
		return funcVO;
	}

	public void setFuncVO(FuncQueryVO funcVO) {
		this.funcVO = funcVO;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryVO = (LoansQueryVO) excelVO;
	}

}
