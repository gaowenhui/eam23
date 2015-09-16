package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CardAssetHistory;
import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcRisk;
import com.tansun.eam2.common.model.orm.bo.JyzcRiskLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.jygdzc.JygdzcCommonImpl;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.AssetCardVO;
import com.tansun.eam2.jygdzc.vo.AssetInfoVO;
import com.tansun.eam2.jygdzc.vo.JygdzcRcglVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxBuilding;
import com.tansun.eam2.jygdzc.vo.JyzcXxElse;
import com.tansun.eam2.jygdzc.vo.JyzcXxMain;
import com.tansun.eam2.jygdzc.vo.JyzcXxVehicle;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.eam2.ssgl.ucc.ISsglUCC;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.generalapps.user.ucc.IUserUCC;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 * 资产管理
 * 
 * @author lihuan
 * 
 */

public class AssetManageBodyAction extends CommonAction {
	// 处理单
	public String sheettype;
	// jyzcXxLsb临时表
	public JyzcXxLsb jyzcXxLsb;
	// JyzcXx资产表
	public JyzcXx jyzcXx;
	// 资产主信息
	public JyzcXxMain jyzcXxMain;
	// 建筑物
	public JyzcXxBuilding jyzcXxBuilding;
	// 车辆
	public JyzcXxVehicle jyzcXxVehicle;
	// 设备及其他
	public JyzcXxElse jyzcXxElse;
	// 风险、
	public JyzcSqsdfyXx jyzcSqsdfyXx;
	public Paginator paginator = new Paginator();
	// 资产卡片关系表
	public CardAssetHistory cardAssetHistory;
	public Recordhistory recordhistory;
	public JyzcRiskLsb jyzcRiskLsb;
	public JyzcRisk jyzcRisk;
	public String message;//控制保存是否成功
	// 接口
	@Autowired
	public IAssetUCC assetUCCImpl;
	@Autowired
	public IUserUCC iUserUCCimpl;
	@Autowired
	private ISsglUCC ssglUCCImpl;
//	@Autowired
//	private ICardCommonUCC cardCommonUCCImpl;
	// 资产Id
	public String zcId;
	// 处理单
	public String headId;
	// 处理单业务类型 用来判断添加资产资产状态
	public String ywlx;
	//是否页面不可编辑
	public String isdisable;
	// 审批状态
	public String spzt;
	// 资产卡片关系表ID
	private String historyId;
	private List sqsdfyxxs;
	private AssetCardVO cardVO;
	private List jbhList;
	@Autowired
	JygdzcCommonImpl jygdzcCommonImpl;
	// 修改页面显示费用名称
	private JyzlViewVO jyzlViewVO;
	// 资产 及资产下卡片信息
	private AssetBodyVO assetBodyVO;
	private AssetInfoVO assetInfoVO;
	private String sheettype2;// 控制main 页面中输入框的控制
	@Autowired
	public ICodeGenerator iCodeGenerator;

	/**
	 * 生成处理单编号
	 * 
	 * @return
	 * 
	 */
	public String createNum() {
		String code = request.getParameter("code");
		String PROVINCE = request.getParameter("PROVINCE");
		String PROVINCEVALUE = assetUCCImpl.findCoteTagBycodeKey("PROVIENCE",
				PROVINCE);
		String code1 = iCodeGenerator.generateCurrentCode(code, "", "");
		String code2 = code1.replace("#1#", PROVINCEVALUE);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(code2);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public String regainNum() {
		String zcbh = request.getParameter("zcbh");
		String Identifier = request.getParameter("Identifier");
		headId = request.getParameter("headId");
		String exist = "no";
		if(headId!=null&&!"".equals(headId)&&zcbh!=null&&!"".equals(zcbh)&&"close".equals(Identifier)){
			exist = assetUCCImpl.codeExistyesORno(headId,zcbh);
		}
		if("no".equals(exist)){
			StringBuffer code =new StringBuffer(); 
			if(zcbh!=null&&""!=zcbh){
				String aa[] = zcbh.split("-");
				code.append(aa[0]);
				code.append("-");
				code.append("#1#");
				code.append("-");
				code.append(aa[2]);
			}
			try {
				iCodeGenerator.disableCurrentCode("zcbh", code.toString(), "");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("成功");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return null;
	}
	
	public String  addAsset(){
		ywlx = request.getParameter("ywlx");
		zcId  = request.getParameter("zcId");
		String result = assetUCCImpl.addAsset(zcId, ywlx);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 新增body入口 准备数据
	 * 
	 * @return
	 */
	public String newBody() {
		// 新添加一条记录
		if ("addInfo".equals(sheettype)) {
			// 新添一条数据
			jyzcXxLsb = new JyzcXxLsb();
			headId = request.getParameter("headId");
			jyzcXxLsb.setCldId(headId);
			// 设置录入人
			Long userId = UserThreadLocal.get().getUserTid();
			PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
			String userName = userBo.getUsername();
			// 录入人
			jyzcXxLsb.setLrr(userName);
			// 录入时间
			jyzcXxLsb.setLrrq(new Date());

			zcId = jyzcXxLsb.getId();
			request.setAttribute("headId", headId);
			request.setAttribute("sheettype", sheettype);
		}
		if ("manageInfo".equals(sheettype)) {
			String isAdd = request.getParameter("isAdd");
			String bmbh = request.getParameter("bmbh");
			String jbh = request.getParameter("jbh");
			String sfsjfy = request.getParameter("sfsjfy");
			request.setAttribute("sfsjfy", sfsjfy);
			if(jbh!=null&&!"".equals(jbh.trim())&&jbh.length()==4){
				jbh = jbh.substring(1);
			}
			jbhList = jygdzcCommonImpl.getFenhangTypeList();// 经办行list add by
			request.setAttribute("isAdd", "true");
			request.setAttribute("bmbh", bmbh);
			request.setAttribute("jbh", jbh);
		}
		return sheettype;
	}

	/**
	 * 新增入口 准备数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public String saveBody() throws IOException {
		sheettype = request.getParameter("sheettype");
		sheettype2 = request.getParameter("sheettype2");
		if ("change".equals(sheettype) || "check".equals(sheettype)
				|| "scrap".equals(sheettype) || "agentCheck".equals(sheettype)
				|| "agentScrap".equals(sheettype)) {
			headId = request.getParameter("headId");
			zcId = request.getParameter("zcId");
			if (zcId.startsWith(",")) {
				zcId = zcId.substring(1);
			}
			String[] zcIds = zcId.split(",");

			for (int i = 0; i < zcIds.length; i++) {
				// 根据查询得到的资产ID得到信息表的数据
				// 把信息表的数据转换为临时表
				// 给临时表设置相应的CLDID 保存起来
				jyzcXxLsb = new JyzcXxLsb();
				jyzcXx = assetUCCImpl.getJyzcXxById(zcIds[i]);
				jyzcXxLsb = assetUCCImpl.jyzc2Body(jyzcXx);
				jyzcXxLsb.setCldId(headId);
				assetUCCImpl.save(jyzcXxLsb);
				if ("change".equals(sheettype)) {
					List riskList = assetUCCImpl.getJyzcRiskByzczsbId(zcIds[i]);
					for (int x = 0; x < riskList.size(); x++) {
						jyzcRisk = (JyzcRisk) riskList.get(x);
						jyzcRiskLsb = new JyzcRiskLsb();
						assetUCCImpl.copyAtoB(jyzcRiskLsb, jyzcRisk);
						jyzcRiskLsb.setZcId(jyzcXxLsb.getId());
						assetUCCImpl.save(jyzcRiskLsb);
					}
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(zcId);
			return null;
		} else {
			String[] zcIds = zcId.split(",");

			if (zcId == null || "".equals(zcId)) {
				if (jyzcXxLsb == null) {
					jyzcXxLsb = new JyzcXxLsb();
				}
				assetUCCImpl.zcXxcopy(jyzcXxLsb, jyzcXxMain);
				assetUCCImpl.save(jyzcXxLsb);
			} else {
				jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
				if ("building".equals(sheettype)) {
					assetUCCImpl.zcXxcopy(jyzcXxLsb, jyzcXxBuilding);
				} else if ("main".equals(sheettype)) {

					assetUCCImpl.zcXxcopy(jyzcXxLsb, jyzcXxMain);

				} else if ("vehicle".equals(sheettype)) {

					assetUCCImpl.zcXxcopy(jyzcXxLsb, jyzcXxVehicle);

				} else if ("else".equals(sheettype)) {

					assetUCCImpl.zcXxcopy(jyzcXxLsb, jyzcXxElse);
				}

				assetUCCImpl.update(jyzcXxLsb);
				if ("change".equals(sheettype2)) {
					List<Recordhistory> recordhistoryList = assetUCCImpl
							.getRecordhistoryByzcId(zcId, headId, paginator);
					for (int d = 0; d < recordhistoryList.size(); d++) {
						recordhistory = recordhistoryList.get(d);
						assetUCCImpl.delete(recordhistory);
					}

					jyzcXx = assetUCCImpl.getJyzcXxByzclsbId(jyzcXxLsb.getId());
					assetUCCImpl.compareXxVsLsb(jyzcXx, jyzcXxLsb);
				}
			}

			zcId = jyzcXxLsb.getId();
			headId = jyzcXxLsb.getCldId();
			//message = ;
			request.setAttribute("zcId", zcId);
			request.setAttribute("message","保存成功");
			return "tomodify";
		}

	}

	/**
	 * 保存 主信息
	 * 
	 * @return
	 */
	public String modifyBody() { 
		isdisable = request.getParameter("isdisable");
		String sfsjfy = request.getParameter("sfsjfy");
		request.setAttribute("isdisable", isdisable);
		request.setAttribute("sfsjfy", sfsjfy);
		String  zcId1 = (String) request.getParameter("zcId");
		String  zcId2 =(String) request.getAttribute("zcId");
		if(zcId1!=null&&!"".equals(zcId1)){
			zcId = zcId1;
		} else {
			zcId = zcId2;
		}
		// headId = (String) request.getParameter("headId");
		if (sheettype.contains(",")) {
			sheettype = sheettype.substring(0, sheettype.indexOf(","));
		}
		sheettype2 = request.getParameter("sheettype2");
		if (zcId != null && !"".equals(zcId)) {
			if ("main".equals(sheettype) || "building".equals(sheettype)
					|| "vehicle".equals(sheettype) || "else".equals(sheettype)) {
				// jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
				assetBodyVO = assetUCCImpl.getAssetBodyVOByzcId(zcId);
				if ("building".equals(sheettype)) {
					jyzcXxBuilding = new JyzcXxBuilding();
					assetUCCImpl.copyZcXx(jyzcXxBuilding, assetBodyVO);
				} else if ("main".equals(sheettype)) {
					jyzcXxMain = new JyzcXxMain();
					assetUCCImpl.copyZcXx(jyzcXxMain, assetBodyVO);
					
				} else if ("vehicle".equals(sheettype)) {
					jyzcXxVehicle = new JyzcXxVehicle();
					assetUCCImpl.copyZcXx(jyzcXxVehicle, assetBodyVO);
				} else if ("else".equals(sheettype)) {
					jyzcXxElse = new JyzcXxElse();
					assetUCCImpl.copyZcXx(jyzcXxElse, assetBodyVO);
				}
			}
		} else {
			if ("main".equals(sheettype)) {
				jyzcXxMain = new JyzcXxMain();
				Long userId = UserThreadLocal.get().getUserTid();
				PTUserBO userBo = iUserUCCimpl.getSingleById(userId);
				String userName = userBo.getUsername();
				// 设置默认值
				jyzcXxMain.setLrr(userName);
				jyzcXxMain.setLrrq(new Date());
			}
		}
		if ("manageInfo".equals(sheettype) && zcId != null) {
			if (zcId.startsWith(",")) {
				zcId = zcId.substring(1);
			}
			String jbh = request.getParameter("jbh");
			if(jbh!=null&&jbh.trim()!=""&&jbh.length()==4){
				jbh = jbh.substring(1);
			}
			sqsdfyxxs = assetUCCImpl.getJyzcSqsdfyXxByZcId(zcId);// 根据临时表id得到申请审定金额，然后修改
			jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
			jyzcXx = assetUCCImpl.getJyzcXxByLsbZcid(zcId);// 根据临时表id得到信息表信息，然后得到信息表id得到管理部门，使用部门
			jbhList = jygdzcCommonImpl.getFenhangTypeList();// 经办行list add by
			assetInfoVO = assetUCCImpl.getAssetInfoVOByzcId(jyzcXx.getId());												// lantianbo
			assetInfoVO.setCFyzlValue(assetUCCImpl.getCFyzlValue(jyzcXxLsb
					.getCFyzl()));
			request.setAttribute("isRCModify", "true");// 设置修改标志，以便页面进行判断然后展示数据
			request.setAttribute("isChooseAsset", "true");
			request.setAttribute("jbh", jbh);
			request.setAttribute("chakan", request.getParameter("chakan"));
		}
		if("attachment".equals(sheettype)&&"change".equals(sheettype2)){
			jyzcXx = assetUCCImpl.getJyzcXxByLsbZcid(zcId);
			if(jyzcXx!=null){
				zcId = jyzcXx.getId();
			}
		}
		// request.setAttribute("zcId", zcId);
		return sheettype;
	}

	public String view() {
		headId = (String) request.getAttribute("headId");
		sheettype = (String) request.getAttribute("sheettype");
		jyzcXxLsb = (JyzcXxLsb) request.getAttribute("jyzcXxLsb");
		// 把经营表里的数据展示出来
		List<JyzcXxLsb> jyList = assetUCCImpl.getJyzcXxLsbsByHeadId(headId);
		CommonBO[] cb = new CommonBO[jyList.size()];
		jyList.toArray(cb);
		String bodyJSON = BodyListToJSON.getJSON(cb, 1, 1, 1);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 展示资产INFO
	// 信息====================================================================================
	public String viewAsset() {
		zcId = (String) request.getAttribute("zcId");
		sheettype = (String) request.getParameter("sheettype");
		sheettype2 = (String) request.getParameter("sheettype2");
		String zclx = (String) request.getParameter("zclx");
		if (zcId != null && !"".equals(zcId)) {
			// jyzcXx = assetUCCImpl.getJyzcXxById(zcId);
			assetInfoVO = assetUCCImpl.getAssetInfoVOByzcId(zcId);
			if ("buildingInfo".equals(sheettype)) {
				jyzcXxBuilding = new JyzcXxBuilding();
				assetUCCImpl.copyZcXx(jyzcXxBuilding, assetInfoVO);
			} else if ("mainInfo".equals(sheettype)) {
				jyzcXxMain = new JyzcXxMain();
				assetUCCImpl.copyZcXx(jyzcXxMain, assetInfoVO);
			} else if ("vehicleInfo".equals(sheettype)) {
				jyzcXxVehicle = new JyzcXxVehicle();
				assetUCCImpl.copyZcXx(jyzcXxVehicle, assetInfoVO);
			} else if ("elseInfo".equals(sheettype)) {
				jyzcXxElse = new JyzcXxElse();
				assetUCCImpl.copyZcXx(jyzcXxElse, assetInfoVO);
			}
		}
		request.setAttribute("zclx", zclx);
		request.setAttribute("sheettype2", sheettype2);
		return sheettype;
	}

	/**
	 * 删除 一条/多条
	 * 
	 * @return
	 */

	public String deleteBody() {

		zcId = request.getParameter("zcId");
		String[] zcIds = null;
		if (zcId.startsWith(",")) {
			zcId = zcId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		zcIds = zcId.split(",");
		if ("manage".equals(sheettype) || "agentManage".equals(sheettype)) { // 如果是日常管理的删除，那么删除临时表信息，并删除申请审定表信息，此方法在日常管理业务类型变化时用到
																				// addby
																				// lantianbo
			List list = assetUCCImpl.getJyzcXxLsbsByHeadId(headId);
			if (list.size() > 0) {
				for (int i = 0; i < list.size(); i++) {
					jyzcXxLsb = (JyzcXxLsb) list.get(i);
					assetUCCImpl.deleteJyzcSqsdfyXxByZcId(jyzcXxLsb.getId());
				}
			}
			assetUCCImpl.deleteLSBByCLDId(headId);
		} else if ("check".equals(sheettype)) {
			String headId = request.getParameter("headId");
			assetUCCImpl.deleteBodyAndCardLSB(zcIds, headId);
		} else if("agentCheck".endsWith(sheettype)){
			String headId = request.getParameter("headId");
			assetUCCImpl.deleteBodyAndCardLSB(zcIds, headId);
		}
		for (int i = 0; i < zcIds.length; i++) {
			jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcIds[i]);
			if (jyzcXxLsb != null) {
				assetUCCImpl.delete(jyzcXxLsb);
			}
			if ("add".equals(sheettype)) {
				List<CardAssetHistory> aa = assetUCCImpl.getCardAssetHistoryByZcId(zcIds[i]);
				for (int j = 0; j < aa.size(); j++) {
					assetUCCImpl.delete(aa.get(j));
				}
				List<JyzcRiskLsb> bb = assetUCCImpl.getJyzcRiskLsbByZcId(zcIds[i], paginator);
				for (int g = 0; g < bb.size(); g++) {
					JyzcRiskLsb jyzcRiskLsb = bb.get(g);
					assetUCCImpl.delete(jyzcRiskLsb);
					String fxbh = jyzcRiskLsb.getFxbh();
					try {
						iCodeGenerator.disableCurrentCode("fxbh", fxbh, "");
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				List<SsBaseinfo> cc = ssglUCCImpl.getSsBaseinfoByzcLsbId(zcIds[i], paginator);
				for (int l = 0; l < cc.size(); l++) {
					SsBaseinfo ssBaseinfo = cc.get(l);
					assetUCCImpl.delete(ssBaseinfo);
				}
				//收回资产编号
				StringBuffer code =new StringBuffer(); 
				String zcbh = jyzcXxLsb.getZcbh();
				if(zcbh!=null&&!"".equals(zcbh)){
					String codes[] = zcbh.split("-");
					code.append(codes[0]);
					code.append("-");
					code.append("#1#");
					code.append("-");
					code.append(codes[2]);
				}
				try {
					iCodeGenerator.disableCurrentCode("zcbh", code.toString(), "");
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else if ("change".equals(sheettype)) {
				List<Recordhistory> recordList = assetUCCImpl
						.getRecordhistoryByzcId(zcIds[i], headId, paginator);
				for (int z = 0; z < recordList.size(); z++) {
					recordhistory = recordList.get(z);
					assetUCCImpl.delete(recordhistory);
				}
				List riskLsbList = assetUCCImpl.getJyzcRiskLsbByZcId(zcIds[i],
						paginator);
				for (int c = 0; c < riskLsbList.size(); c++) {
					jyzcRiskLsb = (JyzcRiskLsb) riskLsbList.get(c);
					List<Recordhistory> recordriskList = assetUCCImpl
							.getRecordhistoryByzcId(jyzcRiskLsb.getId(),
									headId, paginator);
					for (int v = 0; v < recordriskList.size(); v++) {
						recordhistory = recordriskList.get(v);
						assetUCCImpl.delete(recordhistory);
					}
				}
			}
		}
		request.setAttribute("sheettype", sheettype);
		request.setAttribute("headId", headId);
		return null;
	}
	/**
	 * 资产挂接卡片查询页面
	 * @return
	 */
	public String init() {
		String isModal = request.getParameter("isModal"); // 模态窗口
		request.setAttribute("isModal", isModal);
		String batch = request.getParameter("batch"); // 批量选择
		request.setAttribute("batch", batch);
		return "cardQuery";
	}
	/**
	 * 资产挂接卡片
	 * 
	 * @return
	 */
	public String setCard() {
		zcId = request.getParameter("zcId");
		String cardId = request.getParameter("cardId");
		String[] cardIds = null;
		cardIds = cardId.split(",");
		for (int i = 0; i < cardIds.length; i++) {
			cardAssetHistory = assetUCCImpl.getCardAssetHistoryByZcId(zcId, cardIds[i]);
			if(cardAssetHistory==null){
				cardAssetHistory = new CardAssetHistory();
				cardAssetHistory.setZcId(zcId);
				cardAssetHistory.setKpId(cardIds[i]);
				cardAssetHistory.setGjksrq(new Date());// 挂接开始日期
				cardAssetHistory.setDqgjzt("0");
				cardAssetHistory.setSfwzkp("0");
				assetUCCImpl.save(cardAssetHistory);
			}
//			else {
//				Cardinfo cardinfo = cardCommonUCCImpl.findCardinfoByCardId(cardIds[i]);
//				String  message ="";
//			}
		}
		return null;
	}

	/**
	 * 根据删除资产下挂接的卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String deleteCard() throws IOException {
		historyId = request.getParameter("historyId");
		String[] historyIds = null;
		if (historyId.startsWith(",")) {
			historyId = historyId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		historyIds = historyId.split(",");
		for (int i = 0; i < historyIds.length; i++) {
			cardAssetHistory = assetUCCImpl
					.getcardAssetHistoryById(historyIds[i]);
			assetUCCImpl.delete(cardAssetHistory);
			response.getWriter().write("删除成功");
		}
		return null;
	}

	/**
	 * 查看资产下是否有主卡片
	 */
	public String cksfyzkp() {
		try {
			zcId = request.getParameter("zcId");
			String zkp = assetUCCImpl.cksfyzkp(zcId);
			StringBuffer sb = new StringBuffer();
			// sb.append("{\"").append(zkp).append("\"}");
			sb.append("{\"zkp\":\"").append(zkp).append("\"}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(sb.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void setMainCardByYbYz() {
		zcId = request.getParameter("zcId");
		assetUCCImpl.setMainCardByYbYz(zcId);
		try {
			response.getWriter().print("success");
		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	/**
	 * 设置主卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String setMainCard() {
		zcId = request.getParameter("zcId");
		historyId = request.getParameter("historyId");
		List historyList = assetUCCImpl.getCardAssetHistoryByZcId(zcId);
		if(historyList!=null&&historyList.size()>0){
			for (int i = 0; i < historyList.size(); i++) {
				CardAssetHistory aa = new CardAssetHistory();
				aa = (CardAssetHistory) historyList.get(i);
				aa.setSfwzkp("0");
				assetUCCImpl.update(aa);
			}
			cardAssetHistory = assetUCCImpl.getcardAssetHistoryById(historyId);
			cardAssetHistory.setSfwzkp("1");
			assetUCCImpl.update(cardAssetHistory);
		}
		try {
			response.getWriter().print("success");
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 设置主卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String checkCard() {
		String ids = request.getParameter("ids");
		String result ="成功";
		if(ids!=null||!"".equals(ids)){
			result = assetUCCImpl.checkCard(ids);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 日常管理，临时表信息选择资产
	 * 
	 * @return
	 */
	public String prepareValue() {
		String gr = request.getParameter("gr");
		String isAdd = request.getParameter("isAdd");
		String isRCModify = request.getParameter("isRCModify");
		if (gr != null && "true".equals(isAdd)) {
			// 根据id得到jyzcXxLsb 的信息
			assetInfoVO = assetUCCImpl.getAssetInfoVOByzcId(gr);
			List list = new ArrayList();
			list.add(assetInfoVO);
			String  bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(bodyJSON);
			} catch (IOException e) {
				e.printStackTrace();
			}
			//jyzcXx = assetUCCImpl.getJyzcXxById(gr);
			//jyzcXxLsb = assetUCCImpl.jyzc2Body(jyzcXx);
			//jyzcXxLsb.setId(null);
		} else if ("true".equals(isRCModify)) {
			String lsbId = jyzcXxLsb.getId();
			sqsdfyxxs = assetUCCImpl.getJyzcSqsdfyXxByZcId(lsbId);// 根据临时表id得到申请审定金额，然后修改
			jyzcXx = assetUCCImpl.getJyzcXxById(gr);
			jyzcXxLsb = assetUCCImpl.jyzc2Body(jyzcXx);
			jyzcXxLsb.setId(lsbId);
			request.setAttribute("isRCModify", isRCModify);// 设置日常修理临时表单为true
		}
		jbhList = jygdzcCommonImpl.getFenhangTypeList();// 经办行list add by
														// lantianbo
		request.setAttribute("isChooseAsset", "true");
		return sheettype;
	}
	
	public String prepareValue1() {
		String gr = request.getParameter("gr");
		if (gr != null) {
			// 根据id得到jyzcXxLsb 的信息
			assetInfoVO = assetUCCImpl.getAssetInfoVOByzcId(gr);
			List list = new ArrayList();
			list.add(assetInfoVO);
			String  bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(bodyJSON);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		return null;
	}

	/**
	 * 日常管理临时表添加，及申请审定费用表添加
	 * 
	 * @return
	 */
	public String addFy() {
		String isAdd = request.getParameter("isAdd");
		String isRCModify = request.getParameter("isRCModify");
		JyzcXxLsb zcLsb = new JyzcXxLsb();
		if ("true".equals(isAdd)) {
			// /////////添加一条body的数据
			jyzcXx = assetUCCImpl.getJyzcXxById(zcId);
			zcLsb = assetUCCImpl.jyzc2Body(jyzcXx);
			zcLsb.setId(null);
			zcLsb.setCldId(headId);
			zcLsb.setXlid(assetUCCImpl.getSend2ERPSEQ());
			zcLsb.setCFyzl(jyzcXxLsb.getCFyzl());
			zcLsb.setCEjfhbh(jyzcXxLsb.getCEjfhbh());
			zcLsb.setCJbhbh(jyzcXxLsb.getCJbhbh());
			zcLsb.setBlsm(jyzcXxLsb.getBlsm());
			zcLsb.setCJsfs(jyzcXxLsb.getCJsfs());
			zcLsb.setCBz(jyzcXxLsb.getCBz());
			assetUCCImpl.save(zcLsb);
		} else if ("true".equals(isRCModify)) {
			//zcLsb = assetUCCImpl.getJyzcXxLsbById(jyzcXxLsb.getId());
			jyzcXx = assetUCCImpl.getJyzcXxById(zcId);
			zcLsb = assetUCCImpl.jyzc2Body(jyzcXx);
			zcLsb.setId(jyzcXxLsb.getId());
			zcLsb.setCldId(headId);
			zcLsb.setXlid(assetUCCImpl.getSend2ERPSEQ());
			zcLsb.setCFyzl(jyzcXxLsb.getCFyzl());
			zcLsb.setCEjfhbh(jyzcXxLsb.getCEjfhbh());
			zcLsb.setCJbhbh(jyzcXxLsb.getCJbhbh());
			zcLsb.setBlsm(jyzcXxLsb.getBlsm());
			zcLsb.setCJsfs(jyzcXxLsb.getCJsfs());
			zcLsb.setCBz(jyzcXxLsb.getCBz());
			assetUCCImpl.update(zcLsb);
			assetUCCImpl.deleteJyzcSqsdfyXxByZcId(jyzcXxLsb.getId());
		}

		// 添加多条风险费用的信息
		String[] xmmc = request.getParameterValues("data1");
		String[] sqje = request.getParameterValues("data2");
		String[] sdje = request.getParameterValues("data3");
		if (xmmc != null && xmmc.length > 0) {
			for (int i = 0; i < xmmc.length; i++) {
				JyzcSqsdfyXx jyzcSqsdfyXx = new JyzcSqsdfyXx();
				if(xmmc[i]!=null&&""!=xmmc[i].trim()){
					jyzcSqsdfyXx.setXmmc(xmmc[i]);
					if(sqje!=null){
						String sqje1 = sqje[i].trim();
						jyzcSqsdfyXx.setSqje(Double.parseDouble(sqje1.length() > 0 ? sqje1 : "0"));
					}
					if(sdje!=null){
						String sdje1 = sdje[i].trim();
						jyzcSqsdfyXx.setSdje(Double.parseDouble(sdje1.length() > 0 ? sdje1 : "0"));
					}
					jyzcSqsdfyXx.setZcId(zcLsb.getId());
					jyzcSqsdfyXx.setCldId(headId);// 处理单id
					jyzcSqsdfyXx.setSpzt("0");
					assetUCCImpl.save(jyzcSqsdfyXx);
				}
			}
		}
		jbhList = jygdzcCommonImpl.getFenhangTypeList();// 经办行list add by
														// lantianbo
		request.setAttribute("message", "保存成功");
		return sheettype;
	}

	/**
	 * 查看 一条body信息 为相应的Body值准备数据
	 * 
	 * @return
	 */
	public String viewBody() {

		// 根据Id得到这条数据下的所有信息
		String zcId = request.getParameter("zcId");
		sheettype = (String) request.getParameter("sheettype");
		if (sheettype.contains(",")) {
			sheettype = sheettype.substring(0, sheettype.indexOf(","));

		}
		headId = request.getParameter("headId");
		jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
		// 多项风险信息
		List<JyzcRiskLsb> jyzcRiskList = assetUCCImpl.getJyzcRiskLsbByZcId(
				zcId, paginator);
		// 变动
		// List<jy> assetUCCImpl.g
		// 得到卡片信息
		request.setAttribute("sheettype", sheettype);
		return "tomodify";
	}

	public String query4View() throws IOException {
		headId = request.getParameter("headId");
		sheettype = request.getParameter("sheettype");
		spzt = request.getParameter("spzt");
		String json4RCGL = request.getParameter("json4RCGL");
		List<Recordhistory> recordList = null;
		List<AssetBodyVO> assetList = null;
		List<AssetCardVO> cardList = null;
		List<JyzcHead> jyzcHeadList = null;
		List<JygdzcRcglVO> JygdzcRcglVOList = null;
		String bodyJSON = null;
		try {
			if ("changeHistory".equals(sheettype)) {
				if ("pass".equals(spzt)) {
					String type = request.getParameter("type");
					if("change".equals(type)){
						jyzcXx = assetUCCImpl.getJyzcXxByLsbZcid(zcId);
						if(jyzcXx!=null){
							zcId = jyzcXx.getId();
						}
					}
					List zclsbIdList = assetUCCImpl.getLsbIdByzsbId(zcId);
					recordList = assetUCCImpl.getRecordhistoryByzcId(
							zclsbIdList, paginator);
				} else {
					recordList = assetUCCImpl.getRecordhistoryByzcId(zcId,
							headId, paginator);
				}
				bodyJSON = BodyListToJSON.getJSONWithMinute(recordList, paginator
						.getPageCount(), paginator.getCurrentPage(), paginator
						.getCount());

			} else if ("card".equals(sheettype)) {
				if ("pass".equals(spzt)) {
					jyzcXx = assetUCCImpl.getJyzcXxByzclsbId(zcId);
					if (jyzcXx != null) {
						zcId = jyzcXx.getId();
					}
					cardList = assetUCCImpl.getAssetCardXxVOByzcId(zcId,
							paginator);
				} else {
					cardList = assetUCCImpl.getAssetCardVOByzcId(zcId,
							paginator);
				}

				bodyJSON = BodyListToJSON.getJSON(cardList, paginator
						.getPageCount(), paginator.getCurrentPage(), paginator
						.getCount());
			} else if ("manage".equals(json4RCGL)) {
				assetList = assetUCCImpl.getJygdzcRcglVOListById(headId);
				bodyJSON = BodyListToJSON.getJSON(assetList, 2, 1, 24);
			} else {
				assetList = assetUCCImpl.getAssetBodyVOById(headId);
				bodyJSON = BodyListToJSON.getJSON(assetList, 1, 1, 1);
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getJyzcHeadByZcId() {
		if ("change".equals(sheettype)) {
			jyzcXx = assetUCCImpl.getJyzcXxByzclsbId(zcId);
			if (jyzcXx != null) {
				zcId = jyzcXx.getId();
			}
		}
		String JosnStr = assetUCCImpl.getJyzcHeadByZcId(zcId, paginator);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(JosnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 流程办结按钮调用
	 */
	// @SuppressWarnings("finally")
	// public String finishWork(){
	// ZyShead headForFinish = null;
	// String isOperateSuccess = "";
	// headForFinish = zCManageHeadUCCimpl.readHead(headId);
	// if("数据已办结".equals(headForFinish.getBdzt())){
	// isOperateSuccess = "ok";
	// response.setCharacterEncoding("UTF-8");
	// try {
	// response.getWriter().print(isOperateSuccess);
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }else{
	// try{
	// saveInfoToKCtz();
	// isOperateSuccess = "ok";
	// //throw new Exception();
	// }catch(Exception e){
	// isOperateSuccess = "error";
	// e.printStackTrace();
	// }finally{
	// if("ok".equals(isOperateSuccess)){
	// headForFinish = zCManageHeadUCCimpl.readHead(headId);
	// headForFinish.setBdzt("数据已办结");
	// zCManageHeadUCCimpl.updateHead(headForFinish);
	// }
	// response.setCharacterEncoding("UTF-8");
	// try {
	// response.getWriter().print(isOperateSuccess);
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// }
	// }
	// return null;
	// }
	/**
	 * 查看资产相关联的卡片信息，add by 陈煜霄
	 * 
	 * @throws IOException
	 */
	public String saveCardLSB() throws IOException {
		String zcids = request.getParameter("zcids");
		String headId = request.getParameter("headId");
		if (zcids.startsWith(",")) {
			zcids = zcids.substring(1);
		}
		String[] ids = zcids.split(",");
		assetUCCImpl.saveCardLSB(ids, headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}

	/**
	 * 查找盘点卡片临时表信息
	 * 
	 * @return
	 */
	public String queryCardLSB() throws IOException {
		String headId = request.getParameter("headId");
		String cardJSON = assetUCCImpl.queryCardLSB(headId,"1");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardJSON);
		return null;
	}
	/**
	 * 查找非盘点卡片临时表信息
	 * 
	 * @return
	 */
	public String queryCardLSB1() throws IOException {
		String headId = request.getParameter("headId");
		String cardJSON = assetUCCImpl.queryCardLSB(headId,"0");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardJSON);
		return null;
	}
	/**
	 * 根据条件查找盘点卡片临时表信息
	 * 
	 * @return
	 */
	public String queryCardLSB2() throws IOException {
		String headId = request.getParameter("headId");
		String cardcode = request.getParameter("cardcode");
		String cardname = request.getParameter("cardname");
		String cardJSON = assetUCCImpl.queryCardLSB(headId,cardcode,cardname);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardJSON);
		return null;
	}
	/**
	 * 选中卡片临时表中的内容
	 * 
	 * @return
	 * @throws IOException
	 */
	public String cardSelect() throws IOException {
		String zclsbid = request.getParameter("zclsbid");
		String headId = request.getParameter("headId");
		JyzcXx xx = new JyzcXx();
		String cardIds = assetUCCImpl.query4CardLSBIds(zclsbid, headId);
		cardIds = cardIds.substring(0, cardIds.length() - 1);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardIds);
		return null;
	}

	/**
	 * 取消盘点卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String deleteCardLSB() throws IOException {
		String kpids = request.getParameter("kpids");
		if (kpids.startsWith(",")) {
			kpids = kpids.substring(1);
		}
		String[] ids = kpids.split(",");
		assetUCCImpl.deleteCardLSB(ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}
	/**
	 * 添加盘点卡片
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addCardLSB() throws IOException {
		String kpids = request.getParameter("kpids");
		if (kpids.startsWith(",")) {
			kpids = kpids.substring(1);
		}
		String[] ids = kpids.split(",");
		assetUCCImpl.addCardLSB(ids);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("ok");
		return null;
	}
	public String updateSjhf() {
		zcId = request.getParameter("id");
		Double sjhf = Double.valueOf(request.getParameter("sjhf"));
		jyzcXxLsb = assetUCCImpl.getJyzcXxLsbById(zcId);
		if (jyzcXxLsb != null) {
			jyzcXxLsb.setSjhf(sjhf);
			assetUCCImpl.update(jyzcXxLsb);
		}
		return null;
	}

	/**
	 * 盘点办结
	 * 
	 * @return
	 */
	public String doOver() throws IOException {
		String headId = request.getParameter("headId");
		ywlx =   request.getParameter("ywlx");
		String cardIds ="";
		cardIds = assetUCCImpl.doOver(headId);
		//String blyjId = assetUCCImpl.findBLYJ(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(cardIds);
		return null;
	}

	/**
	 * 资产处置项目信息查询 add by lantianbo 2011-1-8
	 * @return
	 */
	public String findCzXxList(){
		zcId = request.getParameter("zcId");
		if ("change".equals(sheettype2)) {
			jyzcXx = assetUCCImpl.getJyzcXxByzclsbId(zcId);
			if (jyzcXx != null) {
				zcId = jyzcXx.getId();
			}
		}
		String jsonStr = this.assetUCCImpl.findCzXxList(zcId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public IAssetUCC getassetUCCimpl() {
		return assetUCCImpl;
	}

	public void setassetUCCimpl(IAssetUCC assetUCCImpl) {
		this.assetUCCImpl = assetUCCImpl;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public void setJyzcXx(JyzcXx jyzcXx) {
		this.jyzcXx = jyzcXx;
	}

	public JyzcXx getJyzcXx() {
		return jyzcXx;
	}

	public JyzcSqsdfyXx getJyzcSqsdfyXx() {
		return jyzcSqsdfyXx;
	}

	public void setJyzcSqsdfyXx(JyzcSqsdfyXx jyzcSqsdfyXx) {
		this.jyzcSqsdfyXx = jyzcSqsdfyXx;
	}

	public IAssetUCC getAssetUCCImpl() {
		return assetUCCImpl;
	}

	public void setAssetUCCImpl(IAssetUCC assetUCCImpl) {
		this.assetUCCImpl = assetUCCImpl;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public JyzcXxLsb getJyzcXxLsb() {
		return jyzcXxLsb;
	}

	public void setJyzcXxLsb(JyzcXxLsb jyzcXxLsb) {
		this.jyzcXxLsb = jyzcXxLsb;
	}

	public List getSqsdfyxxs() {
		return sqsdfyxxs;
	}

	public void setSqsdfyxxs(List sqsdfyxxs) {
		this.sqsdfyxxs = sqsdfyxxs;
	}

	public AssetCardVO getCardVO() {
		return cardVO;
	}

	public void setCardVO(AssetCardVO cardVO) {
		this.cardVO = cardVO;
	}

	public JyzcXxMain getJyzcXxMain() {
		return jyzcXxMain;
	}

	public void setJyzcXxMain(JyzcXxMain jyzcXxMain) {
		this.jyzcXxMain = jyzcXxMain;
	}

	public JyzcXxBuilding getJyzcXxBuilding() {
		return jyzcXxBuilding;
	}

	public void setJyzcXxBuilding(JyzcXxBuilding jyzcXxBuilding) {
		this.jyzcXxBuilding = jyzcXxBuilding;
	}

	public JyzcXxVehicle getJyzcXxVehicle() {
		return jyzcXxVehicle;
	}

	public void setJyzcXxVehicle(JyzcXxVehicle jyzcXxVehicle) {
		this.jyzcXxVehicle = jyzcXxVehicle;
	}

	public JyzcXxElse getJyzcXxElse() {
		return jyzcXxElse;
	}

	public void setJyzcXxElse(JyzcXxElse jyzcXxElse) {
		this.jyzcXxElse = jyzcXxElse;
	}

	public IUserUCC getIUserUCCimpl() {
		return iUserUCCimpl;
	}

	public void setIUserUCCimpl(IUserUCC userUCCimpl) {
		iUserUCCimpl = userUCCimpl;
	}

	public CardAssetHistory getCardAssetHistory() {
		return cardAssetHistory;
	}

	public void setCardAssetHistory(CardAssetHistory cardAssetHistory) {
		this.cardAssetHistory = cardAssetHistory;
	}

	public String getHistoryId() {
		return historyId;
	}

	public void setHistoryId(String historyId) {
		this.historyId = historyId;
	}

	public List getJbhList() {
		return jbhList;
	}

	public void setJbhList(List jbhList) {
		this.jbhList = jbhList;
	}

	public JyzlViewVO getJyzlViewVO() {
		return jyzlViewVO;
	}

	public void setJyzlViewVO(JyzlViewVO jyzlViewVO) {
		this.jyzlViewVO = jyzlViewVO;
	}

	public AssetBodyVO getAssetBodyVO() {
		return assetBodyVO;
	}

	public void setAssetBodyVO(AssetBodyVO assetBodyVO) {
		this.assetBodyVO = assetBodyVO;
	}

	public AssetInfoVO getAssetInfoVO() {
		return assetInfoVO;
	}

	public void setAssetInfoVO(AssetInfoVO assetInfoVO) {
		this.assetInfoVO = assetInfoVO;
	}

	public String getSpzt() {
		return spzt;
	}

	public void setSpzt(String spzt) {
		this.spzt = spzt;
	}

	public String getSheettype2() {
		return sheettype2;
	}

	public void setSheettype2(String sheettype2) {
		this.sheettype2 = sheettype2;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public JyzcRiskLsb getJyzcRiskLsb() {
		return jyzcRiskLsb;
	}

	public void setJyzcRiskLsb(JyzcRiskLsb jyzcRiskLsb) {
		this.jyzcRiskLsb = jyzcRiskLsb;
	}

	public JyzcRisk getJyzcRisk() {
		return jyzcRisk;
	}

	public void setJyzcRisk(JyzcRisk jyzcRisk) {
		this.jyzcRisk = jyzcRisk;
	}

	public String queryWorkFlow() {
		String josnStr = null;
		IUser user = UserThreadLocal.get();
		if (user == null) {
			throw new RuntimeException("用户无效.");
		}
		String strTitle = request.getParameter("title");
		if ("change".equals(sheettype2)) {
			jyzcXx = assetUCCImpl.getJyzcXxByzclsbId(zcId);
			if (jyzcXx != null) {
				zcId = jyzcXx.getId();
			}
		}
		List<PTEnd> list = assetUCCImpl.findMyPTEndList_nopage(zcId, strTitle);
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(),
				paginator.getCurrentPage(), list.size());
		josnStr = generateUrl(josnStr);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Autowired
	PTTodoBS pTTodoBS;

	public PTTodoBS getPTTodoBS() {
		return pTTodoBS;
	}

	public void setPTTodoBS(PTTodoBS todoBS) {
		pTTodoBS = todoBS;
	}

	public String generateUrl(String jsonString) {
		JSONObject data = JSONObject.fromObject(jsonString);
		if (data != null) {
			JSONArray rows = data.getJSONArray("rows");
			for (Object object : rows.toArray()) {
				try {
					String userId = PropertyUtils.getProperty(object, "userId")
							.toString();
					String userName = pTTodoBS
							.getUserNameById(new Long(userId));
					PropertyUtils.setProperty(object, "userId", userName);
				} catch (IllegalAccessException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				} catch (InvocationTargetException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				} catch (NoSuchMethodException ex) {
					Logger.getLogger(BodyListToJSON.class.getName()).log(
							Level.SEVERE, null, ex);
				}
			}
		}
		return data.toString();
	}
	public String getIsdisable() {
		return isdisable;
	}
	public void setIsdisable(String isdisable) {
		this.isdisable = isdisable;
	}
	public String getYwlx() {
		return ywlx;
	}
	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Recordhistory getRecordhistory() {
		return recordhistory;
	}
	public void setRecordhistory(Recordhistory recordhistory) {
		this.recordhistory = recordhistory;
	}
	public ISsglUCC getSsglUCCImpl() {
		return ssglUCCImpl;
	}
	public void setSsglUCCImpl(ISsglUCC ssglUCCImpl) {
		this.ssglUCCImpl = ssglUCCImpl;
	}
	public JygdzcCommonImpl getJygdzcCommonImpl() {
		return jygdzcCommonImpl;
	}
	public void setJygdzcCommonImpl(JygdzcCommonImpl jygdzcCommonImpl) {
		this.jygdzcCommonImpl = jygdzcCommonImpl;
	}
	public ICodeGenerator getICodeGenerator() {
		return iCodeGenerator;
	}
	public void setICodeGenerator(ICodeGenerator codeGenerator) {
		iCodeGenerator = codeGenerator;
	}
}
