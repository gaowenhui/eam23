package com.tansun.eam2.stock.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.StockInfo;
import com.tansun.eam2.common.model.orm.bo.StockList;
import com.tansun.eam2.common.model.orm.bo.StockSdzmzXx;
import com.tansun.eam2.stock.ucc.IStockInvestService;
import com.tansun.eam2.stock.vo.StockListVO;
import com.tansun.eam2.stock.vo.StockQueryVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
public class stockInvestAction extends CommonAction {

    private StockList slist = new StockList();
    private StockQueryVO stVO ;
    private Paginator paginator;
    
    @Autowired
    private IStockInvestService stService;
    
	/**
     * 查询债券清单
     * @return
     */
    public String listStockInvest(){

        return "stockList";
    }
    
    /**
     * jsp  返回 url
     * @return
     */
    public String viewListStockInvest(){
    	
    	try {
    		if(stVO != null){
	            List<StockListVO> list = new ArrayList();
	            List listMap=new ArrayList(); 
	            listMap = stService.listStock(paginator,stVO);
	            for(int i =0;i<listMap.size();i++){
	            	Map map = (Map) listMap.get(i);
	            	StockListVO slVO = new StockListVO();
	            	slVO.setBeizhu(String.valueOf(map.get("beizhu")));
	            	slVO.setId(String.valueOf(map.get("id")));
	            	slVO.setXmmc(String.valueOf(map.get("xmmc")));
	            	SimpleDateFormat  sdf = new SimpleDateFormat("yyyy-mm-dd");
	            	slVO.setShidian(sdf.parse(String.valueOf((map.get("shidian")))));
	            	slVO.setJzzb(String.valueOf(map.get("jzzb")));
	            	slVO.setZmz(String.valueOf(map.get("zmz")));
	            	slVO.setFhmc(String.valueOf(map.get("fhmc")));
	            	slVO.setXmmcqr(String.valueOf(map.get("xmmcqr")));
	            	
	         //   	slVO.setZqmz(String.valueOf(map.get("zqmz")));
	            	list.add(slVO);
	            }	
		         String josnStr = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
				 response.setCharacterEncoding("UTF-8");
				 response.getWriter().print(josnStr);
    			}
        	} catch (Exception e) {
        		
    			e.printStackTrace();
    		}
        return null;
    }
    
    
    public String query4Elect(){

		String params = request.getParameter("ids");
		String bodyJSON =null;
		//债券查询
//		list=assetUCCImpl.getJyzcXxVOByCondition(params);
//		for(JyzcXxVO vo : list){
//			if(vo.getCardinfo() == null){
//				vo.setCardinfo(new Cardinfo());
//			}
//		}
//		try{
//			bodyJSON = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//		}catch(Exception e){ 
//			e.printStackTrace();
//		}
		
		
//		List<StockQueryVO> list = stService.
		
		
		
		response.setCharacterEncoding("UTF-8");
//		response.getWriter().print(bodyJSON);
		return null;
	
    	
    }
    
    /**
     * 查看stock
     * @return
     */
    public String viewStockInvest(){
    	
    	String id = request.getParameter("id");
    	request.setAttribute("id", id);
    	slist = stService.viewDetail(id);
    	return "viewStockInvest";
    }
    
    
    public String viewStockInvestList(){
    	try {
    		String id = request.getParameter("id");
			List<StockSdzmzXx> list = null;
            list = stService.listStockAss(id);
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
     * 查看stock明细
     * @return
     */
    public String viewStockInvestDetail(){
    	
    	String id = request.getParameter("id");
    	request.setAttribute("id", id);
    	slist = stService.viewDetail(id);
    	
    	return "viewStockInvestDetail";
    }
    
    
    
    public String viewStockDetailInvestList(){
    	
    	try {
    		String id = request.getParameter("id");
			List<StockInfo> list = null;
            list = stService.listStockDetailAss(id);
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
    
    
    
	public StockList getSlist() {
		return slist;
	}
	public void setSlist(StockList slist) {
		this.slist = slist;
	}
	public StockQueryVO getStVO() {
		return stVO;
	}
	public void setStVO(StockQueryVO stVO) {
		this.stVO = stVO;
	}
	public Paginator getPaginator() {
		return paginator;
	}
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}





	public IStockInvestService getStService() {
		return stService;
	}





	public void setStService(IStockInvestService stService) {
		this.stService = stService;
	}

}
