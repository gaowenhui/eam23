package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.ErpCommon;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardaddsend;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardspdaddsend;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * EAM发送给ERP信息 卡片新增
 * @author lantb
 *根据一期相关代码复制更改
 */
public class EERCardAddAction extends CommonAction  {
	private CaShead head;
	private String sendErpState;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	@Autowired
	private PTTodoBS ptBs;  
	@Autowired
	private WorkflowBS workflowBS;
	@Autowired
	private IERPCommonUCC erpCommonUCC;			//erp相关
	
	public String requestExecute() {
		
		String ErpMessage = "";//发送erp后返回消息
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		//BasicPersonInfo person = (BasicPersonInfo) request.getSession().getAttribute("EC_CURRUSER");
		IUser user = UserThreadLocal.get();//得到当前登陆人员
		String headId = request.getParameter("headId");//head.getId();
		//Add by YanPeiLing 2011-1-12 start
		String isStock = request.getParameter("isStock");//是否时自用资产入库
		if("Yes".equals(isStock)){
			headId = cardQueryUCCImpl.getcaSheadIdWithHeadId(headId);
		}
		//Add by YanPeiLing 2011-1-12 end
		CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
	   	String jbrcode="EAM";
		if ("0".equals(pojo.getZjfs().trim()))// 直接增加 
		{
			int asset_code = 100;
			StringBuffer erpxml = new StringBuffer();
			try {
				String cardsql = "from LcCardtemp td where td.kpxzid = ?";// TODO and td.wfconfigCode = ? and td.state is null";
				Long[] strs = new Long[1];
				strs[0] = pojo.getId();
				//strs[1] = pojo.getWfconfigCode();
				List list1 = dao.find(cardsql, strs);
				erpxml.append(Comment_AddZj.CardAddHead(pojo, "add"));
				if (list1.size() > 0) {
					Iterator it = list1.iterator();
					while (it.hasNext()) {
						LcCardtemp temp = (LcCardtemp) it.next();
						asset_code = asset_code + 1;
						jbrcode = Comment
								.changeuser(temp.getFirstbranch(), dao);
						ErpCardaddsend erpcardvalue = Comment_AddZj
								.getCardValue(pojo, temp, String
										.valueOf(asset_code), dao);
						erpxml.append(Comment_AddZj.CardAddBody(pojo,
								erpcardvalue, String.valueOf(temp.getYsqdjz()),
								String.valueOf(temp.getSynx()), dao, temp,
								jbrcode));
						Comment_AddZj.saveOrUpdate(dao, temp, pojo,
								erpcardvalue);
					}
				}
				erpxml.append(Comment_AddZj.CardAddEnd());
				String input = new Comment().sender(erpxml); 
				//插入erp_history表，备份发送记录   
				if(pojo!=null){
					new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo 
							.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
							, String.valueOf(erpxml), String.valueOf(input),dao);
					}
				if (input.indexOf("ufinterface") > 0) {
					String documentstr = Comment.geterp(input, "<ufinterface",
							"</ufinterface>");
					String code = Comment.getvalue(documentstr, "resultcode");
					String codeinfo = Comment.getinfo(documentstr,
							"resultdescription");
					if (code.equals("1")) {
						List returnlist = Comment_AddZj.pasexml(documentstr);
						Comment_AddZj.ChangeInterface(dao,
								returnlist, pojo);
						pojo.setIsrejected("03");
						dao.update(pojo);
						if(!Comment.checkPTCommonOpinion(String.valueOf(headId), dao,"通过")){
							PTCommonOpinionBO bo = new PTCommonOpinionBO();
							bo.setBdid(String.valueOf(headId));
							bo.setTaskId(null);
							bo.setTjr("15938");
							bo.setYjbm(10762);
							bo.setTjrq(new Date());
							bo.setYjylx(4);//4为erp意见类型
							bo.setYjlx(2);
							bo.setYjnr("通过");
							dao.save(bo);
							Comment.banjie(dao, ptBs, workflowBS, erpCommonUCC, cardQueryUCCImpl, pojo, headId);
						}
						ErpMessage = "ERP系统正确接收!";
						sendErpState = ErpCommon.SEND_ERP_CG;
						// TODO Comment.alertaddzj(request, response,
						// "ERP系统正确接收!");
					} else {
						if (codeinfo.indexOf("最小未结账月") > 0) {
							pojo.setIsrejected("01");
							dao.update(pojo);
							ErpMessage = "会计月不是NC系统的最小未结账月对应的会计月!";
							sendErpState = ErpCommon.SEND_ERP_BCG;
							// TODO Comment.alertaddzj(request,
							// response,"会计月不是NC系统的最小未结账月对应的会计月!");
						} else {
							pojo.setIsrejected("01");
							dao.update(pojo);
							ErpMessage =  "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo;
							sendErpState = ErpCommon.SEND_ERP_BCG;
							// TODO Comment.alertaddzj(request,
							// response,"ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo);
						}
					}
				} else {
					ErpMessage =  "网络不通,请联系管理员!";
					sendErpState = ErpCommon.SEND_ERP_BCG;
					// Comment.alertaddzj(request, response, "网络不通,请联系管理员!");
				}

			} catch (Exception ex) {

				ex.printStackTrace();
			}
		}
		else if ("1".equals(pojo.getZjfs().trim()) || "".equals(pojo.getZjfs())) {//测试用的是这个方式
			String addorupdate = "";
			String erpnotice = pojo.getErpnotice();
			if (erpnotice != null) {
				addorupdate = "update";
				if (erpnotice.length() > 100)
					erpnotice = erpnotice.substring(0, 99);
			} else if (erpnotice == null) {
				addorupdate = "add";
			}
			String asset_code = "";
			try {
				String cardsql = "from LcCardtemp td where td.kpxzid = ? ";//and td.wfconfigCode = ? ";// TODO 因为现在没有流程，测试用
				Long []strs = new Long[1];
				strs[0] = pojo.getId();
				//strs[1] = pojo.getWfconfigCode();
				List list1 = dao.find(cardsql, strs);
				StringBuffer erpxml = new StringBuffer();
				erpxml.append(Comment_AddSpd.CardAddHead(pojo, addorupdate));
				String billcode = Comment_AddSpd.getErpCode(dao, pojo.getId().toString());
				if (list1.size() > 0) {
					LcCardtemp temp = (LcCardtemp) list1.get(0);
					jbrcode = Comment.changeuser(temp.getFirstbranch(), dao);
				}
				erpxml.append(Comment_AddSpd.CardAddItemHead(dao, pojo,billcode, jbrcode,erpurl));
				if (list1.size() > 0) {
					Iterator it = list1.iterator();
					while (it.hasNext()) {
						LcCardtemp temp = (LcCardtemp) it.next();
						if (erpnotice == null) {
							asset_code = temp.getErpassetcode();
						}
						ErpCardspdaddsend erpcardvalue = Comment_AddSpd.getCardValue(pojo, temp, String.valueOf(asset_code));
						erpxml.append(Comment_AddSpd.CardAddItemBody(
								erpcardvalue, Comment_AddSpd.getbillcode(String.valueOf(temp.getId()), dao),
								asset_code, dao, Comment.getsyrbm(temp.getUsername(), dao)));
						Comment_AddSpd.saveOrUpdate(dao, temp, pojo, erpcardvalue);
					}
				}
				erpxml.append(Comment_AddSpd.CardAddItemEnd());
				String input = new Comment().sender(erpxml);
				if(pojo!=null){
					new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
							,String.valueOf(erpxml), String.valueOf(input),dao);
				}
				if (input.indexOf("ufinterface") > 0) {
					String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
					String code = Comment.getvalue(documentstr, "resultcode");
					String codeinfo = Comment.getinfo(documentstr, "resultdescription");
					if (code.equals("1")) {
						if (erpnotice == null) {
							List returnlist = Comment_AddSpd.pasexml(documentstr);
							Comment_AddSpd.ChangeInterface(dao, returnlist, pojo);
							ErpMessage =  "ERP系统正确接收!";
							sendErpState = ErpCommon.SEND_ERP_CG;
							// TODO Comment.alertReload(request, response, "ERP系统正确接收!");
						} else {
							List returnlist = Comment_AddSpd .pasexml(documentstr);
							Comment_AddSpd.ChangeInterface(dao, returnlist, pojo);
							pojo.setSenderp("1");
							pojo.setIsrejected("02");//这个02状态不清楚做什么的
							dao.update(pojo);
							ErpMessage =  "ERP系统正确接收,修改完成!";
							sendErpState = ErpCommon.SEND_ERP_CG;
							//Comment.alertReload(request, response, "ERP系统正确接收,修改完成!");
						}
					} else {
						if (codeinfo.indexOf("最小未结账月") > 0) {
							pojo.setIsrejected("01");
							dao.update(pojo);
							ErpMessage = "会计月不是NC系统的最小未结账月对应的会计月!";
							sendErpState = ErpCommon.SEND_ERP_BCG;
							//Comment.alertaddzj(request, response, "会计月不是NC系统的最小未结账月对应的会计月!");
						} else {
							pojo.setIsrejected("01");
							dao.update(pojo);
							ErpMessage = "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo;
							sendErpState = ErpCommon.SEND_ERP_BCG;
							//Comment.alertaddzj(request, response, "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo);
						}
					}
				} else {
					ErpMessage = "网络不通,请联系管理员!";
					sendErpState = ErpCommon.SEND_ERP_BCG;
					//Comment.alertaddzj(request, response, "网络不通,请联系管理员!");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(ErpMessage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public PublicDao getDao() {
		return dao;
	}
	public void setDao(PublicDao dao) {
		this.dao = dao;
	}
	public CaShead getHead() {
		return head;
	}
	public void setHead(CaShead head) {
		this.head = head;
	}
	public String getSendErpState() {
		return sendErpState;
	}
	public void setSendErpState(String sendErpState) {
		this.sendErpState = sendErpState;
	}


}

