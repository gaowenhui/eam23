package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.CzSczskBdxx;
import com.tansun.eam2.common.model.orm.bo.CzSczskHead;
import com.tansun.eam2.zccz.ucc.IKnowOperateUCC;
import com.tansun.eam2.zccz.ucc.IKnowQueryUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 知识库表体
 * 
 * @author 陈煜霄
 * @date 2010-12-22
 */

public class KnowBodyAction extends CommonAction {

	private CzSczskBdxx body;
	private CzSczskHead head;
	private List XMList;
	@Autowired
	private IKnowOperateUCC knowOperateUCCImpl;
	@Autowired
	private IKnowQueryUCC knowQueryUCCImpl;

	/**
	 * 打开表体页面，把正式表里面内容写到临时表里面
	 * 
	 * @return
	 */
	public String openBody() {
		String headId = request.getParameter("headId");
		boolean flag = knowQueryUCCImpl.findLSBbyHeadId(headId);
		if (flag) {
			knowQueryUCCImpl.addToLSB(headId);
		}
		request.setAttribute("headId", headId);
		return "openBody";
	}

	/**
	 * 查询表体
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryBody() throws IOException {
		String headId = request.getParameter("headId");
		String bodyJSON = knowOperateUCCImpl.findBodyByHeadId(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(bodyJSON);
		return null;
	}

	/**
	 * 删除临时表里面的数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public String deleteLSB() throws IOException {
		String headId = request.getParameter("headId");
		String itemId = request.getParameter("itemId");
		String level = request.getParameter("level");
		knowOperateUCCImpl.deleteLSB(headId, itemId,level);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("删除成功！");
		return null;
	}

	/**
	 * 修改临时表里的数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateLSB() throws IOException {
		String headId = request.getParameter("headId");
		String itemId = request.getParameter("itemId");
		String value = request.getParameter("value");
		String level = request.getParameter("level");
		knowOperateUCCImpl.updateLSB(headId, itemId, value, level);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("修改成功！");
		return null;
	}

	/**
	 * 迁移临时表的数据
	 * 
	 * @return
	 * @throws IOException
	 */
	public String moveLSB() throws IOException {
		String moveIds = request.getParameter("moveIds");
		String parentId = request.getParameter("parentId");
		String nextId = request.getParameter("nextId");
		String headId = request.getParameter("headId");
		knowOperateUCCImpl.moveLSB(moveIds, parentId, nextId, headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("迁移成功！");
		return null;
	}

	/**
	 * 同意该条表体记录
	 * 
	 * @return
	 * @throws IOException
	 */
	public String agree() throws IOException {
		String bodyIds = request.getParameter("bodyIds");
		String isAgree = request.getParameter("isAgree");
		if (bodyIds.startsWith(",")) {
			bodyIds = bodyIds.substring(1);
		}
		String[] ids = bodyIds.split(",");
		knowOperateUCCImpl.isAgree(ids, isAgree);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("操作成功！");
		return null;
	}

	/**
	 * 增加根节点
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addLSBParent() throws IOException {
		String headId = request.getParameter("headId");
		String level = request.getParameter("level");
		response.setCharacterEncoding("UTF-8");
		if ("1".equals(level)) {
			knowOperateUCCImpl.addLSBParent1(headId);
			response.getWriter().write("添加成功！");
		} else {
			String itemId = request.getParameter("itemId");
			knowOperateUCCImpl.addLSBParent2(headId, itemId);
			response.getWriter().write("添加成功！");
		}
		return null;
	}

	/**
	 * 添加子节点
	 * 
	 * @return
	 * @throws IOException
	 */
	public String addLSBChild() throws IOException {
		String headId = request.getParameter("headId");
		String itemId = request.getParameter("itemId"); // 项目id
		String itemText = request.getParameter("itemText");// 项目名称
		knowOperateUCCImpl.addLSBChild(headId, itemId, itemText);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("添加成功！");
		return null;
	}

	/**
	 * 流程办结时候将变动信息写入正式表
	 * 
	 * @param headId
	 * @throws IOException
	 * @throws ParseException
	 */
	public String writeToZSB() throws IOException, ParseException {
		String headId = request.getParameter("headId");
		head = new CzSczskHead();
		head.setId(request.getParameter("headId"));
		head.setBianhao(request.getParameter("bianhao"));
		head.setBiaoti(request.getParameter("biaoti"));
		head.setJhcd(request.getParameter("jhcd"));
		head.setNigaorenxm(request.getParameter("nigaorenxm"));
		head.setNigaoren(request.getParameter("nigaoren"));
		head.setLxdh(request.getParameter("lxdh"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = sdf.parse(request.getParameter("ngrq"));
		head.setNgrq(date);
		head.setNgbm(request.getParameter("ngbm"));
		head.setNgbmmc(request.getParameter("ngbmmc"));
		knowOperateUCCImpl.updateHead(head);
		knowOperateUCCImpl.writeToZSB(headId);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("回写成功");
		return null;
	}

	/**
	 * 打开迁移界面
	 * 
	 * @return
	 */
	public String openMove() {
		String yjid = request.getParameter("YJId");
		String headId = request.getParameter("headId");
		XMList = knowQueryUCCImpl.queryXM(headId);
		request.setAttribute("yjid", yjid);
		request.setAttribute("headId", headId);
		return "openMove";
	}

	/**
	 * 意见迁移
	 * 
	 * @return
	 * @throws IOException
	 */
	public String moveYJ() throws IOException {
		String headId = request.getParameter("headId");
		String hxmid = request.getParameter("hxmid");
		String hxmtext = request.getParameter("hxmtext");
		String hydid = request.getParameter("hydid");
		String hydtext = request.getParameter("hydtext");
		String qyjid = request.getParameter("qyjid");
		knowOperateUCCImpl.moveYJ(headId, qyjid, hxmid, hxmtext, hydid, hydtext);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("迁移成功！");
		return null;
	}

	/**
	 * 项目和要点的联动临时表
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findYDList() throws IOException {
		String pid = request.getParameter("pid");
		String headId = request.getParameter("headId");
		StringBuffer returnStr = new StringBuffer();
		returnStr.append("{'yds':[");
		Map<String, String> ydMap = knowQueryUCCImpl.findYDByXM(pid, headId);
		for (Map.Entry<String, String> entry : ydMap.entrySet()) {
			returnStr.append("{'ydid':'" + entry.getKey() + "','ydtext':'"
					+ entry.getValue() + "'},");
		}
		if (ydMap.size() != 0) {
			returnStr.deleteCharAt(returnStr.length() - 1);
		}
		returnStr.append("]}");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(returnStr.toString());
		return null;
	}

	/*
	 * 以下为用到的getter setter
	 */

	public CzSczskBdxx getBody() {
		return body;
	}

	public void setBody(CzSczskBdxx body) {
		this.body = body;
	}

	public CzSczskHead getHead() {
		return head;
	}

	public void setHead(CzSczskHead head) {
		this.head = head;
	}

	public List getXMList() {
		return XMList;
	}

	public void setXMList(List list) {
		XMList = list;
	}

}
