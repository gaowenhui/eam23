package com.tansun.eam2.stgl.actions;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.codeService.ICodeService;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.stgl.ucc.ICEMEntityQueryUcc;
import com.tansun.eam2.stgl.ucc.impl.CEMEntityQueryUccImpl;
import com.tansun.eam2.stgl.vo.AllAssetQueryResultVO;
import com.tansun.eam2.stgl.vo.AssetQueryVO;
import com.tansun.eam2.stgl.vo.QueryResultVO;
import com.tansun.eam2.stgl.vo.ZCXXQueryVO;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * @Title: CEMEntityMaintainAction.java 
 * @Package com.tansun.eam2.stgl.actions 
 * @Description: 资产信息查询
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Nov 16, 2010 3:23:03 PM 
 * @version V1.0
 */
public class NCEMAssetQueryAction extends CommonAction implements IExport{
    
    /**
     * 资产信息查询
     * @return
     */
	private AssetQueryVO  assetQueryVO;
	private QueryResultVO queryResultVO;
	public Paginator paginator ;
	private List<QueryResultVO> resultList=new ArrayList<QueryResultVO>();
	private AllAssetQueryResultVO  allAssetQueryResultVO;
	private ZCXXQueryVO zCXXQueryVO;
	public String stmc;
	
	@Autowired
	ICEMEntityQueryUcc cEMEntityQueryUccImpl;
	@Autowired 
	ICodeService codeServiceImpl;		
	/**
	 *根据返回结果，进入资产信息汇总查询
	 * @return
	 * 
	 */
	public String listAssets(){
        
        return "start";
    }

	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		String bodyJSON = null;
//		resultList = cEMEntityQueryUccImpl.queryAsset(assetQueryVO,paginator);
		if(cEMEntityQueryUccImpl==null){
			cEMEntityQueryUccImpl=(ICEMEntityQueryUcc)SpringContextHelper.getBean(CEMEntityQueryUccImpl.class);
		}
		
		List<QueryResultVO> list=new ArrayList<QueryResultVO>();
		paginator.setPageSize(1000000);
		list = cEMEntityQueryUccImpl.queryAsset(zCXXQueryVO,paginator);
		 bodyJSON = BodyListToJSON.getJSON(list, 1, 1, list.size());
		return bodyJSON;
	}
    /**
     * 资产信息查询
     * @return
     * @throws UnsupportedEncodingException 
     */
    public String viewAsset() throws UnsupportedEncodingException{
    	if(paginator == null){
    		paginator = new Paginator();
    	}
    	resultList = cEMEntityQueryUccImpl.queryAsset(assetQueryVO,paginator);
    	List<AllAssetQueryResultVO> resultListAll=new ArrayList<AllAssetQueryResultVO>();
    	String bodyJSON = BodyListToJSON.getJSON(resultListAll, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
    	if(resultList==null){
    		response.setCharacterEncoding("UTF-8");
    		try {
				response.getWriter().print(bodyJSON);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
    	}
    	List<QueryResultVO> listNew = new ArrayList<QueryResultVO>();
		for(QueryResultVO object:resultList){
			String stnzcfl = object.getStnzcfl();
			if(stnzcfl!=null&&""!=stnzcfl){
				stnzcfl = codeServiceImpl.findCodeValueByCodeTypeAndCodeKey("ENTITY_ASSET_TYPE",stnzcfl );
			}
			object.setStnzcfl(stnzcfl);
			//土地使用权证
			if("1".equals(object.getJtdsyqz())){
				object.setJtdsyqz("有");
			}else if("2".equals(object.getJtdsyqz())){
				object.setJtdsyqz("无");
			}else if("3".equals(object.getJtdsyqz())){
				object.setJtdsyqz("下落不明");
			}
			//土地是否抵押
			if("0".equals(object.getJtdsfdy())){
				object.setJtdsfdy("否");
			}else if("1".equals(object.getJtdsfdy())){
				object.setJtdsfdy("是");
			}
			//房屋使用权证
			if("1".equals(object.getKywfwsyqz())){
				object.setKywfwsyqz("有");
			}else if("2".equals(object.getKywfwsyqz())){
				object.setKywfwsyqz("无");
			}else if("3".equals(object.getKywfwsyqz())){
				object.setKywfwsyqz("下落不明");
			}
			//房屋是否抵押
			if("0".equals(object.getKsfdy())){
				object.setKsfdy("否");
			}else if("1".equals(object.getKsfdy())){
				object.setKsfdy("是");
			}
			
			//机器设备是否抵押
			if("0".equals(object.getMsbsfdy())){
				object.setMsbsfdy("否");
			}else if("1".equals(object.getKsfdy())){
				object.setKsfdy("是");
			}
			//交通工具是否抵押
			if("0".equals(object.getLsfdy())){
				object.setLsfdy("否");
			}else if("1".equals(object.getLsfdy())){
				object.setLsfdy("是");
			}
			//其他资产是否抵押
			if("0".equals(object.getPqtzcsfdy())){
				object.setPqtzcsfdy("否");
			}else if("1".equals(object.getPqtzcsfdy())){
				object.setPqtzcsfdy("是");
			}
			
			listNew.add(object);		
		}
    	for(QueryResultVO object : listNew){
    		AllAssetQueryResultVO allAssetQueryResultVO = new AllAssetQueryResultVO();
    		String stnzcfl=object.getStnzcfl();
    		BeanUtils.copyProperties(object, allAssetQueryResultVO);
    		if("现金".equals(stnzcfl)){
    			allAssetQueryResultVO.setZmingcheng(object.getHzhmc());//现金
    			System.out.println("=================="+allAssetQueryResultVO.getZmingcheng());
    		}else if("土地".equals(stnzcfl)){//土地
    			allAssetQueryResultVO.setZmingcheng(object.getJtdmc());
    			allAssetQueryResultVO.setZsjzyr(object.getJsjzyr());
    			allAssetQueryResultVO.setZdiya(object.getJtdsfdy());
    			allAssetQueryResultVO.setZpgz(object.getJtdpgz());	    			
    			allAssetQueryResultVO.setZbxe(object.getJbxe());
    			allAssetQueryResultVO.setZmiaoshu(object.getJtdqdfs());
    		}else if("房屋".equals(stnzcfl)){//房屋
    			allAssetQueryResultVO.setZmingcheng(object.getKfwmc());
    			allAssetQueryResultVO.setZsjzyr(object.getKfwsjzyr());
    			allAssetQueryResultVO.setZdiya(object.getKsfdy());
    			allAssetQueryResultVO.setZpgz(object.getKfwpgz());
    			allAssetQueryResultVO.setZbxe(object.getKfwbxe());
    			allAssetQueryResultVO.setZmiaoshu(object.getKfwms());
    		}else if("机器设备".equals(stnzcfl)){//机器设备
    			allAssetQueryResultVO.setZmingcheng(object.getMsbmc());
    			allAssetQueryResultVO.setZsjzyr(object.getMsbsjzyr());
    			allAssetQueryResultVO.setZcfhc(object.getMsbcfwz());
    			allAssetQueryResultVO.setZquanshu(object.getMsbqs());
    			allAssetQueryResultVO.setZdiya(object.getMsbsfdy());
    			allAssetQueryResultVO.setZpgz(object.getMsbpgz());
    			allAssetQueryResultVO.setZbxe(object.getMsbbxe());
    			allAssetQueryResultVO.setZmiaoshu(object.getMsbms());
    		}else if("交通工具".equals(stnzcfl)){//交通工具
    			allAssetQueryResultVO.setZmingcheng(object.getLcph());
    			allAssetQueryResultVO.setZsjzyr(object.getLsjzyr());
    			allAssetQueryResultVO.setZcfhc(object.getLjtgjcfwz());
    			allAssetQueryResultVO.setZquanshu(object.getLqs());
    			allAssetQueryResultVO.setZdiya(object.getLsfdy());
    			allAssetQueryResultVO.setZpgz(object.getLpgz());
    			allAssetQueryResultVO.setZpgz(object.getLbxe());
    			allAssetQueryResultVO.setZmiaoshu(object.getLjtgjms());
    		}else if("对外投资".equals(stnzcfl)){//对外投资
    			allAssetQueryResultVO.setZmingcheng(object.getNbtqymc());
    		}else if("其他资产".equals(stnzcfl)){//其他资产
    			allAssetQueryResultVO.setZmingcheng(object.getPqtzcmc());
    			allAssetQueryResultVO.setZsjzyr(object.getPqtzcsjzyr());
    			allAssetQueryResultVO.setZcfhc(object.getPqtzccfwz());
    			allAssetQueryResultVO.setZquanshu(object.getPqtzcqs());
    			allAssetQueryResultVO.setZdiya(object.getPqtzcsfdy());
    			allAssetQueryResultVO.setZpgz(object.getPpgz());
    			allAssetQueryResultVO.setZbxe(object.getPbxe());
    			allAssetQueryResultVO.setZmiaoshu(object.getPzcms());  
    			
    		}
    		resultListAll.add(allAssetQueryResultVO);
    	}
    	bodyJSON = BodyListToJSON.getJSON(resultListAll, paginator.getPageCount(), paginator.getCurrentPage(), paginator.getCount());
//    	bodyJSON = BodyListToJSON.getJSON(resultListAll, 1, 1, resultListAll.size());
    	bodyJSON = bodyJSON.substring(0, bodyJSON.length()-1);
    	Double hjine = 0D,pgz = 0D ,zpgz = 0D,zbxe = 0D ,jtdmj = 0D , jtdsyqr = 0D ,jtdpgz = 0D , 
    	jbxe = 0D ,ksfdy = 0D , kfwmj = 0D ,kfwpgz = 0D , kfwbxe = 0D ,msbpgz = 0D,msbbxe = 0D,
    	lpgz = 0D,lbxe = 0D,ppgz = 0D,pbxe = 0D,ntze = 0D;
    	for(AllAssetQueryResultVO entity:resultListAll){
    		hjine += entity.getHjine()==null?0:entity.getHjine();
    		zpgz +=  entity.getZpgz()==null?0:entity.getZpgz() ;
    		zbxe +=  entity.getZbxe()==null?0:entity.getZbxe() ;
    		jtdmj +=  entity.getJtdmj()==null?0:entity.getJtdmj() ;
     		jtdpgz +=  entity.getJtdpgz()==null?0:entity.getJtdpgz() ;
     		jbxe +=  entity.getJbxe()==null?0:entity.getJbxe() ;
     		kfwmj += entity.getKfwmj()==null?0:entity.getKfwmj() ;
     		kfwpgz += entity.getKfwpgz()==null?0:entity.getKfwpgz();
     		kfwbxe += entity.getKfwbxe()==null?0:entity.getKfwbxe();
     		msbpgz += entity.getMsbpgz()==null?0:entity.getMsbpgz();
     		msbbxe += entity.getMsbbxe()==null?0:entity.getMsbbxe();
     		lpgz += entity.getLpgz()==null?0:entity.getLpgz();
     		lbxe += entity.getLbxe()==null?0:entity.getLbxe();
     		ntze += entity.getNtze()==null?0:entity.getNtze();
     		ppgz += entity.getNtze()==null?0:entity.getNtze();
     		pbxe += entity.getPbxe()==null?0:entity.getPbxe();
    	}
    	
		String ss = ",\"userdata\":{" +
		"\"hjine\":\"" + hjine + 
		"\",\"zpgz\":\"" + zpgz + 
		"\",\"zbxe\":\"" + zbxe + 
		"\",\"jtdmj\":\"" + jtdmj + 
		"\",\"jtdpgz\":\"" + jtdpgz + 
		"\",\"jbxe\":\"" + jbxe + 
		"\",\"kfwmj\":\"" + kfwmj + 
		"\",\"kfwpgz\":\"" + kfwpgz + 
		"\",\"kfwbxe\":\"" + kfwbxe + 
		"\",\"msbpgz\":\"" + msbpgz + 
		"\",\"msbbxe\":\"" + msbbxe + 
		"\",\"lpgz\":\"" + lpgz + 
		"\",\"lbxe\":\"" + lbxe + 
		"\",\"ntze\":\"" + ntze + 
		"\",\"ppgz\":\"" + ppgz + 
		"\",\"pbxe\":\"" + pbxe +
		"\",\"stmc\":\"合计:\"}";
    	bodyJSON += ss;
     	bodyJSON += "}";
		response.setCharacterEncoding("UTF-8");
        try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
    }
	
		
	public AssetQueryVO getAssetQueryVO() {
		return assetQueryVO;
	}

	public void setAssetQueryVO(AssetQueryVO assetQueryVO) {
		this.assetQueryVO = assetQueryVO;
	}

	public QueryResultVO getQueryResultVO() {
		return queryResultVO;
	}

	public void setQueryResultVO(QueryResultVO queryResultVO) {
		this.queryResultVO = queryResultVO;
	}

	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}

	public List<QueryResultVO> getResultList() {
		return resultList;
	}

	public void setResultList(List<QueryResultVO> resultList) {
		this.resultList = resultList;
	}

	public ICEMEntityQueryUcc getCEMEntityQueryUccImpl() {
		return cEMEntityQueryUccImpl;
	}

	public void setCEMEntityQueryUccImpl(ICEMEntityQueryUcc entityQueryUccImpl) {
		cEMEntityQueryUccImpl = entityQueryUccImpl;
	}


	public AllAssetQueryResultVO getAllAssetQueryResultVO() {
		return allAssetQueryResultVO;
	}
	public void setAllAssetQueryResultVO(AllAssetQueryResultVO allAssetQueryResultVO) {
		this.allAssetQueryResultVO = allAssetQueryResultVO;
	}

	public void setExcelVO(CommonBO excelVO) {
		// TODO Auto-generated method stub
		this.zCXXQueryVO = (ZCXXQueryVO)excelVO;
	}


}
