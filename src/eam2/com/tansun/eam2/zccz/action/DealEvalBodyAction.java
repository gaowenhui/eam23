package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.model.orm.bo.CzPgxxLsb;
import com.tansun.eam2.zccz.ucc.IDealEvalBodyService;
import com.tansun.eam2.zccz.vo.CzPgxxLsbVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class DealEvalBodyAction extends CommonAction {
	Log log = LogFactory.getLog(this.getClass());

	private String assetIds;
	private String assetType;
	private String cldId;
	private ICodeService codeService;
	private String deleteId; // 删除CzPgxxLsb ID
	private Paginator paginator = new Paginator();
	private CzPgxxLsb cpl = new CzPgxxLsb();

	private IDealEvalBodyService bodyService;

	@Autowired
	public void setCodeService(ICodeService codeService) {
		this.codeService = codeService;
	}

	/**
	 * 取得经营性固定资产列表的Json字符串
	 */
	@SuppressWarnings("unchecked")
	public String getBodyPageJson() {
		String returnStr = null;
		response.setCharacterEncoding("UTF-8");
		try {
			PageableList voPage = bodyService.getDealEvalVOPage(paginator,
					cldId, "0");
			List<CzPgxxLsbVO> resList = new ArrayList<CzPgxxLsbVO>();
			for (CzPgxxLsb lsb : (List<CzPgxxLsb>) voPage.getResults()) {
				CzPgxxLsbVO vo = new CzPgxxLsbVO();
				vo.copyValue(lsb);
				vo.setPgffName(codeService.findCodeValueByCodeTypeAndCodeKey(
						"ESTIMATE_METHOD", lsb.getPgff()));
				vo.setJzlxName(codeService.findCodeValueByCodeTypeAndCodeKey(
						"ESTIMATE_VALUE_TYPE", lsb.getCJzlx()));
				vo.setCzfsName(codeService.findCodeValueByCodeTypeAndCodeKey(
						"ASSET_DISPOSE_METHOD", lsb.getCCzfs()));
				vo.setSfName(codeService.findCodeValueByCodeTypeAndCodeKey(
						"PROVIENCE", lsb.getGqstsf()));

				if (StringUtils.isNotEmpty(lsb.getGqstglbm())) {
					if ("1".equals(lsb.getGqstglbm())) {
						vo.setStglbmName("委托代理业务部");
					} else if ("2".equals(lsb.getGqstglbm())) {
						vo.setStglbmName("资产管理处置部");
					}
				}
				if (StringUtils.isNotEmpty(lsb.getZqzl())) {
					if (StringUtils.equals("1", lsb.getZqzl()))
						vo.setZqzlName("信达转让");
					else if (StringUtils.equals("2", lsb.getZqzl()))
						vo.setZqzlName("建银转让");
					else if (StringUtils.equals("3", lsb.getZqzl()))
						vo.setZqzlName("其它");
				}
				vo.setZjfdValue(lsb.getZjfd() == null ? 0D
						: lsb.getZjfd() * 100);
				/**
				 * lsb.setZczmjz(lsb.getZczmjz()==null?0D:lsb.getZczmjz()/10000);
				 * lsb.setZcybyz(lsb.getZcybyz()==null?0D:lsb.getZcybyz()/10000);
				 * lsb.setZjz(lsb.getZjz() == null?0D:lsb.getZjz()/10000);
				 * lsb.setPingguzhi(lsb.getPingguzhi() ==
				 * null?0D:lsb.getPingguzhi()/10000);
				 * lsb.setGqjzrjzcz(lsb.getGqjzrjzcz() ==
				 * null?0D:lsb.getGqjzrjzcz()/10000);
				 * lsb.setPgjzrzmzqz(lsb.getPgjzrzmzqz() ==
				 * null?0D:lsb.getPgjzrzmzqz()/10000); lsb.setZjfd(lsb.getZjfd() ==
				 * null?0D:lsb.getZjfd()*100); lsb.setJzrzmjz(lsb.getJzrzmjz() ==
				 * null ? 0D:lsb.getJzrzmjz()/10000);
				 */
				resList.add(vo);
			}
			if (voPage != null) {
				returnStr = BodyListToJSON.getJSON(resList, voPage
						.getPaginator().getPageCount(), voPage.getPaginator()
						.getCurrentPage(), voPage.getPaginator().getCount());
				response.getWriter().print(returnStr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 保存表体
	 * 
	 * @return
	 */
	public String saveBody() {
		String id = request.getParameter("id");
		String czpgscclid = (String) request.getSession().getAttribute(
				"zcczpgscclid");
		String pgzclb = request.getParameter("pgzclb");
		cpl.setPgzclb(pgzclb);
		bodyService.saveBodyInfo(cpl, id, czpgscclid);
		return null;
	}

	/**
	 * 取得实体内资产列表的Json字符串
	 */
	public String viewBodyList() {
		try {
			String czpgscclid = (String) request.getSession().getAttribute(
					"zcczpgscclid");
			List<CzPgxxLsb> list = bodyService.getCzPgxxLsbList(czpgscclid);
			/*
			 * Double pingguzhi = 0D; for(CzPgxxLsb vo: (List<CzPgxxLsb>)list){
			 * pingguzhi += (vo.getPingguzhi()==null?0D:vo.getPingguzhi());
			 * vo.setPingguzhi(vo.getPingguzhi()/10000); }
			 */
			CommonBO[] boArray = new CommonBO[list.size()];
			list.toArray(boArray);
			String jsonString = "";
			jsonString = BodyListToJSON.getJSON(boArray, paginator
					.getPageCount(), paginator.getCurrentPage(), paginator
					.getCount());

			StringBuffer returnSB = new StringBuffer(jsonString);
			/*
			 * String ss = ",\"userdata\":{\"pingguzhi\":\"" + (pingguzhi/10000) +
			 * "\",\"stcfwz\":\"合计(万元):\"}";
			 * returnSB.insert(returnSB.length()-1, ss);
			 */
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnSB.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 增加表体记录
	 * 
	 * @return
	 */
	public String addBodys() {
		String returnStr = null;
		try {
			bodyService.addBodys(assetIds.split(","), assetType, cldId);
			returnStr = "success";
		} catch (Exception e) {
			e.printStackTrace();
			returnStr = "添加资产失败，请联系管理员！";
		}
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 删除实体内资产
	 */
	public String deleteBody() {
		try {
			if (deleteId != null) {
				String[] id = deleteId.split(",");
				bodyService.deleteBody(cldId, id);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print("删除成功!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 删除经营性固定资产body
	public String delAsset() {
		try {
			bodyService.delAssets(cldId, assetIds);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 打开编辑评估信息的页面
	public String editPgxx() {
		cpl = bodyService.getpgXxLsbById(cpl.getId());
		return "editPgxx";
	}

	// 提交评估信息
	public String submitPgxx() {
		try {
			bodyService.updatePgxx(cpl);
			response.getWriter().print("SUCCESS");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 更新股权基准日价值
	public String updateBodyGqjzrjzcz() {
		try {
			String id = request.getParameter("id");
			String gqjzrjzcz = request.getParameter("gqjzrjzcz");
			String pingguzhi = request.getParameter("pingguzhi");
			bodyService.updateGqjzrjzcz(id, Double.parseDouble(gqjzrjzcz),
					Double.parseDouble(pingguzhi));
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	// 更新债权基准日价值
	public String updateBodyPgjzrzmzqz() {
		try {
			String id = request.getParameter("id");
			String pgjzrzmzqz = request.getParameter("pgjzrzmzqz");
			String pingguzhi = request.getParameter("pingguzhi");
			bodyService.updatePgjzrzmzqz(id,
					Double.parseDouble(pgjzrzmzqz), Double
							.parseDouble(pingguzhi));
		} catch (Exception e) {
			if (log.isDebugEnabled()) {
				log.debug(e.getStackTrace());
			}
		}
		return null;
	}

	@Autowired
	public void setBodyService(IDealEvalBodyService bodyService) {
		this.bodyService = bodyService;
	}

	public void setCldId(String cldId) {
		this.cldId = cldId;
	}

	public void setAssetIds(String assetIds) {
		this.assetIds = assetIds;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(String deleteId) {
		this.deleteId = deleteId;
	}

	public CzPgxxLsb getCpl() {
		return cpl;
	}

	public void setCpl(CzPgxxLsb cpl) {
		this.cpl = cpl;
	}

	public String getAssetIds() {
		return assetIds;
	}

	public String getAssetType() {
		return assetType;
	}

	public String getCldId() {
		return cldId;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public IDealEvalBodyService getBodyService() {
		return bodyService;
	}

}
