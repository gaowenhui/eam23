package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class ERPCardReduceAction extends CommonAction{
	private CaShead head;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	
	public String requestExecute() {
		String ErpMessage = "";//发送erp后返回消息
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		try {
			IUser user = UserThreadLocal.get();//得到当前登陆人员
			String headId = request.getParameter("headId");//head.getId();
			CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
			String jbrcode = "EAM";
			String cardsql = "select  td  from LcCardtemp td where td.kpxzid=?";// and td.WfconfigCode=:wfconfigCode";// TODO 因为现在没有流程，测试用
			Long []strs = new Long[1];
			strs[0] = pojo.getId();
			//strs[1] = pojo.getWfconfigCode();
			List list1 = dao.find(cardsql, strs);
			String billcode = "";
			String notice = Comment_Reduce.getGubNotice(dao, pojo);
			StringBuffer erpxml = new StringBuffer();
			erpxml.append(Comment_Reduce.CardReduceHead());
			String erpnotice = pojo.getErpnotice();
			if (erpnotice != null) {
				erpxml.append(Comment_Reduce.Erpupdatetype());
				billcode = Comment_Reduce.QueryerpCode(pojo.getId().toString(),
						dao);
			} else if (erpnotice == null) {
				erpxml.append(Comment_Reduce.Erpaddtype());
			}
			if (list1.size() > 0) {
				LcCardtemp temp = (LcCardtemp) list1.get(0);
				jbrcode = Comment.changeuser(temp.getFirstbranch(), dao);
			}
			erpxml.append(Comment_Reduce.CardReduceItemHead(pojo.getId().toString(), billcode, notice, jbrcode,erpurl));
			if (list1.size() > 0) {
				Iterator it = list1.iterator();
				while (it.hasNext()) {
					LcCardtemp temp = (LcCardtemp) it.next();
					erpxml.append(Comment_Reduce.CardReduceItemBody(temp,temp.getChangereason())); //主要信息，卡片编号，资产编号 add by lantianbo
					if (pojo.getErpnotice() == null) {
						Comment_Reduce.savejl(dao, temp.getCardcode(), temp
										.getErpassetcode(), pojo.getId()
										.toString(), "");
					}
				}
			}
			erpxml.append(Comment_Reduce.CardReduceItemEnd());
			String input = new Comment().sender(erpxml);
			//插入erp_history表，备份发送记录  
			if(pojo!=null){
				new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
						,String.valueOf(erpxml), String.valueOf(input),dao);
			}
			if (input.indexOf("ufinterface") > 0) {
				String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
				String code = Comment.getvalue(documentstr, "resultcode");
				String codeinfo = Comment.getinfo(documentstr, "resultdescription");
				if (code.equals("1")) {
					String billcode1 = Comment_Reduce.getQueryvalue(documentstr, "billcode");
					if (list1.size() > 0) {
						Iterator it = list1.iterator();
						while (it.hasNext()) {
							LcCardtemp temp = (LcCardtemp) it.next();
							Comment_Reduce.savereduce(dao, temp.getCardcode(), temp.getErpassetcode(), billcode1, pojo
											.getId().toString(), "1");
							pojo.setSenderp("1");
							pojo.setIsrejected("");
							dao.update(pojo);
						}
					}
					if (erpnotice != null) {
						ErpMessage =  "修改完毕,ERP系统正确接收!";
						//Comment.alertReload(request, response, "修改完毕,ERP系统正确接收!");
					} else if (erpnotice == null) {
						ErpMessage =  "ERP系统正确接收!";
						//Comment.alertReload(request, response, "ERP系统正确接收!");
					}
				} else {
					if (codeinfo.indexOf("最小未结账月") > 0) {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage =  "会计月不是NC系统的最小未结账月对应的会计月!";
						//Comment.alertaddzj(request, response, "会计月不是NC系统的最小未结账月对应的会计月!");
					} else {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage =  "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo;
						//Comment.alertaddzj(request, response, "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo);
					}
				}
			} else {
				ErpMessage =  "网络不通,请联系管理员!";
				//Comment.alertaddzj(request, response, "网络不通,请联系管理员!");
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
