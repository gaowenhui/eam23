package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JjzcGctbXx;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcTbgcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlHead;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.ucc.IIntentionUCC;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.JjzcGctbXxVO;
import com.tansun.eam2.jygdzc.vo.JyzcJyzlLsbVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.JyzlXxBodyVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class IntentionManageBodyAction extends CommonAction {
	public JyzcJyzlLsb jyzcJyzlLsb;//经营租赁信息临时表
	public JyzcJyzlLsbVO jyzcJyzlLsbVO ;//经营租赁信息临时表VO
	public JyzcJyzlXx jyzcJyzlXx;//经营租赁信息
	public JjzcGctbXx jjzcGctbXx ;//固保信息
	public JjzcTbgcXx jjzcTbgcXx; //投保固产信息
	public JyzcJyzlHead head; //处理单ID
	public JyzcXx jyzcXx;//经营资产信息
	public JyzcXxVO jyzcXxVO;//资产信息VO
	public String sheettype;//表单类型
	public String ywlx;//业务类型
	public String tblb;//投保类别
	public String headId = null; //处理单ID
	public Paginator paginator =new Paginator(); //分页器
	public String tbId;//投保ID
	public String zlXxId; //租赁信息ID
	public String zllsbId; //租赁临时表ID
	public String zcId; //资产ID
	public String handle;//判断 是修改 还是新增
	public String message;//控制保存是否成功
	public String bmbh;//部门编码
	@Autowired
    public IIntentionUCC intentionUCCImpl;
	@Autowired
	public IContractUCC contractUCCImpl;
	@Autowired
	public IAssetUCC assetUCCImpl;
	/**
	 * 新增body入口 准备数据
	 * 
	 * @return
	 */
	public String newBody() {
		String view = request.getParameter("view");
		String bmbh = request.getParameter("bmbh");
		ywlx = request.getParameter("ywlx");
		request.setAttribute("ywlx", ywlx);
		request.setAttribute("view", view);
		request.setAttribute("ngbm", bmbh);
		return sheettype;
	}

	/**
	 * 新增入口 准备数据
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String saveBody() throws IOException {
		if("tenancyInfo".equals(sheettype)){
			jyzcJyzlLsb = new JyzcJyzlLsb();
			try {
				BeanUtils.copyProperties(jyzcJyzlLsb, jyzcJyzlLsbVO);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if(jyzcJyzlLsbVO.getYxzjzje()!=null &&!"".equals(jyzcJyzlLsbVO.getYxzjzje().trim())){
				jyzcJyzlLsb.setYxzjzje(Double.valueOf(jyzcJyzlLsbVO.getYxzjzje()));
			}
			if(jyzcJyzlLsbVO.getYxzlmj()!=null && !"".equals(jyzcJyzlLsbVO.getYxzlmj().trim())){
				jyzcJyzlLsb.setYxzlmj(Double.valueOf(jyzcJyzlLsbVO.getYxzlmj()));
			}
			if ("change".equals(ywlx)){
				if("".equals(zllsbId)){
					intentionUCCImpl.save(jyzcJyzlLsb);
					//String htId = jyzcJyzlLsb.getHtId();
					//jyzcJyzlXx = intentionUCCImpl.getJyzcJyzlXxById(zlXxId);
					//intentionUCCImpl.compareZlXxVsZlXxLsb(jyzcJyzlXx, jyzcJyzlLsb);
					intentionUCCImpl.compareZlXxVsHTXx(jyzcJyzlLsb);
				}else{
					intentionUCCImpl.update(jyzcJyzlLsb);
					String pkId = jyzcJyzlLsb.getCldId();
					String htId = jyzcJyzlLsb.getHtId();
					List<Recordhistory> changeList =null;
					changeList = intentionUCCImpl.getRecordhistoryBypkId(pkId,jyzcJyzlLsb.getId(),paginator);
					for(int y=0;y<changeList.size();y++){
						intentionUCCImpl.delete(changeList.get(y));
					}
					intentionUCCImpl.compareZlXxVsHTXx(jyzcJyzlLsb);
					//jyzcJyzlXx = intentionUCCImpl.getJyzcJyzlXxById(zlXxId);
					//intentionUCCImpl.compareZlXxVsZlXxLsb(jyzcJyzlXx, jyzcJyzlLsb);
				}
			}else if("rent".equals(ywlx)){
				
				if("".equals(zllsbId)){
					intentionUCCImpl.save(jyzcJyzlLsb);
				}else{
					intentionUCCImpl.update(jyzcJyzlLsb);
				}
				
			}else {
				if("".equals(zllsbId)){
					intentionUCCImpl.save(jyzcJyzlLsb);
				}else{
					intentionUCCImpl.update(jyzcJyzlLsb);
				}
			}
			//zcId = jyzcJyzlLsb.getZcId();
			zllsbId = jyzcJyzlLsb.getId();
			//request.setAttribute("zcId", zcId);
			request.setAttribute("zllsbId", zllsbId);
			request.setAttribute("message", "保存成功");
			
		}
		return "tomodify";
		
	}

	/**
	 * 保存 主信息
	 * 
	 * @return
	 */
	public String modify(){
		 bmbh = (String)request.getAttribute("bmbh");
		 ywlx = (String)request.getAttribute("ywlx");
		if("tenancyInfo".equals(sheettype)){
			zllsbId = (String) request.getAttribute("zllsbId");
			if("rent".equals(ywlx)){
				if(zllsbId!=null){
					jyzcJyzlLsbVO = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
					//jyzcJyzlLsb = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
					zcId = intentionUCCImpl.getZcIdByzlId(zllsbId);
					jyzcXxVO = intentionUCCImpl.getJyzcXxVOByzcId(zcId);
				}
					
			}
			if("change".equals(ywlx)){
				jyzcJyzlLsbVO = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
				//jyzcJyzlLsb = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
				zcId = intentionUCCImpl.getZcIdByzlId(zllsbId);
				jyzcXxVO = intentionUCCImpl.getJyzcXxVOByzcId(zcId);
			}
			if("quit".equals(ywlx)){
				jyzcJyzlLsbVO = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
				//jyzcJyzlLsb = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
				zcId = intentionUCCImpl.getZcIdByzlId(zllsbId);
				jyzcXxVO = intentionUCCImpl.getJyzcXxVOByzcId(zcId);
			}
		}
		request.setAttribute("ywlx", ywlx);
		return sheettype;
	}
	/**
	 * 保存投保固产信息
	 * @return
	 */
	public String saveJjzcTbgcXx(){
		tbId = request.getParameter("tbId");
		zcId = request.getParameter("zcId");
		headId = request.getParameter("headId");
		tblb = request.getParameter("tblb");
		if (zcId.startsWith(",")) {
			zcId = zcId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] zcIds = zcId.split(",");
		Double total =0d;
		Double  avg = 0d;
		for(int i=0;i<zcIds.length;i++){
			if(zcIds!=null&&zcIds[i].trim().length()>0){
				jjzcTbgcXx= intentionUCCImpl.getJjzcTbgcXxBytbIdAndzcId(tbId, zcIds[i]);
				if(jjzcTbgcXx==null){
					jjzcTbgcXx  = new JjzcTbgcXx();
					if("0".equals(tblb)){
						jjzcTbgcXx.setTbje(intentionUCCImpl.getSfhjByzcId(zcIds[i]));
					}else if("1".equals(tblb)){
						jjzcTbgcXx.setTbje(intentionUCCImpl.getYbyzByzcId(zcIds[i]));
					}
					jjzcTbgcXx  = new JjzcTbgcXx();
					jjzcTbgcXx.setZcId(zcIds[i]);
					jjzcTbgcXx.setCldId(headId);
					jjzcTbgcXx.setGctbId(tbId);
					jjzcTbgcXx.setTblb(tblb);
					intentionUCCImpl.save(jjzcTbgcXx);
				}
			}	
		}
		//this.total();	
		return null;
	}
	public String total(){
		tbId = request.getParameter("tbId");
		tblb = request.getParameter("tblb");
		try{
			Double total =0d;
			Double zjgcTotal = 0d;
			Double  avg = 0d;
			List list =intentionUCCImpl.getZcIdByTbIdAndTblb(tbId, tblb);
			for(int i=0;i<list.size();i++){
				if("0".equals(tblb)){
					total +=intentionUCCImpl.getSfhjByzcId(list.get(i).toString());
				}else if("1".equals(tblb)){
					zjgcTotal +=intentionUCCImpl.getZjgcYbyzByzcId(list.get(i).toString());
					total +=intentionUCCImpl.getYbyzByzcId(list.get(i).toString());
				}
			}
			if(list.size()!=0&&"0".equals(tblb)){
				avg = total/list.size();
			}
				
			StringBuffer sb = new StringBuffer();
			sb.append("{\"total\":\"").append(total).append("\",").append("\"zjgcTotal\":\"").append(zjgcTotal).append("\",").append("\"avg\":\"").append(avg).append("\"}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(sb.toString());
			}catch(Exception e){
				e.printStackTrace();
			}
		return null;
	}
	public String deleteJjzcTbgcXx(){
		zcId = request.getParameter("zcId");
		//tblb = request.getParameter("tblb");
		if (zcId.startsWith(",")) {
			zcId = zcId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] zcIds = zcId.split(",");
		for(int i=0;i<zcIds.length;i++){
			jjzcTbgcXx= intentionUCCImpl.getJjzcTbgcXxBytbIdAndzcId(tbId, zcIds[i]);
			try{
			intentionUCCImpl.delete(jjzcTbgcXx);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return null;
	}
	public String queryJjzcTbgcXx() {
		String view = request.getParameter("view");
		tbId = request.getParameter("tbId");
		tblb = request.getParameter("tblb");
		List<AssetBodyVO> list =null;
		List<JjzcGctbXxVO> tbgclist =null;
		String bodyJSON =null;
		if(!"".equals(view)&&view!=null){
			tbgclist = intentionUCCImpl.getJjzcGctbXxBycldId(headId);
			bodyJSON = BodyListToJSON.getJSON(tbgclist,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}else{
			list =intentionUCCImpl.getJyzcXxBytbId(tbId,tblb);
			bodyJSON = BodyListToJSON.getJSON(list,  paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 删除 一条/多条
	 * 
	 * @return
	 * @throws IOException 
	 */
	public String deleteBody(){
		zllsbId= request.getParameter("zllsbId");
		if (zllsbId.startsWith(",")) {
			zllsbId = zllsbId.substring(1);// 全选时会把全选按钮空字串带过来，格式如“,1,2”
		}
		String[] jyzlIds = zllsbId.split(",");
		ywlx = (String) request.getParameter("ywlx");
		// JyzcXxLsb
		for (int i = 0; i < jyzlIds.length; i++) {
			// 新建经营信息临时表的数据
			if (jyzlIds[i] != null) {
				if("rent".equals(ywlx)||"quit".equals(ywlx)){
					jyzcJyzlLsb = (JyzcJyzlLsb) intentionUCCImpl.findById(JyzcJyzlLsb.class, jyzlIds[i]);
				//	jyzcJyzlLsb=intentionUCCImpl.getJyzcJyzlLsbById(jyzlIds[i]);
					intentionUCCImpl.delete(jyzcJyzlLsb);
				}else if("change".equals(ywlx)){
					jyzcJyzlLsb = (JyzcJyzlLsb) intentionUCCImpl.findById(JyzcJyzlLsb.class, jyzlIds[i]);
					//jyzcJyzlLsb=intentionUCCImpl.getJyzcJyzlLsbById(jyzlIds[i]);
					String pkId = jyzcJyzlLsb.getCldId();
					zlXxId = jyzcJyzlLsb.getJyzlId();
					List<Recordhistory> changeList =null;
					changeList = intentionUCCImpl.getRecordhistoryBypkId(pkId,zlXxId ,paginator);
					if(changeList!=null&&changeList.size()>0){
						for(int y=0;y<changeList.size();y++){
							intentionUCCImpl.delete(changeList.get(y));
						}
					}
					intentionUCCImpl.delete(jyzcJyzlLsb);
				}
			}
		}
		 request.setAttribute("sheettype",sheettype);
		 request.setAttribute("headId", headId);
		 
		return null;
	}
	/**
	 * 表体更换合同时 删除表体变动所产生的变动数据
	 * @return
	 */
	public  String delete(){
		String str ="成功";
		try {
			List<Recordhistory> changeList =null;
			changeList = intentionUCCImpl.getRecordhistoryBypkId(headId,zllsbId ,paginator);
			if(changeList!=null&&changeList.size()>0){
				for(int y=0;y<changeList.size();y++){
					intentionUCCImpl.delete(changeList.get(y));
				}
				
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	public String viewBody() {
		headId  =request.getParameter("headId");
		String alldesable = request.getParameter("alldesable");
		ywlx = request.getParameter("ywlx");
		zllsbId = (String) request.getAttribute("zllsbId");
		head = (JyzcJyzlHead) intentionUCCImpl.findById(JyzcJyzlHead.class, headId);
		//ywlx = head.getYwlx();
		if(zllsbId!=null&&!"".equals(zllsbId)){
			jyzcJyzlLsbVO = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
			//jyzcJyzlLsb = intentionUCCImpl.getJyzcJyzlLsbById(zllsbId);
			zcId = intentionUCCImpl.getZcIdByzlId(zllsbId);
			jyzcXxVO = intentionUCCImpl.getJyzcXxVOByzcId(zcId);
		}
			request.setAttribute("alldesable", alldesable);
			return sheettype;
	}
	public String query4View() {
		
		headId = request.getParameter("headId");
		String pkId = request.getParameter("pkId");
		List<JyzlXxBodyVO> list = null;
		List<JyzcJyzlXx> xxlist = null;
		List<Recordhistory> changeList =null;
		String bodyJSON = null;
		if(headId!=null){
			list = intentionUCCImpl.getJyzlBodyVOByHeadId(headId, paginator);
		    bodyJSON = BodyListToJSON.getJSON(list,  paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}else if(zcId!=null){
			ywlx = request.getParameter("ywlx");
			sheettype = request.getParameter("sheettype");
			handle = request.getParameter("add");
			xxlist = intentionUCCImpl.getJyzcJyzlXxByzcId(zcId);
			bodyJSON = BodyListToJSON.getJSON(xxlist, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}else if(pkId!=null){
			changeList = intentionUCCImpl.getRecordhistoryBypkId(pkId,zllsbId,paginator);
		    bodyJSON = BodyListToJSON.getJSON(changeList,  paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
public String query4Contract() {
		
		zcId = request.getParameter("zcId");
		List<JjzcHtZlwg> list = null;
		String bodyJSON = null;
		if(zcId!=null){
			handle = request.getParameter("add");
			list = contractUCCImpl.getJjzcHtZlwgByzcIdandzcLxforAsset(zcId,"1");
			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//租赁页面展示资产信息
	public String  assetView(){
		zcId = request.getParameter("zcId");
		//jyzcXxVO = assetUCCImpl.getAssetInfoVOByzcId(zcId);
		jyzcXxVO = intentionUCCImpl.getJyzcXxVOByzcId(zcId);
		List list = new ArrayList();
		list.add(jyzcXxVO);
		String  bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	public  String isExist(){
		String htId = request.getParameter("htId");
		headId = request.getParameter("headId");
		String isExist="不存在";
		List<JyzcJyzlLsb> jyzcJyzlLsbList = intentionUCCImpl.getJyzcJyzlLsbByhtId(htId, headId);
		if(jyzcJyzlLsbList.size()>0){
			isExist = "存在";
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(isExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//租赁页面展示租赁信息
	public String  tenancyView(){
		zlXxId = request.getParameter("zlXxId");
		jyzcJyzlXx = intentionUCCImpl.getJyzcJyzlXxById(zlXxId);
		jyzcJyzlLsb = intentionUCCImpl.jyzc2Body(jyzcJyzlXx);
		jyzcJyzlLsb.setJyzlId(zlXxId);
		List list = new ArrayList();
		list.add(jyzcJyzlLsb);
		String  bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	//租赁页面展示租赁信息
	public String  contractView(){
		String htId = request.getParameter("htId");
		JjzcHtZlwg jjzcHtZlwg = new JjzcHtZlwg();
		if(htId!=null&&""!=htId){
			 jjzcHtZlwg=contractUCCImpl.getJjzcHtZlwgById(htId);
		}
		List list = new ArrayList();
		if(jjzcHtZlwg!=null){
			list.add(jjzcHtZlwg);
		}
		String  bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	private void clearDate() {
		session.remove("JyzcXxLsbList");
	}

	public JyzcJyzlLsb getJyzcJyzlLsb() {
		return jyzcJyzlLsb;
	}

	public void setJyzcJyzlLsb(JyzcJyzlLsb jyzcJyzlLsb) {
		this.jyzcJyzlLsb = jyzcJyzlLsb;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getZcId() {
		return zcId;
	}

	public void setZcId(String zcId) {
		this.zcId = zcId;
	}

	public IIntentionUCC getIntentionUCCImpl() {
		return intentionUCCImpl;
	}

	public void setIntentionUCCImpl(IIntentionUCC intentionUCCImpl) {
		this.intentionUCCImpl = intentionUCCImpl;
	}


	public String getZllsbId() {
		return zllsbId;
	}

	public void setZllsbId(String zllsbId) {
		this.zllsbId = zllsbId;
	}

	public String getYwlx() {
		return ywlx;
	}

	public void setYwlx(String ywlx) {
		this.ywlx = ywlx;
	}

	public String getHandle() {
		return handle;
	}

	public void setHandle(String handle) {
		this.handle = handle;
	}

	public JyzcJyzlXx getJyzcJyzlXx() {
		return jyzcJyzlXx;
	}

	public void setJyzcJyzlXx(JyzcJyzlXx jyzcJyzlXx) {
		this.jyzcJyzlXx = jyzcJyzlXx;
	}

	public String getZlXxId() {
		return zlXxId;
	}

	public void setZlXxId(String zlXxId) {
		this.zlXxId = zlXxId;
	}

	public JjzcGctbXx getJjzcGctbXx() {
		return jjzcGctbXx;
	}

	public void setJjzcGctbXx(JjzcGctbXx jjzcGctbXx) {
		this.jjzcGctbXx = jjzcGctbXx;
	}

	public String getTbId() {
		return tbId;
	}

	public void setTbId(String tbId) {
		this.tbId = tbId;
	}

	public JjzcTbgcXx getJjzcTbgcXx() {
		return jjzcTbgcXx;
	}

	public void setJjzcTbgcXx(JjzcTbgcXx jjzcTbgcXx) {
		this.jjzcTbgcXx = jjzcTbgcXx;
	}

	public JyzcXx getJyzcXx() {
		return jyzcXx;
	}

	public void setJyzcXx(JyzcXx jyzcXx) {
		this.jyzcXx = jyzcXx;
	}

	public String getTblb() {
		return tblb;
	}

	public void setTblb(String tblb) {
		this.tblb = tblb;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public JyzcJyzlLsbVO getJyzcJyzlLsbVO() {
		return jyzcJyzlLsbVO;
	}

	public void setJyzcJyzlLsbVO(JyzcJyzlLsbVO jyzcJyzlLsbVO) {
		this.jyzcJyzlLsbVO = jyzcJyzlLsbVO;
	}
	
}
