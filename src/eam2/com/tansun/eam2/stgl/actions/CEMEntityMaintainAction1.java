package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.impl.CodeServiceImpl;
import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.DebtInfo;
import com.tansun.eam2.common.model.orm.bo.SsBaseinfo;
import com.tansun.eam2.common.model.orm.bo.StFsxx;
import com.tansun.eam2.common.model.orm.bo.StJbxx;
import com.tansun.eam2.common.model.orm.bo.StSkjnXx;
import com.tansun.eam2.common.model.orm.bo.ZcPgXx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.stgl.StglCommon;
import com.tansun.eam2.stgl.ucc.ICEMEntityService;
import com.tansun.eam2.stgl.ucc.impl.CEMEntityService;
import com.tansun.eam2.stgl.vo.EntityQueryVO;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.zqgl.ucc.ICreditorService;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.ICodeGenerator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;
import com.tansun.rdp4j.workflow.common.model.PTEnd;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;
import com.tansun.rdp4j.workflow.task.ucc.PTEndUCC;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 实体查询及维护
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class CEMEntityMaintainAction1 extends CommonAction implements IExport{
 //   private String zixunType ; //0:咨询类 //1:非咨询类
    public EntityQueryVO entityvo;
    private StJbxx st;				//基本信息
    private StFsxx sf;				//附属信息
    private String fsxxIds;
    private String pop;
    private Paginator paginator = new Paginator();
    private StglCommon sc;			
    private DebtInfo di;			//债务
    private StSkjnXx sk;			//税款
    private SsBaseinfo sbInfo;       //  诉讼
    private ZcPgXx zc ;
    private String ZcPgXxIds;		// 评估信息id
    private String taxPaymentIds;   //税款缴纳信息id
    public String look="";
    @Autowired
    private ICodeGenerator codeGenerator ;
    @Autowired
    private ICEMEntityService cemES;    
	private CodeServiceImpl codeService;
    private Code cd;
	@Autowired
	private ICreditorService creditorService; 

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
     * 咨询类查询实体
     * @return
     */
    public String listEntities(){
    	try {
	        String zixunType = request.getParameter("zixunType");
	        request.getSession().setAttribute("stlx", zixunType);
	        
	        //处理单id  Added by liubeibei. 2010-12-3
	        String cldId = this.request.getParameter("cldId");
	        String ctlButton = this.request.getParameter("ctlButton");
	        this.request.setAttribute("ctlButton", ctlButton);
	        if(cldId != null && cldId.trim().length() > 0){
	        	 session.put("entityCldId", cldId);
	        }
	        //Added by liubeibei.
	        request.setAttribute("zixunType",zixunType);
			String zcczpg = request.getParameter("zcczpg");
			request.setAttribute("zcczpg", zcczpg);
			
	        String debtSign = request.getParameter("debtSign");
	        request.setAttribute("debtSign", debtSign);
	        String stlx = zixunType;
	        if(entityvo != null){
	            List<StJbxx> list = null;
	            list = cemES.listEntities(paginator,entityvo,stlx);
	            List<Code> provienceList = codeService.findAllByCodeType("PROVIENCE");
	            List<Code> entityTradeList = codeService.findAllByCodeType("ENTITY_TRADE");
	            List<Code> entityStatus = codeService.findAllByCodeType("ENTITY_STATUS");
	            List<Code> entityDisposition = codeService.findAllByCodeType("ENTITY_DISPOSE_METHOD");
	            for(StJbxx st : list){
	    			if(!"1".equals(st.getStlx())){
	    				for(Code en : entityTradeList){
	    					if(en.getCodeKey().equals(st.getCHangye()))st.setCHangye(en.getCodeValue());
	    				}
	    			}
	    			for(Code pn : provienceList){
	    				if(pn.getCodeKey().equals(st.getCShengfen()))st.setCShengfen(pn.getCodeValue());
	    			}
	    			for(Code status : entityStatus){
	    				if(status.getCodeKey().equals(st.getCStzt()))st.setCStzt(status.getCodeValue());
	    			}
	    			for(Code disposition : entityDisposition){
	    				if(disposition.getCodeKey().equals(st.getCCzfs())){
	    					st.setCCzfs(disposition.getCodeValue());
	    				}
	    			}
	    			//st.setCShengfen(codeService.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", st.getCShengfen()));
	        		if("1".equals(st.getCGlbm())){
	    				st.setCGlbm("委托代理业务部");
	    			}else if("2".equals(st.getCGlbm())) {
	    				st.setCGlbm("资产管理处置部");
	    			}
	        		if("0".equals(st.getJyfl())){
	    				st.setJyfl("持续经营类");
	    			}else if("1".equals(st.getJyfl())){
	    				st.setJyfl("处置类");
	    			}
	        		
	    		}
	            CommonBO[] boArray = new CommonBO[list.size()];
	            list.toArray(boArray);
	            String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
 				response.setCharacterEncoding("UTF-8");
				response.getWriter().print(josnStr);
				return null;
        	}
    	} catch (Exception e) {
			e.printStackTrace();
		}

        return "weihuQueryInit";
    }

    
    /**
     * 进入咨询st新增/修改页面
     * @return
     */
    public String newEntity(){
    	// ----- chenyuxiao start------
    	String loansId = request.getParameter("loansId");
    	request.setAttribute("loansId", loansId);
    	// ----- chenyuxiao end------
    	String newAdd = request.getParameter("newAdd");
    	request.setAttribute("newAdd", newAdd);
    	String sfbc = request.getParameter("sfbc");
    	request.setAttribute("sfbc", sfbc);
	   	String rework = request.getParameter("rework");
	   	request.setAttribute("rework", rework);
    	String fslx = request.getParameter("fslx");
		String stid = request.getParameter("stid");
		request.setAttribute("stid", stid);
		request.setAttribute("stid", request.getParameter("stid"));
		String bili = request.getParameter("bili");
		String stlx = request.getParameter("stlx");
		String assetType = request.getParameter("assetType");
		request.setAttribute("assetType", assetType);
		String ctlButton = request.getParameter("ctlButton");
		request.setAttribute("ctlButton",ctlButton);
		request.setAttribute("zcczCldId", request.getParameter("zcczCldId"));
		String zixunType = request.getParameter("zixunType");
		request.setAttribute("zixunType", zixunType);
		String zcczpg = request.getParameter("zcczpg");
		request.setAttribute("zcczpg", zcczpg);
		if(stid != null){
			st = cemES.viewEntityJbxx(stid);
		}else{
			st = new StJbxx();
			cemES.newEntity(st);
    		st.setStlx((String)request.getSession().getAttribute("stlx"));
		}
		request.setAttribute("stid", stid);
		request.setAttribute("stlx", stlx);
    	String look = request.getParameter("look");
    	request.setAttribute("look", look);
    	if("1".equals(rework)){
    		request.setAttribute("rework", rework);
    		String zzqks = st.getZzqkHtml(st.getZzqk(),look);
    		request.setAttribute("zzqks", zzqks);
    		String khyhs = st.getkhyhString(st.getKhyh(),look);
    		request.setAttribute("khyhs", khyhs);
    	}
    	if(StglCommon.ST_INFO_JIBEN.equals(fslx)){
    		return "jiben";
    	}else if(StglCommon.ST_INFO_RENYUAN.equals(fslx)){
    		return "renyuan";
    	} else if(StglCommon.ST_INFO_GAOGUAN.equals(fslx)){
    		return "gaoguan";
    	}else if(StglCommon.ST_INFO_GUQUAN.equals(fslx)){
    		return "guquan";
    	}else if(StglCommon.ST_INFO_GREATAFFAIR.equals(fslx)){
    		return "dashiji";
    	}else if(StglCommon.ST_INFO_REPORTFORM.equals(fslx)){
    		return "caiwu";
    	}else if(StglCommon.ST_INFO_ZICHAN.equals(fslx)){
    		return "zichan";
    	}else if(StglCommon.ST_INFO_LIUCHENG.equals(fslx)){
    		return "liucheng";
    	}else if(StglCommon.ST_INFO_CHUZHI.equals(fslx)){
    		return "chuzhi";
    	}else if(StglCommon.ST_INFO_RIZHI.equals(fslx)){
    		return "rizhi";
    	}else if(StglCommon.ST_INFO_FEIYONG.equals(fslx)){
    		return "feiyong";
    	}else if(StglCommon.ST_INFO_FUJIAN.equals(fslx)){
    		return "fujian";
    	}
        return "newEntity";
    }
    
    /**
     * 进入非咨询实体新增/修改页面
     * @return
     */
    public String newNonEntity(){
    	String newAdd = request.getParameter("newAdd");
    	request.setAttribute("newAdd", newAdd);
    	String assetType = request.getParameter("assetType");// add by lantianbo
		request.setAttribute("assetType", assetType);
		String ctlButton = request.getParameter("ctlButton");
		request.setAttribute("ctlButton",ctlButton);
		String look = request.getParameter("look");
		request.setAttribute("look", look);
	   	String rework = request.getParameter("rework");
	   	request.setAttribute("rework", rework);
		String fslx = request.getParameter("fslx");
		String stid = request.getParameter("stid");
		request.setAttribute("stid", request.getParameter("stid"));
		String zixunType = request.getParameter("zixunType");
		request.setAttribute("zixunType", zixunType);
		String zcczpg = request.getParameter("zcczpg");
		request.setAttribute("zcczpg", zcczpg);
		
		
		if(stid != null){
			st = new StJbxx();
			st.setId(stid);
		}
    	if(st == null){
    		st = new StJbxx();
    		st.setStlx((String)request.getSession().getAttribute("stlx"));
    		cemES.newEntity(st);
        	request.setAttribute("stid", stid);
        	st = cemES.viewEntityJbxx(st.getId());
    	}
    	request.setAttribute("stid", stid);
    	if(StringUtils.isNotEmpty(st.getId())){
    		request.setAttribute("stid", st.getId());
    	}
    	st = cemES.viewEntityJbxx(st.getId());


		if(StglCommon.ST_INFO_JIBEN.equals(fslx)){
			String bili = request.getParameter("bili");
			if(StringUtils.isNotEmpty(rework)){
				String pop = request.getParameter("pop");
				sf = new StFsxx();
	    		sf.setLeixing(fslx);
	    		sf.setStnzcfl(pop);
			 List<StFsxx> list = new ArrayList();
   			 list = cemES.viewEntityFsxxPop(stid, sf.getLeixing(), sf.getStnzcfl());
			}
			return "nonBasic";
		}else if(StglCommon.ST_INFO_RENYUAN.equals(fslx)){       //实体人员信息
			return "nonrenyuan";
		}else if(StglCommon.ST_INFO_WEIJIAN.equals(fslx)){   //文件及公章存放情况
			return "nonkeep";
		}else if(StglCommon.ST_INFO_ZICHAN.equals(fslx)){		//实体资产情况
			return "nonzichan";
		}else if(StglCommon.ST_INFO_ZAIWU.equals(fslx)){		//债务债权情况
			return "nondebt";
		}else if(StglCommon.ST_INFO_SUSONG.equals(fslx)){		//诉讼情况
			return "nonlitigation";
		}else if(StglCommon.ST_INFO_RIZHI.equals(fslx)){		//日志信息
			return "nonrizhi";
		}else if(StglCommon.ST_INFO_LIUCHENG.equals(fslx)){		//流程信息
			return "nonliucheng";
		}else if(StglCommon.ST_INFO_CHUZHI.equals(fslx)){		//处置信息
			return "nonchuzhi";
		}else if(StglCommon.ST_INFO_FEIYONG.equals(fslx)){      //相关费用收入
    		return "nonfeiyong";
    	}else if(StglCommon.ST_INFO_FUJIAN.equals(fslx)){       //相关附件
    		return "nonfujian";
    	}
//		else if(StglCommon.ST_INFO_FEIYONG.equals(fslx)){
//    		return "feiyong";
//    	}
    	return "newNonEntity";
    }
    
    public String saveEntity(){
    	cd =  codeService.findByCodeTypeAndCodeKey("PROVIENCE", st.getCShengfen());
		if(st.getZcbh() == null || st.getZcbh().length() == 0){
			String code = codeGenerator.generateCurrentCode("stzcbh", "", "");
			String code2 = code.replace("#1#", cd.getCodeTag());
			st.setZcbh(code2);
		}
		if(st.getZcbh() != null){
			st.setZcbh(st.getZcbh().replace(st.getZcbh().substring(0, st.getZcbh().indexOf("-")), cd.getCodeTag()));
		}
    	if(!"1".equals(st.getStlx())){
	    	String[] zzmcArr = request.getParameterValues("zzmc");
	    	String[] stzzdjArr = request.getParameterValues("stzzdj");
	    	String[] fzdwArr = request.getParameterValues("fzdw");
	    	String[] zzdqrqArr = request.getParameterValues("zzdqrq");
	    	st.setZzqk(st.setZzqkString(zzmcArr, stzzdjArr, fzdwArr, zzdqrqArr));
	    	
	    	String[] khyh = request.getParameterValues("khyh"); 
	    	String[] zh = request.getParameterValues("zh");
	    	st.setKhyh(st.setkhyhString(khyh, zh));
    	}
    	st.setSfbc("1");
    	//记录实体日志信息
	    String newAdd = request.getParameter("newAdd");
	    if("1".equals(newAdd)){
	    	cemES.saveEntityLog(null, st, "新增");
		}else{
			StJbxx old = cemES.viewEntityJbxx(st.getId());
			cemES.saveEntityLog(old, st, "修改");
		}  
	    String stzzqk=st.getZzqk();
    	cemES.saveEntity(st);
    	try {
    		response.setCharacterEncoding("UTF-8");
			response.getWriter().write("{\"result\":[{\"stzcbh\":\"" + st.getZcbh() + "\"}]}");
    	} catch (Exception e) {
			try {
				response.getWriter().write("error");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
        return null;
    }
    
    public String saveStFsxx(){
    	
    		StFsxx ss = new StFsxx();
    	    ss = cemES.viewFsxx(sf.getId());
    	    sf.setStid(ss.getStid());
    	    // chenyuxiao start
    	    if(sf.getCdkzh()!=null && !"".equals(sf.getCdkzh())){
    	    	this.diZaiZhiChanSave();
    	    	return null;
    	    }
    	    // chenyuxiao end
    	    if("1".equals(sf.getStnzcfl())){
    	    	String[] zsbh = request.getParameterValues("zsbh");
    	    	String[] zsmc = request.getParameterValues("zsmc");
    	    	String[] fzsj = request.getParameterValues("fzsj");
    	    	String[] fzjg = request.getParameterValues("fzjg");
    	    	sf.setFzyzgqk(sf.setFzyzgqkString(zsmc, fzsj, fzjg, zsbh));
    	    }
    	    StJbxx st = cemES.viewEntityJbxx(ss.getStid());
    	    //    cd为空  null
    	    cd =  codeService.findByCodeTypeAndCodeKey("PROVIENCE", st.getCShengfen());
    	   
    	    if("1".equals(sf.getStnzcfl()) && (sf.getFrybh() == null || sf.getFrybh().length() == 0)){
    			String code = codeGenerator.generateCurrentCode("strybh", "", "");
    			String code2 = code.replace("#1#", cd.getCodeTag());
    			if(code2 !=null && code2 !=""){
    				sf.setFrybh(code2);
    			}
    			
    		}else if("4".equals(sf.getStnzcfl()) && (sf.getGdsjbh() == null || sf.getGdsjbh().length() == 0)){
    			String code = codeGenerator.generateCurrentCode("stdsjbh", "", "");
    			String code2 = code.replace("#1#",cd.getCodeTag());
    			sf.setGdsjbh(code2);
    		}else if("6".equals(sf.getStnzcfl()) && (sf.getHxjbh() == null || sf.getHxjbh().length() == 0)){
				String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
    			String code2 = code.replace("#1#",cd.getCodeTag());
    			sf.setHxjbh(code2);

    		}else if("7".equals(sf.getStnzcfl())){
    			if( sf.getJtdbh() == null || sf.getJtdbh().length() == 0){
        			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
        			String code2 = code.replace("#1#",cd.getCodeTag());
        			sf.setJtdbh(code2);
    			}
					
    		}else if("8".equals(sf.getStnzcfl())){
    			if(sf.getKfwbh() == null || sf.getKfwbh().length() == 0){
        			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
        			String code2 = code.replace("#1#",cd.getCodeTag());
        			sf.setKfwbh(code2);
    			}
					
    		}else if("9".equals(sf.getStnzcfl())){
    			if(sf.getMsbbh() == null || sf.getMsbbh().length() == 0){
        			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
        			String code2 = code.replace("#1#",cd.getCodeTag());
        			sf.setMsbbh(code2);
    			}
				
    		}else if("10".equals(sf.getStnzcfl())){
    			if(sf.getLjtgjbh() == null || sf.getLjtgjbh().length() == 0){
        			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
        			String code2 = code.replace("#1#",cd.getCodeTag());
        			sf.setLjtgjbh(code2);
    			}
    		}else if("11".equals(sf.getStnzcfl()) && (sf.getNdwtzbh() == null || sf.getNdwtzbh().length() == 0)){
    			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
    			String code2 = code.replace("#1#",cd.getCodeTag());
    			sf.setNdwtzbh(code2);
    		}else if("12".equals(sf.getStnzcfl())){
    			if(sf.getPqtzcbh() == null || sf.getPqtzcbh().length() == 0){
        			String code = codeGenerator.generateCurrentCode("stzcxx", "", "");
        			String code2 = code.replace("#1#",cd.getCodeTag());
        			sf.setPqtzcbh(code2);
    			}
					
    		}
    		else if("14".equals(sf.getStnzcfl())){
    			sf.setFcRylb("1");
    		}else if("15".equals(sf.getStnzcfl())){
    			sf.setFcRylb("2");
    		}
    	    sf.setSfbc("1");
			//记录实体日志信息
    	    String newAdd = request.getParameter("newAdd");
    	    if("1".equals(newAdd)){
	    		cemES.saveEntityFsxxLog(null, sf, "新增");
			}else{
    	    	StFsxx old = cemES.viewEntityFsxx(sf.getId());
    			cemES.saveEntityFsxxLog(old, sf, "修改");
			}  
    	    cemES.saveEntity(sf);
    	    response.setCharacterEncoding("UTF-8");
    	try {
    		if("7".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"jtdbh\":\"" + sf.getJtdbh() + "\"}]}");
    		}else if("8".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"kfwbh\":\"" + sf.getKfwbh() + "\"}]}");
    		}else if("9".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"msbbh\":\"" + sf.getMsbbh() + "\"}]}");
    		}else if("10".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"ljtgjbh\":\"" + sf.getLjtgjbh() + "\"}]}");
    		}else if("12".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"pqtzcbh\":\"" + sf.getPqtzcbh() + "\"}]}");
    		}
			
		} catch (Exception e) {
			try {
				response.getWriter().print("error");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
    	return null;	
    }
    
    public String getZcPgXxList(){
    	String sfid = request.getParameter("sfid");
    	String cdkzh = request.getParameter("cdkzh");
    	request.setAttribute("sfid", sfid);
    	request.setAttribute("cdkzh", cdkzh);
    	List<ZcPgXx> list = null;
		list = cemES.getZcPgXxList(sfid,null);
    	
    	
    	String json = BodyListToJSON.getJSON(list, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
    	response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    
    
    /**
     *  保存评估信息
     * @return
     */
    public String saveZcPgXx(){
    	String sfid = request.getParameter("sfid");
    	 
    	StFsxx sff = new StFsxx();
    	sff = cemES.viewFsxx(sfid);
    	
    	StJbxx sttt = new StJbxx();
		sttt = cemES.viewEntityJbxx(sff.getStid());
		//委托贷款
		String cdkzh = request.getParameter("cdkzh");
		if(!"".equals(cdkzh)&&cdkzh!=null){
			//根据实体内资产分类进行判断
			if("7".equals(sff.getStnzcfl())){
	    		if( sff.getJtdbh() == null || sff.getJtdbh().length() == 0){
    	    		String firstBranch = sff.getCdkzh().substring(0,3);
        			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
        			String code2 = code.replace("#1#", firstBranch);
        			sff.setJtdbh(code2);
    			}
//	    		//土地名称
//    	    	zc.setCzcmc(sff.getJtdmc());
//    	    	//实际占有人
//    	    	zc.setCsjzyr(sff.getJsjzyr());
//    	    	//土地编号
//    	    	zc.setCzcbh(sff.getJtdbh());
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
    	    	//资产类型
    	    	zc.setCzclx("土地");
    		}else if("8".equals(sff.getStnzcfl())){
    			if(sff.getKfwbh() == null || sff.getKfwbh().length() == 0){
    				String firstBranch = sff.getCdkzh().substring(0,3);
        			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
        			String code2 = code.replace("#1#", firstBranch);
        			sff.setKfwbh(code2);
    			}
    	    	zc.setCzclx("房屋");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
    		}else if("9".equals(sff.getStnzcfl())){
    			if(sff.getMsbbh() == null || sff.getMsbbh().length() == 0){
    				String firstBranch = sff.getCdkzh().substring(0,3);
        			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
        			String code2 = code.replace("#1#", firstBranch);
        			sff.setMsbbh(code2);
    			}
    	    	zc.setCzclx("机械设备");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
    		}else if("10".equals(sff.getStnzcfl())){
    			if(sff.getLjtgjbh() == null || sff.getLjtgjbh().length() == 0){
    				String firstBranch = sff.getCdkzh().substring(0,3);
        			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
        			String code2 = code.replace("#1#", firstBranch);
        			sff.setLjtgjbh(code2);
    			}
    	    	zc.setCzclx("交通工具");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
    		}else if("12".equals(sff.getStnzcfl())){
    			if(sff.getPqtzcbh() == null || sff.getPqtzcbh().length() == 0){
    				String firstBranch = sff.getCdkzh().substring(0,3);
        			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
        			String code2 = code.replace("#1#",firstBranch);
        			sff.setPqtzcbh(code2);
    			}
    	    	zc.setCzclx("其他资产");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
    		}
			zc.setDkzh(sff.getCdkzh());
			zc.setStfsxxid(sff.getId());
		}else{
			//根据实体内资产分类进行判断
			if("7".equals(sff.getStnzcfl())){
				zc.setSttzclx("土地");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
			}else if("8".equals(sff.getStnzcfl())){
				zc.setSttzclx("房屋");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());				
			}else if("9".equals(sff.getStnzcfl())){
				zc.setSttzclx("机械设备");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());	
			}else if("10".equals(sff.getStnzcfl())){
				//设置 实体内资产类型
				zc.setSttzclx("交通工具");
	    		//设置 实体内资产名称
	    		zc.setStzcmc(sff.getLcph());
	    		//设置 实体内资产编号
	    		zc.setStzcbh(sff.getLjtgjbh());
	    		//设置 资产实际占有人
	    		zc.setStsjzyr(sff.getLsjzyr());	 
	    		//设置 交通工具存放何处
	    		zc.setStcfwz(sff.getLjtgjcfwz());
			}else if("12".equals(sff.getStnzcfl())){
				zc.setCCzfs(sff.getPcCzfs());
				zc.setStzcmc(sff.getPqtzcmc());
				zc.setStzcbh(sff.getPqtzcbh());
				zc.setSttzclx("其他资产");
	    		zc.setStid(sff.getStid());
	    		zc.setZcid(sff.getId());
				zc.setStsjzyr(sff.getPqtzcsjzyr());
				zc.setStcfwz(sff.getPqtzccfwz());
			}
			//设置 实体附属信息ID
			zc.setStfsxxid(sff.getId());
			//设置 实体ID
	    	zc.setStid(sff.getStid());
	    	//设置 实体内资产名称
	    	zc.setStmc(sttt.getStzwmc());
	    	//设置 实体资产类别
    		zc.setStzclb(sttt.getStlx());
		}
     	zc.setSfbc("1");
	    if(zc.getId() == null || "".equals(zc.getId())){
	    	cemES.saveEntityZcPgXxLog(null, zc, "新增");
			cemES.saveZcPgXx(zc);   //插入一条记录
		}else{
			//记录实体日志基本信息
			ZcPgXx old = cemES.getZcPgXx(zc.getId());
			cemES.saveEntityZcPgXxLog(old, zc, "修改");
			cemES.updateZcPgXx(zc);  //更新
		}
    	return null;
    }
    
    public String newZcPgXx(){
    	//实体附属信息表id
    	String sfid = request.getParameter("sfid");
    	request.setAttribute("sfid", sfid);
    	//如果新增，zcid为空
    	String zcid = request.getParameter("zcid");
    	
    	String look = request.getParameter("look");
    	request.setAttribute("look", look);
    	String rework = request.getParameter("rework");
    	request.setAttribute("rework", rework);
    	
    	String cdkzh = request.getParameter("cdkzh");
    	request.setAttribute("cdkzh", cdkzh);
		if(zcid != null){
			zc = cemES.getZcPgXx(zcid);
		}
    	return "newZcPgXx";
    } 
    
    
    /**
     * 删除评估信息
     * @return
     */
    public String deleteZcPgXx(){
    	if(ZcPgXxIds != null){
			if(ZcPgXxIds.startsWith(",")){
				ZcPgXxIds = ZcPgXxIds.substring(1);
			}
        	String[] ids = ZcPgXxIds.split(",");
        	cemES.deleteZcPgXx(ids);
        	for (int i = 0; i < ids.length; i++){
        		ZcPgXx zcPgXx_old = cemES.getZcPgXx(ids[i]);
        		cemES.saveEntityZcPgXxLog(zcPgXx_old, null, "删除");
        	}
        	
    	}
    	response.setCharacterEncoding("UTF-8");
    	try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
    	return null;
    }
    
    
    
    /**
     * 进入咨询类附属信息新增/修改页面
     * @return
     */
    public String viewEntity(){
    	String fslx = request.getParameter("fslx");
    	String stid = request.getParameter("stid");
    	String pop = request.getParameter("pop");
    	String loansId = request.getParameter("loansId");
    	request.setAttribute("stid", stid);
		sf = new StFsxx();
		sf.setLeixing(fslx);
		sf.setStnzcfl(pop);
		sf.setStid(stid);
		sf.setCdkzh(loansId);
		List<StFsxx> list = new ArrayList();
		List list1 = new ArrayList();
		if(StringUtils.isNotEmpty(sf.getStnzcfl())&& ("".equals(loansId) || loansId == null)){
			list = cemES.viewEntityFsxxPop(stid, sf.getLeixing(), sf.getStnzcfl());
			StFsxx sf1=null;
			for(StFsxx sf :list){
				sf1 = sf.clone(sf);
				List<Code> bbflList= codeService.findAllByCodeType("REPORT_FORM_CLASSIFY");
	    		List<Code> bblxList = codeService.findAllByCodeType("REPORT_FORM_TYPE");
	    		List<Code> sjlxList = codeService.findAllByCodeType("EVENT_TYPE");
        		if(list != null){
        			for(Code bbfl : bbflList){
    					if(bbfl.getCodeKey().equals(sf1.getDcBbfl())){
    						sf1.setDcBbfl(bbfl.getCodeValue());
    					}
    				}
        			for(Code bblx : bblxList){
        				if(bblx.getCodeKey().equals(sf1.getDcBblx())){
        					sf1.setDcBblx(bblx.getCodeValue());
        				}
        			}
        			for(Code sjlx : sjlxList){
        				if(sjlx.getCodeKey().equals(sf1.getGcSjlx())){
        					sf1.setGcSjlx(sjlx.getCodeValue());
        				}
        			}
        		}
        		list1.add(sf1);
			}
		}else if(loansId!=null&&!"".equals(loansId)){    //chenyuxiao add
			list1 = cemES.viewEntityFsxxLoans(sf.getCdkzh(), sf.getLeixing(), sf.getStnzcfl());
		}
		else{
			 list = cemES.viewEntityFsxx(stid, sf.getLeixing());
			 StFsxx sf1 =null;
			 for(StFsxx sf :list){
				sf1 = sf.clone(sf);
				List<Code> bbflList= codeService.findAllByCodeType("REPORT_FORM_CLASSIFY");
	    		List<Code> bblxList = codeService.findAllByCodeType("REPORT_FORM_TYPE");
	    		List<Code> sjlxList = codeService.findAllByCodeType("EVENT_TYPE");
	    		List<Code> sjczfsList = codeService.findAllByCodeType("CONTRIBUTION_METHOD");//出资方式
	    		List<Code> sjczqkList = codeService.findAllByCodeType("CONTRIBUTION_DESC");//出资情况
//	    			sf.setDcBbfl(codeService.findCodeValueByCodeTypeAndCodeKey("REPORT_FORM_CLASSIFY", sf.getDcBbfl()));
//	    			sf.setDcBblx(codeService.findCodeValueByCodeTypeAndCodeKey("REPORT_FORM_TYPE", sf.getDcBblx()));
        		if(list != null){
        			for(Code bbfl : bbflList){
    					if(bbfl.getCodeKey().equals(sf1.getDcBbfl())){
    						sf1.setDcBbfl(bbfl.getCodeValue());
    					}
    				}
        			for(Code bblx : bblxList){
        				if(bblx.getCodeKey().equals(sf1.getDcBblx())){
        					sf1.setDcBblx(bblx.getCodeValue());
        				}
        			}
        			for(Code sjlx : sjlxList){
        				if(sjlx.getCodeKey().equals(sf1.getGcSjlx())){
        					sf1.setGcSjlx(sjlx.getCodeValue());
        				}
        			}
        			for(Code sjczfs : sjczfsList){
        				if(sjczfs.getCodeKey().equals(sf1.getQcCzfs())){
        					sf1.setQcCzfs(sjczfs.getCodeValue());
        				}
        			}
        			for(Code sjczqk : sjczqkList){
        				if(sjczqk.getCodeKey().equals(sf1.getQcCzqk())){
        					sf1.setQcCzqk(sjczqk.getCodeValue());
        				}
        			}
        		}
        		list1.add(sf1);
			}
		}
//		CommonBO[] cmb = new CommonBO[list.size()];
//		list.toArray(cmb);
		String josnStr = BodyListToJSON.getJSON(list1, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return null;
    }

	public Paginator getPaginator() {
		return paginator;
	}

	/**
	 * 咨询类jQuery 新增/修改弹出页面
	 * @return
	 */
	public String newPopList(){
		String fslx = request.getParameter("fslx");
		String stid = request.getParameter("stid");
		request.setAttribute("stid", stid);
		String loansId = request.getParameter("loansId");
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String zcid = request.getParameter("zcid");
		request.setAttribute("zcid", zcid);
		String newAdd = request.getParameter("newAdd");
		String pop = request.getParameter("pop");
		
		String zcczpg = request.getParameter("zcczpg");
		request.setAttribute("newAdd", newAdd);
		request.setAttribute("zcczpg", zcczpg);
		String opTypeFsxx = "";
		if("1".equals(newAdd)){
			sf= new StFsxx();
			sf.setCdkzh(loansId);
			sf.setStid(stid);
			sf.setLeixing(fslx);
			sf.setStnzcfl(pop);
			if("1".equals(pop) || "2".equals(pop)){
				sf.setFcRylb(pop);
			}
			cemES.newEntityFsxx(sf);
			opTypeFsxx = "newFsxx";
		}else{
			opTypeFsxx = "modifyFsxx";
			sf = cemES.viewFsxx(id);
		}
		request.setAttribute("opTypeFsxx", opTypeFsxx);
		 look = request.getParameter("look");
//		System.out.println("look" + look);
		request.setAttribute("look", look);
		if("1".equals(pop)){			 //实体人员信息
			if(!"1".equals(newAdd)){
				String zyzgqk = sf.getFzyzgqkString(sf.getFzyzgqk(),look);
				request.setAttribute("zyzgqk", zyzgqk);
			}
			return "personList";
		}else if("2".equals(pop)){         //高管人员信息
			return "exectivesList";
		}else if("3".equals(pop)){       //实体股权结构
			return "shareholderList";			
		}else if("4".equals(pop)){         //实体大事记
			return "affairList";			
		}else if("5".equals(pop)){        //实体财务报表信息
			String s = this.getDateFormat().format(new Date());
			sf.setDbbscrq(s);
			return "reportList";			
		}else if("6".equals(pop)){        //实体资产--金额
			return "cashList";			
		}else if("7".equals(pop)){        //实体资产--土地

			return "landList";			
		}else if("8".equals(pop)){        //实体资产--房屋
			
			return "houseList";			
		}else if("9".equals(pop)){        //实体资产--机器设备
			
			return "machineList";			
		}else if("10".equals(pop)){        //实体资产--交通运输工具

			return "trafficList";			
		}else if("11".equals(pop)){        //实体资产--对外投资

			return "investList";			
		}else if("12".equals(pop)){        //实体资产--其它资产
			
			return "otherList";			
		}
		return null;
	}
	
	public SimpleDateFormat getDateFormat(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf;
	}
	/**
	 * 非咨询类jQuery新增弹出页面
	 * @return
	 */
	public String newNonList(){
		String fslx = request.getParameter("fslx");
		String stid = request.getParameter("stid");
		request.setAttribute("stid", stid);
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		String newAdd = request.getParameter("newAdd");
		request.setAttribute("newAdd", newAdd);
		String pop = request.getParameter("pop");
		String zcczpg = request.getParameter("zcczpg");
		request.setAttribute("zcczpg", zcczpg);
		if("1".equals(newAdd)){
			sf= new StFsxx();
			sf.setStid(stid);
			sf.setLeixing(fslx);
			sf.setStnzcfl(pop);
			cemES.newEntityFsxx(sf);
		}else{
			sf = cemES.viewFsxx(id);
		}
		String look = request.getParameter("look");
		request.setAttribute("look", look);
		if("13".equals(pop)){			 //项目企业出资情况
			return "nonProjectList";
		}else if("14".equals(pop)){       //知情人员
			return "nonKnowList";
		}else if("15".equals(pop)){       //安置人员
			return "nonPutList";			
		}else if("16".equals(pop)){       //文件及公章存放情况
			return "nonkeepList";			
		}else if("6".equals(pop)){        //实体资产--现金
			
			return "nonCashList";			
		}else if("7".equals(pop)){        //实体资产--土地
			return "nonLandList";			
		}else if("8".equals(pop)){        //实体资产--房屋
			
			return "nonHouseList";			
		}else if("9".equals(pop)){        //实体资产--机器设备
			
			return "nonMachineList";			
		}else if("10".equals(pop)){        //实体资产--交通运输工具
			
			return "nonTrafficList";			
		}else if("11".equals(pop)){        //实体资产--对外投资
			
			return "nonInvestList";			
		}else if("12".equals(pop)){        //实体资产--其它资产
			
			return "nonOtherList";			
		}else if("17".equals(pop)){        //债务债权--主要债权
			return "nonCreditorList";			
		}else if("18".equals(pop)){        //债务债权--主要债务
			return "nonDebtList";			
		}else if("19".equals(pop)){        //实体资产--税款缴纳
			return "nonTaxList";			
		}
		return null;
	}
	
	
	/**
	 * 删除附属信息
	 * @return
	 */
	public String deleList(){
		if(fsxxIds != null){
			if(fsxxIds.startsWith(",")){
				fsxxIds = fsxxIds.substring(1);
			}
			String [] ids = fsxxIds.split(",");
			cemES.deleteFsxx(ids);
			for (int i = 0; i < ids.length; i++){
				StFsxx sf = cemES.viewFsxx(ids[i]);
				cemES.saveEntityFsxxLog(sf, null, "删除");
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除基本信息
	 * @return
	 */
	public String deleteStJbxx(){
		if(fsxxIds != null){
			if(fsxxIds.startsWith(",")){
				fsxxIds = fsxxIds.substring(1);
			}
			String[] ids = fsxxIds.split(",");
			cemES.deleteStJbxx(ids);
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 删除债权(债务)信息
	 * @return
	 */
	public String claimsdeleList(){
		String clsimsIds =request.getParameter("clsimsIds");
		String debtInfo = request.getParameter("debtInfo"); 
		if(clsimsIds != null){
			String[] ids = clsimsIds.split(",");
			cemES.claimsdeleList(ids);
			for (int i = 0; i < ids.length; i++){
				DebtInfo debtInfo_old = cemES.getDebtInfo(ids[i]);
				cemES.saveDebtClaimsLog(debtInfo_old, null, "删除",debtInfo);
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public String viewFsxx(){
		if(sf!=null){
			sf = cemES.viewFsxx(sf.getId());
		}
		return "newPersonList";
	}
	
	/**
	 * 删除税款缴纳信息
	 * @return
	 */
	public String deleTaxPayment(){
		if(taxPaymentIds != null){
			if(taxPaymentIds.startsWith(",")){
				taxPaymentIds = taxPaymentIds.substring(1);
			}
			String[] ids = taxPaymentIds.split(",");
			cemES.deleTaxPayment(ids);
			for (int i = 0; i < ids.length; i++){
				StSkjnXx old = cemES.getTaxInfo(ids[i]);
				cemES.saveTaxInfoLog(old, null, "删除");
			}
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print("删除成功!");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	//--------------------债权  债务   税务-------------------------

	/**
	 * 查询债权债务列表
	 * @return
	 */
	public String debtList(){
		String look = request.getParameter("look");			//查看参数
		request.setAttribute("look", look);
		String stid = request.getParameter("stid");
		request.setAttribute("stid", stid);
	    String refershSign = request.getParameter("refershSign");
	    //refershSign = 1 债权     refershSign = 2 债务       refershSign = 3  税款
		if("1".equals(refershSign)){												
			List<DebtInfo> list = null;
			list = cemES.getDebtList(stid);
			CommonBO[] commonBo = new CommonBO[list.size()];
			list.toArray(commonBo);
			String jsonStr = BodyListToJSON.getJSON(commonBo, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(jsonStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else if("2".equals(refershSign)){
			List<DebtInfo> list = null;
			list = cemES.getDebtInfoList(stid);
			CommonBO[] commonBo = new CommonBO[list.size()];
			list.toArray(commonBo);
			String jsonStr = BodyListToJSON.getJSON(commonBo, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(jsonStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else if("3".equals(refershSign)){
			List<StSkjnXx> list = null;
			list = cemES.getTaxList(stid);
			CommonBO[] commonBo = new CommonBO[list.size()];
			for(StSkjnXx sk: list){
        		if("1".equals(sk.getSfasjn())){
        			sk.setSfasjn("是");
    			}else if("0".equals(sk.getSfasjn())) {
    				sk.setSfasjn("否");
    			}
        		if("1".equals(sk.getSwjgsfkjm())){
        			sk.setSwjgsfkjm("是");
    			}else if("0".equals(sk.getSwjgsfkjm())){
    				sk.setSwjgsfkjm("否");
    			}
			}
			list.toArray(commonBo);
			String jsonStr = BodyListToJSON.getJSON(commonBo, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(jsonStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		return "debtList";
	}
	
	/**
	 * 新增债权债务
	 * @return
	 */
	public String newDebtInfo(){
		String newAdd = request.getParameter("newAdd");		//新增参数
		String stid = request.getParameter("stid");			
	    request.setAttribute("stid", stid);					//实体id
		request.setAttribute("newAdd", newAdd);
		String look = request.getParameter("look");			//查看参数
		request.setAttribute("look", look);
		String rework = request.getParameter("rework");      //修改参数
		String id = request.getParameter("id");
		String debtInfo = request.getParameter("debtInfo");      //新增或修改债务  标志
		di = new DebtInfo();
		if("1".equals(look) || "1".equals(rework)){
			di = cemES.getDebtInfo(id);
		}
		if("1".equals(debtInfo)){
			return "newDebtInfo";
		}else {
			return "newClaimsInfo";
		}
	}
	
	/**
	 * 保存债权债务
	 * @return
	 */
	public String saveDebtInfo(){
		String stid = request.getParameter("stid");
		String newAdd = request.getParameter("newAdd");
		String rework = request.getParameter("rework");
		String debtInfo = request.getParameter("debtInfo"); 
		DebtInfo di2 = cemES.getDebtInfo(di.getId());
		//di2.setSfbc("1");
		di.setSfbc("1");
		//新增或修改债务  标志
		if("1".equals(debtInfo)){
			//di2.setZwrid(stid);
			di.setZwrid(stid);
		}else {
			//di2.setZwrid(stid);
			di.setZqrid(stid);
		}
		
		if("1".equals(newAdd)){
			//==========新增日志
			cemES.saveDebtClaimsLog(null, di, "新增",debtInfo);
			//==========新增日志
			cemES.newDebtInfo(di);
		}else{
			//==========修改日志
			DebtInfo diy = creditorService.getDebtInfo(di.getId());
			cemES.saveDebtClaimsLog(diy, di, "修改",debtInfo);
			//==========修改日志
//			DebtInfo di2 = new DebtInfo();
			try {
				BeanUtils.copyProperties(di2, di);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cemES.saveDebtInfo(di2);
		}
		return null;
	}
	
	/**
	 * 新增税款
	 * @return
	 */
	public String newTaxInfo(){
		String newAdd = request.getParameter("newAdd");		//新增参数
		String stid = request.getParameter("stid");			
	    request.setAttribute("stid", stid);					//实体id
		request.setAttribute("newAdd", newAdd);
		String look = request.getParameter("look");			//查看参数
		request.setAttribute("look", look);
		String rework = request.getParameter("rework");      //修改参数
		String id = request.getParameter("id");

		sk = new StSkjnXx();
		if("1".equals(look) || "1".equals(rework)){
			sk = cemES.getTaxInfo(id);
		}
		return "newTaxInfo";
	}
	
	
	/**
	 * 保存税款
	 * @return
	 */
	public String saveTaxInfo(){
		String stid = request.getParameter("stid");
		String newAdd = request.getParameter("newAdd");
		String rework = request.getParameter("rework");
		StSkjnXx sk2 = cemES.getTaxInfo(sk.getId());
			sk.setStId(stid);
			sk.setSfbc("1");
		if("1".equals(newAdd)){
			cemES.saveTaxInfoLog(null, sk, "新增");
			cemES.newTaxInfo(sk);
		}else{
			StSkjnXx old = cemES.getTaxInfo(sk.getId());
			cemES.saveTaxInfoLog(old, sk, "修改");
			try {
				BeanUtils.copyProperties(sk2, sk);
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cemES.saveTaxInfo(sk2);
		}
		return null;
	}
	
//--------------------诉讼---------------------------------
	
	
	public String getLitigationList(){
		String look = request.getParameter("look");			//查看标志
		request.setAttribute("look", look);
		String stid = request.getParameter("stid");		
		request.setAttribute("stid", stid);
		String litigationType = request.getParameter("litigationType");					//诉讼类型
		if(StringUtils.isNotEmpty(litigationType)){
			List<SsBaseinfo> list = cemES.getLitigationList(stid, litigationType);
			CommonBO[] commonBO = new CommonBO[list.size()];
			list.toArray(commonBO);
			String jsonStr = BodyListToJSON.getJSON(commonBO, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
			response.setCharacterEncoding("UTF-8");
			try {
				response.getWriter().print(jsonStr);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			return null;
		}
		return "getLitigationList";
	}
	
	//--------------------抵债资产---------------------------------
	
	public void diZaiZhiChanSave(){
		if("6".equals(sf.getStnzcfl())){
			if( sf.getHxjbh() == null || sf.getHxjbh().length() == 0){
	    		String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setHxjbh(code2);
			}
		}else if("7".equals(sf.getStnzcfl())){
    		if( sf.getJtdbh() == null || sf.getJtdbh().length() == 0){
	    		String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setJtdbh(code2);
			}
		}else if("8".equals(sf.getStnzcfl())){
			if(sf.getKfwbh() == null || sf.getKfwbh().length() == 0){
				String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setKfwbh(code2);
			}
		}else if("9".equals(sf.getStnzcfl())){
			if(sf.getMsbbh() == null || sf.getMsbbh().length() == 0){
				String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setMsbbh(code2);
			}
		}else if("10".equals(sf.getStnzcfl())){
			if(sf.getLjtgjbh() == null || sf.getLjtgjbh().length() == 0){
				String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setLjtgjbh(code2);
			}
		}else if("11".equals(sf.getStnzcfl())){
			if(sf.getNdwtzbh() == null || sf.getNdwtzbh().length() == 0){
				String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#", firstBranch);
    			sf.setNdwtzbh(code2);
			}
		}else if("12".equals(sf.getStnzcfl())){
			if(sf.getPqtzcbh() == null || sf.getPqtzcbh().length() == 0){
				String firstBranch = sf.getCdkzh().substring(0,3);
    			String code = codeGenerator.generateCurrentCode("dzzcbh", "", "");
    			String code2 = code.replace("#1#",firstBranch);
    			sf.setPqtzcbh(code2);
			}
		}
        response.setCharacterEncoding("UTF-8");
    	try {
    		if("7".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"jtdbh\":\"" + sf.getJtdbh() + "\"}]}");
    		}else if("7".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"jtdbh\":\"" + sf.getJtdbh() + "\"}]}");
    		}else if("8".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"kfwbh\":\"" + sf.getKfwbh() + "\"}]}");
    		}else if("9".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"msbbh\":\"" + sf.getMsbbh() + "\"}]}");
    		}else if("10".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"ljtgjbh\":\"" + sf.getLjtgjbh() + "\"}]}");
    		}else if("11".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"ljtgjbh\":\"" + sf.getLjtgjbh() + "\"}]}");
    		}else if("12".equals(sf.getStnzcfl())){
    			response.getWriter().write("{\"result\":[{\"pqtzcbh\":\"" + sf.getPqtzcbh() + "\"}]}");
    		}
			
		} catch (Exception e) {
			try {
				response.getWriter().print("error");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		sf.setSfbc("1");
    	cemES.saveEntity(sf);
	}
	
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList(){
		String stId = request.getParameter("stId");
		String jsonStr = this.cemES.findCzXxList(stId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 查询处置信息列表，add by lantianbo 2011-1-7
	 * @return
	 */
	public String findCzXxList2(){
		String stId = request.getParameter("stId");
		String jsonStr = this.cemES.findCzXxList2(stId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据选择的项目得到项目下的资产列表
	 * @return
	 */
	public String findAssetByCzXxList(){
		String stId = request.getParameter("stId");
		String cldId = request.getParameter("cldId");
		String xmId = request.getParameter("xmId");
		String jsonStr = this.cemES.findAssetByCzXxList(stId,cldId,xmId);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jsonStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public EntityQueryVO getEntityvo() {
		return entityvo;
	}

	public void setEntityvo(EntityQueryVO entityvo) {
		this.entityvo = entityvo;
	}

	public StJbxx getSt() {
		return st;
	}

	public void setSt(StJbxx st) {
		this.st = st;
	}

	public ICEMEntityService getCemES() {
		return cemES;
	}

	public void setCemES(ICEMEntityService cemES) {
		this.cemES = cemES;
	}

	public StFsxx getSf() {
		return sf;
	}

	public void setSf(StFsxx sf) {
		this.sf = sf;
	}

	public String getFsxxIds() {
		return fsxxIds;
	}

	public void setFsxxIds(String fsxxIds) {
		this.fsxxIds = fsxxIds;
	}

	public String getPop() {
		return pop;
	}

	public void setPop(String pop) {
		this.pop = pop;
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


	public DebtInfo getDi() {
		return di;
	}


	public void setDi(DebtInfo di) {
		this.di = di;
	}


	public StSkjnXx getSk() {
		return sk;
	}


	public void setSk(StSkjnXx sk) {
		this.sk = sk;
	}


	public SsBaseinfo getSbInfo() {
		return sbInfo;
	}


	public void setSbInfo(SsBaseinfo sbInfo) {
		this.sbInfo = sbInfo;
	}


	public ZcPgXx getZc() {
		return zc;
	}


	public void setZc(ZcPgXx zc) {
		this.zc = zc;
	}


	public String getZcPgXxIds() {
		return ZcPgXxIds;
	}


	public void setZcPgXxIds(String zcPgXxIds) {
		ZcPgXxIds = zcPgXxIds;
	}
	
	private PTEndUCC endUCC;
	
	public String queryString() {
		String josnStr = null;
		IUser user = UserThreadLocal.get(); 
		if (user == null) {
			throw new RuntimeException("用户无效.");
		}
		String title=request.getParameter("title");
		String strSTID=request.getParameter("id");
		List<PTEnd> list = findMyPTEndList_page(strSTID,paginator,title);
		CommonBO[] boArray = new CommonBO[list.size()];
		list.toArray(boArray);
		josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), list.size());
		josnStr = generateUrl(josnStr);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<PTEnd> findMyPTEndList_page(String strSTID,
			Paginator paginator, String  title) {
		return cemES.queryEndList_page(strSTID,paginator,title);
	}
	
	 public  String generateUrl(String jsonString){ 
			JSONObject data = JSONObject.fromObject(jsonString);
	       if(data != null){
	    		JSONArray rows = data.getJSONArray("rows");
	            for (Object object : rows.toArray()) {
	                try {
	                    String userId=PropertyUtils.getProperty(object,"userId").toString();
	                    String userName= pTTodoBS.getUserNameById(new Long(userId));
	                    PropertyUtils.setProperty(object,"userId", userName);
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
		@Autowired
		PTTodoBS pTTodoBS;

		public PTTodoBS getPTTodoBS() {
			return pTTodoBS;
		}

		public void setPTTodoBS(PTTodoBS todoBS) {
			pTTodoBS = todoBS;
		}


		public PTEndUCC getEndUCC() {
			return endUCC;
		}


		public void setEndUCC(PTEndUCC endUCC) {
			this.endUCC = endUCC;
		}


		public String getTaxPaymentIds() {
			return taxPaymentIds;
		}


		public void setTaxPaymentIds(String taxPaymentIds) {
			this.taxPaymentIds = taxPaymentIds;
		}


		public String exportexcel() throws Exception {
	    	try {
//		        String zixunType = request.getParameter("zixunType");
//		        request.getSession().setAttribute("stlx", zixunType);
		        
		        //处理单id  Added by liubeibei. 2010-12-3
//		        String cldId = this.request.getParameter("cldId");
//		        String ctlButton = this.request.getParameter("ctlButton");
//		        this.request.setAttribute("ctlButton", ctlButton);
//		        if(cldId != null && cldId.trim().length() > 0){
//		        	 session.put("entityCldId", cldId);
//		        }
		        //Added by liubeibei.
//		        request.setAttribute("zixunType",zixunType);
//				String zcczpg = request.getParameter("zcczpg");
//				request.setAttribute("zcczpg", zcczpg);
//				
//		        String debtSign = request.getParameter("debtSign");
//		        request.setAttribute("debtSign", debtSign);
//		        String stlx = zixunType;
		        if(entityvo != null){
		    		if(cemES==null){
		    			cemES=(ICEMEntityService)SpringContextHelper.getBean(CEMEntityService.class);
		    			codeService=(CodeServiceImpl)SpringContextHelper.getBean(CodeServiceImpl.class);
		    		}
		    		List<QueryResultVO> list=new ArrayList<QueryResultVO>();
		            List<StJbxx> listExcell = null;
		            listExcell = cemES.listEntities(paginator,entityvo,"1");
		            List<Code> provienceList = codeService.findAllByCodeType("PROVIENCE");
		            List<Code> entityTradeList = codeService.findAllByCodeType("ENTITY_TRADE");
		            List<Code> entityStatus = codeService.findAllByCodeType("ENTITY_STATUS");
		            List<Code> entityDisposition = codeService.findAllByCodeType("ENTITY_DISPOSE_METHOD");
		            for(StJbxx st : listExcell){
		    			if(!"1".equals(st.getStlx())){
		    				for(Code en : entityTradeList){
		    					if(en.getCodeKey().equals(st.getCHangye()))st.setCHangye(en.getCodeValue());
		    				}
		    			}
		    			for(Code pn : provienceList){
		    				if(pn.getCodeKey().equals(st.getCShengfen()))st.setCShengfen(pn.getCodeValue());
		    			}
		    			for(Code status : entityStatus){
		    				if(status.getCodeKey().equals(st.getCStzt()))st.setCStzt(status.getCodeValue());
		    			}
		    			for(Code disposition : entityDisposition){
		    				if(disposition.getCodeKey().equals(st.getCCzfs())){
		    					st.setCCzfs(disposition.getCodeValue());
		    				}
		    			}
		    			//st.setCShengfen(codeService.findCodeValueByCodeTypeAndCodeKey("PROVIENCE", st.getCShengfen()));
		        		if("1".equals(st.getCGlbm())){
		    				st.setCGlbm("委托代理业务部");
		    			}else if("2".equals(st.getCGlbm())) {
		    				st.setCGlbm("资产管理处置部");
		    			}
		        		if("0".equals(st.getJyfl())){
		    				st.setJyfl("持续经营类");
		    			}else if("1".equals(st.getJyfl())){
		    				st.setJyfl("处置类");
		    			}
		        		
		    		}
		            CommonBO[] boArray = new CommonBO[listExcell.size()];
		            listExcell.toArray(boArray);
		            String josnStr = BodyListToJSON.getJSON(boArray, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//	 				response.setCharacterEncoding("UTF-8");
//					response.getWriter().print(josnStr);
					return josnStr;
	        	}
	    	} catch (Exception e) {
				e.printStackTrace();
			}

	        return "weihuQueryInit";
		}


		public void setExcelVO(CommonBO excelVO) {
			// TODO Auto-generated method stub
			this.entityvo = (EntityQueryVO)excelVO;
		}
}
