package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.zyzc.ucc.DicAppAssetTypeUCC;
import com.tansun.eam2.zyzc.ucc.ZCBookQueryUcc;
import com.tansun.eam2.zyzc.ucc.impl.ZCBookQueryUccImpl;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.eam2.zyzc.vo.QueryBody4View;
import com.tansun.eam2.zyzc.vo.QueryPurchaseVo;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 资产台账查询
 * @author 穆占强
 * @date 2010-11-20
 */

//@Controller
//@Scope("prototype")
public class ZCBookQueryAction extends CommonAction  implements IExport{
	List<QueryBody4View> zctzVOList;
	private QueryPurchaseVo queryPurVo;
	private String zctzlx="";
	private String bodyIds = "";
	private Paginator paginator;
	private String sheettype;
	private QueryBody4View queryBody4View;
	@Autowired
	private ZCBookQueryUcc zCBookQueryUcc;
	@Autowired
	private DicAppAssetTypeUCC dicAppAssetTypeUCC;
	
	/**
	 * 这是入口
	 * @return
	 */
	public String init() {
		session.put("conForm", queryPurVo);
		return zctzlx + "_init";
	}
	
	/**
	 * 库存台账查询页面使用
	 * @deprecated
	 * @return
	 */
//	public String query() {
//		List<QueryBody4View> queryBody4ViewList = zCBookQueryUcc.queryKCTZ(queryPurVo,paginator);
//		String josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
//				paginator.getCurrentPage(), paginator.getCount());
//		response.setCharacterEncoding("UTF-8");
//		try {
//			response.getWriter().print(josnStr);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	
	/**
	 * 库存台账查询页面使用
	 * @return
	 */
	public String queryKCTZ() {
		String josnStr = null;
		List<QueryBody4View> queryBody4ViewList = zCBookQueryUcc.queryKCTZ(queryPurVo,paginator);
		if(queryBody4ViewList==null){
			josnStr = "{\"total\" : \"0\",\"page\" : \"0\",\"records\" : \"0\",\"rows\" : []}";
		}else{
			josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		String josnStr = null;
		if(zCBookQueryUcc==null){
			zCBookQueryUcc=(ZCBookQueryUcc)SpringContextHelper.getBean(ZCBookQueryUccImpl.class);
		}
		List<QueryBody4View> queryBody4ViewList = null;
		if("inventoryFixedAsset".equals(queryPurVo.getGhlx())){
			queryBody4ViewList = zCBookQueryUcc.queryKCTZ(queryPurVo,paginator);
		}else if("realFixedAsset".equals(queryPurVo.getGhlx())){
			queryBody4ViewList = zCBookQueryUcc.querySWTZ(queryPurVo,paginator);
		}else if("realLowValue".equals(queryPurVo.getGhlx())){
			queryBody4ViewList = zCBookQueryUcc.queryDZPTZ(queryPurVo,paginator);
		}else if("realConsum".equals(queryPurVo.getGhlx())){
			queryBody4ViewList = zCBookQueryUcc.queryYHPTZ(queryPurVo,paginator);
		}
		josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		return josnStr;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.queryPurVo = (QueryPurchaseVo)excelVO;
	}
	
	/**
	 * 实物台账--》低值品台账查询页面使用
	 * @return
	 */
	public String queryDZPTZ() {
		String josnStr = null;
		List<QueryBody4View> queryBody4ViewList = zCBookQueryUcc.queryDZPTZ(queryPurVo,paginator);
		if(queryBody4ViewList==null){
			josnStr = "{\"total\" : \"0\",\"page\" : \"0\",\"records\" : \"0\",\"rows\" : []}";
		}else{
			josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 实物台账--》固定资产台账查询页面使用
	 * @return
	 */
	public String querySWTZ() {
		String josnStr = null;
		List<QueryBody4View> queryBody4ViewList = zCBookQueryUcc.querySWTZ(queryPurVo,paginator);
		if(queryBody4ViewList==null){
			josnStr = "{\"total\" : \"0\",\"page\" : \"0\",\"records\" : \"0\",\"rows\" : []}";
		}else{
			josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	
	/**
	 * 实物台账--》易耗品台账查询页面使用
	 * @return
	 */
	public String queryYHPTZ() {
		String josnStr = null;
		List<QueryBody4View> queryBody4ViewList = zCBookQueryUcc.queryYHPTZ(queryPurVo,paginator);
		if(queryBody4ViewList==null){
			josnStr = "{\"total\" : \"0\",\"page\" : \"0\",\"records\" : \"0\",\"rows\" : []}";
		}else{
			josnStr = BodyListToJSON.getJSON(queryBody4ViewList, paginator.getPageCount(), 
					paginator.getCurrentPage(), paginator.getCount());
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * @return
	 */
	public String queryBySelectCondition(){
		if(queryPurVo == null){
			queryPurVo = new QueryPurchaseVo();
		}
		String yjflbm = queryPurVo.getYjflbm();
		String ejflbm = queryPurVo.getEjflbm();
		Map<String, String> yjMap = dicAppAssetTypeUCC.findYjFl();
		Map<String, String> ejMap = new HashMap<String, String>();
		Map<String, String> sjMap = new HashMap<String, String>();
		if (StringUtils.isNotEmpty(yjflbm)) {
			ejMap = dicAppAssetTypeUCC.findEjFl(yjflbm);
			if (StringUtils.isNotEmpty(ejflbm)) {
				sjMap = dicAppAssetTypeUCC.findSjFl(ejflbm);
			}
		}
		session.put("yjMap", yjMap);
		session.put("ejMap", ejMap);
		session.put("sjMap", sjMap);
		return zctzlx+"_queryBySelectCondition";
	}

	public ZCBookQueryUcc getZCBookQueryUcc() {
		return zCBookQueryUcc;
	}

	public void setZCBookQueryUcc(ZCBookQueryUcc bookQueryUcc) {
		zCBookQueryUcc = bookQueryUcc;
	}

	public String getZctzlx() {
		return zctzlx;
	}

	public void setZctzlx(String zctzlx) {
		this.zctzlx = zctzlx;
	}

	public QueryPurchaseVo getQueryPurVo() {
		return queryPurVo;
	}

	public void setQueryPurVo(QueryPurchaseVo queryPurVo) {
		this.queryPurVo = queryPurVo;
	}

	public List<QueryBody4View> getZctzVOList() {
		return zctzVOList;
	}

	public void setZctzVOList(List<QueryBody4View> zctzVOList) {
		this.zctzVOList = zctzVOList;
	}

	public String getBodyIds() {
		return bodyIds;
	}

	public void setBodyIds(String bodyIds) {
		this.bodyIds = bodyIds;
	}

	public DicAppAssetTypeUCC getDicAppAssetTypeUCC() {
		return dicAppAssetTypeUCC;
	}

	public void setDicAppAssetTypeUCC(DicAppAssetTypeUCC dicAppAssetTypeUCC) {
		this.dicAppAssetTypeUCC = dicAppAssetTypeUCC;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public QueryBody4View getQueryBody4View() {
		return queryBody4View;
	}

	public void setQueryBody4View(QueryBody4View queryBody4View) {
		this.queryBody4View = queryBody4View;
	}
	
	
}