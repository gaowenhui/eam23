package com.tansun.eam2.jiekou.erp.action;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.jiekou.erp.config.ERPconfig;
import com.tansun.eam2.jiekou.erp.config.ReadBolb;
import com.tansun.eam2.jiekou.erp.ucc.IERPCommonUCC;
import com.tansun.eam2.kpgl.KpglCommon;
import com.tansun.eam2.kpgl.ucc.ICardQueryUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

/**
 * 卡片发送erp 公共类
 * @author lantb
 *	根据一期相关代码复制更改
 */
public class Comment {
	Map map=ReadBolb.getReadfilepath();
	
	public static String changeuser(String eamname, PublicDao dao) {
		String erpname = "zonghangbenbu";
		if (eamname != null) {
			try {
				String sql = "select  t.erpuser  from   erp_usermap  t  where t.eamuser = ?";
				String[] strs = new String[1];
				strs[0] = eamname;
				List list = dao.queryForList(sql, strs);
				if (list.size() > 0) {
					Map map = (Map)list.get(0);
					erpname = (String) map.get("erpuser");
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return erpname;
	}
	public static boolean checkPTCommonOpinion(String headId, PublicDao dao,String tongguo) {
		boolean fanhui  = false;
		if (headId != null) {
			try {
				String sql = "from   PTCommonOpinionBO  t  where t.yjnr = ? and t.bdid=?";
				List list = dao.find(sql, new Object[]{tongguo,headId});
				if (list.size() > 0) {
					fanhui= true;
				}else{
					fanhui= false;
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return fanhui;
	}
	public static void banjie(PublicDao dao,PTTodoBS ptBs,WorkflowBS workflowBS, IERPCommonUCC erpCommonUCC,ICardQueryUCC cardQueryUCCImpl,CaShead head,String headId) {
		try{
			String ErpMessage = erpCommonUCC.book4CardById(headId);
			if(!(KpglCommon.KP_CZTYPE_CARDDEVALUE.equals(head.getBdlx())||
					(KpglCommon.KP_CZTYPE_CARDADD.equals(head.getBdlx()))&&"0".equals(head.getZjfs()))){//如果是减值和直接增加，因为正确发到erp即可减值，所以在页面上办结并跳转，不用后台操作
				if("办结成功".equals(ErpMessage)){
					List list1 = ptBs.findUnfinishedTodoListByPiId(head.getWfconfigCode());
					if(list1!=null&&list1.size()>0){
						PTTodo todo = (PTTodo) list1.get(0);
						workflowBS.endPi(todo.getTaskId(),"生成台账","kpglWorkflow/kpglWorkflow_endView.do",head.getBianhao());
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}

			
	}
	public static String checkdate(String str) {
		try {

			if (str == null || str.equals("null")) {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date now = new Date();
				str = df.format(now);
			} else {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date date = df.parse(str);
				str = df.format(date);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return str;
	}

	public static String getYear() {
		String receicedate = "";
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy");
		receicedate = formatdate.format(new Date());
		return receicedate;
	}

	public static String getMonth() {
		String receicedate = "";
		SimpleDateFormat formatdate = new SimpleDateFormat("MM");
		receicedate = formatdate.format(new Date());
		return receicedate;
	}

	public static String checkZero(String intvalue) {
		if (intvalue == null || intvalue.equals("null"))
			return "0";
		else
			return intvalue;
	}

	public static String checkzjgc(String str) {
		if ("0501".equals(str)) {
			return "05";
		} else if ("0801".equals(str)) {
			return "08";
		}
		return str;
	}

	public static String checknull(String intvalue) {
		if (intvalue == null || "null".equals(intvalue))
			return "";
		else
			return intvalue;
	}
	
	public static String getsyrbm(String user, PublicDao dao) {
		if (user == null || user.equals("") || "null".equals(user)) {
			user = "";
		} else {
			String sql = "select  t.code    from dic_app_asset_state t  where t.type='person'  and t.name='"+ user + "'";//TODO
			List list = dao.queryForList(sql, new ArrayList());
			if (list.size() > 0){
				Map map = (Map) list.get(0);
				user = (String) map.get("code"); 
			}else
				user = "";
		}
		return user;

	}
	
	public static String zjcdbm(String str) {
		if(str==null){
			return "";
		}
		if ("1".equals(str.trim()))
			str = "1";
		else if ("0".equals(str.trim()))
			str = "0";
		return str;
	}
	
	public static String getifjc(String sfjc) {
		if ("0".equals(sfjc))
			return "是";
		else
			return "否";
	}
	
	public String sender(StringBuffer erpxml) {
		URL senderp = null;
		HttpURLConnection connection = null;
		InputStream inputstream = null;
		String str = "";
		try {
			String url = String.valueOf(map.get("esb"));
			senderp = new URL(url);
			connection = (HttpURLConnection) senderp.openConnection();
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-type", "text/xml");
			connection.setRequestMethod("POST");
			connection.getOutputStream().write(erpxml.toString().getBytes("UTF-8"));
			connection.getOutputStream().flush();
			connection.getOutputStream().close();
			//int code = connection.getResponseCode();
			if (connection.getResponseCode() < 400) {
				inputstream = connection.getInputStream();
			} else {
				inputstream = connection.getErrorStream();
			}
			str = new Comment().changestr(inputstream);
		} catch (Exception ex) {
			System.out.println(new Date().toString() + "  无法与erp系统连通!");
			 ex.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return str;
	}
	
	public static String changestr(InputStream is) {
		try {
			BufferedReader in = new BufferedReader(new InputStreamReader(is,"UTF-8"));
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}
			return buffer.toString();
		} catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}
	}
	
	public static String geterp(String str, String start, String end) {
		String s = "";
		if (str.indexOf(start) > 0) {
			int i = str.indexOf(start);
			int j = str.lastIndexOf(end);
			s = str.substring(i, j + end.length());
		}
		return s;
	}
	
	public static String getvalue(String inputstr, String str1) {
		String id = "";
		try {
			if (inputstr != null) {
				if (inputstr.indexOf("sendresult") > 0
						&& inputstr.indexOf(str1) > 0) {
					SAXBuilder builder = new SAXBuilder(false);
					Reader in = new StringReader(inputstr);
					Document doc = builder.build(in);
					Element books = doc.getRootElement();
					List list1 = books.getChildren("sendresult");
					Iterator it = list1.iterator();
					Element book = (Element) it.next();
					id = book.getChildTextTrim(str1);
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return id;
	}
	
	public static String getinfo(String inputstr, String str1) {
		String id = "";
		if (inputstr.indexOf("sendresult") > 0) {
			try {
				SAXBuilder builder = new SAXBuilder(false);
				Reader in = new StringReader(inputstr);
				Document doc = builder.build(in);
				Element books = doc.getRootElement();
				List list1 = books.getChildren("sendresult");
				Iterator it = list1.iterator();
				while (it.hasNext()) {
					Element book = (Element) it.next();
					String info = book.getChildTextTrim(str1);
					if (!info.equals("null"))
						id = id + book.getChildTextTrim(str1);
				}
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return id;
	}
	
	public static String NewDate() {
		String receicedate = "";
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
		receicedate = formatdate.format(new Date());
		return receicedate;
	}
	
	public static String checkifjc(String str) {
		if ("0".equals(str))
			str = "01";
		else if ("1".equals(str))
			str = "02";
		return str;
	}
	
//	public static void alertaddzj(HttpServletRequest request,
//			HttpServletResponse response, String alertMessage) {
//	}
	
	public static String changedate(Date date) {
		if (date == null || date.equals("")) {
			date = new Date();
		}
		String receicedate = "";
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MM-dd");
		receicedate = formatdate.format(date);
		return receicedate;
	}
	//**********************以上为add 卡片新增用到的方法*****************************
	//**********************以下为change 卡片变动用到的方法*****************************
	public static String checklength(String str) {
		if (str != null) {
			if (str.length() > 4000) {
				str = str.substring(0, 4000);
			}
		}
		return str;
	}
	//**********************以上为change 卡片变动用到的方法*****************************
	//**********************以下为 卡片减值用到的方法*****************************
	public static Date monthnextdate() {
		Date date = new Date();
		try {
			StringBuffer xml = new StringBuffer();
			xml.append(Comment_Money.Esbhead());
//			xml.append("<ufinterface roottag=\"bill\" billtype=\"ncinfo\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\"EAM\" isexchange=\"Y\" filename=\"NC系统部分信息查询.xml\" proc=\"query\" operation=\"req\" account=\"0001\">");
			xml.append("<ufinterface roottag=\"bill\" billtype=\"ncinfo\" subtype=\"\" replace=\"Y\" receiver=\"" + ERPconfig.erpcompany + "\" sender=\"EAM\" isexchange=\"Y\" filename=\"NC系统部分信息查询.xml\" proc=\"query\" operation=\"req\" account=\""+ERPconfig.account+"\">");
			xml.append("<bill id=\"QUERY\">");
			xml.append("<bill_head>");
//			xml.append("<company>10101</company>");
			xml.append("<company>" + ERPconfig.erpcompany + "</company>");
			xml.append("<infotype>MINUNCB</infotype>");
			xml.append("</bill_head>");
			xml.append("</bill>");
			xml.append("</ufinterface>");
			xml.append(Comment_Money.Esbend());
			String input = new Comment().sender(xml);
			String documentstr = Comment.geterp(input, "<ufinterface", "</ufinterface>");
			date = getnextdate(documentstr);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
	public static Date getnextdate(String inputstr) {
		Date date = new Date();
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
			List list1 = books.getChildren("queryresult");
			Iterator it = list1.iterator();
			Element book = (Element) it.next();
			List list2 = book.getChildren("ncinfo");
			Iterator it2 = list2.iterator();
			Element book2 = (Element) it2.next();
			List list3 = book2.getChildren("minuncb");
			Iterator it3 = list3.iterator();
			Element book3 = (Element) it3.next();
			String year = book3.getChildTextTrim("year");
			String month = book3.getChildText("month");
			int monthtime = Integer.valueOf(month);
			if (monthtime < 9) {
				month = "0" + String.valueOf(monthtime + 1);
			} else {
				month = String.valueOf(monthtime + 1);
			}
			String id = year + "-" + month + "-01";
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = df.parse(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
	public static boolean checkifjz(Date date) {
		Date jzdate = jzdate();
		boolean sfjz = date.before(jzdate);
		return sfjz;
	}
	
	public static Date jzdate() {
		Date date = new Date();
		try {
			StringBuffer xml = new StringBuffer();
			xml.append(Comment_Money.Esbhead());
//			xml
//			.append("<ufinterface roottag=\"bill\" billtype=\"ncinfo\" subtype=\"\" replace=\"Y\" receiver=\"10101\" sender=\"EAM\" isexchange=\"Y\" filename=\"NC系统部分信息查询.xml\" proc=\"query\" operation=\"req\" account=\"0001\">");
			xml
					.append("<ufinterface roottag=\"bill\" billtype=\"ncinfo\" subtype=\"\" replace=\"Y\" receiver=\""+
							ERPconfig.receiver+"\" sender=\"EAM\" isexchange=\"Y\" filename=\"NC系统部分信息查询.xml\" proc=\"query\" operation=\"req\" account=\"0001\">");
			xml.append("<bill id=\"QUERY\">");
			xml.append("<bill_head>");
//			xml.append("<company>10101</company>");
			xml.append("<company>" + ERPconfig.erpcompany + "</company>");
			xml.append("<infotype>MINUNCB</infotype>");
			xml.append("</bill_head>");
			xml.append("</bill>");
			xml.append("</ufinterface>");
			xml.append(Comment_Money.Esbend());
			String input = new Comment().sender(xml);
			String documentstr = Comment.geterp(input, "<ufinterface",
					"</ufinterface>");
			date = geterpdate(documentstr);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
	public static Date geterpdate(String inputstr) {
		Date date = new Date();
		try {
			SAXBuilder builder = new SAXBuilder(false);
			Reader in = new StringReader(inputstr);
			Document doc = builder.build(in);
			Element books = doc.getRootElement();
			List list1 = books.getChildren("queryresult");
			Iterator it = list1.iterator();
			Element book = (Element) it.next();
			List list2 = book.getChildren("ncinfo");
			Iterator it2 = list2.iterator();
			Element book2 = (Element) it2.next();
			List list3 = book2.getChildren("minuncb");
			Iterator it3 = list3.iterator();
			Element book3 = (Element) it3.next();
			String year = book3.getChildTextTrim("year");
			String month = book3.getChildText("month");
			String id = year + "-" + month + "-01";
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = df.parse(id);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}
	
}
