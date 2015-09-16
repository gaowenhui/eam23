package com.tansun.eam2.jiekou.erp.action;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXxLsb;
import com.tansun.eam2.jiekou.erp.config.OA_Database;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.UserThreadLocal;

/**
 * EAM发送给ERP信息 确权、业务维修、更新改造、事项审批
 * 
 * @author lantb 根据一期相关代码复制更改
 */
public class Comment_SxSpd {

	public static String Comment_zc(PublicDao dao,JyzcHead pojo,HttpServletRequest request ,IAssetBS assetBSImpl) {
		//BasicPersonInfo person = (BasicPersonInfo) request.getSession().getAttribute("EC_CURRUSER");
		IUser user = UserThreadLocal.get();//得到当前登陆人员
		
		String id = "";
		String xlid = "";
		String wfconfigcode = "";
		String tel = "";
		String notice = Comment_FySpd.GetNotice(pojo, dao);
		String bankeare = "";
		String jbrcode = "";
		if (notice != null) {
			if (notice.length() > 4000) {
				notice = notice.substring(0, 4000);
			}
		}
		String spr = Comment_FySpd.GetPerson(pojo, dao);
		String checktype = "";
		String title = "";
		String mainid = "";
		String wfconfigCode = "";
		if (notice.equals("")) {
			notice = "EAM系统发送的审批单";
		}
		String yjfh = "";
		JyzcHead fyspd = (JyzcHead) pojo;
		id = String.valueOf(fyspd.getId());
		xlid = fyspd.getXlid();
		wfconfigcode = fyspd.getLcId();
		tel = fyspd.getLxdh();
		yjfh = String.valueOf(fyspd.getRegion());
		checktype = fyspd.getErpnotice();
		title = fyspd.getBiaoti();
		bankeare = String.valueOf(fyspd.getRegion());
		jbrcode = Comment.changeuser(bankeare, dao);
		StringBuffer head = new StringBuffer();
		if (checktype == null) {
			head.append(Comment_Money.AddFyhead(String.valueOf(jbrcode)));
		} else if(checktype.equals("01")) {
			head.append(Comment_Money.AddFyhead(String.valueOf(jbrcode)));
		}else if (checktype.equals("02")) {
			String check = Comment_Money.FySpd(xlid, dao);
			if (check.equals("Y")) {
				return "审批单已经结算,不能修改审批单!";
				//Comment_AddSpd.errorinfo(request, response, "审批单已经结算,不能修改审批单!");
			}
			head.append(Comment_Money.ModenFyhead());
		} else if (checktype.equals("03")) {
			String check = Comment_Money.FySpd(xlid, dao);
			if (check.equals("Y")) {
				return  "审批单已经结算,不能删除审批单!";
				//Comment_AddSpd.errorinfo(request, response, "审批单已经结算,不能删除审批单!");
			}
			StringBuffer xml = new StringBuffer();
			xml.append(Comment_Money.Esbhead());
			xml.append(Comment_Money.DeleteFyhead());
			xml.append(Comment_Money.DeleteFy(xlid));
			xml.append(Comment_Money.Esbend());
			String input = new Comment().sender(xml);
			if(pojo!=null){
				new OA_Database().insertClob(pojo.getId().toString(), pojo
						.getId(), user.getUserLoginId(), pojo.getYwlx()// TODO 这个需要确认
						, String.valueOf(xml), String.valueOf(input),dao);
			}
			String documentstr = Comment.geterp(input, "<ufinterface",
					"</ufinterface>");
			String code = Comment.getvalue(documentstr, "resultcode");
			if (code.equals("1")) {
				JyzcHead fyspd1 = (JyzcHead) pojo;
				fyspd1.setSenderp("1");
				fyspd1.setErpnotice("04");
				dao.update(fyspd1);
				Comment_Money.delestate(id, dao);
				mainid = String.valueOf(fyspd1.getId());
				wfconfigCode = fyspd1.getLcId();
				
				Comment_FySpd.deletecz(mainid, wfconfigCode, dao);

				try {
					//TODO 下面2行跟流程相关 备注
					//IActionForm actionForm = (IActionForm) request.getAttribute(ControllerServlet.POJO_NAME);
					//WorkflowExtEngine.getExtEngine().endProcess(actionForm,person);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return "审批单删除完毕!";
				//Comment.alertReload(request, response, "审批单删除完毕!");
			} else {
				return "审批单删除失败,请联系管理员!";
				//Comment_AddSpd.errorinfo(request, response, "审批单删除失败,请联系管理员!");
			}
		}
		String wxsql = "select td from JyzcXxLsb td  where td.cldId=?";// and td.WfconfigCode=:wfconfigCode and td.State='01'";//TODO流程相关，备注
		List list1 = dao.find(wxsql, new Object[]{id});
		StringBuffer xml = new StringBuffer();
		xml.append(Comment_Money.Esbhead());
		xml.append(head);
		xml.append(Comment_Money.CardAddItemHead(xlid, xlid, "", notice, yjfh,jbrcode, title)); //xlid为表单erp发送号，时间+随机数，因为表单id为uuid32位长度，erp系统要求验证长度为20位，所以用这个字段来作为标识
		Iterator it = list1.iterator();
		while (it.hasNext()) {
			JyzcXxLsb lctemp = (JyzcXxLsb) it.next();
			String jbh = lctemp.getCEjfhbh();
			if (null == jbh)
				jbh = "110000000";
			List<JyzcSqsdfyXx> list = assetBSImpl.getJyzcSqsdfyXxByZcId(lctemp.getId());
			double sqje1 = 0.0;
			double sdje1 = 0.0;
			for (int i = 0; i < list.size(); i++) {
				JyzcSqsdfyXx temp = list.get(i);
				sqje1 += temp.getSqje();
				sdje1 += temp.getSdje();
			}
			String sqje = String.valueOf(sqje1);
			String jbrdh = tel;
			String eampk = lctemp.getXlid();//xlid为临时表erp发送号，时间+随机数，因为表单id为uuid32位长度，erp系统要求验证长度为20位，所以用这个字段来作为标识
			String sdje = String.valueOf(sdje1);
			String fyzl = lctemp.getCFyzl();
			//String zhaiyao = lctemp.getBlsm(); //日常管理发送erp因为办理说明太大 erp 无法接受 和钱诚确认后 此项可以不传
			String zhaiyao = "日常管理相关事项审批";
			String jsfs = lctemp.getCJsfs();
			String bz = lctemp.getCBz();
			// 李冬东修改与2009-02-19日，修改后解决的问题是，在原有版本中，deptid为定值1000，也就是
			// 代表的是公司本部，此信息发送给erp后，在erp环境中查询到审批单信息的一级分行为公司本部，
			// 这样就导致了分部的人无法查看到审批单，因为这里增加了一个参数，代表是审批单的一级分行，
			// 改信息来源于审批上所选择的地区。
			xml.append(Comment_Money.CardAddItemBody(jbh, jbrcode, sqje, jbrdh,
					eampk, sdje, fyzl, yjfh,zhaiyao,title,jsfs,bz));//基本信息
		}
		xml.append(Comment_Money.ErpEnd());
		xml.append(Comment_Money.Esbend());
		String input = new Comment().sender(xml);
		new OA_Database().insertClob(pojo.getId().toString(), pojo
				.getId(), user.getUserLoginId(), pojo.getYwlx()// TODO 这个需要确认
				, String.valueOf(xml), String.valueOf(input),dao);
		if (input.indexOf("ufinterface") > 0) {
			String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
			String code = Comment.getvalue(documentstr, "resultcode");
			if (code.equals("1")) {
				Comment_FySpd.ljfyspd(documentstr, dao);
				
				pojo.setSenderp("2");
				pojo.setIsrejected("02");
				pojo.setErpnotice("01");
				dao.update(pojo);
				return "ERP系统正确接收!";
				//Comment.alertaddzj(request, response, "ERP系统正确接收!");
			} else {
				if (documentstr.indexOf("最小未结账月") > 0) {
					return "会计月不是NC系统的最小未结账月对应的会计月!";
//					Comment_AddSpd.errorinfo(request, response,
//							"会计月不是NC系统的最小未结账月对应的会计月!");
				} else {
					String codeinfo = Comment.getinfo(documentstr,
							"resultdescription");
					return "ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo;
//					Comment_AddSpd.errorinfo(request, response,
//							"ERP系统接收错误,请联系管理员! 错误信息：" + codeinfo);
				}
			}
		} else {
			return "网络不通,请联系管理员!";
//			Comment_AddSpd.errorinfo(request, response, "网络不通,请联系管理员!");
		}
	}
}
