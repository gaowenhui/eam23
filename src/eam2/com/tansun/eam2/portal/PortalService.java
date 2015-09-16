package com.tansun.eam2.portal;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import cn.cbhb.rpending.common.vo.RPendingVo;

import com.panding.webservice.IPandingInterfaceWebservice;
import com.panding.webservice.PandInterfaceWebservice;
import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.generalapps.dept.service.IDeptBS;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;

public class PortalService {

    private String prefix;
    
    //点击代办变颜色
    public void setHaveRead(PTTodo todo) {
    	IPandingInterfaceWebservice pand=(IPandingInterfaceWebservice)SpringContextHelper.getBean("pand");
    	String taskId = todo.getTaskId();
    	String userloginid = UserCache.getLoginId(todo.getUserId());
    	if(taskId==null||taskId.equals("")) return;
    	if(userloginid==null||userloginid.equals("")) return;
    	RPendingVo rpv = new RPendingVo();
		rpv.setOptType("2");
		rpv.setPCode(taskId);
		rpv.setPscode("eam");
		rpv.setPstatus("1");
		rpv.setPtype("1");
		rpv.setPPrincipal(userloginid);
		try{
			pand.changePangdingStatus(rpv);
		}catch(Exception e){
			System.err.println("修改门户待办状态为已阅出错。");
		}
	}
    
    //委员提交向portal发送代办
	public  void newTask(PTTodo todo){
		   IPandingInterfaceWebservice pand=(IPandingInterfaceWebservice)SpringContextHelper.getBean("pand");
	       RPendingVo rpv = new RPendingVo();
	       rpv.setOptType("1");
	       rpv.setPCode(todo.getTaskId());
	       rpv.setPURL(getUrl(todo));
	       rpv.setPnote(todo.getHeadType());
	       rpv.setPTitle(todo.getTitle());
	       rpv.setPscode("eam");
	       rpv.setPDate(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
	       rpv.setNgDate(DateUtils.formatDate(todo.getDraftDate(), "yyyy-MM-dd"));
	       rpv.setNgPerson(UserCache.getUsernameById(todo.getDraftUserId()));
	       rpv.setPstatus("0");
	       rpv.setWenHao(todo.getSheetId());
	       rpv.setPscodeZH("资产管理系统");
	       PTDeptBO dept =((IDeptBS)SpringContextHelper.getBean(DeptBSimpl.class)).getSingleById(todo.getDraftDeptId());
	       if(dept != null){
	    	   rpv.setNgDept(dept.getDeptName());
	       }
	       rpv.setPPrincipal(UserCache.getLoginId(todo.getUserId()));
	       rpv.setPtype("1");
	       try{
	           pand.putPandingInfo(rpv);
	       }catch(Exception e){
	           System.err.println("发送到门户待办出错。");
	           e.printStackTrace();
	       }
	    }
	  /**
     * 结束门户待办
     * @param taskid
     */
    public void completeTask(String taskid, String userloginid){
    	IPandingInterfaceWebservice pand=(IPandingInterfaceWebservice)SpringContextHelper.getBean("pand");
		RPendingVo rpv = new RPendingVo();
		rpv.setOptType("3");
		rpv.setPCode(taskid);
		rpv.setPscode("eam");
		rpv.setPstatus("2");
		rpv.setPtype("1");
		rpv.setPPrincipal(userloginid);
		try{
			pand.changePangdingStatus(rpv);
		}catch(Exception e){
			System.err.println("发送到门户待办出错。");
		}
    }

	    private String getUrl(PTTodo todo){
	       String url = prefix + todo.getSubsystem();
	        try {
	            String urlPortal = URLEncoder.encode(todo.getUrl() + "?taskId=" + todo.getTaskId() + "&piId=" + todo.getProcInstId() + "&" + todo.getParam(), "UTF-8");
	            url += "?urlPortal=" + urlPortal;
	        } catch (UnsupportedEncodingException ex) {
	            Logger.getLogger(PortalPanding.class.getName()).log(Level.SEVERE, null, ex);
	        }
	        return url;
	    }
	    
	    private String getUrl(PTMessage msg){
	        String url = prefix;
	         try {
	             String urlPortal = URLEncoder.encode("msgId=" + msg.getId(), "UTF-8");
	             //url += "workflow/workflow_readMsg.do?urlPortal=" + urlPortal;
	             url += "workflow/workflow_readMsg.do?msgId=" + msg.getId();
	         } catch (UnsupportedEncodingException ex) {
	             Logger.getLogger(PortalPanding.class.getName()).log(Level.SEVERE, null, ex);
	         }
	         return url;
	     }
	    
	    private String getSubSystem(String sub){
	        String url = "";
	        if(GlobalVariable.ASSET_FOR_USING.equals(sub)){
	            url = GlobalVariable.INDEX_ASSET_FOR_USING;
	        } else if (GlobalVariable.CARD_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_CARD_SUBSYSTEM;
	        } else if (GlobalVariable.FIXED_ASSET_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_FIXED_ASSET_SUBSYSTEM;
	        } else if (GlobalVariable.ENTITY_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_ENTITY_SUBSYSTEM;
	        } else if (GlobalVariable.STOCK_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_STOCK_SUBSYSTEM;
	        } else if (GlobalVariable.DEBT_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_DEBT_SUBSYSTEM;
	        } else if (GlobalVariable.ASSET_DISPOSE_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_ASSET_DISPOSE_SUBSYSTEM;
	        }else if (GlobalVariable.HKGL_SUBSYSTEM.equals(sub)){
	        	url = GlobalVariable.INDEX_HKGL_SUBSYSTEM;	
	        } else if (GlobalVariable.INVESTMENT_SUBSYSTEM.equals(sub)) {
	            url = GlobalVariable.INDEX_INVESTMENT_SUBSYSTEM;
	        }
	        return url;
	    }

		public String getPrefix() {
			return prefix;
		}

		public void setPrefix(String prefix) {
			this.prefix = prefix;
		}
}
