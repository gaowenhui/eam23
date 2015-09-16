package com.tansun.eam2.zccz.action;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.CzPgscZskwhCld;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.zccz.ucc.IEvalQueryUCC;
import com.tansun.eam2.zccz.ucc.impl.EvalQueryUCCImpl;
import com.tansun.eam2.zccz.vo.EvalVO1;
import com.tansun.eam2.zccz.vo.EvalVO2;
import com.tansun.eam2.zccz.vo.EvalVO3;
import com.tansun.eam2.zccz.vo.EvalVO4;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class EvalCommentQueryAction extends CommonAction implements IExport {

	@Autowired
	IEvalQueryUCC evalQueryUCCImpl;
	String biaoti;
	String scxm;
	String scyd;
	String jtyj;
	String datebegin;
	String dateend;

	String s1;
	String s2;
	String s3;
	String s4;
	
	public EvalVO3 evalVO3 =new EvalVO3();
	public EvalVO1 evalVO1 =new EvalVO1();
	public EvalVO2 evalVO2 =new EvalVO2();
	public Paginator paginator ;
	List<CzPgscZskwhCld> listCzPgscZskwhCld;

	/**
	 * 查询入口功能
	 * 
	 * @return
	 */
	public String init() {
		Map<String, String> yjMap = evalQueryUCCImpl.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		return "init";
	}

	public String findFl() {
		Map<String, String> yjMap = evalQueryUCCImpl.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();

		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		return "init";
	}

	public String query() {

		return "init";

	}

	/**
	 * 审查意见查询，查询的结果列表
	 * @return
	 */
	public String queryString1() {
		List<EvalVO1> listVO = evalQueryUCCImpl.queryCzPgscZskwhCld(paginator,evalVO1);
		CommonBO[] boArray = new CommonBO[listVO.size()];
		listVO.toArray(boArray);
		String josnStr = BodyListToJSON.getJSON(boArray, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		josnStr=generateUrl(josnStr);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	
	
	 public  String generateUrl(String jsonString){ 
			JSONObject data = JSONObject.fromObject(jsonString);
			HashMap<String,String> hashmap=new HashMap();
			//'1':'通过','2':'通过（附参考意见）','3':'不通过','4':'不具备评估审查条件'
			hashmap.put("1","通过");
			hashmap.put("2","通过（附参考意见）");
			hashmap.put("3","不通过");
			hashmap.put("4","不具备评估审查条件");
			
	       if(data != null){
	    		JSONArray rows = data.getJSONArray("rows");
	            for (Object object : rows.toArray()) {
	                try {
	                    String scjl = (String)PropertyUtils.getProperty(object,"scjl");
//	                    String strScjl= hashmap.get(scjl);
//	                    PropertyUtils.setProperty(object,"scjl",strScjl);
	                } catch (IllegalAccessException ex) {
	                    Logger.getLogger(BodyListToJSON.class.getName()).log(Level.SEVERE, null, ex);
	                } catch (InvocationTargetException ex) {
	                    Logger.getLogger(BodyListToJSON.class.getName()).log(Level.SEVERE, null, ex);
	                } catch (NoSuchMethodException ex) {
	                    Logger.getLogger(BodyListToJSON.class.getName()).log(Level.SEVERE, null, ex);
	                }
	           }
	    	} 
	        return data.toString();
		}
	
	public String updateMemo() {
		String strId=request.getParameter("id");
		String strMemo=request.getParameter("memo");
		System.out.println(strId);
		System.out.println(strMemo);
		evalQueryUCCImpl.updateMemo(strId,strMemo);
		return null;
	}

	/**
	 * 评估报告问题明细表查询
	 */
	public String queryString2() {
		List<EvalVO2> listVO = evalQueryUCCImpl.queryCzPgscZskwhCld2(paginator,
				evalVO2);
		CommonBO[] boArray = new CommonBO[listVO.size()];
		listVO.toArray(boArray);
		String josnStr = BodyListToJSON.getJSON(boArray, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 全口径查询，查询结果列表
	 * @return
	 */           
	public String queryString3() {
		List<EvalVO4> listVO = evalQueryUCCImpl.queryCzPgscZskwhCld3(paginator,
				evalVO3);
		CommonBO[] boArray = new CommonBO[listVO.size()];
		listVO.toArray(boArray);
		String josnStr = BodyListToJSON.getJSON(boArray, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}

	
	/**
	 * 统计查询，查询结果列表
	 * @return
	 */           
	public String queryString4() {
		List<EvalVO4> listVO = evalQueryUCCImpl.queryCzPgscZskwhCld4(paginator,evalVO3);
		CommonBO[] boArray = new CommonBO[listVO.size()];
		listVO.toArray(boArray);
		String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;

	}
	public IEvalQueryUCC getEvalQueryUCCImpl() {
		return evalQueryUCCImpl;
	}

	public void setEvalQueryUCCImpl(IEvalQueryUCC evalQueryUCCImpl) {
		this.evalQueryUCCImpl = evalQueryUCCImpl;
	}

	public String getBiaoti() {
		return biaoti;
	}

	public void setBiaoti(String biaoti) {
		this.biaoti = biaoti;
	}

	public String getScxm() {
		return scxm;
	}

	public void setScxm(String scxm) {
		this.scxm = scxm;
	}

	public String getScyd() {
		return scyd;
	}

	public void setScyd(String scyd) {
		this.scyd = scyd;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public EvalVO3 getEvalVO3() {
		return evalVO3;
	}

	public void setEvalVO3(EvalVO3 evalVO3) {
		this.evalVO3 = evalVO3;
	}

	public List<CzPgscZskwhCld> getListCzPgscZskwhCld() {
		return listCzPgscZskwhCld;
	}

	public void setListCzPgscZskwhCld(List<CzPgscZskwhCld> listCzPgscZskwhCld) {
		this.listCzPgscZskwhCld = listCzPgscZskwhCld;
	}

	public String getJtyj() {
		return jtyj;
	}

	public void setJtyj(String jtyj) {
		this.jtyj = jtyj;
	}

	public String getS1() {
		return s1;
	}

	public void setS1(String s1) {
		this.s1 = s1;
	}

	public String getS2() {
		return s2;
	}

	public void setS2(String s2) {
		this.s2 = s2;
	}

	public String getS3() {
		return s3;
	}

	public void setS3(String s3) {
		this.s3 = s3;
	}

	public String getS4() {
		return s4;
	}

	public void setS4(String s4) {
		this.s4 = s4;
	}

	public String getDatebegin() {
		return datebegin;
	}

	public void setDatebegin(String datebegin) {
		this.datebegin = datebegin;
	}

	public String getDateend() {
		return dateend;
	}

	public void setDateend(String dateend) {
		this.dateend = dateend;
	}

	public String exportexcel() throws Exception {
		if(paginator==null){
			paginator = new Paginator();
		}
		paginator.setCurrentPage(1);
		paginator.setPageSize(10000000);
		if (evalQueryUCCImpl == null) {
			evalQueryUCCImpl = (EvalQueryUCCImpl) SpringContextHelper
					.getBean(EvalQueryUCCImpl.class);
		}
		List<EvalVO4> list = evalQueryUCCImpl.queryCzPgscZskwhCld3(paginator, evalVO3);
		String json = BodyListToJSON.getJSON(list, paginator
				.getPageCount(), paginator.getCurrentPage(), paginator
				.getCount());
		return json;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.evalVO3 = (EvalVO3) excelVO;
		
	}

	public EvalVO1 getEvalVO1() {
		return evalVO1;
	}

	public void setEvalVO1(EvalVO1 evalVO1) {
		this.evalVO1 = evalVO1;
	}

	public EvalVO2 getEvalVO2() {
		return evalVO2;
	}

	public void setEvalVO2(EvalVO2 evalVO2) {
		this.evalVO2 = evalVO2;
	}

	
}
