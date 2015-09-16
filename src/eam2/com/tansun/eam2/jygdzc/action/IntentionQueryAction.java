package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.jygdzc.ucc.IAssuranceQueryUCC;
import com.tansun.eam2.jygdzc.ucc.IIntentionUCC;
import com.tansun.eam2.jygdzc.ucc.impl.IntentionUCCImpl;
import com.tansun.eam2.jygdzc.vo.AssuranceQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.task.service.PTEndBS;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;

/**
 * 清单查询
 * @author lihuan
 *
 */

public class IntentionQueryAction extends CommonAction implements IExport{
	
	private JyzcXx zcxx;
	private String sheettype;	
	private Paginator paginator;
	private JyzlQueryVO jyzlQueryVO;
	private JyzlViewVO jyzlViewVO;
    private AssuranceQueryVO assQueryVO;
    public String headId = null;
    @Autowired
    public IDeptUCC iDeptUCCImpl;
    @Autowired
	PTEndBS  PTEndBSImpl ;
    @Autowired
    IIntentionUCC intentionUCCImpl;
    @Autowired
    IAssuranceQueryUCC assuranceQueryUCCImpl;
    /**
     * 查询信息初识化
     * @return
     */
    public String init(){
    	return sheettype;
     }
      /**
       * 查询信息组装成Bo对象
     * @return
     */
    public void  findPTEndByHeadId(){
    	String headId = request.getParameter("headId");
    	PTEnd  ptEnd = PTEndBSImpl.findPTEndByHeadId(headId);
    	Long endId = new Long(0); 
    	if(ptEnd!=null){
    		 endId = ptEnd.getId(); 
    	}
    	try {
 			response.getWriter().print(endId);
 		} catch (IOException e) {
 			e.printStackTrace();
 		}
    }
    
    //经营租赁查询
    public String query4View(){
    	if (jyzlQueryVO == null) {
    		jyzlQueryVO = new JyzlQueryVO();
		}
    	    IUser user = UserThreadLocal.get();
    	    List<PTDeptBO> listuser = iDeptUCCImpl.getDeptByUserId(user.getUserTid());
    	    if(listuser != null && listuser.size()>0){
    	    	for(int i=0;i<listuser.size();i++){
    	    		PTDeptBO dept = listuser.get(i);
    	    		//如果是代理机构，一级委托管理机构下属的尸体
    	    		if(dept.getRsvdNum1()!=null && "11262".equals(dept.getRsvdNum1().toString())){
    	    			jyzlQueryVO.setccrwtjg(String.valueOf(dept.getTid()));
    	    		}else if(dept.getRsvdNum1()!=null && "113".equals(dept.getRsvdNum1().toString())){
    	    			jyzlQueryVO.setcyjwtjg("113");
    	    		}
    	    	}
    	    }
    		List<JyzlViewVO> list = intentionUCCImpl.getJyzlViewVOByCondition(jyzlQueryVO,paginator);
			//System.out.println(list.size());
			String bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			//System.out.println(bodyJSON);
	        response.setCharacterEncoding("UTF-8");
	 		try {
	 			response.getWriter().print(bodyJSON);
	 		} catch (IOException e) {
	 			e.printStackTrace();
	 		}
	 		return null;
	  }
    
    public String query4ViewSelect(){
    	try {
    	String params = request.getParameter("idStr");
    	List<JyzlViewVO> list = intentionUCCImpl.getJyzlViewVOByCondition(params);
    	String bodyJSON = null;
    	bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
    	response.setCharacterEncoding("UTF-8");
 			response.getWriter().print(bodyJSON);
 		} catch (Exception e) {
 			e.printStackTrace();
 		}
    	return null;
    }
    
    
    
    /**
	 * 投保申请查询
	 * 
	 * @author 陈煜霄
	 * @return
	 * @throws IOException
	 */
	public String query4insurance() throws IOException {
		if (assQueryVO == null) {
			assQueryVO = new AssuranceQueryVO();
		}
		String assuranceJSON = assuranceQueryUCCImpl.queryAssurance(assQueryVO,
				paginator);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(assuranceJSON);
		return null;
	}
    
	
	public String query4Select() throws IOException{
		String params = request.getParameter("idStr");
		String bodyJSON =null;
		//按照投保申请的Id查出信息来
		List<AssuranceQueryVO> list = new ArrayList<AssuranceQueryVO>();
		list=assuranceQueryUCCImpl.queryAssurance(params);
		try{
			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		}catch(Exception e){ 
			e.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(bodyJSON);
		return null;
	}
	
    // 下面是自动生成的Get/Set方法
    //下面的方法不可修改.
	public JyzcXx getZcxx() {
		return zcxx;
	}
	public void setZcxx(JyzcXx zcxx) {
		this.zcxx = zcxx;
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
	public JyzlQueryVO getJyzlQueryVO() {
		return jyzlQueryVO;
	}
	public void setJyzlQueryVO(JyzlQueryVO jyzlQueryVO) {
		this.jyzlQueryVO = jyzlQueryVO;
	}
	public JyzlViewVO getJyzlViewVO() {
		return jyzlViewVO;
	}
	public void setJyzlViewVO(JyzlViewVO jyzlViewVO) {
		this.jyzlViewVO = jyzlViewVO;
	}
	public String getHeadId() {
		return headId;
	}
	public void setHeadId(String headId) {
		this.headId = headId;
	}
	public IIntentionUCC getIntentionUCCImpl() {
		return intentionUCCImpl;
	}
	public void setIntentionUCCImpl(IIntentionUCC intentionUCCImpl) {
		this.intentionUCCImpl = intentionUCCImpl;
	}
	public AssuranceQueryVO getAssQueryVO() {
		return assQueryVO;
	}
	public void setAssQueryVO(AssuranceQueryVO assQueryVO) {
		this.assQueryVO = assQueryVO;
	}
	/**
	 * 导出excel
	 */
	public String exportexcel() throws Exception {
		if (jyzlQueryVO == null) {
    		jyzlQueryVO = new JyzlQueryVO();
		}else{
			if("Thu Jan 01 00:00:00 CST 1970".equals(jyzlQueryVO.getBegintime1().toString())){
				jyzlQueryVO.setBegintime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(jyzlQueryVO.getBegintime2().toString())){
				jyzlQueryVO.setBegintime2(null);
			}
			if("Thu Jan 01 00:00:00 CST 1970".equals(jyzlQueryVO.getEndtime1().toString())){
				jyzlQueryVO.setEndtime1(null);
			}
			if("Sat Dec 31 00:00:00 CST 2050".equals(jyzlQueryVO.getEndtime2().toString())){
				jyzlQueryVO.setEndtime2(null);
			}
		}
		if(intentionUCCImpl==null){
			intentionUCCImpl=(IIntentionUCC)SpringContextHelper.getBean(IntentionUCCImpl.class);
		}
		List<JyzlViewVO> list = intentionUCCImpl.getJyzlViewVOByCondition(jyzlQueryVO,paginator);
		String bodyJSON = BodyListToJSON.getJSON(list,paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
 		return bodyJSON;
	}
	public void setExcelVO(CommonBO excelVO) {
		this.jyzlQueryVO = (JyzlQueryVO)excelVO;
	}
	
}
