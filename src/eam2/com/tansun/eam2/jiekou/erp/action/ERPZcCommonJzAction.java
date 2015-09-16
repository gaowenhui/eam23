package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.service.IERPCommonBS;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * EAM发送给ERP信息 卡片减值
 * @author lantb 
 * 根据一期相关代码复制更改
 */
public class ERPZcCommonJzAction extends CommonAction {
	private CaShead head;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	@Autowired
	private PTTodoBS ptBs;  
	@Autowired
	private WorkflowBS workflowBS;
	@Autowired
	private IERPCommonUCC erpCommonUCC;			//erp相关
	@Autowired
	private ICardQueryUCC cardQueryUCCImpl;
	@Autowired
	private IERPCommonBS erpbs;
	public String requestExecute(){
		String ErpMessage = "";//发送erp后返回消息
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		try {
			IUser user = UserThreadLocal.get();//得到当前登陆人员
			String jbrcode = "EAM";
			String headId = request.getParameter("headId");//head.getId();
			CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
			String cardsql = "select  td  from LcCardtemp td where td.kpxzid=? ";//and td.wfconfigCode=:wfconfigCode and td.State='01'";// TODO 因为现在没有流程，测试用
			Long[] strs = new Long[1];
			strs[0] = pojo.getId();
			//strs[1] = pojo.getWfconfigCode();
			List list = dao.find(cardsql, strs);
			Date now = new Date();
			if (now.after(Comment.monthnextdate())) {
				ErpMessage = "会计月不是NC系统的最小未结账月对应的会计月!";
				//Comment_AddSpd.errorinfo(request, response, "会计月不是NC系统的最小未结账月对应的会计月!");
			}
			if (list.size() > 0) {
				Iterator it = list.iterator();
				StringBuffer xml = new StringBuffer();
				xml.append(Comment_JvalueSpd.CardAddHead("add", pojo.getId()
						.toString()));
				while (it.hasNext()) {
					LcCardtemp lccard = (LcCardtemp) it.next();
					jbrcode = Comment.changeuser(lccard.getFirstbranch(), dao);
					xml.append(Comment_JvalueSpd.CardAddItemBody(String.valueOf(lccard.getId()),
									lccard.getCardcode(), Comment.checkZero(String.valueOf(lccard.getBcjt())), Comment.changedate(now), jbrcode,pojo.getBz()));
					Comment_JvalueSpd.insertjz(dao, lccard.getCardcode(),
							String.valueOf(pojo.getId()), String.valueOf(lccard.getId()), "", "", "");
				}
				xml.append(Comment_JvalueSpd.CardAddItemEnd());
				String input = new Comment().sender(xml);
				if(pojo!=null){
					new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo
							.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
							, String.valueOf(xml), String.valueOf(input),dao);
				}
				if (input.indexOf("ufinterface") > 0) {
					String documentstr = Comment.geterp(input, "<ufinterface",
							"</ufinterface>");
					String code = Comment.getvalue(documentstr, "resultcode");
					String codeinfo = Comment.getinfo(documentstr,
							"resultdescription");
					if (code.equals("1")) {
						pojo.setSenderp("2");
						pojo.setIsrejected("03");
						dao.update(pojo);
						erpbs.book4CardById(String.valueOf(pojo.getId()));
//						Comment.banjie(dao, ptBs, workflowBS, erpCommonUCC, cardQueryUCCImpl, pojo, headId);
						ErpMessage =  "ERP系统正确接收!";
						//Comment.alertaddzj(request, response, "ERP系统正确接受!");
					} else {
						pojo.setIsrejected("01");
						dao.update(pojo);
						int cardin = codeinfo.indexOf("处理错误:");
						codeinfo = codeinfo.substring(cardin + 5, codeinfo
								.length());
						ErpMessage =  codeinfo;
						//Comment.alertaddzj(request, response, codeinfo);
					}
				} else {
					ErpMessage =  "网络不通,请联系管理员!";
					//Comment.alertaddzj(request, response, "网络不通,请联系管理员!");
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(ErpMessage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public CaShead getHead() {
		return head;
	}
	public void setHead(CaShead head) {
		this.head = head;
	}
	public PublicDao getDao() {
		return dao;
	}
	public void setDao(PublicDao dao) {
		this.dao = dao;
	}
}
