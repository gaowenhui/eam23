package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.DicAppAssettype1;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype2;
import com.tansun.eam2.common.model.orm.bo.DicAppAssettype3;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.web.action.CommonAction;

/**
 * 当前类包括主要分则对前台传过来的增加、删除、修改、查询二级和三级列表显示数据等功能进行响应
 * @date 2010-11-29
 */

//@Controller
//@Scope("prototype")
public class DicAppAssetTypeAction extends CommonAction {
	QueryPurchaseVo queryPurVo;
	DicAppAssettype1 dicAppAssettype1;
	DicAppAssettype2 dicAppAssettype2;
	DicAppAssettype3 dicAppAssettype3;
	
	@Autowired
	private DicAppAssetTypeUCC dicAppAssetTypeUCC;
	
	String SuccessReturn = "";
	/**
	 * 页面初始化和当前类的其他方法调用完成后，都要返回该方法
	 */
	public String findFL() {
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		if (queryPurVo == null) {
			queryPurVo = new QueryPurchaseVo();
		} 
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();

		if (StringUtils.isNotEmpty(yjflbm)) {
			ejMap = dicAppAssetTypeUCC.findEjFl(yjflbm);
			if (StringUtils.isNotEmpty(ejflbm)) {
				sjMap = dicAppAssetTypeUCC.findSjFl(ejflbm);
			}
		}
		request.setAttribute("SuccessReturn", SuccessReturn);
		request.setAttribute("yjMap", yjMap);
		request.setAttribute("ejMap", ejMap);
		request.setAttribute("sjMap", sjMap);
		return "initPage";
	}
	/**
	 * 根据URL传过来的值是否为空,以及分类级别调用保存不同的对象到相应的表中
	 * @return 调用findFL()方法，返回页面
	 * @param fljb:分类级别
	 */
	public String addFL() {
		String fljb = request.getParameter("fljb");
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		if(StringUtils.isNotEmpty(fljb) && "yjfl".equals(fljb)){
			dicAppAssetTypeUCC.saveFL(dicAppAssettype1);
			SuccessReturn = "添加一级分类成功";
		}else if(StringUtils.isNotEmpty(fljb) && "ejfl".equals(fljb)){
			dicAppAssettype2.setMaincode(yjflbm);
			dicAppAssetTypeUCC.saveFL(dicAppAssettype2);
			SuccessReturn = "添加二级分类成功";
		}else if(StringUtils.isNotEmpty(fljb) && "sjfl".equals(fljb)){
			dicAppAssettype3.setMaincode(yjflbm);
			dicAppAssettype3.setSecondcode(ejflbm);
			dicAppAssetTypeUCC.saveFL(dicAppAssettype3);
			SuccessReturn = "添加三级分类成功";
		}
		return findFL();
	}
	
	/**
	 * 根据三级分类编码到资产表（zy_zc）中查询该分类编码下是否含有物品
	 * 如果不含物品，传到前台 currentFLCanBeDelete
	 * 如果含有物品，传到前台 currentFLCanNotBeDelete
	 * @return
	 */
	public String isSjflCanBeDelete(){
		String sjflbm = request.getParameter("sjflbm");
		String isFLCanBeDelete = null;
		if(dicAppAssetTypeUCC.isCurrentFLHaveGoods(sjflbm)){
			isFLCanBeDelete = "currentFLCanBeDelete";
		}else{
			isFLCanBeDelete = "currentFLCanNotBeDelete";
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(isFLCanBeDelete);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据URL中传过来的数据是否为空调用不同的删除方法
	 */
	public String delFL() {
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		String sjflbm = request.getParameter("sjflbm");
		if(StringUtils.isNotEmpty(sjflbm)){
			dicAppAssetTypeUCC.deletesjFL(sjflbm);
			SuccessReturn = "删除三级分类成功";
		}else if(StringUtils.isNotEmpty(ejflbm)){
			dicAppAssetTypeUCC.deleteejFL(ejflbm);
			SuccessReturn = "删除二级分类成功";
		}else if(StringUtils.isNotEmpty(yjflbm)){
			dicAppAssetTypeUCC.deleteyjFL(yjflbm);
			SuccessReturn = "删除一级分类成功";
		}
		return findFL();
	}
	
	/**
	 * 根据URL传过来的参数是否为空，调用不同的修改方法，在修改记录之前，设置相应的主键和外键
	 * @return
	 */
	public String modFL() {
		String yjflbm = request.getParameter("yjflbm");
		String ejflbm = request.getParameter("ejflbm");
		String sjflbm = request.getParameter("sjflbm");
		if(StringUtils.isNotEmpty(sjflbm)&&(dicAppAssettype3 != null)){
			dicAppAssettype3.setAssettype3Id(sjflbm);
			dicAppAssettype3.setMaincode(yjflbm);
			dicAppAssettype3.setSecondcode(ejflbm);
			dicAppAssetTypeUCC.modifyFL(dicAppAssettype3);
			SuccessReturn = "修改三级分类成功";
		}else if(StringUtils.isNotEmpty(ejflbm)&&(dicAppAssettype2 != null)){
			dicAppAssettype2.setAssettype2Id(ejflbm);
			dicAppAssettype2.setMaincode(yjflbm);
			dicAppAssetTypeUCC.modifyFL(dicAppAssettype2);
			SuccessReturn = "修改二级分类成功";
		}else if(StringUtils.isNotEmpty(yjflbm)&&(dicAppAssettype1 != null)){
			dicAppAssettype1.setAssettype1Id(yjflbm);
			dicAppAssetTypeUCC.modifyFL(dicAppAssettype1);
			SuccessReturn = "修改一级分类成功";
		}
		return findFL();
	}
  	
	/**
	 *一级分类值改变时，根据前台传过来的一级分类编码值到二级分类表中查询MainCode为一级分类编码所有记录名称
	 *并组成json串，传到前台
	 */
  	public String ejflRefresh(){
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'ejfls':[");
			Map<String, String> ejMap = dicAppAssetTypeUCC.findEjFl(queryPurVo.getYjflbm());
			for(Map.Entry<String, String> entry : ejMap.entrySet()){
				returnStr.append("{'ejflbm':'" + entry.getKey() + "','ejflmc':'" + entry.getValue() + "'},");
			}
			if(ejMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
  	/**
  	 * 查询三级分类中所有二级分类编码为选中的二级分类编码的值
  	 * @return
  	 */
	public String sjflRefresh(){
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'sjfls':[");
			Map<String, String> sjMap = dicAppAssetTypeUCC.findSjFl(queryPurVo.getEjflbm());
			for(Map.Entry<String, String> entry : sjMap.entrySet()){
				returnStr.append("{'sjflbm':'" + entry.getKey() + "','sjflmc':'" + entry.getValue() + "'},");
			}
			if(sjMap.size() != 0){
				returnStr.deleteCharAt(returnStr.length()-1);
			}
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString());
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 新增按钮时传到前台一条空记录
	 * @return
	 */
	public String AddOperRefresh(){
		try{
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'del':[");
			returnStr.append("{'typecode':'"+"',");
			returnStr.append("'typename':'" +"',");
			returnStr.append("'typeorder':'"+"',");
			returnStr.append("'typearea':'"+"',");
			returnStr.append("'orgid':'" + "',");
			returnStr.append("'memo1':'" + "',");
			returnStr.append("'memo2':'");
			returnStr.append("'}");
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString().replaceAll("null", ""));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 从一级分类表中查询一条数据，组成json串，返回到前台
	 * @return
	 */
	public String YJFLOperRefresh(){
		try{
			DicAppAssettype1 dic = new DicAppAssettype1();
			DicAppAssettype1 dic1 = dicAppAssetTypeUCC.findSingleRecordById(dic, queryPurVo.getYjflbm());
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'del':[");
			returnStr.append("{'typecode':'" + dic1.getTypecode()+"',");
			returnStr.append("'typename':'" + dic1.getTypename()+"',");
			returnStr.append("'typeorder':'" + dic1.getTypeorder()+"',");
			returnStr.append("'typearea':'" + dic1.getTypearea()+"',");
			returnStr.append("'memo1':'" + dic1.getMemo1() + "',");
			returnStr.append("'memo2':'" + dic1.getMemo2());
			returnStr.append("'}");
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString().replaceAll("null", ""));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 从二级分类表中查询一条数据，组成json串，返回到前台
	 * @return
	 */
	public String EJFLOperRefresh(){
		try{
			DicAppAssettype2 dic = new DicAppAssettype2();
			DicAppAssettype2 dic2 = dicAppAssetTypeUCC.findSingleRecordById(dic,queryPurVo.getEjflbm());
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'del':[");
			returnStr.append("{'typecode':'" + dic2.getTypecode()+"',");
			returnStr.append("'typename':'" + dic2.getTypename()+"',");
			returnStr.append("'typeorder':'" + dic2.getTypeorder()+"',");
			returnStr.append("'orgid':'" + dic2.getOrgid()+"',");
			returnStr.append("'memo1':'" + dic2.getMemo1() + "',");
			returnStr.append("'memo2':'" + dic2.getMemo2());
			returnStr.append("'}");
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString().replaceAll("null", ""));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 从三级分类表中查询一条数据，组成json串，返回到前台
	 * @return
	 */
	public String SJFLOperRefresh(){
		try{
			DicAppAssettype3 dic = new DicAppAssettype3();
			DicAppAssettype3 dic3 = dicAppAssetTypeUCC.findSingleRecordById(dic,queryPurVo.getSjflbm());
			StringBuffer returnStr = new StringBuffer();
			returnStr.append("{'del':[");
			returnStr.append("{'typecode':'" + dic3.getTypecode()+"',");
			returnStr.append("'typename':'" + dic3.getTypename()+"',");
			returnStr.append("'typeorder':'" + dic3.getTypeorder()+"',");
			returnStr.append("'orgid':'" + dic3.getOrgid()+"',");
			returnStr.append("'memo1':'" + dic3.getMemo1() + "',");
			returnStr.append("'memo2':'" + dic3.getMemo2());
			returnStr.append("'}");
			returnStr.append("]}");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(returnStr.toString().replaceAll("null", ""));
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 一级分类删除时的验证
	 * @return
	 * @throws IOException 
	 */
	public String yjflDelCheck() throws IOException{
		String yjfl = request.getParameter("yjvl");
		String fl = dicAppAssetTypeUCC.yjflDelCheck(yjfl);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(fl);
		return null;
	}
	
	/**
	 * 二级分类删除时的验证
	 * @return
	 * @throws IOException
	 */
	public String ejflDelCheck() throws IOException{
		String ejfl = request.getParameter("ejvl");
		String fl = dicAppAssetTypeUCC.ejflDelCheck(ejfl);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(fl);
		return null;
	}
	
	/**
	 * 三级分类删除时的验证
	 * @return
	 * @throws IOException
	 */
	public String sjflDelCheck() throws IOException{
		String sjfl = request.getParameter("sjfl");
		String fl = dicAppAssetTypeUCC.ejflDelCheck(sjfl);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(fl);
		return null;
	}
	
	public QueryPurchaseVo getQueryPurVo() {
		return queryPurVo;
	}

	public void setQueryPurVo(QueryPurchaseVo queryPurVo) {
		this.queryPurVo = queryPurVo;
	}

	public DicAppAssettype1 getDicAppAssettype1() {
		return dicAppAssettype1;
	}

	public void setDicAppAssettype1(DicAppAssettype1 dicAppAssettype1) {
		this.dicAppAssettype1 = dicAppAssettype1;
	}

	public DicAppAssettype2 getDicAppAssettype2() {
		return dicAppAssettype2;
	}

	public void setDicAppAssettype2(DicAppAssettype2 dicAppAssettype2) {
		this.dicAppAssettype2 = dicAppAssettype2;
	}

	public DicAppAssettype3 getDicAppAssettype3() {
		return dicAppAssettype3;
	}

	public void setDicAppAssettype3(DicAppAssettype3 dicAppAssettype3) {
		this.dicAppAssettype3 = dicAppAssettype3;
	}
}