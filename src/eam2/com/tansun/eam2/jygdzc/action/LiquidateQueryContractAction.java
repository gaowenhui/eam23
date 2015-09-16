package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IContractUCC;
import com.tansun.eam2.jygdzc.ucc.ILiquidateUCC;
import com.tansun.eam2.jygdzc.ucc.impl.ContractUCCImpl;
import com.tansun.eam2.jygdzc.vo.ClearQueryVO;
import com.tansun.eam2.jygdzc.vo.ClearViewVO;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * 为了合同清算需要,而设计的租赁和委托合同的查询功能 为了简化程序结构,这一功能单独实现.
 * 
 * @author 刘峻松
 * 
 */

public class LiquidateQueryContractAction extends CommonAction  implements IExport{

	public ClearQueryVO queryVO;
	// 注入ucc方法
	@Autowired
	public IContractUCC contractUCCImpl;
	@Autowired
	public ILiquidateUCC liquidateUCCimpl;
	private String sheettype;
	private String headId;
	public Paginator paginator;
	public List<ClearViewVO> list = new ArrayList<ClearViewVO>();

	/**
	 * init 是资产台账查询界面的入口方法，不做任何操作，直接返回init.
	 * 
	 * @return
	 */
	public String init() {
		String sheetType = request.getParameter("sheettype");
		return sheetType;
	}

	/**
	 * query 是资产台账查询功能的入口，从界面上得到对应的查询条件，然后提交后台查询 按输入元素进行组合查询,目前实现资产编号和资产名称,
	 * 查询结果变成一个BO的List集合,提供给界面
	 * 
	 * @return
	 * @throws IOException
	 */
	public String query() throws IOException {
		if(queryVO==null){
			queryVO = new ClearQueryVO();
		}
		String bodyJSON = contractUCCImpl.getJjzcHtViewByCondition(queryVO,paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	//可勾选的删除
	public String excel4Select() throws IOException {
		String params = request.getParameter("idStr");
		String bodyJSON =null;
		if(queryVO==null){
			queryVO = new ClearQueryVO();
		}
		List<ClearQueryVO> list=new ArrayList<ClearQueryVO>();
		list = contractUCCImpl.getJjzcHtViewByCondition(params);
		bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	
	
	/**
	 * 清算查询里的查看功能
	 * @return
	 */
	public String openViewDetail(){
		String headId = (String)request.getParameter("headId");
		request.setAttribute("headId", headId);
		return "openViewDetail";
	}
	
	/**
	 * 清算查询里的查看功能
	 * @return
	 */
	public String viewDetail(){
		String headId = (String)request.getParameter("headId");
		List list = this.contractUCCImpl.getBodyListByHeadId(headId);
		request.setAttribute("list", list);
		return "modifyDetail";
//		String jsonStr = BodyListToJSON.getJSON(list, 1, 1, 10000);
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().write(jsonStr);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
	}
	
	/**
	 * 选择初始化
	 * 
	 * @return
	 */
	public String selectinit() {
		// 入口，这个入口代表要选择一个经营型固定资产，界面上要显示一个选择按钮
		// step1:得到查询对象
		// step2:调用后台Service,得到资产对应的列表
		// step3:将List对象传递到前台去

		// step4:结束工作，转到相关页面

		// step5: 返回选中记录的Id值
		return "";
	}

	//相关流程
	public String xglc(){
		
		String s = liquidateUCCimpl.findXglc(headId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(s);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String getSheettype() {
		return sheettype;
	}

	public void setSheettype(String sheettype) {
		this.sheettype = sheettype;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public ClearQueryVO getQueryVO() {
		return queryVO;
	}

	public void setQueryVO(ClearQueryVO queryVO) {
		this.queryVO = queryVO;
	}

	public String getHeadId() {
		return headId;
	}

	public void setHeadId(String headId) {
		this.headId = headId;
	}
	/**
	 * 导出excel
	 */
	public String exportexcel() throws Exception {
		if (queryVO == null) {
			queryVO = new ClearQueryVO();
		}
		if(contractUCCImpl==null){
			contractUCCImpl=(IContractUCC)SpringContextHelper.getBean(ContractUCCImpl.class);
		}
		String bodyJSON ="";
		bodyJSON = contractUCCImpl.getJjzcHtViewByCondition(queryVO,paginator);
 		return bodyJSON;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.queryVO = (ClearQueryVO)excelVO;
	}
}
