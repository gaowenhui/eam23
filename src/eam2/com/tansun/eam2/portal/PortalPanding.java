package com.tansun.eam2.portal;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.springframework.beans.factory.annotation.Autowired;

import cn.cbhb.rpending.common.vo.RPendingVo;

import com.panding.webservice.IPandingInterfaceWebservice;
import com.tansun.eam2.GlobalVariable;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.workflow.pgsc.service.ETPgscCounterSignBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.generalapps.dept.service.IDeptBS;
import com.tansun.rdp4j.generalapps.dept.service.impl.DeptBSimpl;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTDid;
import com.tansun.rdp4j.workflow.common.model.PTMessage;
import com.tansun.rdp4j.workflow.common.model.PTTodo;
import com.tansun.rdp4j.workflow.task.service.PTTodoBS;

/**
 *
 * @author Baitin.Fong
 */
public class PortalPanding implements MethodInterceptor {
	@Autowired
	PTTodoBS todoBS;
	@Autowired
	IUserBS userBS;
	@Autowired
	ETPgscCounterSignBS  etPgscCounterSignBS;
	@Autowired
	private PublicDao publicDao;
	IPandingInterfaceWebservice pand;
    private String prefix;
	public IPandingInterfaceWebservice getPand() {
		return pand;
	}

	public void setPand(IPandingInterfaceWebservice pand) {
		this.pand = pand;
	}

	public Object invoke(MethodInvocation invocation) throws Throwable {
		Method m = invocation.getMethod();
        Object o = invocation.proceed();
        Object[] args = invocation.getArguments();
        boolean haveArgs=((args!=null)&&(args.length>0));
        PTTodo todo = null;
        if(o instanceof PTTodo){
        	todo = (PTTodo)o;
        }
        if(m.getName().equals("completeTask")){
            if(todo!=null){
                newTask(todo);
                completeTask(todo.getUperTaskId(), UserCache.getLoginId(todo.getSendUserId()));
            }
        }
        if(m.getName().equals("todo")){
            if(todo!=null){
            	setHaveRead(todo);
            }
        }
        if(m.getName().equals("startCounterSignParticipant")||m.getName().equals("startCounterSign")||m.getName().equals("editPortal")){
        	 newTask(todo);
        }
        if(m.getName().equals("commitFinalContent")||m.getName().equals("commitZHFinalContent")||m.getName().equals("commitJBGCContent")||m.getName().equals("commitZHGCContent")){
        	if (haveArgs){
        		String	taskId = (String)args[0];
        		todo = this.todoBS.findPTTodoByTaskId(taskId);
        		if(todo!=null){
        			String loginId = UserCache.getLoginId(todo.getUserId());
                	completeTask(todo.getTaskId(), loginId);
                }
        		//如果是综合提交过程意见，则需要向门户中新增加一条待办，并把待办变为已读。
        		if(m.getName().equals("commitZHGCContent")){
        	        if(o instanceof String){
        	        	String newTaskId = (String)o;
        	        	PTTodo newTo = this.todoBS.findPTTodoByTaskId(newTaskId);
        	        	this.newTask(newTo);
        	        	//如果会签部门综合未添加其他会签人员，综合提交过程意见，同样待办显示红色
        	        	//否则待办显示已读
        	        	if(todoBS.exitsCountersignPerson(newTo.getHeadId(),newTo.getUserId(),newTo.getDeptId())){
        	        		//如果存在综合以外的本部门内其他会签人员
        	        		this.setHaveRead(newTo);
        	        	}
        	        }
        		}
        		//如果其他用户提交过程意见
        		if(m.getName().equals("commitJBGCContent")){
        			//根据部门Id获取本部门的综合Id
        			String zhUserId = userBS.getZhUserByDept(todo.getDeptId().toString());
        			//判断是否存在其他同部门的会签人员，不存在，修改综合的待办为红色
        			if(zhUserId != null && !"".equals(zhUserId)){
	        			if(!todoBS.exitsOtherCountersignPerson(todo.getHeadId(),todo.getUserId(),Long.parseLong(zhUserId),todo.getDeptId())){
	        				//查询综合待办
	        				PTTodo zhTodo = this.todoBS.findTodoByHeadIdAndUserId(todo.getHeadId(),Long.parseLong(zhUserId));
	        				completeTask(zhTodo.getTaskId(),UserCache.getLoginId(zhTodo.getUserId()));
	        				this.newTask(zhTodo);  
	        			}
        			}
        		}
        		
        		//办理单提交退回或者最终意见  删除所有会签人员代办
	        	if(m.getName().equals("commitFinalContent")||m.getName().equals("commitZHFinalContent")){
	        		List list = etPgscCounterSignBS.findtaskListBytaskId(taskId);
	        		if(list!=null&&list.size()>0){
	        			for(int i=0;i<list.size();i++){
	        				String hqtaskid = (String) list.get(i);
	        				todo = this.todoBS.findPTTodoByTaskId(hqtaskid);
	        				if(!hqtaskid.equals(taskId)){
	        					if(todo!=null){
	        	                	completeTask(todo.getTaskId(), UserCache.getLoginId(todo.getUserId()));
	        	                }
	        				}else{
	        					//查询发起会签的部门综合的待办
        	                	PTTodo fqbmZhTodo = this.todoBS.findTodoByHeadIdAndUserId(todo.getHeadId(),todo.getSendUserId());
        	                	//查询当前任务是否还有其他部门在办理
        	                	int count = this.todoBS.getUnfinishCounterSign(fqbmZhTodo.getProcInstId());
        	                	//如果没有，查询发起会签部门综合待办
        	                	if(count == 0){
        	                		//结束发起会签部门综合门户待办
        	        				completeTask(fqbmZhTodo.getTaskId(),UserCache.getLoginId(fqbmZhTodo.getUserId()));
        	        				//新增发起会签部门综合门户待办
        	        				this.newTask(fqbmZhTodo);
        	                	}
	        				}
	        			}
	        		}
	        	}
        	}
        }
        if(m.getName().equals("editPortal")){
        	if (haveArgs){
        		String	taskId = (String)args[0];
        		todo = this.todoBS.findPTTodoByTaskId(taskId);
        		if(todo!=null){
                	completeTask(todo.getTaskId(), UserCache.getLoginId(todo.getUserId()));
                }
    		}
        }
        if(m.getName().equals("circulation")){
        	List<PTMessage> list = null;
        	if(o instanceof ArrayList){
        		list = (ArrayList)o;
            }
            if(list!=null){
            	for(PTMessage msg : list){
            		newMsg(msg);
            	}
            }
        }
        if(m.getName().equals("readMsg")){
        	PTMessage msg = null;
        	if(o instanceof PTMessage){
        		msg = (PTMessage)o;
            }
            if(msg!=null){
            	completeMSGTask(""+msg.getId(), UserCache.getLoginId(msg.getUserId()));
            }
        }
        if(m.getName().equals("abandonPi")||m.getName().equals("endPi")){
            String taskId = (String)invocation.getArguments()[0];
            todo = this.todoBS.findPTTodoByTaskId(taskId);
            if(todo!=null){
            	completeTask(todo.getTaskId(), UserCache.getLoginId(todo.getUserId()));
            }
        }
        return o;
	}

    private void newMsg(PTMessage msg) {
    	RPendingVo rpv = new RPendingVo();
        rpv.setOptType("1");
        rpv.setPCode(""+msg.getId());
        rpv.setPURL(getUrl(msg));
        rpv.setPTitle(msg.getMessage());
        rpv.setPscode("eam");
        rpv.setPDate(DateUtils.formatDate(new Date(), "yyyy-MM-dd HH:mm:ss"));
        rpv.setNgDate(DateUtils.formatDate(msg.getCreateDate(), "yyyy-MM-dd"));
        rpv.setNgPerson(UserCache.getUsernameById(msg.getSendUserId()));
        rpv.setPstatus("0");
        rpv.setPscodeZH("资产管理系统");
        String bhbm = getPTDidbylcID(msg.getProcInstId());
        String a[] = bhbm.split("&");
        String draftdeptid = a[0];
        String bianhao = null;
        if(a.length == 2){
        	bianhao = a[1];
        }
        rpv.setWenHao(bianhao);
       // PTDeptBO dept =((IDeptBS)SpringContextHelper.getBean(DeptBSimpl.class)).getSingleById(msg.getDeptId());
        PTDeptBO dept =((IDeptBS)SpringContextHelper.getBean(DeptBSimpl.class)).getSingleById(Long.valueOf(draftdeptid));
        if(dept != null){
     	   rpv.setNgDept(dept.getDeptName());
        }
        rpv.setPPrincipal(UserCache.getLoginId(msg.getUserId()));
        rpv.setPtype("2");
        try{
            pand.putPandingInfo(rpv);
        }catch(Exception e){
            System.err.println("发送到门户待办出错。");
            e.printStackTrace();
        }
	}
    /**
     * 结束门户传阅待办
     * @param taskid
     */
    private void completeMSGTask(String taskid, String userloginid){
		RPendingVo rpv = new RPendingVo();
		rpv.setOptType("3");
		rpv.setPCode(taskid);
		rpv.setPscode("eam");
//		rpv.setPstatus("2");
		rpv.setPtype("2");
		rpv.setPPrincipal(userloginid);
		try{
			pand.changePangdingStatus(rpv);
		}catch(Exception e){
			System.err.println("发送到门户待办出错。");
		}
    }
    public String getPTDidbylcID(String lcId){
    	String sql ="from PTDid t where t.procInstId = ?";
    	List params = new ArrayList();
    	params.add(lcId);
    	List list =  publicDao.find(sql,params);
    	String deptId ="";
    	String bianhao ="";
    	if(list!=null&&list.size()>0){
    		for(int i =0; i<list.size() ;i++){
    			PTDid ptdid = (PTDid) list.get(i);
    			if(ptdid.getDeptId()!=null){
    				deptId = ptdid.getDeptId().toString() ;
    			}
    			if(ptdid.getSheetId()!=null){
    				bianhao =ptdid.getSheetId();
    			}
    		}
    	}
    	return deptId+"&"+bianhao;
    }
	private void setHaveRead(PTTodo todo) {
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
//		try{
//			pand.changePangdingStatus(rpv);
//		}catch(Exception e){
//			System.err.println("修改门户待办状态为已阅出错。");
//		}
	}
	//使门户代办变色
	private void setHaveNoRead(PTTodo todo) {
		String taskId = todo.getTaskId();
		String userloginid = UserCache.getLoginId(todo.getUserId());
		if(taskId==null||taskId.equals("")) return;
		if(userloginid==null||userloginid.equals("")) return;
		RPendingVo rpv = new RPendingVo();
		rpv.setOptType("2");
		rpv.setPCode(taskId);
		rpv.setPscode("eam");
		rpv.setPstatus("0");
		rpv.setPtype("1");
		rpv.setPPrincipal(userloginid);
		try{
			pand.changePangdingStatus(rpv);
		}catch(Exception e){
			System.err.println("修改门户待办状态为待阅出错。");
		}
	}

	private void newTask(PTTodo todo){
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
       rpv.setPscodeZH("资产管理系统");
       rpv.setWenHao(todo.getSheetId());
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

    private String getUrl(PTTodo todo){
    	String url = prefix + getSubSystem(todo.getSubsystem());
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
        } else if (GlobalVariable.INVESTMENT_SUBSYSTEM.equals(sub)) {
            url = GlobalVariable.INDEX_INVESTMENT_SUBSYSTEM;
        }else if (GlobalVariable.HKGL_SUBSYSTEM.equals(sub)){
        	url = GlobalVariable.INDEX_HKGL_SUBSYSTEM;	
        }else if(sub==null || "".equals(sub.trim())){
        	url="index.do";
        }
        return url;
    }

    /**
     * 结束门户待办
     * @param taskid
     */
    private void completeTask(String taskid, String userloginid){
		RPendingVo rpv = new RPendingVo();
		rpv.setOptType("3");
		rpv.setPCode(taskid);
		rpv.setPscode("eam");
//		rpv.setPstatus("2");
		rpv.setPtype("1");
		rpv.setPPrincipal(userloginid);
		try{
			pand.changePangdingStatus(rpv);
		}catch(Exception e){
			System.err.println("发送到门户待办出错。");
		}
    }
    public void setPrefix(String prefix) {
        this.prefix = prefix;
    }

    public String getPrefix() {
        return prefix;
    }

}
