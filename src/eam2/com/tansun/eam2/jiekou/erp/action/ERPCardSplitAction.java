package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardcfsend;
import com.tansun.eam2.kpgl.ucc.ICardCommonUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;

/**
 * EAM发送给ERP信息 卡片拆分
 * @author lantb
 *根据一期相关代码复制更改
 */
public class ERPCardSplitAction extends CommonAction{
	private CaShead head;
	@Autowired
	private PublicDao dao;
	@Autowired
	private ICardCommonUCC cardCommonUCCImpl;

	public String requestExecute() {
		String ErpMessage = "";//发送erp后返回消息
		String ggbnotice = "";
		String jbrcode = "EAM";
		String erpurl = request.getParameter("erpurl");//依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给ERP,在ERP中可以直接打开查看
		try {
			IUser user = UserThreadLocal.get();//得到当前登陆人员
			String headId = request.getParameter("headId");//head.getId();
			CaShead pojo = cardCommonUCCImpl.findCaSheadById(headId);
			String card = "select  td  from LcCardtemp td where td.cardcode is not null and td.kpxzid=? ";//and td.wfconfigCode=? and td.state='05'";// TODO 因为现在没有流程，测试用
			Long []strs = new Long[1];
			strs[0] = pojo.getId();
			//strs[1] = pojo.getWfconfigCode();
			List list2 = dao.find(card, strs);
			List mullist = dao.find("FROM PTCommonOpinionBO o WHERE o.bdid=? ", new Object[]{String.valueOf(pojo.getId())});
			if (mullist.size() > 0) {
				Iterator optioniter = mullist.iterator();
				while (optioniter.hasNext()) {
					PTCommonOpinionBO mulpojo = (PTCommonOpinionBO) optioniter.next();
					ggbnotice = ggbnotice + mulpojo.getYjnr()	+ mulpojo.getTjr() + mulpojo.getTjrq();
				}
				if (ggbnotice != null) {
					if (ggbnotice.length() > 4000) {
						ggbnotice = ggbnotice.substring(0, 4000);
					}
				}
			}
			String erpnotice = pojo.getErpnotice();
			if (list2.size() > 0) {
				StringBuffer erpxml = new StringBuffer();
				erpxml.append(Comment_SplitSpd.CardReduceHead());
				if (erpnotice != null) {
					erpxml.append(Comment_SplitSpd.ufdModelhead());
				} else if (erpnotice == null) {
					erpxml.append(Comment_SplitSpd.ufdAddhead());
				}
				Iterator cardlist = list2.iterator();
				if (cardlist.hasNext()) {
					LcCardtemp temp = (LcCardtemp) cardlist.next();
					jbrcode = Comment.changeuser(temp.getFirstbranch(), dao);
					Long cardinfoid = Long.parseLong(temp.getCardinfoid());
					String cardsql = "from LcCardtemp td where td.cardcode is null and td.kpxzid=?";// and td.wfconfigCode=? and td.state='06' and td.BoxId=:BoxId";// TODO 因为现在没有流程，测试用
					List list1 = dao.find(cardsql, new Object[]{pojo.getId()});
//							.setString("mainid", pojo.getId().toString())
//							.setString("wfconfigCode", pojo.getWfconfigCode())
//							.setInteger("BoxId", cardinfoid).list();
					if (list1.size() > 0) {
						if (erpnotice != null) {
							String billcode = Comment_SplitSpd.getcfcode("erpcode", String.valueOf(pojo.getId()),dao);
							String erpcode = Comment_SplitSpd.getcfcode("fbyz", String.valueOf(pojo.getId()), dao);
							erpxml.append(Comment_SplitSpd.CardModelItemHead(temp, billcode, erpcode, ggbnotice, jbrcode,pojo.getBz(),erpurl));
						} else if (erpnotice == null) {
							erpxml.append(Comment_SplitSpd.CardReduceItemHead(temp, ggbnotice,jbrcode,erpurl));
						}
						Iterator it = list1.iterator();
						while (it.hasNext()) {
							LcCardtemp cardtemp = (LcCardtemp) it.next();
							// BigDecimal jcz=new BigDecimal("0");
							// if(cardtemp.getJczl()!=null)
							// {
							// jcz=cardtemp.getYbyz().multiply(cardtemp.getJczl()).multiply(new
							// BigDecimal("0.01"));
							// }
							erpxml.append(Comment_SplitSpd.CardReduceItemBody(
									cardtemp, String.valueOf(cardtemp.getYbyz()),
									String.valueOf(cardtemp.getLjzj()), String.valueOf(cardtemp.getJzzb()),
									String.valueOf(cardtemp.getJcz()), dao,
									jbrcode));
						}
						erpxml.append(Comment_SplitSpd.CardReduceItemEnd());
						String input = new Comment().sender(erpxml);
						System.out.println();System.out.println();System.out.println();
						System.out.println(erpxml);
						System.out.println();System.out.println();System.out.println();
						//插入erp_history表，备份发送记录 
						if(pojo!=null){
							new OA_Database().insertClob(pojo.getId().toString(), String.valueOf(pojo.getId()), user.getUserLoginId(), pojo.getBdlx()// TODO 这个需要确认
									,String.valueOf(erpxml), String.valueOf(input),dao);
						}
						if (input.indexOf("ufinterface") > 0) {
							String documentstr = Comment.geterp(input,
									"<ufinterface", "</ufinterface>");
							String code = Comment.getvalue(documentstr,
									"resultcode");
							String codeinfo = Comment.getinfo(documentstr,
									"resultdescription");
							if (code.equals("1")) {
								if (erpnotice != null) {
									pojo.setSenderp("1");
									dao.update(pojo);
									String sql = "from  ErpCardcfsend  t  where t.eamcode= ?";
									List list = dao.find(sql, new Object[]{String.valueOf(pojo.getId())});
									for (Iterator itt = list.iterator(); itt .hasNext();) {
										ErpCardcfsend erpcf = (ErpCardcfsend) itt.next();
										erpcf.setSfcode(null);
										dao.update(erpcf);
									}
									ErpMessage =  "修改完毕,ERP系统正确接收!";
									//Comment.alertReload(request, response, "修改完毕,ERP系统正确接收!");
								} else if (erpnotice == null) {
									pojo.setSenderp("1");
									dao.update(pojo);
									Comment_SplitSpd.getCfinfo(documentstr, dao, String.valueOf(pojo.getId()));
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
						System.out.println(erpxml);
					}
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
