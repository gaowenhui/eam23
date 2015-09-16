package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

//@Controller
//@Scope("prototype")
public class BatchAddAction extends CommonAction{
	private ZyPdxx pdxx;
	private String zcIds;
	private String delIds;
	private String Ids;
	private Paginator paginator;
	@Autowired
	ToCheckUCC toCheckUCCimpl;
	
	/**
	 * 批次新增页面使用，得到盘点信息表中最大的盘点信息号，加1后传输到页面
	 * @return
	 */
	public String init(){
		if(pdxx == null){
			pdxx = new ZyPdxx();
		}
//		List<ZyPdxx> PdxxList = toCheckUCCimpl.queryAllPdxx();
//		int MaxPdpc = 0;
//		int temp = 0;
//		for (Iterator<ZyPdxx> i = PdxxList.iterator(); i.hasNext();) {
//			String pdpcStr = i.next().getPdpc();
//			if(StringUtils.isNotEmpty(pdpcStr)){
//				temp = Integer.valueOf(pdpcStr);
//			}
//			if(temp > MaxPdpc){
//				MaxPdpc = temp;
//			}
//		}
//		pdxx.setPdpc(String.valueOf(MaxPdpc + 1));
		
		return "initAddPage";
	}
	
	/**
	 * 根据页面选择好的zcId，调用createZyPdxxByZcId方法（过滤掉资产id为空的情况）查出一条记录保存到盘点信息表中
	 * @return
	 */
	public String query(){
		String [] zcIdArray = zcIds.split(",");
		ZyPdxx PdxxForSave = null;
		for(String zcId : zcIdArray){
			if(StringUtils.isNotEmpty(zcId)){
				PdxxForSave = toCheckUCCimpl.createZyPdxxByZcId(zcId);
				PdxxForSave.setPdsl(PdxxForSave.getSl());
				PdxxForSave.setPdjg("盘平");
				toCheckUCCimpl.saveZyPdxx(PdxxForSave);
			}
		}
		return null;
	}
	
	/**
	 * 通过批次类型生成盘点批次，生成最大的盘点批次号
	 * @return
	 */
	public String generPdpcWithPclx(){
		String pclx = request.getParameter("pclx");
		String maxPdpc = toCheckUCCimpl.getMaxPdpc(pclx);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(maxPdpc);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除盘点信息表中没有盘点批次号的记录
	 * @return
	 */
	public String deletePdxxWithoutPdpc(){
		List<ZyPdxx> pdxxList = toCheckUCCimpl.queryAllPdxxWithoutPdpc();
		for(ZyPdxx pdxx : pdxxList){
			String [] deleteIdArr = {pdxx.getId()};
			toCheckUCCimpl.deleteBody(deleteIdArr);
		}
		return null;
	}
	
	/**
	 * 根据资产Id选择出来的信息保存到盘点信息表中后，返回到资产增加页面后再从数据库中查出来刚增加进去的数据
	 * @return
	 * @throws IOException 
	 */
	public String displayDataWithoutPdpc() throws IOException{
		//pdxxListWithNullPdpc 盘点批次为空的ZyPdxx列表
		List<ZyPdxx> pdxxListWithNullPdpc = toCheckUCCimpl.queryPdxxWithoutPdpc(paginator);
		String josnStr = BodyListToJSON.getJSON(pdxxListWithNullPdpc, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(josnStr);
		return null;
	}
	
	/**
	 * 通过盘点批次号查找该批次的记录
	 * @return
	 * @throws Exception
	 */
	public String findPdxxWithPdpc() throws Exception{
		String pdpc = request.getParameter("pdpc");
		List<ZyPdxx> pdxxList = toCheckUCCimpl.findZyPdxxWithPdpcAndPager(pdpc, paginator);
		displayJSonString(pdxxList);
		return null;
	}
	
	/**
	 * 根据选中的资产Id到盘点信息表中更改盘点批次，点击确定按钮时使用
	 * @return
	 */
	public String Ok(){
		List<ZyPdxx> pdxxList = new ArrayList<ZyPdxx>();
		pdxxList = toCheckUCCimpl.queryPdxxWithoutPdpc();
		for(ZyPdxx pdxxFromTable : pdxxList){
			pdxxFromTable.setPdpc(pdxx.getPdpc());
			if(pdxx.getPdrq() != null){
				pdxxFromTable.setPdrq(pdxx.getPdrq());
			}
			toCheckUCCimpl.update(pdxxFromTable);
		}
		return null;
	}
	
	/**
	 * 工具类，把所有继承CommonBO类的List转换成JSON串传到前台
	 * @param <T>
	 * @param VOList
	 * @return
	 */
	private <T> String displayJSonString(List<T> VOList){
		String josnStr = BodyListToJSON.getJSON(VOList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除选中的表体记录
	 */
	public String deleteBody() {
		String[] delIdArray = delIds.split(",");
		toCheckUCCimpl.deleteBody(delIdArray);
		return null;
	}
	
	public ZyPdxx getPdxx() {
		return pdxx;
	}
	public void setPdxx(ZyPdxx pdxx) {
		this.pdxx = pdxx;
	}

	public String getZcIds() {
		return zcIds;
	}

	public void setZcIds(String zcIds) {
		this.zcIds = zcIds;
	}

	public String getDelIds() {
		return delIds;
	}

	public void setDelIds(String delIds) {
		this.delIds = delIds;
	}

	public String getIds() {
		return Ids;
	}

	public void setIds(String ids) {
		Ids = ids;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
}
