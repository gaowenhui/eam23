package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.impl.AssetUCCImpl;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.QueryBO;
import com.tansun.eam2.zccz.ucc.IKnowQueryUCC;
import com.tansun.eam2.zccz.vo.PgsczckBO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 知识库查询
 * 
 * @author 陈煜霄
 * @date 2010-12-21
 */

public class KnowQueryAction extends CommonAction implements IExport {

	private List XMList;
	
	public List<JyzcXxVO> list=new ArrayList<JyzcXxVO>();
	@Autowired
	private IKnowQueryUCC knowQueryUCCImpl;

	public String option;
	
	private PgsczckBO pgsczckbo;
	
	public Paginator paginator ;
	
	/**
	 * 查询知识库正式表
	 * 
	 * @return
	 */
	public String query() {
		
		return "query";
	}

	/**
	 * 知识库正式表查询
	 * 
	 * @return
	 */
	public String queryNew() {
		XMList = knowQueryUCCImpl.queryXMZSB();
		String xmid = request.getParameter("xmid");
		String ydid = request.getParameter("ydid");
		String option = request.getParameter("option");
		request.setAttribute("xmid", xmid);
		request.setAttribute("ydid", ydid);
	    request.setAttribute("option", option);
//	    List<PgsczckBO> list = this.daochuExcel();
//	    String bodyJSON ="";
//	    response.setCharacterEncoding("UTF-8");
//	    bodyJSON = BodyListToJSON.getJSON(list,1,1,1);
// 		try {
//			response.getWriter().print(bodyJSON);
//			} catch (IOException e) {
//				e.printStackTrace();
//          }
//	    Iterator<pgsczckBO> iterator = list.iterator();
//	    while(iterator.hasNext()){
//        	Map map = new HashMap();
//			map = (Map)iterator.next();
//	        request.setAttribute("fstree",pgsczckbo.getFirsttree());
//	        request.setAttribute("sedtree", pgsczckbo.getSceondtree());
//	        request.setAttribute("threetree", pgsczckbo.getThreetree());
//	    }
		return "queryNew";
	}

	/**
	 * 得到正式表的tree
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getTree() throws IOException {
		 option = "czpgsc";
		String xmlStr = knowQueryUCCImpl.getKnowXML();
		//System.out.println(xmlStr);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		response.getWriter().write(xmlStr);
		return null;
	}

	/**
	 * 带查询条件的正式表查询
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getTreeNew() throws IOException {
		String xmid = request.getParameter("xmid");
		String ydid = request.getParameter("ydid");
		String option = request.getParameter("option");
		String xmlStr = knowQueryUCCImpl.getKnowXMLByChoose(xmid,ydid);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		response.getWriter().write(xmlStr);
		return null;
	}

	/**
	 * 得到临时表的tree
	 * 
	 * @return
	 * @throws IOException
	 */
	public String getLSBTree() throws IOException {
		 option = "czpgsc";
		String headId = request.getParameter("headId");
		String xmlStr = knowQueryUCCImpl.gotKnowLSBXML(headId);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml; charset=UTF-8");
		response.getWriter().write(xmlStr);
		return null;
	}

	public String getZSBTreeByTiaoJiao() {
		return null;
	}

	/**
	 * 项目和要点的联动正式表
	 * 
	 * @return
	 * @throws IOException
	 */
	public String findYDList() throws IOException {
		 option = "czpgsc";
		String pid = request.getParameter("pid");
		StringBuffer returnStr = new StringBuffer();
		returnStr.append("{'yds':[");
		Map<String, String> ydMap = knowQueryUCCImpl.findYDByXMZSB(pid);
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

	public List getXMList() {
		return XMList;
	}

	public void setXMList(List list) {
		XMList = list;
	}
	
	/*
	 * 导出EXCEL 主字段
	 */
	public List<PgsczckBO> daochuExcel(){
		List<PgsczckBO> excelList = new ArrayList<PgsczckBO>();
		if(knowQueryUCCImpl == null){
			knowQueryUCCImpl = (IKnowQueryUCC)SpringContextHelper.getBean(IKnowQueryUCC.class);
		}
		List list = knowQueryUCCImpl.getKnowZSB("0");
		Iterator iter = list.iterator();		
		while(iter.hasNext()){
			pgsczckbo = new PgsczckBO();
			Map map = new HashMap();
			map = (Map) iter.next();
			pgsczckbo.setFirsttree((String)map.get("value"));
			//查询中节点
			//if (map.get("id") != null && map.get("id").toString().length() > 0){
			List elist = this.daochuexcel1(pgsczckbo,(String)map.get("id"));
			//}
            excelList.addAll(elist);
			//excelList.add(pgsczckbo);
		}
		return excelList;		
	}
	
	
	/*
	 * 导出EXCEL 二级节点
	 */
	public List<PgsczckBO> daochuexcel1(PgsczckBO pgsczckbo,String id){
		List list = knowQueryUCCImpl.getKnowExeclByChoose(id);
		Iterator iter = list.iterator();
		List<PgsczckBO> elist = new ArrayList<PgsczckBO>();
		while(iter.hasNext()){
			Map map = new HashMap();
			map = (Map)iter.next();
			PgsczckBO pgBO = new PgsczckBO();
			pgBO.setFirsttree(pgsczckbo.getFirsttree());
			pgBO.setSceondtree((String)map.get("value"));
			elist.addAll(daochuexcel2(pgBO,(String)map.get("id")));
		}
		return elist;
	}
	
	/*
	 * 导出子三级节点
	 */
    public List<PgsczckBO> daochuexcel2(PgsczckBO pgsczckBO,String id){
    	List list = knowQueryUCCImpl.getKnowExeclByChoose(id);
		List<PgsczckBO> elist = new ArrayList<PgsczckBO>();
		Iterator iter = list.iterator();	
		while(iter.hasNext()){
			Map map = new HashMap();
			map = (Map)iter.next();
			PgsczckBO pgBO = new PgsczckBO();
			pgBO.setFirsttree(pgsczckBO.getFirsttree());
			pgBO.setSceondtree(pgsczckBO.getSceondtree());
			pgBO.setThreetree((String)map.get("value"));
			elist.add(pgBO);
		}
		return elist;    	
    }
    
	
	
	/**
	 *
	 *   继承IExport
	 *
	 *
	 **/
	public void setExcelVO(CommonBO excelVO) {
		this.pgsczckbo = (PgsczckBO)excelVO;
	}
	
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	
	public String exportexcel() throws Exception {
		if(pgsczckbo==null){
			pgsczckbo = new PgsczckBO();
		}
		List<PgsczckBO> list = this.daochuExcel();
		//System.out.println(list.size());
		String bodyJSON ="";
			bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		return bodyJSON;
	}

	

}
