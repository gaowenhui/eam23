package com.tansun.eam2.zyzc.service.impl;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.transformer.XLSTransformer;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.ZySbody;
import com.tansun.eam2.common.model.orm.bo.ZyShead;
import com.tansun.eam2.zyzc.service.ZCManageBodyBS;
import com.tansun.eam2.zyzc.service.ZCManageHeadBS;
import com.tansun.eam2.zyzc.utils.CoverMapToBody;
import com.tansun.eam2.zyzc.vo.PTVO;
import com.tansun.eam2.zyzc.vo.ZySheadVO;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.PageableList;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * @author 薛崇杰 2010-11-23 下午10:47:59
 */
@Service
public class ZCManageHeadBSImpl implements ZCManageHeadBS {

	@Autowired
	PublicDao publicDao;
	@Autowired
	ZCManageBodyBS bodybs;
	private XLSTransformer transformer = new XLSTransformer();
	/**
	 * 新增一张单子,数据库中插入一条空记录,得到id
	 * 
	 * @return
	 */
	public void newHead(ZyShead zyShead) {
		publicDao.save(zyShead);
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * 
	 * @return
	 */
	public ZyShead readHead(String sheadID) {
		String hql = "from ZyShead o where o.sheadId=?";
		List<String> list = new ArrayList<String>();
		list.add(sheadID);
		return (ZyShead) publicDao.findSingleResult(hql, list);
	}

	/**
	 * 界面上加一个删除按钮,点击后提交.
	 * 
	 * @return
	 */
	public void deleteHead(String sheadId) {
		String hql = "from ZyShead o where o.sheadId=?";
		List<String> list = new ArrayList<String>();
		list.add(sheadId);
		ZyShead zyShead = (ZyShead) publicDao.findSingleResult(hql, list);
		publicDao.delete(zyShead);
	}

	/**
	 * 根据表体ID删除相应的表体
	 * 
	 * @return
	 */
	public void deleteBody(String[] bodyIds) {
		for (int i = 0; i < bodyIds.length; i++) {
			String hql = "from ZySbody o where o.sbodyId=?";
			List<String> list = new ArrayList<String>();
			list.add(bodyIds[i]);
			ZySbody zySbody = (ZySbody) publicDao.findSingleResult(hql, list);
			publicDao.delete(zySbody);
		}
	}

	/**
	 * 从后台数据库检索单据信息,提供给前台界面进行显示,
	 * 
	 * @return
	 */
	public ZyShead viewHead(String sheadId) {
		List<String> params = new ArrayList<String>();
		params.add(sheadId);
		return (ZyShead) publicDao.findSingleResult(
				"from ZyShead o where o.sheadId=?", params);
	}

	/**
	 * 界面上有一个保存按钮,点击以后更新保存到数据库,
	 * 
	 * @return
	 */
	public void saveHead(ZyShead zyShead) {
		publicDao.saveOrUpdate(zyShead);
	}
	
	/**
	 * 更新head
	 * @param zyShead
	 */
	public void updateHead(ZyShead zyShead) {
		publicDao.update(zyShead);
	}

	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * 
	 * @param sheettype
	 *            存放查询类型，区分是领用还是借用的
	 * @param dept
	 *            存放部门id，作为查询区间
	 * @return
	 */
	public List<ZySbody> getBodyByDept(String sheettype, String dept) {
		String[] shtype = sheettype.split("_");
		String type = shtype[shtype.length - 1];
		List<String> params = new ArrayList<String>();
		params.add("%" + type + "%");
		params.add(dept);
		List bodyList = publicDao.find(" select sb from ZySbody sb, ZyShead sh "
				+ " where sb.sheadId=sh.sheadId " + " and sh.sheetType like ? "
				+ "	and sh.ngbmbh=? and (sh.bdzt = '1' or sh.bdzt= '进行中')", params);
		return bodyList;
	}
	
	/**
	 * 根据部门来查询当前的部门内的借用，领用等资产信息
	 * 
	 * @param sheettype
	 *            存放查询类型，区分是领用还是借用的
	 * @param dept
	 *            存放部门id，作为查询区间
	 * @return
	 */
	public List<ZySbody> getBodyByDeptWithoutGRSQDBodyId(String sheettype, String dept,Paginator paginator) {
		String[] shtype = sheettype.split("_");
		String type = shtype[shtype.length - 1];
		List<String> params = new ArrayList<String>();
		String preparSQL = "select sb.* from Zy_Sbody sb, Zy_Shead sh"
			+ " where sb.shead_Id = sh.shead_Id" 
			+ " and sh.sheet_Type like ?"
			+ "	and sh.ngbmbh = ? and (sh.bdzt = '1' or sh.bdzt= '进行中')" 
			+ " and sb.grsqdbodyid is not null"
			+ " order by sb.sbody_Id asc";
		params.add("%" + type + "%");
		params.add(dept);
		PageableList pageableList = publicDao.queryForList(preparSQL, params, paginator);
		List<Map<String,Object>> zySbodyMapList = (List<Map<String,Object>>)pageableList.getResults();
		List<ZySbody> finalList = new ArrayList<ZySbody>();
		for(Map<String,Object> map : zySbodyMapList){
			finalList.add(CoverMapToBody.obtainZySbodyFromMap(map));
		}
		return finalList;
	}
	
//	public List<ZySbody> getBodyByDeptWithoutGRSQDBodyId(String sheettype, String dept,Paginator paginator) {
//		String[] shtype = sheettype.split("_");
//		String type = shtype[shtype.length - 1];
//		List<String> params = new ArrayList<String>();
//		String preparHQL = "select sb from ZySbody sb, ZyShead sh"
//			+ " where sb.sheadId = sh.sheadId" 
//			+ " and sh.sheetType like ?"
//			+ "	and sh.ngbmbh = ? and (sh.bdzt = '1' or sh.bdzt= '进行中')" 
//			+ " and sb.grsqdbodyid is not null"
//			+ " order by sb.sbodyId asc";
//		params.add("%" + type + "%");
//		params.add(dept);
//		PageableList pageableList = publicDao.queryByHQLWithPaginator(preparHQL, params, paginator);
//		return (List<ZySbody>)pageableList.getResults();
//	}
	
	/**
	 * 查询head表中已通过审批的采购单的ID
	 * @return
	 */
	public String [] obtainHeadId(){
		String hql = "from ZyShead zs where zs.sheetType = 'purchase' and (zs.bdzt= '3' or zs.bdzt = '数据已办结')";
		List<ZyShead> headList = (List<ZyShead>)publicDao.find(hql);
		String [] headIdList = new String[headList.size()];
		int headIdListIndex = 0;
		for(Iterator<ZyShead> i = headList.iterator(); i.hasNext();){
			headIdList[headIdListIndex] = i.next().getSheadId();
			headIdListIndex++;
		}
		return headIdList;
	}
	
	/**
	 * 根据VO中的查询条件到head表中查询出符合条件的记录
	 * @param headVO
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<ZyShead> obtainHeadList(ZySheadVO headVO){
		List paramsList = new ArrayList();
		StringBuffer sb = new StringBuffer();
		sb.append("from ZyShead zh where 1 = 1 and zh.sheetType = 'purchase' and (zh.bdzt= '3' or zh.bdzt='数据已办结')");
		if(StringUtils.isNotEmpty(headVO.getTitle())){
			sb.append(" and zh.title like ?");
			paramsList.add("%" + headVO.getTitle()+ "%");
		}
		if(StringUtils.isNotEmpty(headVO.getNgrmc())){
			sb.append(" and zh.ngrmc like ?");
			paramsList.add("%"+ headVO.getNgrmc() +"%");
		}
		if(StringUtils.isNotEmpty(headVO.getNgbmmc())){
			sb.append(" and zh.ngbmmc like ?");
			paramsList.add("%"+ headVO.getNgbmmc() +"%");
		}
		if(StringUtils.isNotEmpty(headVO.getZzngrq())){
			sb.append(" and zh.ngrq > ?");
			paramsList.add(headVO.getZzngrq());
		}
		if(StringUtils.isNotEmpty(headVO.getZwngrq())){
			sb.append(" and zh.ngrq <= ?");
			paramsList.add(headVO.getZwngrq());
		}
		return (List<ZyShead>)publicDao.find(sb.toString(), paramsList);
	}
	

	/**
	 * 根据表单信息将归还信息记录入台账
	 * 
	 * @param sheadId
	 */
	public void saveBodyToBook(String sheadId) {

	}

	/**
	 * 归还物品，刷新资产表信息
	 * 
	 * @param sheadId
	 */
	public void refreshZc(String sheadId) {

	}
	
	@SuppressWarnings("unchecked")
	public void print(String headId, HttpServletRequest request, HttpServletResponse response){
		try {
			String filename = (String)request.getAttribute("filename1");
			String finalFileName = "";
			String templateFileName = request.getSession().getServletContext().getRealPath("")+"/printTemplate/"+filename+".xls";
			response.setContentType("contentType=application/vnd.ms-excel; charset=UTF-8");
			
			if("cheapGoodsStockTable".equals(filename)){
				finalFileName = "自用资产采购打印单";
			}else if("putDepotTable".equals(filename)){
				finalFileName = "自用资产入库打印单";
			}else if("drawBetakeTable_shen".equals(filename)){
				finalFileName = "自用资产部门领用打印单";
			}else if("borrowAppTable_shen".equals(filename)){
				finalFileName = "自用资产部门借用打印单";
			}
			
			response.setHeader("Content-disposition","attachment;filename=" + new String((finalFileName+".xls").getBytes("GBK"),"iso8859-1"));
			InputStream is = new FileInputStream(templateFileName);
			Map beanParams = new HashMap();
			ZyShead head1 = this.readHead(headId);
			ZyShead head = head1.clone(head1); 
			//打印单据调用方法 原来是用bodybs.readLyBodyByHeadID(headId);这个方法有汇总  
			List list = bodybs.print(headId);
			ZySbody body1 = null;
			ZySbody body = null;
			double zj = 0.0;
			List list1 = new ArrayList();
			for (int i = 0; i< list.size(); i++) {
				body1 = (ZySbody) list.get(i);
				body = body1.clone(body1);
				body.setSbodyId(String.valueOf(i + 1));
				zj += body.getDj()== null?0.0:body.getDj();
				String jylyrq4Char = "";
				String jydqrq4Char = "";
				Date date1 = body.getJylyrq();
				if(date1!=null){
					jylyrq4Char = DateUtils.formatDate(date1,"yyyy-MM-dd");
				}
				Date date2 = body.getJydqrq();
				if(date2!=null){
					jydqrq4Char = DateUtils.formatDate(date2,"yyyy-MM-dd");
				}
				body.setJylyrq4Char(jylyrq4Char);
				body.setJydqrq4Char(jydqrq4Char);
				list1.add(body);
			}
			head.setBodys(list1);
			head.setHqyj(String.valueOf(list.size()));//这个是废弃字段，在打印里借用下，在打印模板里为数量， lantianbo 
			head.setYwyyzyj(String.valueOf(zj));//这个是废弃字段，在打印里借用下，在打印模板里为总价， lantianbo 
			beanParams.put("head", head);
			HSSFWorkbook workbook = transformer.transformXLS(is, beanParams);
	    	HttpServletResponse res = response;
		   	res.setHeader("Pragma","public");
		   	res.setContentType("contentType=application/vnd.ms-excel;charset=UTF-8");
		   	res.setHeader("Content-disposition","attachment;filename=" + new String((finalFileName+".xls").getBytes("GBK"),"iso8859-1"));
			ServletOutputStream ouputStream = response.getOutputStream();
			workbook.write(ouputStream);
			ouputStream.flush();
			ouputStream.close();

		} catch (Exception e){
			System.out.println(e.getMessage());
			throw new RuntimeException(e.getMessage(),e);
		}
	}
	
	public PTVO findPTtodo(String applyId){
		PTVO pt = new PTVO();
		String sql = "select * from p_t_todo where head_id = '"+applyId+"'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if(list.size()>0){
			Map map = (Map)list.get(0);
			pt.setHeadId(String.valueOf(map.get("HEAD_ID")));
			pt.setTid(String.valueOf(map.get("PROC_INST_ID")));
			pt.setUrl(String.valueOf(map.get("URL")));
		}
		return pt;
	}
	
	/**
	 * 把采购单作为办理依据
	 * @param headId
	 * @param applyId
	 * @return
	 */
	public CommonAccording getBLYJByHeadId(String headId,String applyId){
		String sql = "select t.* from zy_shead t where t.shead_id = '"+applyId+"'";
		List list = publicDao.queryForList(sql, new ArrayList());
		CommonAccording blyj = new CommonAccording();
		PTVO pt = this.findPTtodo(applyId);
		if(list.size()>0){
			Map map = (Map)list.get(0);
			blyj.setBdid(headId);
			blyj.setBh(String.valueOf(map.get("SHEET_ID")));
			blyj.setBt(String.valueOf(map.get("TITLE")));
			blyj.setLcid(String.valueOf(pt.getTid()));
			blyj.setLcmc(String.valueOf(map.get("SHEET_TYPE")));
			blyj.setNgr(String.valueOf(map.get("NGRBH")));
			try {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = sdf.parse(String.valueOf(map.get("NGRQ")));
				blyj.setNgrq(date);
			} catch (ParseException e) {
				e.printStackTrace();
			}
			blyj.setUrl("/eam2/zyzc/ZCManageHead_modifyHead.do?headId="+applyId);
			blyj.setUserCode(String.valueOf(map.get("NGRBH")));
			blyj.setDel(new Long(0));
			blyj.setTbdid(applyId);
			blyj.setSource("EAM");
		}
		return blyj;
	}
}
