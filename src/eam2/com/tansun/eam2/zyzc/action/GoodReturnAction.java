package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.ZyKctz;
import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.zyzc.ucc.GoodReturnUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageBodyUCC;
import com.tansun.eam2.zyzc.ucc.ZCManageHeadUCC;
import com.tansun.eam2.zyzc.ucc.ZCQueryUCC;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.eam2.zyzc.vo.ReturnVO;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;

/**
 * 自用资产物品归还的查询
 * 
 * @author 陈煜霄
 * @date 2011-02-25
 */
//@Controller
//@Scope("prototype")
public class GoodReturnAction extends CommonAction {

	private ZyShead head;
	private QueryPurchaseVo queryPurVo;
	private Paginator paginator;
	private ReturnVO returnVO;
	@Autowired
	private GoodReturnUCC goodReturnUCCImpl;
	@Autowired
	private IDeptUCC deptUCCimpl;
	@Autowired
	private ZCManageHeadUCC zCManageHeadUCC;
	@Autowired
	private ZCManageBodyUCC zCManageBodyUCC;
	@Autowired
	private ZCQueryUCC zCQueryUCCimpl;

	public String newHead() {
		returnVO = new ReturnVO();
		// 得到当前登陆人员
		returnVO.setGhrbm(UserThreadLocal.get().getUserTidChar());
		returnVO.setGhrxm(UserThreadLocal.get().getUsername());
		List<PTDeptBO> list = deptUCCimpl.getDeptByUserId(UserThreadLocal.get()
				.getUserTid());
		if (list != null && list.size() > 0) {
			PTDeptBO dept = list.get(0);
			returnVO.setGhrbmbm(String.valueOf(dept.getRsvdNum1()));
			returnVO.setGhrbmmc(dept.getRsvdStr1());
		}
		returnVO.setGhsj(DateUtils.formatDate(new Date(), "yyyy-MM-dd"));

		head = new ZyShead();
		// 得到当前登陆人员
		head.setNgrbh(UserThreadLocal.get().getUserTidChar());
		head.setNgrmc(UserThreadLocal.get().getUsername());
		List<PTDeptBO> list1 = deptUCCimpl.getDeptByUserId(UserThreadLocal
				.get().getUserTid());
		if (list1 != null && list1.size() > 0) {
			PTDeptBO dept = list1.get(0);
			head.setNgbmbh(String.valueOf(dept.getRsvdNum1()));
			head.setNgbmmc(dept.getRsvdStr1());
		}
		head.setNgrq(DateUtils.formatDate(new Date(), "yyyy-MM-dd"));
		// 在数据库中插入一条空的head记录，得到处理单ID
		zCManageHeadUCC.newHead(head);
		return "newHead";
	}

	/**
	 * init 是资产查询界面的入口方法，
	 */
	public String init() {
		String cldId = request.getParameter("headId");
		// 设置页面状态，直接返回
		Map<String, String> yjMap = goodReturnUCCImpl.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		request.setAttribute("cldId", cldId);
		return "init";
	}

	/**
	 * 物品归还添加
	 * 
	 * @return
	 * @throws IOException
	 */
	public String queryReturn() throws IOException {
		String json = goodReturnUCCImpl.queryReturn(queryPurVo, paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		return null;
	}

	/**
	 * 办结时把台账信息保存到台账表中
	 * @return
	 * @throws ParseException
	 */
	public String saveInfoToKCtz() throws ParseException {
		String bodyIds = request.getParameter("ids");
		String ghrbm = request.getParameter("ghrbm");
		String ghrxm = request.getParameter("ghrxm");
		String ghrbmbm = request.getParameter("ghrbmbm");
		String ghrbmmc = request.getParameter("ghrbmmc");
		String ghsj = request.getParameter("ghsj");
		String[] ids = bodyIds.split(",");
		for (int i = 0; i < ids.length; i++) {
			if(StringUtils.isNotEmpty(ids[i])){
				ZySbody body = zCManageBodyUCC.findBody(ids[i]);
				ZyZc zc = zCQueryUCCimpl.getZyzcByZcId(body.getZcId());
				zc.setZczt("在库");
				zCQueryUCCimpl.updateZyZc(zc);
				ZyKctz tz = zCQueryUCCimpl.findTZById(body.getZcId());
				ZyKctz kc = new ZyKctz();
				if (tz != null) {
					tz.setSfzxjl(0L);
					zCQueryUCCimpl.updateTZ(tz.getKctzId());
					kc = tz;
				}
				kc.setTzzt("在库");
				kc.setRksl(1D);
				kc.setCksl(0D);
				kc.setKcsl(1D);
				kc.setLybmbm(null);
				kc.setLybmmc(null);
				kc.setJybmbm(null);
				kc.setJybmmc(null);
				kc.setLyrbh(null);
				kc.setLyrmc(null);
				kc.setLyrq(null);
				kc.setJydqrq(null);
				kc.setSfxj(null);
				kc.setSfzxjl(1L);
				kc.setDjlx("goodreturn");
				kc.setRq(new Date());
				kc.setGhrbm(ghrbm);
				kc.setGhrbmbm(ghrbmbm);
				kc.setGhrbmmc(ghrbmmc);
				kc.setGhrxm(ghrxm);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date udate = sdf.parse(ghsj);
				kc.setGhsj(udate);
				zCQueryUCCimpl.saveTZ(tz);
			}
		}
		zCManageBodyUCC.deleteBody(ids);
		return null;
	}

	/**
	 * 通过资产id查找资产信息
	 * 
	 * @return
	 * @throws IOException
	 */
	// public String findZCListById() throws IOException {
	// String zcIds = request.getParameter("zcIds");
	// String[] ids = zcIds.split(",");
	// String id = "";
	// for (int i = 0; i < ids.length; i++) {
	// id = id + "'" + ids[i] + "',";
	// }
	// id = id.substring(0, id.length() - 1);
	// String json = goodReturnUCCImpl.findZCListById(id,paginator);
	// response.setCharacterEncoding("UTF-8");
	// response.getWriter().write(json);
	// return null;
	// }
	public QueryPurchaseVo getQueryPurVo() {
		return queryPurVo;
	}

	public void setQueryPurVo(QueryPurchaseVo queryPurVo) {
		this.queryPurVo = queryPurVo;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public ReturnVO getReturnVO() {
		return returnVO;
	}

	public void setReturnVO(ReturnVO returnVO) {
		this.returnVO = returnVO;
	}

	public ZyShead getHead() {
		return head;
	}

	public void setHead(ZyShead head) {
		this.head = head;
	}

}
