package com.tansun.eam2.stock.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;
import net.sf.json.util.PropertyFilter;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.impl.CodeServiceImpl;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.StockBookvalue;
import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSbody;
import com.tansun.eam2.common.model.orm.bo.StockShead;
import com.tansun.eam2.common.model.orm.bo.StockWorklog;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stock.StockCommon;
import com.tansun.eam2.stock.ucc.IStockApproveService;
import com.tansun.eam2.stock.ucc.IStockService;
import com.tansun.eam2.stock.ucc.impl.stockServiceImpl;
import com.tansun.eam2.stock.vo.StockListVO;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.eam2.stock.vo.stockFlowListVO;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.FuncQueryUCCImpl;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 实体查询及维护
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class StockMaintainAction extends CommonAction implements IExport {
    public StockQueryVO stVO;
    private StockInfo sinfo;
    private StockList slist;
    private StockWorklog sw;
    private StockBookvalue sb;
    private Paginator paginator;
    private StglCommon sc;
    private List nfList;
    private StockShead head;
    private String id;
    @Autowired
    private ICodeGenerator codeGenerator;
    @Autowired
    private ICEMEntityService cemES;    
    @Autowired
    private IStockService stockService;
    
	private CodeServiceImpl codeService;
    private Code cd;
    private StockCommon stCommon;
    @Autowired
    private IStockApproveService stockApproveService;
    
    public StockSbody  sinfo1 = new StockSbody();
    
	public String getSingle(){
		String zcbh = request.getParameter("zcbh");
		String id= request.getParameter("id");
		sinfo = stockApproveService.getStockSbodyById(zcbh,id);
		return "look";
		
	}
	public IStockApproveService getStockApproveService() {
		return stockApproveService;
	}


	public void setStockApproveService(IStockApproveService stockApproveService) {
		this.stockApproveService = stockApproveService;
	}


	public Code getCd() {
		return cd;
	}


	public void setCd(Code cd) {
		this.cd = cd;
	}


	public CodeServiceImpl getCodeService() {
		return codeService;
	}
    
	
	
	/**
     * 债券日常维护查询
     * @return
     */
    public String listStockMaintain(){
//    	try {
//            List<StockListVO> list = new ArrayList();
//            List listMap=new ArrayList(); 
//            listMap = stockService.listStockRework(stVO);
//            for(int i =0;i<listMap.size();i++){
//            	Map map = (Map) listMap.get(i);
//            	StockListVO slVO = new StockListVO();
//            	slVO.setId(String.valueOf(map.get("STOCKID")));
//            	slVO.setDqr(String.valueOf(map.get("DQR")));
//            	slVO.setZqmc(String.valueOf(map.get("ZQMC")));
//            	slVO.setJhfhmc(String.valueOf(map.get("JHFHMC")));
//            	slVO.setZqzlmc(String.valueOf(map.get("ZQZLMC")));
//            	slVO.setZqmz(String.valueOf(map.get("ZQMZ")));
//            	list.add(slVO);
//            }
//            CommonBO[] boArray = new CommonBO[list.size()];
//	         list.toArray(boArray);
//            String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().print(josnStr);
//    	} catch (Exception e) {
//			e.printStackTrace();
//		}
        return "stockMaintainList";
    }
    
    public String viewListStockMaintain(){
    	if(stVO != null){
   		String id = request.getParameter("id");
    		
            List<StockListVO> list = new ArrayList();
            List listMap=new ArrayList(); 
 //           listMap = stockService.listStockRework(stVO);
            String json  = stockService.stockReworkList(stVO, id,paginator);
//            for(int i =0;i<listMap.size();i++){
//            	Map map = (Map) listMap.get(i);
//            	StockListVO slVO = new StockListVO();
//            	slVO.setStockid(String.valueOf(map.get("xm_id")));
//            	slVO.setXmmc(String.valueOf(map.get("xmmc")));
//            	slVO.setId(String.valueOf(map.get("id")));
//            	slVO.setDqr(String.valueOf(map.get("DQR")));
//            	slVO.setZqmc(String.valueOf(map.get("ZQMC")));
//            	slVO.setJhfhmc(String.valueOf(map.get("JHFHMC")));
//            	slVO.setZqzlmc(String.valueOf(map.get("ZQZLMC")));
//            	slVO.setZqmz(String.valueOf(map.get("zqmz")));
//            	list.add(slVO);
//            }	
//	         CommonBO[] boArray = new CommonBO[list.size()];
//	         list.toArray(boArray);
//	         String josnStr = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			 response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(json);
			} catch (IOException e) {
				e.printStackTrace();
			}
    	}
		return null;
    }
    
	/**
	 * 通过id查询债券投资详细信息
	 * @param id
	 * @return
	 */
    public String viewStockList200906(){
    	String id = request.getParameter("id");
    	slist = new StockList();
    	slist = stockService.viewDetail(id);
    	return "viewStockList200906";
    }

    /**
     * 添加工作记录
     * @return
     */
    public String newWork(){
    	String saveSign = request.getParameter("saveSign"); 
    	String stockId = request.getParameter("stockId");
    	sw = new StockWorklog();
    	sw.setStockid(stockId);
    	stockService.saveEntity(sw);
        return "newWork";
    }
    
    
    
    public String saveWork(){
    	
    	stockService.saveEntity(sw);
    	return null;
    }
    
    /**
     * 保存年初、年末值
     * @return
     */
    public String saveBookValue(){
    	String yearData = request.getParameter("yearData");
		sb.setStockid(sinfo.getId());
		sb.setZqmc(sinfo.getZqmc());
    	stockService.saveStockBook(sb,yearData);
    	
    	return null;
    }
    
    /**
     * 添加详细信息
     * @return
     */
    public String detailInfo(){
    	String tag = request.getParameter("tag");
    	String saveSign = request.getParameter("saveSign"); 
    	String stockId = request.getParameter("stockId");
    	String id = request.getParameter("id");
    	request.setAttribute("stockId", stockId);
    	sinfo = new StockInfo();
    	sinfo.setId(stockId);
    	request.setAttribute("stockId", stockId);
    	String bodyJSON =null;
        
    	if(StockCommon.stock_basicInfo.equals(tag)){
    		sinfo = new StockInfo();
    		if(stockId != null){
    			sinfo = stockService.viewStockInfo(stockId);
    			List list1 = stockService.bookValueList(stockId);
        		if(list1.size() == 0 || list1 == null){
                	List<StockBookvalue> list = stockService.bookValueList(stockId);
                	nfList = list;
        			return "newInfo";
        		}else{
        			sb = stockService.bookValueList(stockId).get(0);
        		}
            	List<StockBookvalue> list = stockService.bookValueList(stockId);
            	nfList = list;
    		}
    		if(id != null){
    			sinfo = stockService.viewStockInfo1(id);
    			List list1 = stockService.bookValueList1(id);
        		if(list1.size() == 0 || list1 == null){
                	List<StockBookvalue> list = stockService.bookValueList(id);
                	nfList = list;
        			return "newInfo";
        		}else{
        			sb = stockService.bookValueList(id).get(0);
        		}
            	List<StockBookvalue> list = stockService.bookValueList(stockId);
            	nfList = list;
    		}
    		sb = new StockBookvalue();
    		return "newInfo";
    	}else if(StockCommon.stock_workRecord.equals(tag)){
    		List<StockWorklog> list = null;
    		return "newWorkRecord";
    	}else if(StockCommon.stock_workFlow.equals(tag)){
    		List<stockFlowListVO> list = null;
        
    		return "workFlow";
    	}else if(StockCommon.stock_logInfo.equals(tag)){		//查看日志
    		String zcid = request.getParameter("zcid");
        	request.setAttribute("zcid", zcid);
    		return "lookLogInfo";
    	}
    	return "tagPage";
    }
    /**
     * 返回年初、年末值json串
     * @return
     */
    public String returnJsonString(){
    	String stockId = request.getParameter("stockId");
    	String nf = request.getParameter("nf");
    	List<StockBookvalue> list = stockService.bookValueList(stockId);
    	sb = new StockBookvalue();
    	nfList = list;
    	sb = stockService.viewbookValue(nf, stockId);
    	response.setCharacterEncoding("UTF-8");
    	try {
			response.getWriter().print(BodyListToJSON.bodyToJSON(sb,getJsonConfig(),false));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;	
    }
    
   /**
    * 查看工作记录
    * @return
    */ 
    public String viewList(){
    	@SuppressWarnings("unused")
		String stockId = request.getParameter("stockId");
//    	List<StockWorklog> list = null;
//    	list = stockService.workLogList(stockId,paginator);
    	String json = stockService.workLogList(stockId, paginator);
//    	CommonBO[] boArray = new CommonBO[list.size()];
//        list.toArray(boArray);
//        String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
    }
    
    /**
     * 
     * 产看流程信息
     * @return
     */
    public String viewListLiucheng(){
    	@SuppressWarnings("unused")
		String stockId = request.getParameter("stockId");
//    	List<StockWorklog> list = null;
//    	list = stockService.workLogList(stockId,paginator);
    	String json = stockService.workLogList(stockId, paginator);
//    	CommonBO[] boArray = new CommonBO[list.size()];
//        list.toArray(boArray);
//        String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
    }
    
    
    
    /*弹出详细信息
     * 
     */
    public String popPage(){
    	String yearData = request.getParameter("yearData");
    	String stockId = request.getParameter("stockId");
    	String id = request.getParameter("id");
    	sinfo = new StockInfo();
		sinfo = stockService.viewStockInfo(stockId);
		sb = new StockBookvalue();
//		sb.setId(id);
//		String rework = request.getParameter("rework");
//		request.setAttribute("rework", rework);
//		if("1".equals(rework)){
//			
//		}
    	return "popPageInfo";
    }
    
    
    /**
     * 查看 详细信息中的 工作记录的 详细记录
     * @return
     */
    public String viewWorkDetail(){
    	String look = request.getParameter("look");
    	request.setAttribute("look", look);
    	String swid = request.getParameter("swid");
    	sw = new StockWorklog();
    	sw = stockService.viewStock(swid);
    	return "newWork";
    }
    
    /**
     * 弹出入工作记录
     */
    public String popWorkLog(){
    	
    	String stockId = request.getParameter("stockId");
    	String dunPersonId = request.getParameter("dunPersonId");
    	stockService.workLogDetail(stockId, dunPersonId);
    	
    	return "newWork";
    }
    
    
//    /**
//     * 弹出相关流程界面
//     * @return
//     */
//    public String popMutualityflow(){
//       	try {
//       		String stockId = request.getParameter("stockId");
//            List list = new ArrayList();
//            list = stockService.listStockFlow(stockId);
//            CommonBO[] boArray = new CommonBO[list.size()];
//            list.toArray(boArray);
//            String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//			response.setCharacterEncoding("UTF-8");
//			response.getWriter().print(josnStr);
//    	} catch (Exception e) {
//			e.printStackTrace();
//		}
//    	return "popMutualityflow";
//    }
//    
    
    /**
     * jsp  返回 url 相关流程
     * @return 
     */
    public String viewMutualityflow(){
    	String stockId = request.getParameter("stockId");
    	String look = request.getParameter("look");
    	request.setAttribute("look", look);
    	List<stockFlowListVO> list = new ArrayList();
        List listMap=new ArrayList(); 
        listMap = stockService.listStockFlow(stockId);
        for(int i =0;i<listMap.size();i++){
        	Map map = (Map) listMap.get(i);
        	stockFlowListVO slVO = new stockFlowListVO();
        	slVO.setSheadId(String.valueOf(map.get("shead_id")));
        	slVO.setNgrq(String.valueOf(map.get("ngrq")));
        	slVO.setBdzt(String.valueOf(map.get("bdzt")));
        	slVO.setNgbmmc(String.valueOf(map.get("ngbmmc")));
        	slVO.setStock_id(String.valueOf(map.get("stock_id")));
        	slVO.setZqmc(String.valueOf(map.get("zqmc")));
        	slVO.setNgrmc(String.valueOf(map.get("ngrmc")));
        	list.add(slVO);
        }
        CommonBO[] boArray = new CommonBO[list.size()];
        list.toArray(boArray);
        String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return null;
    }


    
    public String viewBodyList(){
    	try {
    		String sheadId = request.getParameter("sheadId");
            List list = new ArrayList();
            list = stockApproveService.viewStockList(sheadId);
            CommonBO[] boArray = new CommonBO[list.size()];
            list.toArray(boArray);
            String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
    	} catch (Exception e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    
    
    /**
     * 查看相关工作流详细记录
     * @return
     */
    public String viewFlow(){
    	
    	String sheadId = request.getParameter("sheadId");
    	request.setAttribute("sheadId", sheadId);
    	String look = request.getParameter("look");
    	request.setAttribute("look", look);
    	head = stockApproveService.viewStockShead(sheadId);
    	
    	return "viewFlow";
    }
   
    

    
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}


	public ICEMEntityService getCemES() {
		return cemES;
	}

	public void setCemES(ICEMEntityService cemES) {
		this.cemES = cemES;
	}

	@Autowired
	public void setCodeService(CodeServiceImpl codeService) {
		this.codeService = codeService;
	}

    public StglCommon getSc() {
		return sc;
	}

	public void setSc(StglCommon sc) {
		this.sc = sc;
	}

	public ICodeGenerator getCodeGenerator() {
		return codeGenerator;
	}

	public void setCodeGenerator(ICodeGenerator codeGenerator) {
		this.codeGenerator = codeGenerator;
	}


	public IStockService getStockService() {
		return stockService;
	}


	public void setStockService(IStockService stockService) {
		this.stockService = stockService;
	}


	public StockInfo getSinfo() {
		return sinfo;
	}


	public void setSinfo(StockInfo sinfo) {
		this.sinfo = sinfo;
	}


	public StockList getSlist() {
		return slist;
	}


	public void setSlist(StockList slist) {
		this.slist = slist;
	}


	public StockWorklog getSw() {
		return sw;
	}


	public void setSw(StockWorklog sw) {
		this.sw = sw;
	}


	public StockBookvalue getSb() {
		return sb;
	}


	public void setSb(StockBookvalue sb) {
		this.sb = sb;
	}


	public StockQueryVO getStVO() {
		return stVO;
	}


	public void setStVO(StockQueryVO stVO) {
		this.stVO = stVO;
	}


	public StockCommon getStCommon() {
		return stCommon;
	}


	public void setStCommon(StockCommon stCommon) {
		this.stCommon = stCommon;
	}

	
	private JsonConfig getJsonConfig() {
		JsonConfig jsonConfig = new JsonConfig();
		
		//设置没有值，或者指定属性 不处理生成JSON串
		jsonConfig.setJsonPropertyFilter( new PropertyFilter(){   
			   public boolean apply( Object source, String name, Object value ){   
			      return name.equals("sysUpdateTime");   
			   }   
			});
		
		//特殊对象的数据进行转换，可以自行控制，如日期格式化。
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonValueProcessor(){

			public Object processArrayValue(Object value, JsonConfig jsonConfig) {
				return null;
			}

			public Object processObjectValue(String key, Object value,
					JsonConfig jsonConfig) {
				String str = "";
				if(value != null && value instanceof Date){
					str = new SimpleDateFormat("yyyy-MM-dd").format((Date)value);
				}
				
				return str;
			}
			
		});
		//指定某些属性如果为null则不转换成JSON串。
		jsonConfig.setExcludes( new String[]{ "Double", "Boolean"} );
		return jsonConfig;
	}


	public List getNfList() {
		return nfList;
	}


	public void setNfList(List nfList) {
		this.nfList = nfList;
	}


	public StockShead getHead() {
		return head;
	}


	public void setHead(StockShead head) {
		this.head = head;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * excel导出
	 */
    public String exportexcel(){
    	String json = "";
    	if(stVO != null){
//    		String id = request.getParameter("id");
    		String id = "null";
            List<StockListVO> list = new ArrayList();
            List listMap=new ArrayList(); 
            if(stockService==null){
            	stockService=(stockServiceImpl)SpringContextHelper.getBean(stockServiceImpl.class);
    		}
            json  = stockService.stockReworkList(stVO, id,paginator);
    	}
		return json;
    }
    
	public void setExcelVO(CommonBO excelVO) {
		this.stVO = (StockQueryVO)excelVO;
	}

}
