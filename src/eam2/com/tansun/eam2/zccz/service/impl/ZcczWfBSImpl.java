package com.tansun.eam2.zccz.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzHyxx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmXx;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.common.util.ESBBean;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.portal.PortalService;
import com.tansun.eam2.zccz.ZcczCommon;
import com.tansun.eam2.zccz.service.ZcczWfBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;

@Service
public class ZcczWfBSImpl extends CommonBSImpl implements ZcczWfBS {

	@Autowired
	private PublicDao publicDao;

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	/**
	 * 如果处置项目审批通过 把处置投资项目信息临时表CZ_XMXX_LSB中的信息拷贝到处置项目信息表CZ_XM_XX表中
	 * 同时设置CZ_XM_XX表中的状态为0：处置方案未执行
	 * 
	 * @param czXmxxLsb
	 */
	public void copyItemInfo(CzXmxxLsb czXmxxLsb) {
		CzXmXx czXmXx = new CzXmXx();
		BeanUtils.copyProperties(czXmxxLsb, czXmXx);
		czXmXx.setZhuangtai("0");
		publicDao.save(czXmXx);
	}

	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 
	 * @param hyId
	 * @return Map<"处理单id",List<"审批委员Id">>
	 */
	public Map<String, List<String>> getAllShenpiWeiyuan(String hyId) {
		String hsql = "from CzXmxxLsb where hyId=?";
		List args = new ArrayList();
		args.add(hyId);
		List list1 = this.publicDao.find(hsql, args);

		Map retmap = new HashMap();
		int i = 0;
		for (i = 0; i < list1.size(); i++) {
			CzXmxxLsb bo = (CzXmxxLsb) list1.get(i);
			String cldid = bo.getCldId(); // 处理单信息
			String xmid = bo.getId(); // 项目编号

			hsql = "from CzXmSpwYj where xmId=?";
			args = new ArrayList();
			args.add(xmid);
			List list2 = this.publicDao.find(hsql, args);
			int j = 0;
			List xmlist = new ArrayList();
			for (j = 0; j < list2.size(); j++) {
				CzXmSpwYj bo2 = (CzXmSpwYj) list2.get(j);
				xmlist.add(bo2.getSpwy()); // 把审批委员加上去
			}
			retmap.put(xmid, xmlist);
		}

		return retmap; //
	}

	/**
	 * 根据会议Id到项目临时表CZ_XMXX_LSB中查项目列表 再通过项目id到表CZ_XM_SPW_YJ中查询项目下所有的审批委员
	 * 如果说有的审批委员都已经提交审批意见(字段SFTJSPYJ)return true;否则return false
	 * 
	 * @param hyId
	 * @return Map<项目名称,List<委员名称>>
	 */
	public Map<String, List<String>> isAllXmSubmit(String hyId) {
		Map<String, List<String>> returnMap = new HashMap<String, List<String>>();
		//根据会议id取得项目临时信息列表
		List<CzXmxxLsb> list1 = (List<CzXmxxLsb>)this.publicDao.find("from CzXmxxLsb where hyId=?", new String[]{hyId});
		for (CzXmxxLsb bo : list1) {
			// 项目编号
			String xmid = bo.getId(); 
			//根据项目id取得审批委员列表
			List<CzXmSpwYj> list2 = (List<CzXmSpwYj>)this.publicDao.find("from CzXmSpwYj where xmId=? and sfwzcr='0'", new String[]{xmid});
			List<String> wymcList = new ArrayList<String>();
			for (CzXmSpwYj bo2 : list2) {
				if (bo2.getSftjspyj() != null && bo2.getSftjspyj().trim().equals("0")) {
					//如果没有提交意见，加入到wymcList中，待返回
					wymcList.add(bo2.getSpwyxm());
				}
			}
			if(wymcList.size() > 0)
				returnMap.put(bo.getCzxmmc(), wymcList);
		}
		return returnMap; 
	}

	/**
	 * 返回一个会议内的所有项目的处理单id和意见汇总人id 表CZ_XMXX_LSB
	 * 
	 * @param hyId
	 * @return Map<处理单id,意见汇总人id>
	 */
	public Map<String, String> getAllcldIdInHy(String hyId) {
		return null;
	}

	/**
	 * 根据会议id取得会议里面所有的项目对应的流程Id 。 1个会议对应多个项目 根据会议Id到表CZ_XMXX_LSB中找到项目
	 * 再通过项目中的处理单id（字段：CLD_ID）到表CZ_STCZTZ中找到对应的流程id（字段LC_ID）
	 * 
	 * @param hyId
	 *            会议id return List<流程Id>
	 */

	public List<String> getStztczStayazLcIdInHy(String hyId) {
		List listMap = new ArrayList();
		List<String> listString = new ArrayList();
		List params = new ArrayList();
		params.add(hyId);
		String preparSQL = "select lc_id from CZ_STCZTZ where lc_id !='' and  id in(select CLD_ID from CZ_XMXX_LSB where HY_ID=? )";
		listMap = publicDao.queryForList(preparSQL, params);
		for (int i = 0; i < listMap.size(); i++) {
			Map map = (Map) listMap.get(i);
			listString.add(map.get("LC_ID").toString());
		}
		return listString;
	}

	/**
	 * 根据会议id取得会议里面所有的项目对应的流程Id 。 1个会议对应多个项目 根据会议Id到表CZ_XMXX_LSB中找到项目
	 * 再通过项目中的处理单id（字段：CLD_ID）到表CZ_CZTZFA_XX中找到对应的流程id（字段LCID）
	 * 
	 * @param hyId 会议id return List<流程Id>
	 */
	public List<String> getZcczLcIdInHy(String hyId) {
		List listMap = new ArrayList();
		List<String> listString = new ArrayList();
		List params = new ArrayList();
		params.add(hyId);
		String preparSQL = "select lcid from CZ_CZTZFA_XX where lcid !='' and  id in(select CLD_ID from CZ_XMXX_LSB where HY_ID=? )";
		listMap = publicDao.queryForList(preparSQL, params);
		for (int i = 0; i < listMap.size(); i++) {
			Map map = (Map) listMap.get(i);
			if (map.get("LC_ID").toString().trim().length() > 0) {
				listString.add(map.get("LCID").toString());
			}
		}
		return listString;
	}

	/**
	 * 向审批委员发送待办 根据会议id找到会议对象（表CZ_HYXX） 根据会议Id到表CZ_XMXX_LSB中找到所有项目
	 * 再通过项目中的项目id到表CZ_XM_SPW_YJ中找到所有的审批委员信息 会议－－－（多个）－－－项目－－－－（多个）－－－委员
	 * 每个委员在待办表（P_T_TODO）中新建一条记录，将以下信息拷贝到新建的待办中
	 * 
	 * 待办所属用户ID------>委员id（CZ_XM_SPW_YJ.SPWY） 待办发送人Id-------->currentUser.tid
	 * 表单类型-------------"CZ_XM_SPW_YJ" 标题-----------------会议次数（CZ_HYXX.HYCS）
	 * 拟稿人Id-------->currentUser.tid 拟稿日期-------->new Date() 创建日期-------->new
	 * Date()
	 * 访问URL--------->"zccz/dealToDo_czxm4Shyj.do?hyId=hyId&todoId=id"(CZ_HYXX.ID,待办id)
	 * 所属子系统------>"zccz" 待办状态——0:已删除，1:有效,---"1" 0：未读，1：已读-------------"0"
	 * 其它全部为空
	 * 
	 * @param hyId
	 */

	public void sendSpwySpdb(String hyId, PTUserBO currentUser) {
		
		CzHyxx hy = publicDao.findById(CzHyxx.class, hyId);
		List listMap = new ArrayList();
		List<String> listString = new ArrayList();
		List params = new ArrayList();
		params.add(hyId);
		// 查询所有审批委员信息
		String preparSQL = "select distinct SPWY from  CZ_XM_SPW_YJ  where XM_ID in (select id from CZ_XMXX_LSB   where HY_ID=? ) and sfwzcr = '0'";
		listMap = publicDao.queryForList(preparSQL, params);
		PortalService portal = new PortalService();
		String flag = "true";
		ESBBean esbBean = (ESBBean)SpringContextHelper.getBean("esbBean");
		portal.setPrefix(esbBean.getEsb());
		flag = esbBean.getMode();
		for (int i = 0; i < listMap.size(); i++) {
			Map map = (Map) listMap.get(i);
			PTTodo pTTodo = new PTTodo();
			publicDao.save(pTTodo);
			pTTodo = publicDao.findById(PTTodo.class, pTTodo.getId());
			if (map.get("SPWY") != null) {
				pTTodo.setUserId(Long.parseLong((String)map.get("SPWY")));
				pTTodo.setSendUserId(currentUser.getTid());
				pTTodo.setTitle(hy.getHycs());
				pTTodo.setHeadId(hy.getId());
				pTTodo.setDraftDate(new Date());
				pTTodo.setCreateDate(new Date());
				pTTodo.setUrl("zccz/dealToDo_czxmsp.do");
				pTTodo.setParam("hyId=" + hyId + "&todoId=" + pTTodo.getId());
				pTTodo.setSubsystem(GlobalVariable.INDEX_ASSET_DISPOSE_SUBSYSTEM);
				pTTodo.setDraftUserId(currentUser.getTid());
				pTTodo.setTaskName("委员审批");
				pTTodo.setStatu("1");
				pTTodo.setIsRead("0");
				pTTodo.setDeptId(new Long(113));
				publicDao.update(pTTodo);
				if(!"true".equals(flag)){
					pTTodo.setTaskId(String.valueOf(System.currentTimeMillis()));
					portal.newTask(pTTodo);
				}
			}
		}
		setXmzt_WYTJYJZ(hyId);
		hy.setSffscl("1");
		publicDao.update(hy);
	}

	/**
	 * 会议提交的时候要将会议的流程Id保存到会议（表：CZ_HYXX，字段：LC_ID）信息中
	 * 
	 * @param processInstanceId
	 * @param cldId
	 */
	public void hyDraftSubmit(String processInstanceId, String cldId) {
		CzHyxx czHyxx = publicDao.findById(CzHyxx.class, cldId);
		czHyxx.setLcId(processInstanceId);
		publicDao.update(czHyxx);
	}

	/**
	 * 添加或修改审批委员信息
	 * 
	 * @param czXmSpwYj
	 */

	public void saveOrUpdateSpwyYj(CzXmSpwYj czXmSpwYj) {
		publicDao.saveOrUpdate(czXmSpwYj);

	}

	/**
	 * 将待办信息（表：P_T_TODO）的状态（字段：STATU）改为"0"
	 * 新建已办，根据待办信息设置已办信息表的数据
	 * ID
	 * USER_ID               todo.id
	 * TITLE                 todo.title
	 * DRAFT_USERID          todo.draft_userId
	 * DRAFT_DATE            todo.draftDate
	 * CREATE_DATE           newdate
	 * URL                   "zccz/dealToDo_czxm4Shyj.do"
	 * SUBSYSTEM			 "zccz"
	 * STATU                 "1"
	 * SEND_USERID			 todo.userId
	 * PARAM				 headId=hyId&todoId=id"
	 * @param todoId
	 */
	public void submitToDo(String todoId) {
		if(StringUtils.isEmpty(todoId))return;
		PTDid pTDid = new PTDid();
		Long didId = (Long)publicDao.save(pTDid);
		PTTodo pTTodo = publicDao.findById(PTTodo.class, Long.parseLong(todoId));
		pTTodo.setStatu("0");
		pTDid = publicDao.findById(PTDid.class, didId);
		pTDid.setUserId(pTTodo.getUserId());
		pTDid.setHeadId(pTTodo.getHeadId());
		pTDid.setTitle(pTTodo.getTitle());
		pTDid.setDraftUserId(pTTodo.getDraftUserId());
		pTDid.setDraftDate(pTTodo.getDraftDate());
		pTDid.setCreateDate(new Date());
		pTDid.setUrl(pTTodo.getUrl());
		pTDid.setSubsystem(pTTodo.getSubsystem());
		pTDid.setStatu("1");
		pTDid.setDraftUserId(pTTodo.getDraftUserId());
		pTDid.setTaskName(pTTodo.getTaskName());
		pTDid.setSendUserId(pTTodo.getUserId());
		pTDid.setParam(pTTodo.getParam().split("&")[0] + "&didId=" + didId);
		publicDao.update(pTTodo);
		publicDao.update(pTDid);
	}

	//审批委员
	@SuppressWarnings("unchecked")
	public void spwyDidToEnd(String hyId) {
		if(StringUtils.isNotEmpty(hyId)){
			List<PTTodo> todoList = (List<PTTodo>)publicDao.find("from PTTodo todo where headId=? and taskId is null", new String[]{hyId});
			for(PTTodo todo : todoList){
				publicDao.delete(todo);
			}
			List<PTDid> didList = (List<PTDid>)publicDao.find("from PTDid did where headId=? and taskId is null",new String[]{hyId});
			for(PTDid did : didList){
				did.setStatu("0");
				PTEnd end = new PTEnd();
				end.setCreateDate(new Date());
				end.setDraftDate(did.getDraftDate());
				end.setDraftDeptId(did.getDraftDeptId());
				end.setHeadId(did.getHeadId());
				end.setProcInstId(did.getProcInstId());
				end.setProcInstName(did.getProcInstName());
				end.setSheetId(did.getSheetId());
				end.setSubsystem(did.getSubsystem());
				end.setTitle(did.getTitle());
				end.setUrl(did.getUrl());
				end.setUserId(did.getUserId());
				if(StringUtils.isNotEmpty(did.getParam()))
					end.setParam(did.getParam().split("&")[0]);
			}
		}
	}
	
	/**
	 * 取得会议里面的所有项目对应的处理单对象
	 * 根据hyId到表CZ_XM_XX找到所有的cldId(即CZ_STCZTZ.id),再到表CZ_CZTZFA_XX中找到所有的对象
	 * 
	 * @param hyId :
	 *            CZ_XM_XX.HY_ID
	 * @return
	 */
	public Map<CzXmxxLsb,CzCztzfaXx> getCzCztzfaXxListInHy(String hyId) {
		String hsql = "from CzXmxxLsb Where hyId=?"; // hsql语句
		List params = new ArrayList();
		params.add(hyId); // 增加参数

		List xmlist = this.publicDao.find(hsql, params); // 得到项目信息的列表
		//List retList = new ArrayList();
		Map<CzXmxxLsb, CzCztzfaXx> xmMap = new LinkedHashMap<CzXmxxLsb, CzCztzfaXx>();
		int i = 0;
		for (i = 0; i < xmlist.size(); i++) {
			CzXmxxLsb czXmxxLsb = (CzXmxxLsb) xmlist.get(i); // 得到项目
			CzCztzfaXx xx = (CzCztzfaXx) this.publicDao.findById(
					CzCztzfaXx.class, czXmxxLsb.getCldId());// 按照处理单编号,检索处置单
			if (xx != null) {
				//retList.add(xx);
				xmMap.put(czXmxxLsb, xx);
			}
		}
		return xmMap;
	}
	/**
	 * 取得会议里面的所有项目对应的处理单对象
	 * 根据hyId到表CZ_XM_XX找到所有的cldId(即CZ_STCZTZ.id),再到表CZ_STCZTZ中找到所有的对象
	 * @param hyId : CZ_XM_XX.HY_ID
	 * @return
	 */
	//public List<CzStcztz> getCzStcztzListInHy(String hyId) {
	public Map<CzXmxxLsb,CzStcztz> getCzStcztzListInHy(String hyId) {
		String hsql = "from CzXmxxLsb Where hyId=?"; // hsql语句
		List params = new ArrayList();
		params.add(hyId); // 增加参数

		List xmlist = this.publicDao.find(hsql, params); // 得到项目信息的列表
		//List retList = new ArrayList();
		Map<CzXmxxLsb,CzStcztz> xmMap = new LinkedHashMap<CzXmxxLsb, CzStcztz>();
		int i = 0;
		for (i = 0; i < xmlist.size(); i++) {
			CzXmxxLsb czXmxxLsb = (CzXmxxLsb) xmlist.get(i); // 得到项目
			CzStcztz xx = (CzStcztz) this.publicDao.findById(
					CzStcztz.class, czXmxxLsb.getCldId());// 按照处理单编号,检索处置单
			if (xx != null) {
				//retList.add(xx);
				xmMap.put(czXmxxLsb, xx);
			}
		}
		//return retList;
		return xmMap;
	}
	/**
	 * 返回本项目(实体整体处置或实体人员安置)所属会议对象(CzHyxx)
	 * 根据cldId 到表 CZ_XMXX_LSB(字段:CLD_ID) 中找到 HY_ID
	 * 根据HY_ID 到表 CZ_HYXX(字段ID) 中找到会议对象CzHyxx 返回对象
	 * @param cldId : CZ_XMXX_LSB.CLD_ID
	 * @return
	 */
	public CzHyxx getHyxxByCldId(String cldId) {
		String hsql="from CzXmxxLsb Where cldId=?";
		List params = new ArrayList();
		params.add(cldId); // 增加参数
		
		CzXmxxLsb xmxxLsb = (CzXmxxLsb)this.publicDao.findSingleResult(hsql, params);
		if (xmxxLsb == null){
			return null;
		}
		//检索会议信息BO对象,用HyId作为主键进行查找
		CzHyxx hyxx = (CzHyxx)this.publicDao.findById(CzHyxx.class, xmxxLsb.getHyId());
		return hyxx;
	}
	/**
	 * 是否本项目(资产处置)所属会议的所有项目都已经结束(CZ_CZTZFA_XX表中的字段CLDZT为已审批)
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回
	 * 如果全部已经结束返回true,否则返回false
	 * @param cldId : CZ_CZTZFA_XX.id
	 * @return
	 */
	public boolean isAllCzCztzfaXxXmIsOver(String cldId) {
		//step1: 从项目临时表里面检索出对应会议Id
		String hsql="from CzXmxxLsb Where cldId=? And zhuangtai<>?";
		List params = new ArrayList();
		params.add(cldId); // 增加参数
		params.add("0"); 	//过滤其中的未上会记录,只剩余上会中和上会完毕
		
		CzXmxxLsb xmxxLsb = (CzXmxxLsb)this.publicDao.findSingleResult(hsql, params);
		if (xmxxLsb == null){
			return false; //找不到对应的项目临时表信息,返回false
		}
		
		//Step2:检索所有对应的处理单CZ_CZTZFA_XX
		String strsql=" Select CLDZT from CZ_CZTZFA_XX where Id in "
			+"(Select CLD_ID from CZ_XMXX_LSB Where Id=?)";
		params=new ArrayList();
		params.add(xmxxLsb.getId()); //把临时表的ID带进去
		
		List cldList = this.publicDao.queryForList(strsql, params);
		int i=0;
		for(i=0;i<cldList.size();i++){
			Map m = (Map)cldList.get(i);
			String cldzt = (String)m.get("CLDZT");
			if(cldzt != null && cldzt.equals("2")){
				continue;
			}else{
				return false;
			}
		}
		//所有项目循环结束,返回true代表所有项目已结束
		return true;
	}
	/**
	 * 是否本项目(实体整体处置或实体人员安置)所属会议的所有项目都已经结束(CZ_STCZTZ表中的字段CLDZT为已审批)
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回
	 * 如果全部已经结束返回true,否则返回false
	 * @param cldId : CZ_STCZTZ.id
	 * @return
	 */
	public boolean isAllCzStcztzXmIsOver(String cldId) {
		//step1: 从项目临时表里面检索出对应会议Id
		String hsql="from CzXmxxLsb Where cldId=? And zhuangtai<>?";
		List params = new ArrayList();
		params.add(cldId); // 增加参数
		params.add("0"); 	//过滤其中的未上会记录,只剩余上会中和上会完毕
		
		CzXmxxLsb xmxxLsb = (CzXmxxLsb)this.publicDao.findSingleResult(hsql, params);
		if (xmxxLsb == null){
			return false; //找不到对应的项目临时表信息,返回false
		}
		
		//Step2:检索所有对应的处理单CZ_CZTZFA_XX
		String strsql=" Select CLDZT from CZ_STCZTZ where Id in "
			+"(Select CLD_ID from CZ_XMXX_LSB Where Id=?)";
		params=new ArrayList();
		params.add(xmxxLsb.getId()); //把临时表的ID带进去
		
		List cldList = this.publicDao.queryForList(strsql, params);
		int i=0;
		for(i=0;i<cldList.size();i++){
			Map m = (Map)cldList.get(i);
			String cldzt = (String)m.get("CLDZT");
			if(cldzt != null && cldzt.equals("2")){ //2代表审批通过
				continue;
			}else{
				return false;
			}
		}
		//所有项目循环结束,返回true代表所有项目已结束
		return true;
	}
	/**
	 * 拟稿提交的时候跟新会议的审批状态和会议里面所有项目的上会状态
	 * 根据cldId 到表CZ_HYXX(字段ID)中找到会议,将字段CZ_HYXX.SPZT改为审批中
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回 4：作废
	 * 再根据cldId(即CZ_HYXX.ID)到表CZ_XMXX_LSB中根据CZ_XMXX_LSB.HY_ID找到所有项目CzHyxx
	 * 将字段CZ_XMXX_LSB.ZHUANGTAI 改为上会中。状态  0：未上会1：上会中2：上会完毕
	 * @param hyId : CZ_HYXX.ID
	 */
	public void updateHyStatuAtDraftSubmit(String hyId) {
		String strsql ="Update CZ_HYXX Set SPZT=? Where ID=?";
		List params = new ArrayList();
		params.add("1"); //1审批中
		params.add(hyId); //会议Id
		this.publicDao.updateBySql(strsql, params); //更新会议表
		
		//step2:更新原始的处理单
		strsql="Update CZ_XMXX_LSB Set ZHUANGTAI=? Where HY_ID=?";
		params=new ArrayList();
		params.add("1"); //上会中
		params.add(hyId); //会议Id
		this.publicDao.updateBySql(strsql, params); //更新项目临时表

	}
	/**
	 * 会议作废时跟新会议处理单状态，字段（CZ_HYXX.SPZT）改为作废
	 * 处理单状态  0：未审批   1：审批中 2：已审批 3：被退回 4：作废
	 * 再将会议涉及的所有项目临时表字段（CZ_XMXX_LSB.ZHUANGTAI）改为未上会
	 * 状态  0：未上会1：上会中2：上会完毕
	 * @param cldId	CZ_HYXX.id
	 */
	public void abandonHy(String hyId) {
		String strsql ="Update CZ_HYXX Set SPZT=? Where ID=?";
		List params = new ArrayList();
		params.add("4"); //1作废
		params.add(hyId); //会议Id
		this.publicDao.updateBySql(strsql, params); //更新会议表
		
		//step2:更新项目临时表
		strsql="Update CZ_XMXX_LSB Set ZHUANGTAI=? Where HY_ID=?";
		params=new ArrayList();
		params.add("0"); //未上会
		params.add(hyId); //会议Id
		this.publicDao.updateBySql(strsql, params); //更新项目临时表		
	}

	/**
	 * 根据会议id给本次会议内所有未提交意见的审批委员发送消息
	 * 到表CZ_HYXX中找到CZ_HYXX.id=hyId 的记录
	 * 到表CZ_XMXX_LSB中找到所有CZ_XMXX_LSB.ID WHERE CZ_XMXX_LSB.HY_ID=hyId的记录
	 * 再通过CZ_XMXX_LSB.ID到表CZ_XM_SPW_YJ找到所有CZ_XM_SPW_YJ.XM_ID=CZ_XMXX_LSB.ID AND CZ_XM_SPW_YJ.SFTJSPYJ="0"的记录
	 * 对于每条记录在表P_T_MESSAGE中插入一条记录（即发送一条消息）。记录字段信息如下：
	 * ID						自动生成
	 * CREATE_DATE				new Date()
	 * SEND_USER_ID				currentUserId
	 * USER_ID					Long.parseLong(CZ_XM_SPW_YJ.SPWY)
	 * MESSAGE					"项目上会材料：请提交" + CZ_HYXX.HYCS + "项目审批意见"
	 * URL						"zccz/dealToDo_czxm4Shyj.do?hyId=hyId"(CZ_HYXX.ID)
	 * IS_READ					"0"
	 * 1:消息,2:传阅				"1"
	 * @param hyId ：CZ_HYXX.id
	 */	
	public void sendSpwyMessage(String hyId, String currentUserId) {
		//Step1:得到审批委员的ID
		String strsql="Select SPWY from CZ_XM_SPW_YJ "
					+" Where SFTJSPYJ= ? "
					+" And xm_id in "
					+" (select id from CZ_XMXX_LSB where hy_id =? )";
		List params = new ArrayList();
		params.add("0"); //0代表没有提交审批意见
		params.add(hyId); //加入会议Id
		
		List userlist = this.publicDao.queryForList(strsql, params);
		
		//检索会议信息
		CzHyxx hyxx = this.publicDao.findById(CzHyxx.class, hyId);
		if (hyxx == null){
			return;
		}
		
		//Step2:给审查委员发相应的消息过去
		int i=0;
		for(i=0;i<userlist.size();i++){
			Map userMap = (Map)userlist.get(i);
			String userid = (String)userMap.get("SPWY"); //得到用户编号
			PTMessage mess = new PTMessage();
			mess.setCreateDate(new java.util.Date());
			mess.setSendUserId(Long.parseLong(currentUserId));
			mess.setUserId(Long.parseLong(userid));
			mess.setMessage("项目上会材料：请提交 " + hyxx.getHycs() + " 项目审批意见");
			mess.setUrl("zccz/dealToDo_czxm4Shyj.do?hyId="+hyId);
			mess.setIsRead("0");
			mess.setType("1");
			this.publicDao.save(mess); //插入一个新的消息记录过去
		}
		
		
	}

	public CzHyxx getHyById(String hyId) {
		if( StringUtils.isNotEmpty(hyId))
			return publicDao.findById(CzHyxx.class, hyId);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public Map<?,?> getHyMapId(String hyId){
		List<?> resultList =
			publicDao.queryForList(
				"select HYJYZLRBMID,HYJYZLR from cz_hyxx where id='" + hyId + "'",
				new ArrayList());
		Map<?,?> returnMap = (Map)resultList.get(0);
		System.out.print(returnMap.get("HYJYZLRBMID"));
		System.out.print(returnMap.get("HYJYZLR"));
		return returnMap;
	}
	
	//会议状态改为上会中
	public void setHyzt_SHZ(String hyId){
		CzHyxx hy = publicDao.findById(CzHyxx.class, hyId);
		hy.setSpzt(ZcczCommon.MEETING_STATE_SHZ);
		publicDao.update(hy);
	}
	//会议状态改为会议纪要整理中
	public void setHyzt_HYJYZLZ(String hyId){
		CzHyxx hy = publicDao.findById(CzHyxx.class, hyId);
		hy.setSpzt(ZcczCommon.MEETING_STATE_HYJYZLZ);
		publicDao.update(hy);		
	}
	//会议状态改为上会完毕
	public void setHyzt_SHWB(String hyId){
		CzHyxx hy = publicDao.findById(CzHyxx.class, hyId);
		hy.setSpzt(ZcczCommon.MEETING_STATE_SHWB);
		publicDao.update(hy);		
	}
	
	public void setXmzt_WSH(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_WSH,hyId});
	}			//0：未上会
	public void setXmzt_SHZ(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_SHZ,hyId});
	}			//1：上会中
	public void setXmzt_SHWB(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_SHWB,hyId});
	}			//2：上会完毕
	public void setXmzt_WYTJYJZ(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_WYTJYJZ,hyId});
	}           //3: 委员提交意见中（发送委员材料后）
	public void setXmzt_WYTJYJZWB(String xmId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_WYTJYJZWB,xmId});
	}    		//4: 委员提交意见完毕（所有的委员提交意见后）
	public void setXmzt_ZCRTJYJZ(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_ZCRTJYJZ,hyId});
	}    		//5: 主持人提交意见中（待办发送到主持人审批环节）
	public void setXmzt_YJHZZ(String hyId){
		publicDao.updateBySql("update CZ_XMXX_LSB set ZHUANGTAI=? where HY_ID=?", new String[]{ZcczCommon.DEALTODO_XMZT_YJHZZ,hyId});
	}			//6:意见汇总中
	
	public boolean isAllYjSubmit(String xmId){
		List<CzXmSpwYj> yjList = (List<CzXmSpwYj>)publicDao.find("from CzXmSpwYj o where o.xmId=? and o.sfwzcr='0'",new String[]{xmId});
		for(CzXmSpwYj yj : yjList){
			if(StringUtils.equals("0", yj.getSftjspyj()))
				return false;
		}
		return true;
	}	//判断所给项目的所有的审批委员是否全部提交意见

	public boolean isAllXmIsOverInHy(String hyId) {
		//根据会议Id取得会议下所有的项目
		List<CzXmxxLsb> xmList = (List<CzXmxxLsb>)publicDao.find("from CzXmxxLsb o where o.hyId= '" + hyId + "'");
		for(CzXmxxLsb lsb : xmList){//遍历项目
			//取得项目对应的实体整体处置或人员安置处理单对象
			CzStcztz czStcztz_lsb = publicDao.findById(CzStcztz.class, lsb.getCldId());
			if(czStcztz_lsb == null){//如果不是实体整体处置或实体人员安置
				//取得项目对应的资产处置处理单
				CzCztzfaXx czCztzfaXx_lsb = publicDao.findById(CzCztzfaXx.class, lsb.getCldId());
				if(!StringUtils.equals(ZcczCommon.FORM_HAVE_APPROVED, czCztzfaXx_lsb.getCldzt()) && !StringUtils.equals(lsb.getCldId(), czCztzfaXx_lsb.getId())){
					return false;//处理单状态是否不为结束
				}
			}else{
				if(!StringUtils.equals(ZcczCommon.FORM_HAVE_APPROVED, czStcztz_lsb.getCldzt()) && !StringUtils.equals(lsb.getCldId(), czStcztz_lsb.getId())){
					return false;//处理单状态是否不为结束
				}
			}
		}
		//如果所有的处理单状态都为结束（"2"）ZcczCommon.FORM_HAVE_APPROVED
		return true;
	}
	
	public void copyAttach(String[] ids, String newbdId, String newFileType) {
		for (int i = 0; i < ids.length; i++) {
			if (!isZzfj(ids[i])) {
				Map map = getFilePropMap(ids[i]);
				PTAttachment pTAttachment_new = new PTAttachment();// 新的附件对象
				pTAttachment_new.setBdid(newbdId);// 设置新的表单ID
				pTAttachment_new.setFjlx(newFileType);
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setYwjm((String) map.get("YWJM"));
				pTAttachment_new.setWjlx((String) map.get("WJLX"));
				pTAttachment_new.setWjdx(new Long((String) map.get("WJDX")));
				pTAttachment_new.setScrid((String) map.get("SCRID"));
				pTAttachment_new.setScrbh((String) map.get("SCRBH"));
				pTAttachment_new.setScsj((String) map.get("SCSJ"));
				pTAttachment_new.setScbm((String) map.get("SCBM"));
				pTAttachment_new.setDel(new Long("0"));
				pTAttachment_new.setSwid((String) map.get("SWID"));
				pTAttachment_new.setTemplateid((String) map.get("TEMPLATEID"));
				pTAttachment_new.setSortid((String) map.get("SORTID"));
				pTAttachment_new.setSessionid((String) map.get("SESSIONID"));
				pTAttachment_new.setZzfj("1");// (String) map.get("ZZFJ")
				PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();// 新的附件正文对象
				PTAttachmentBlob pTAttachment_blob_old = publicDao.findById(PTAttachmentBlob.class, (String)map.get("ID"));
				pTAttachment_blob_new.setContent(pTAttachment_blob_old.getContent());
				pTAttachment_new.setBlob(pTAttachment_blob_new);// 设置新的正文内容
				publicDao.save(pTAttachment_new);// 保存新的附件
				String strId = pTAttachment_new.getId();
//				copyBlob((String) map.get("ID"), strId);
				// System.out.println("新的附件的编号" + strId);
//				setZzfj(ids[i]);// 标识为最终附件
			} else {
				// System.out.println("已经是最终附件");
			}
		}
	}
	public void copyAttach2(String[] ids, String newbdId, String newFileType) {
		for (int i = 0; i < ids.length; i++) {
			//if (!isZzfj(ids[i])) {
				Map map = getFilePropMap(ids[i]);
				PTAttachment pTAttachment_new = new PTAttachment();// 新的附件对象
				pTAttachment_new.setBdid(newbdId);// 设置新的表单ID
				pTAttachment_new.setFjlx(newFileType);
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setFjbt((String) map.get("FJBT"));
				pTAttachment_new.setYwjm((String) map.get("YWJM"));
				pTAttachment_new.setWjlx((String) map.get("WJLX"));
				pTAttachment_new.setWjdx(new Long((String) map.get("WJDX")));
				pTAttachment_new.setScrid((String) map.get("SCRID"));
				pTAttachment_new.setScrbh((String) map.get("SCRBH"));
				pTAttachment_new.setScsj((String) map.get("SCSJ"));
				pTAttachment_new.setScbm((String) map.get("SCBM"));
				pTAttachment_new.setDel(new Long("0"));
				pTAttachment_new.setSwid((String) map.get("SWID"));
				pTAttachment_new.setTemplateid((String) map.get("TEMPLATEID"));
				pTAttachment_new.setSortid((String) map.get("SORTID"));
				pTAttachment_new.setSessionid((String) map.get("SESSIONID"));
				pTAttachment_new.setZzfj(Zzfj(ids[i]));// (String) map.get("ZZFJ")
				PTAttachmentBlob pTAttachment_blob_new = new PTAttachmentBlob();// 新的附件正文对象
				PTAttachmentBlob pTAttachment_blob_old = publicDao.findById(PTAttachmentBlob.class, (String)map.get("ID"));
				pTAttachment_blob_new.setContent(pTAttachment_blob_old.getContent());
				pTAttachment_new.setBlob(pTAttachment_blob_new);// 设置新的正文内容
				publicDao.save(pTAttachment_new);// 保存新的附件
				String strId = pTAttachment_new.getId();
//				copyBlob((String) map.get("ID"), strId);
				// System.out.println("新的附件的编号" + strId);
//				setZzfj(ids[i]);// 标识为最终附件
			//} else {
				// System.out.println("已经是最终附件");
			//}
		}
	}
	private String Zzfj(String strId) {
		List list = new ArrayList();
		String strSQL = "select zzfj from p_t_attachment where id= ? ";
		list.add(strId);
		List<Map<String,Object>> queryList =  publicDao.queryForList(strSQL, list);
		if(queryList == null || queryList.size() == 0){
			return "1";
		}
		Map map = (Map) publicDao.queryForList(strSQL, list).get(0);
		String strZZFJ = (String) map.get("ZZFJ");
		return strZZFJ;
	}
	private boolean isZzfj(String strId) {
		List list = new ArrayList();
		String strSQL = "select zzfj from p_t_attachment where id= ? ";
		list.add(strId);
		List<Map<String,Object>> queryList =  publicDao.queryForList(strSQL, list);
		if(queryList == null || queryList.size() == 0){
			return false;
		}
		Map map = (Map) publicDao.queryForList(strSQL, list).get(0);
		String strZZFJ = (String) map.get("ZZFJ");
		if ("0".equals(strZZFJ)) {
			return false;
		} else {
			return true;
		}
	}
	
	private void copyBlob(String strOld, String strNew) {
		String strSQL = "update p_t_attachment_blob set content = (select content from p_t_attachment_blob where id = '"
				+ strOld + "') where id='" + strNew + "' ";
		publicDao.getJdbcTemplate().execute(strSQL);
	}
	
	private Map getFilePropMap(String strId) {
		String preparSQL = "select * from p_t_attachment where id= ? ";
		List params = new ArrayList();
		List listMap = new ArrayList();
		params.add(strId);
		listMap = publicDao.queryForList(preparSQL, params);
		Map map = (Map) listMap.get(0);
		return map;
	}
	
	public void setZzfj(String id) {
		String strSQL = "update p_t_attachment set zzfj='1' where id='" + id
				+ "'";
		publicDao.getJdbcTemplate().execute(strSQL);
	}
	
	/**
	 * 在合规审查退回的时候将合规审查意见拷贝到历史表中
	 * @param cldId
	 * @param newCldId
	 */
	public void updateFileToHistory(String cldId, String newCldId){
		publicDao.updateBySql("update P_T_ATTACHMENT set bdid=? where bdid= ? and fjlx ='heguishencha'",new String[]{newCldId,cldId});
	}

	
	/**
	 * 在合规审查退回的时候将处置报告进行备份
	 * @param cldId
	 * @param newCldId
	 */
	public void copyDisposeReport(String cldId, String newCldId){
		//According to cldId,query dispose report.
		String hql = "select o from PTAttachment o where o.bdid = ? and o.fjbt = ? and o.templateid = 'bank_Template' and o.fjlx = '0'";
		PTAttachment pt = (PTAttachment)publicDao.findSingleResult(hql, new Object[]{cldId,"资产处置报告"});
		if(pt == null){
			return;
		}
		PTAttachmentBlob blob = (PTAttachmentBlob)publicDao.findById(PTAttachmentBlob.class, pt.getId());
		PTAttachment ptNew = new PTAttachment();
		ptNew.setBdid(newCldId);
		ptNew.setFjbt(pt.getFjbt());
		ptNew.setFjlx(pt.getFjlx());
		ptNew.setState(pt.getState());
		ptNew.setYwjm(pt.getYwjm());
		ptNew.setTemplateid(pt.getTemplateid());
		ptNew.setDel(pt.getDel());
		ptNew.setScrbh(pt.getScrbh());
		ptNew.setScbm(pt.getScbm());
		ptNew.setScrid(pt.getScrid());
		ptNew.setSwid(pt.getSwid());
		PTAttachmentBlob blobNew = new PTAttachmentBlob();
		blobNew.setContent(blob.getContent());
		ptNew.setBlob(blobNew);
		publicDao.save(ptNew);
	}

	public void updateOtherFileToHistory(String cldId, String newCldId) {
		publicDao.updateBySql("update P_T_ATTACHMENT set bdid=? where bdid= ? and fjlx='1'",new String[]{newCldId,cldId});
		publicDao.updateBySql("update P_T_ATTACHMENT set bdid=? where bdid= ? and fjlx = 'heguishencha' and zzfj = '0'",new String[]{newCldId,cldId});
	}	
	
	public void updateHgscDid(String cldId, String taskName, String newCldId){
		//publicDao.updateBySql("update P_T_DID set HEAD_ID=? where HEAD_ID=? and TASKNAME=?",new String[]{newCldId,cldId,taskName});
		List<PTDid> didList = (List<PTDid>)publicDao.find("from PTDid o where o.headId=? and taskName=?", new String[]{cldId,taskName});
		for(PTDid did : didList){
			did.setHeadId(newCldId);
			publicDao.update(did);
		}
	}
	
	/**
	 * 保存会议后更新项目的状态为上会,并在项目委员意见表插入主持人信息
	 * @param id
	 */
	public void updateXmZt(String id) {
		CzXmxxLsb lsb = new CzXmxxLsb();//查询条件
		lsb.setHyId(id);
		List list = this.findCzxmByTerm(lsb);
		
		if(list!=null&&list.size()>0){
			CzXmSpwYj spwyj = null;
			for (int i = 0; i < list.size(); i++) {
				CzXmxxLsb lsb2 = (CzXmxxLsb) list.get(i);
				lsb2.setZhuangtai(ZcczCommon.DEALTODO_XMZT_SHZ);
				publicDao.update(lsb2);
				
				this.deleteZcrByXmId(lsb2.getId());			//如果项目已上会，再次保存先删除主持人，然后再添加主持人信息
				
				spwyj = new CzXmSpwYj();
				spwyj.setSfwzcr(ZcczCommon.DEALTODO_ZCR);	//每个项目加入一条主持人信息
				spwyj.setSftjspyj(ZcczCommon.DEALTODO_TJYJ_FOU);//是否提交审批意见 默认否
				CzHyxx hyxx = this.findHyxxById(id);			//得到会议信息，
				spwyj.setSpwy(hyxx.getSpzcr());					//设置支持人id
				spwyj.setSpwyxm(hyxx.getZcrxm());				//设置主持人姓名
				spwyj.setTongyi(ZcczCommon.DEALTODO_BUTONGYI);	//默认同意为否
				spwyj.setButongyi(ZcczCommon.DEALTODO_BUTONGYI);//默认不同意为否
				spwyj.setXmId(lsb2.getId());					//设置项目id
				publicDao.save(spwyj);
			}
		}
	}
	
	/**
	 * 根据条件查到处置项目 CzXmxxLsb的list
	 * @param hyId
	 * @param zhuangtai
	 * @return
	 */
	private List findCzxmByTerm(CzXmxxLsb lsb) {
		StringBuffer sql = new StringBuffer("")
			.append("from CzXmxxLsb x where ") 
			.append(" (x.zhuangtai = '"  + checkEmpty(lsb.getZhuangtai()) + "' or '" + checkEmpty(lsb.getZhuangtai()) + "' is null )") 
			.append(" and( x.hyId = '"   + checkEmpty(lsb.getHyId() )	  + "' or '" + checkEmpty(lsb.getHyId())      + "' is null )")
			.append(" and( x.fenlei = '" + checkEmpty(lsb.getFenlei())    + "' or '" + checkEmpty(lsb.getFenlei())    + "' is null )")
			.append(" order by x.pxxh asc ");
		List list = publicDao.find(sql.toString(), new Object[]{});
		return list;
	}
	
	private String checkEmpty(String str) {
		if(str==null||str.length()==0){
			return "";
		}else if("".equals(str)||"null".equals(str)||str==null){
			return "";
		}else{
			return str;
		}
	}
	
	/**
	 * 查询hyId的会议信息
	 * @param hyId
	 */
	private CzHyxx findHyxxById(String hyId) {
		String sql = "from CzHyxx x where x.id = ?";
		CzHyxx x = (CzHyxx) publicDao.findSingleResult(sql, new String[]{hyId});
		return x;
	}
	
	/**
	 * 删除项目下的支持人
	 * @param id
	 */
	private void deleteZcrByXmId(String id) {
		String sql = "from CzXmSpwYj yj where yj.xmId = ? and yj.sfwzcr = ?";
		CzXmSpwYj yj = (CzXmSpwYj) publicDao.findSingleResult(sql, new String[]{id,ZcczCommon.DEALTODO_ZCR});
		if(yj!=null&&yj.getId()!=null){
			publicDao.delete(yj);
		}
	}
	public List findAttachment(String bdid){
		String preparSQL = "select * from p_t_attachment where bdid= ? ";
		List params = new ArrayList();
		List listMap = new ArrayList();
		params.add(bdid);
		listMap = publicDao.queryForList(preparSQL, params);
		
		return listMap;
	}
}
