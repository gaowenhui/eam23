package com.tansun.eam2.zyzc.action;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.common.model.orm.bo.ZyPdxx;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.web.servlet.IExport;
import com.tansun.eam2.wtdk.ucc.IFuncQueryUCC;
import com.tansun.eam2.wtdk.ucc.impl.FuncQueryUCCImpl;
import com.tansun.eam2.zyzc.ucc.ToCheckUCC;
import com.tansun.eam2.zyzc.ucc.impl.ToCheckUCCimpl;
import com.tansun.eam2.zyzc.vo.PdxxVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

//@Controller
//@Scope("prototype")
public class BatchQueryAction extends CommonAction implements IExport {
	private PdxxVO pdxxVo; 
	private ZyPdxx pdxx; 
	private Paginator paginator;
	@Autowired
	ToCheckUCC toCheckUCCimpl;
	
	public String init(){
		List<ZyPdxx> PdxxList = toCheckUCCimpl.queryAllPdxx();
		ZyPdxx pdxxForMap;
		Map<String,String> pdpcMap = new TreeMap<String,String>();
		for (Iterator<ZyPdxx> i = PdxxList.iterator(); i.hasNext();) {
			pdxxForMap = i.next();
			if(pdxxForMap.getPdpc() != null){
				pdpcMap.put(pdxxForMap.getPdpc(), pdxxForMap.getPdpc());
			}
		}
		request.setAttribute("pdpcMap", pdpcMap);
		return "initQueryPage";
	}
	
	/**
	 * 批次查询页面使用
	 * @return
	 * @throws IOException
	 */
	public String query() throws IOException{
		if(pdxxVo != null){
			String returnStr = toCheckUCCimpl.query4PanYingPanKui(pdxxVo, paginator);
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(returnStr);
		}
		return null;
	}
	
	public Paginator getPaginator() {
		return paginator;
	}

	public void setPaginator(Paginator paginator) {
		this.paginator = paginator;
	}
	
	public ZyPdxx getPdxx() {
		return pdxx;
	}
	public void setPdxx(ZyPdxx pdxx) {
		this.pdxx = pdxx;
	}

	public PdxxVO getPdxxVo() {
		return pdxxVo;
	}

	public void setPdxxVo(PdxxVO pdxxVo) {
		this.pdxxVo = pdxxVo;
	}

	/**
	 * excel导出
	 */
	public String exportexcel() throws Exception {
		if(toCheckUCCimpl==null){
			toCheckUCCimpl=(ToCheckUCC)SpringContextHelper.getBean(ToCheckUCCimpl.class);
		}
		String returnStr = toCheckUCCimpl.query4PanYingPanKui(pdxxVo, paginator);
		return returnStr;
	}

	public void setExcelVO(CommonBO excelVO) {
		this.pdxxVo = (PdxxVO)excelVO;
	}
}
