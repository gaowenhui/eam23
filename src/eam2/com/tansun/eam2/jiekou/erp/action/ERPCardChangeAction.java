package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardbdsend;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * EAM发送给ERP信息 卡片变动
 * @author lantb
 *根据一期相关代码复制更改
 */
public class ERPCardChangeAction extends CommonAction {
	private CaShead head;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	
	public String requestExecute() {
		
		String ErpMessage = "";//发送erp后返回消息
		
		String mulstr = "";
		String zckpsm = "";
		String ggbnotice = "";
		String jbrcode = "EAM";
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		try {
			IUser user = UserThreadLocal.get();//得到当前登陆人员
			String headId = request.getParameter("headId");//head.getId();
			CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
			String cardsql = "from LcCardtemp td where td.kpxzid=? ";//and td.wfconfigCode=? and td.state='01'";// TODO 因为现在没有流程，测试用
			Long[] strs = new Long[1];
			strs[0] = pojo.getId();
			//strs[1] = pojo.getWfconfigCode();
			List list1 = dao.find(cardsql, strs);
			List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{String.valueOf(pojo.getId())});
			
			if (mullist.size() > 0) {
				Iterator optioniter = mullist.iterator();
				while (optioniter.hasNext()) {
					PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
					ggbnotice = ggbnotice + mulpojo.getYjnr()	+ mulpojo.getTjr() + mulpojo.getTjrq();
				}
			}
			String billid = String.valueOf(pojo.getId());//billid都是申请单id
			String type = "";
			String billcode = "";
			String oldvalue = "";
			String newvalue = "";
			StringBuffer xml = new StringBuffer();
			xml.append(Comment_ChangeSpd.EsbHead());
			if (pojo.getErpnotice() != null) {
				xml.append(Comment_ChangeSpd.ErpModelhead());
				billcode = Comment_ChangeSpd.geterpcode(dao, String.valueOf(pojo.getId()));
			} else {
				xml.append(Comment_ChangeSpd.ErpAddhead());
			}
			Iterator it = list1.iterator();
			StringBuffer body = new StringBuffer();
			while (it.hasNext()) {
				LcCardtemp kapbd = (LcCardtemp) it.next();
				String sql = "from  Cardinfo t where t.cardcode=?";
				List list2 = dao.find(sql, new Object[]{kapbd.getCardcode()});
				if (list2.size() > 0) {
					Cardinfo cardinfo = (Cardinfo) list2.get(0);
					type = String.valueOf(kapbd.getChangeway());
					if (type.equals("1")) {								//add by lantianbo 2010-11-24 这里的1，2，3，4。。。代表的是变动方式 字典表INDIVIDUALTREE cardChangeWay
						newvalue = String.valueOf(kapbd.getYbyz());
						oldvalue = String.valueOf(cardinfo.getYbyz());
					} else if (type.equals("2")) {
						newvalue = String.valueOf(kapbd.getYbyz());
						oldvalue = String.valueOf(cardinfo.getYbyz());
					} else if (type.equals("3")) {
						newvalue = String.valueOf(kapbd.getGlbm());
						oldvalue = String.valueOf(cardinfo.getGlbm());
					} else if (type.equals("4")) {
						newvalue = String.valueOf(kapbd.getUsepartment());
						oldvalue = String.valueOf(cardinfo.getUsepartment());
					} else if (type.equals("5")) {
						newvalue = String.valueOf(kapbd.getUsestatus());
						oldvalue = String.valueOf(cardinfo.getUsestatus());
					} else if (type.equals("6")) {
						newvalue = String.valueOf(kapbd.getZjtype());
						oldvalue = String.valueOf(cardinfo.getZjtype());
					} else if (type.equals("7")) {
						newvalue = String.valueOf(kapbd.getSynx() * 12+ kapbd.getSyyx());
						oldvalue = String.valueOf(cardinfo.getSynx() * 12+ cardinfo.getSyyx());
					} else if (type.equals("9")) {
						newvalue = String.valueOf(kapbd.getJcz());
						oldvalue = String.valueOf(cardinfo.getJcz());
					} else if (type.equals("10")) {
						newvalue = String.valueOf(kapbd.getLjzj());
						oldvalue = String.valueOf(cardinfo.getLjzj());
					} else if (type.equals("11")) {
						newvalue = String.valueOf(kapbd.getTypecode());
						oldvalue = String.valueOf(cardinfo.getTypecode());
					} else if (type.equals("12")) {
						newvalue = String.valueOf(kapbd.getAddtype());
						oldvalue = String.valueOf(cardinfo.getAddtype());
					} else if (type.equals("13")) {
						newvalue = Comment.zjcdbm(String.valueOf(kapbd.getZjcdbm()));
						oldvalue = Comment.zjcdbm(String.valueOf(cardinfo.getZjcdbm()));
					} else if (type.equals("14")) {
						newvalue = String.valueOf(kapbd.getZjtype());
						oldvalue = String.valueOf(cardinfo.getZjtype());
					}
				}
				body.append(Comment_ChangeSpd.Erpbillbody(kapbd.getCardcode(),
						kapbd.getErpassetcode(), newvalue, oldvalue,
						Comment_ChangeSpd.getreasoncode(dao, kapbd.getChangereason()), kapbd.getSaveadsress()));
			}
			;
			if (list1.size() > 0) {
				LcCardtemp temp = (LcCardtemp) list1.get(0);
				jbrcode = Comment.changeuser(temp.getFirstbranch(), dao);
			}
			xml.append(Comment_ChangeSpd.Erpbillhead(billid, billcode,erpurl, type, ggbnotice, jbrcode,pojo.getBz()));
			xml.append(body);
			xml.append(Comment_ChangeSpd.Erpbillend());
			xml.append(Comment_ChangeSpd.Esbend());
			String input = new Comment().sender(xml);
			//插入erp_history表，备份发送记录 
			if(pojo!=null){
				new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo
						.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
						, String.valueOf(xml), String.valueOf(input),dao);
			}
			if (input.indexOf("ufinterface") > 0) {
				String documentstr = Comment.geterp(input, "<ufinterface","</ufinterface>");
				String code = Comment.getvalue(documentstr, "resultcode");
				String codeinfo = Comment.getinfo(documentstr,"resultdescription");
				if (code.equals("1")) {
					String returnbillid = Comment_Reduce.getQueryvalue(documentstr, "billid");
					String returnbillcode = Comment_Reduce.getQueryvalue(documentstr, "billcode");
					String id = Comment_Reduce.getQueryAtt(documentstr, "id");
					//
					if (pojo.getErpnotice() != null) {
						String sql = "from ErpCardbdsend  t where t.eamcode=?";
						List list = dao.find(sql, new Object[]{String.valueOf(pojo.getId())}); 
						Iterator it1 = list.iterator();
						while (it1.hasNext()) {
							ErpCardbdsend cardreduce = (ErpCardbdsend) it1.next();
							cardreduce.setSfbh("");
							dao.update(cardreduce);
						}
					} else {
						ErpCardbdsend cardreduce = new ErpCardbdsend();
						cardreduce.setErpcode(returnbillcode);
						cardreduce.setErppk(returnbillcode);
						cardreduce.setEamcode(id);
						dao.save(cardreduce);
					}
					pojo.setSenderp("1");
					dao.update(pojo);
					ErpMessage = "ERP系统正确接收!";
					//Comment.alertReload(request, response, "ERP系统正确接收!");
				} else {
					if (codeinfo.indexOf("最小未结账月") > 0) {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage = "会计月不是NC系统的最小未结账月对应的会计月!";
						//Comment.alertaddzj(request, response,"会计月不是NC系统的最小未结账月对应的会计月!");
					} else {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage = "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo;
						//Comment.alertaddzj(request, response,"ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo);
					}
				}
			} else {
				ErpMessage = "网络不通,请联系管理员!";
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
