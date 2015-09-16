/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tansun.eam2.oa;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.commons.beanutils.PropertyUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.model.orm.bo.PTUserBO;
import com.tansun.rdp4j.common.util.IUser;
import com.tansun.rdp4j.generalapps.user.service.IUserBS;

/**
 *	
 * @author Baitin.Fong
 */
public class OAInterceptor implements MethodInterceptor{
	@Autowired
	IUserBS iuserBS ;
	GetsubjectService	oaService;
    private static String[] keys = new String[]{"mainid", "title", "url", "ngr", "ngrq","source", "recid" };
    private static String[] caKeys = new String[]{"lcid", "bt", "url", "ngr", "ngrq","lcmc", "bh"};
 
	public Object invoke(MethodInvocation invocation) throws Throwable {
		Object[] args = invocation.getArguments();
		Method m = invocation.getMethod();
		boolean haveArgs=((args!=null)&&(args.length>0));
		String userid = "";
        IUser user =  null;
		String value = "";
		String oaModule ="";
		String beginnum="";
		String endnum="";
		if (haveArgs){
			value = (String)args[0];
			user = (IUser)args[1];
            userid = user.getUserLoginId();
            oaModule = (String)args[2];
            beginnum = (String)args[3];
            endnum = (String)args[4];
		}
		Object o=invocation.proceed();
		if(o instanceof List){
			List<CommonAccording> list = (List<CommonAccording>)o;
//			oaService.setAuthUser("oa");
//			oaService.setAuthPassword("w0rkfl0w");
//			oaService.setDevMode("false");
//			oaService.setSvcName("OAWorkflowWS");
//			oaService.setSvcVersion("1.0");
//			oaService.setReqAppName("EAM");
//			oaService.setSvcOperation("");
//			oaService.setOaUrl("http://10.10.4.109:7001/EntryWS");
//			oaService.setDevMode("true");
			String oaBlyj = this.oaService.getOABlyj(user.getUsername(), oaModule, beginnum, endnum, value, "办结");
			String oaBlyj1 ="";
			if(oaBlyj != null && oaBlyj.length() > 0){
				String totalOA[] =  oaBlyj.split("########");
				String total = totalOA[0];
				oaBlyj = totalOA[1];
				oaBlyj = oaBlyj.replace("=", "\":\"");
				oaBlyj = oaBlyj.replace("######", "\"},{\"");
				oaBlyj = oaBlyj.replace("####", "\",\"");
				oaBlyj1 = "{total:\""+total;
				oaBlyj1 += "\",rows:[{\"" + oaBlyj;
				oaBlyj1 += "\"}]}";
				System.out.println(oaBlyj1);
                JSONObject data = JSONObject.fromObject(oaBlyj1);
                if(data != null){
                    JSONArray rows = data.getJSONArray("rows");
                    String  aa = data.getString("total");
                    CommonAccording ca1 = new CommonAccording();
                    ca1.setBh(aa);
                    list.add(ca1);
                    for (Object object : rows.toArray()) {
                        try {
                            CommonAccording ca = new CommonAccording();
                            ca.setSource("OA");
                            for(int i = 0; i < keys.length; i++){
                                String obj = (String)PropertyUtils.getProperty(object, keys[i]);
                                if(caKeys[i].equals("ngrq")){
                                	DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                                	Date date = df.parse(obj);
                                	PropertyUtils.setProperty(ca, caKeys[i], date);
                                }else if(caKeys[i].equals("ngr")){
                                	PTUserBO ptUserBO = iuserBS.getPTUserBOByUserName(obj);
                                	if(ptUserBO!=null){
                                		String ngrID =  String.valueOf(ptUserBO.getTid());
                                		PropertyUtils.setProperty(ca, caKeys[i], ngrID);
                                	}else{
                                    	System.out.println("OA办理依据拟稿人在EAM中未找到 拟稿人为"+obj);
                                		PropertyUtils.setProperty(ca, caKeys[i], obj);
                                	}
                                }else{
                                	// 转换OA的url到portal的url
                                    PropertyUtils.setProperty(ca, caKeys[i], obj);
                                }
                            }
                            list.add(ca);
                        } catch (IllegalAccessException ex) {
                            Logger.getLogger(OAInterceptor.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (InvocationTargetException ex) {
                            Logger.getLogger(OAInterceptor.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (NoSuchMethodException ex) {
                            Logger.getLogger(OAInterceptor.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
			}
		}
        return o;
	}

	public void setOaService(GetsubjectService oaService) {
		this.oaService = oaService;
	}

	public GetsubjectService getOaService() {
		return oaService;
	}

	public IUserBS getIuserBS() {
		return iuserBS;
	}

	public void setIuserBS(IUserBS iuserBS) {
		this.iuserBS = iuserBS;
	}

}
