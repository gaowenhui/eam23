package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardhbsend;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * EAM发送给ERP信息 卡片合并
 * @author lantb
 *根据一期相关代码复制更改
 */
public class ERPCardCoalitionAction extends CommonAction  {
	private CaShead head;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;
	
	public String requestExecute() {
		
		String ErpMessage = "";//发送erp后返回消息
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		//BasicPersonInfo person = (BasicPersonInfo) request.getSession().getAttribute("EC_CURRUSER");
		IUser user = UserThreadLocal.get();//得到当前登陆人员
		String headId = request.getParameter("headId");//head.getId();
		CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
		String ggbnotice = "";
		String billcode = "";
		String addtype = "";
		String jbrcode="EAM";
		LcCardtemp after = null;
		try {
			String cardsql = "from LcCardtemp td where td.cardcode is not null and td.kpxzid=? ";//and td.wfconfigCode=:wfconfigCode and td.State='06'";合并前卡片// TODO 因为现在没有流程，测试用
			List list1 = dao.find(cardsql, new Object[]{Long.valueOf(pojo.getId())});

			String card = "from LcCardtemp td where td.cardcode is  null and td.kpxzid=?";// and td.WfconfigCode=:wfconfigCode and td.State='05'";合并后卡片// TODO 因为现在没有流程，测试用
			List list2 = dao.find(card, new Object[]{Long.valueOf(pojo.getId())});
			List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{String.valueOf(pojo.getId())});
			if (mullist.size() > 0) {
				Iterator optioniter = mullist.iterator();
				while (optioniter.hasNext()) {
					PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
					ggbnotice = ggbnotice + mulpojo.getYjnr()	+ mulpojo.getTjr() + mulpojo.getTjrq();
				}
				if (ggbnotice != null) {
					if (ggbnotice.length() > 200) {
						ggbnotice = ggbnotice.substring(0, 200);
					}
				}
			}
			String erpnotice = pojo.getErpnotice();
			StringBuffer erpxml = new StringBuffer();
			erpxml.append(Comment_CoalitionSpd.CardHbHead());
			if (erpnotice != null) {
				erpxml.append(Comment_CoalitionSpd.Cardhbupdate());
			} else if (erpnotice == null) {
				erpxml.append(Comment_CoalitionSpd.Cardhbadd());
			}
			if (list2.size() > 0) {
				Iterator it = list2.iterator();
				after = (LcCardtemp) it.next();
				LcCardtemp lctemp = (LcCardtemp) list2.get(0);
				addtype = lctemp.getAddtype();
				jbrcode = Comment.changeuser(lctemp.getFirstbranch(), dao);
				if (erpnotice != null) {
					billcode = Comment_CoalitionSpd.getbillcode(String.valueOf(pojo.getId()), dao);
					erpxml.append(Comment_CoalitionSpd.CardHbmodenhead(after, billcode, ggbnotice, addtype,jbrcode,pojo.getBz(),erpurl));
				} else if (erpnotice == null) {
					erpxml.append(Comment_CoalitionSpd.CardHbItemHead(after, ggbnotice,jbrcode,erpurl));
				}
			}
			if (list1.size() > 0) {
				Iterator it = list1.iterator();
				String sql = "delete from erp_cardhbsend t where t.eamcode='"+after.getId()+"'";
				dao.getJdbcTemplate().execute(sql);
				if(list1.size()>0)
				{
					LcCardtemp  temp=(LcCardtemp)list1.get(0);
					jbrcode=Comment.changeuser(temp.getFirstbranch(), dao);
				}
				while (it.hasNext()) {
					LcCardtemp lccardtemp = (LcCardtemp) it.next();
					erpxml.append(Comment_CoalitionSpd.CardReduceItemBody(lccardtemp.getCardcode(),
									lccardtemp.getErpassetcode(), lccardtemp.getAddtype()));

					Comment_CoalitionSpd.savehblj(lccardtemp, after, dao,String.valueOf(pojo.getId()));
				}
			}
			erpxml.append(Comment_CoalitionSpd.CardReduceItemEnd());

			String input = new Comment().sender(erpxml);
			if(pojo!=null){
				new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
						,String.valueOf(erpxml), String.valueOf(input),dao);
			}
			if (input.indexOf("ufinterface") > 0) {
				String documentstr = Comment.geterp(input, "<ufinterface",
						"</ufinterface>");
				String code = Comment.getvalue(documentstr, "resultcode");
				String codeinfo = Comment.getinfo(documentstr,
						"resultdescription");
				if (code.equals("1")) {
					Comment_CoalitionSpd.updatehbjl(documentstr, dao);
					if (erpnotice != null) {
						pojo.setSenderp("1");
						dao.update(pojo);
						String sql = "from  ErpCardhbsend  t where t.eamcodepk=?";
						List list = dao.find(sql, new Object[]{pojo.getId()});
						for (Iterator it8 = list.iterator(); it8.hasNext();) {
							ErpCardhbsend cardhb = (ErpCardhbsend) it8.next();
							cardhb.setSfbh(null);
							dao.update(cardhb);
						}
						ErpMessage =  "修改完毕,ERP系统正确接收!";
//						Comment.alertReload(request, response, "修改完毕,ERP系统正确接收!");
					} else if (erpnotice == null) {
						pojo.setSenderp("1");
						dao.update(pojo);
						ErpMessage = "ERP系统正确接收!";
//						Comment.alertReload(request, response, "ERP系统正确接收!");
					}
				} else {
					if (codeinfo.indexOf("最小未结账月") > 0) {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage =  "会计月不是NC系统的最小未结账月对应的会计月!";
//						Comment.alertaddzj(request, response,
//								"会计月不是NC系统的最小未结账月对应的会计月!");
					} else {
						pojo.setIsrejected("01");
						dao.update(pojo);
						ErpMessage = "ERP系统接收错误,请联系管理员! 错误信息："+codeinfo;
//						Comment.alertaddzj(request, response,
//								"ERP系统接收错误,请联系管理员! 错误信息："+codeinfo);
					}
				}
			}
			else
			{
				ErpMessage =  "网络不通,请联系管理员!";
//				Comment.alertaddzj(request, response,"网络不通,请联系管理员!");
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
