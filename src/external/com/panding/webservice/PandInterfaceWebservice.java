/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.panding.webservice;

import cn.cbhb.rpending.common.vo.RPendingVo;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.tansun.eam2.oa.GetsubjectService;

/**
 *
 * @author Baitin.Fong
 */
public class PandInterfaceWebservice implements IPandingInterfaceWebservice{

	private static String jic = "http://www.jic.cn/soa";
	private String portalUrl;
    private String devMode;
    private String authUser;
    private String authPassword;
    private String svcName;
    private String svcOperation;
    private String svcVersion;
    private String reqAppName;
    
    /**
     * 
     */
    public String putPandingInfo(RPendingVo vo) {
    	StringBuffer sb = new StringBuffer();
    	sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>").append("\n");
        sb.append("<soapenv:Envelope  xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">").append("\n");
	    sb.append("<soap:Header  xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">").append("\n");
	    sb.append("<jic:header xmlns:jic=\"http://www.jic.cn/soa\">").append("\n");
        sb.append("<jic:auth_user>").append(authUser).append("</jic:auth_user>").append("\n");
	    sb.append("<jic:auth_password>").append(authPassword).append("</jic:auth_password>").append("\n");
        sb.append("<jic:svc_name>").append(svcName).append("</jic:svc_name>").append("\n");
        sb.append("<jic:svc_operation>").append(svcOperation).append("</jic:svc_operation>").append("\n");
        sb.append("<jic:svc_version>").append(svcVersion).append("</jic:svc_version>").append("\n");
        sb.append("<jic:req_appName>").append(reqAppName).append("</jic:req_appName>").append("\n");
        sb.append("</jic:header>").append("\n");
        sb.append("</soap:Header>").append("\n");
        sb.append("<soapenv:Body>").append("\n");
    	sb.append("<soa:putPandingInfo xmlns:soa=\"").append(jic).append("\">").append("\n");
		sb.append("	<soa:RPendingVo xmlns:vo=\"http://vo.common.rpending.cbhb.cn\">").append("\n");
		sb.append("		<vo:PCode>").append(vo.getPCode()).append("</vo:PCode>").append("\n");
		sb.append("		<vo:PDate>").append(vo.getPDate()).append("</vo:PDate>").append("\n");
		sb.append("		<vo:PPrincipal>").append(vo.getPPrincipal()).append("</vo:PPrincipal>").append("\n");
		sb.append("		<vo:PTitle>").append(vo.getPTitle()).append("</vo:PTitle>").append("\n");
		sb.append("		<vo:PURL>").append(vo.getPURL()).append("</vo:PURL>").append("\n");
		sb.append("		<vo:md5info>").append(vo.getMd5info()).append("</vo:md5info>").append("\n");
		sb.append("		<vo:optType>").append(vo.getOptType()).append("</vo:optType>").append("\n");
		sb.append("		<vo:plevel>").append(vo.getPlevel()).append("</vo:plevel>").append("\n");
		sb.append("		<vo:pn>").append(vo.getPn()).append("</vo:pn>").append("\n");
		sb.append("		<vo:pnote>").append(vo.getPnote()).append("</vo:pnote>").append("\n");
		sb.append("		<vo:pscode>").append(vo.getPscode()).append("</vo:pscode>").append("\n");
		sb.append("		<vo:pstage>").append(vo.getPstage()).append("</vo:pstage>").append("\n");
		sb.append("		<vo:pstatus>").append(vo.getPstatus()).append("</vo:pstatus>").append("\n");
		sb.append("		<vo:ptype>").append(vo.getPtype()).append("</vo:ptype>").append("\n");
		sb.append("		<vo:pworkflow>").append(vo.getPworkflow()).append("</vo:pworkflow>").append("\n");
		sb.append("     <vo:pscodeZH>").append(vo.getPscodeZH()).append("</vo:pscodeZH>").append("\n");
		sb.append("    <vo:ngPerson>").append(vo.getNgPerson()).append("</vo:ngPerson>").append("\n");
		sb.append("    <vo:ngDept>").append(vo.getNgDept()).append("</vo:ngDept>").append("\n");
		sb.append("    <vo:wenhao>").append(vo.getWenHao()).append("</vo:wenhao>").append("\n");
		sb.append("    <vo:ngDate>").append(vo.getNgDate()).append("</vo:ngDate>").append("\n");
		sb.append("	</soa:RPendingVo>").append("\n");
		sb.append("</soa:putPandingInfo>").append("\n");    
		sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n"); 
        String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb);
        }
        return res;
    }

    public String changePangdingStatus(RPendingVo vo) {
    	StringBuffer sb = new StringBuffer();
    	sb.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>").append("\n");
        sb.append("<soapenv:Envelope  xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\">").append("\n");
	    sb.append("<soap:Header  xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">").append("\n");
	    sb.append("<jic:header xmlns:jic=\"http://www.jic.cn/soa\">").append("\n");
        sb.append("<jic:auth_user>").append(authUser).append("</jic:auth_user>").append("\n");
	    sb.append("<jic:auth_password>").append(authPassword).append("</jic:auth_password>").append("\n");
        sb.append("<jic:svc_name>").append(svcName).append("</jic:svc_name>").append("\n");
        sb.append("<jic:svc_operation>").append(svcOperation).append("</jic:svc_operation>").append("\n");
        sb.append("<jic:svc_version>").append(svcVersion).append("</jic:svc_version>").append("\n");
        sb.append("<jic:req_appName>").append(reqAppName).append("</jic:req_appName>").append("\n");
        sb.append("</jic:header>").append("\n");
        sb.append("</soap:Header>").append("\n");
        sb.append("<soapenv:Body>").append("\n");
    	sb.append("<soa:changePangdingStatus xmlns:soa=\"").append(jic).append("\">").append("\n");
		sb.append("	<soa:RPendingVo xmlns:vo=\"http://vo.common.rpending.cbhb.cn\">").append("\n");
		sb.append("		<vo:PCode>").append(vo.getPCode()).append("</vo:PCode>").append("\n");
//		sb.append("		<vo:PDate>").append(vo.getPDate()).append("</vo:PDate>").append("\n");
		sb.append("		<vo:PPrincipal>").append(vo.getPPrincipal()).append("</vo:PPrincipal>").append("\n");
//		sb.append("		<vo:PTitle>").append(vo.getPTitle()).append("</vo:PTitle>").append("\n");
//		sb.append("		<vo:PURL>").append(vo.getPURL()).append("</vo:PURL>").append("\n");
//		sb.append("		<vo:md5info>").append(vo.getMd5info()).append("</vo:md5info>").append("\n");
		sb.append("		<vo:optType>").append(vo.getOptType()).append("</vo:optType>").append("\n");
//		sb.append("		<vo:plevel>").append(vo.getPlevel()).append("</vo:plevel>").append("\n");
//		sb.append("		<vo:pn>").append(vo.getPn()).append("</vo:pn>").append("\n");
//		sb.append("		<vo:pnote>").append(vo.getPnote()).append("</vo:pnote>").append("\n");
		sb.append("		<vo:pscode>").append(vo.getPscode()).append("</vo:pscode>").append("\n");
//		sb.append("		<vo:pstage>").append(vo.getPstage()).append("</vo:pstage>").append("\n");
		sb.append("		<vo:pstatus>").append(vo.getPstatus()).append("</vo:pstatus>").append("\n");
		sb.append("		<vo:ptype>").append(vo.getPtype()).append("</vo:ptype>").append("\n");
//		sb.append("		<vo:pworkflow>").append(vo.getPworkflow()).append("</vo:pworkflow>").append("\n");
//		sb.append("     <vo:pscodeZH>").append("资产管理系统").append("</vo:pscodeZH>").append("\n");
//		sb.append("     <vo:ngPerson>").append(vo.getNgPerson()).append("</vo:ngPerson>").append("\n");
//		sb.append("     <vo:ngDept>").append(vo.getNgDept()).append("</vo:ngDept>").append("\n");
//		sb.append("     <vo:wenhao>").append(vo.getWenHao()).append("</vo:wenhao>").append("\n");
//		sb.append("     <vo:ngDate>").append(vo.getNgDate()).append("</vo:ngDate>").append("\n");
		sb.append("	</soa:RPendingVo>").append("\n");
		sb.append("</soa:changePangdingStatus>").append("\n");
		sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
        String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb);
        }
        return res;
    }

    public String putOaPandingInfo(String optType, String psCode, String pCode, String pTitle, String pDate, String pOraniger, String pPrincipal, String pURL, String pStatus, String Ptype) throws SQLException {
    	return "";
    }

    public String changeOaPangdingStatus(String optType, String psCode, String pCode, String Ptype) {
    	return "";
    }
    public String sender(StringBuffer xml) {
		URL senderp = null;
		HttpURLConnection connection = null;
		InputStream inputstream = null;
		String str = "";
		try {
			senderp = new URL(portalUrl);
			connection = (HttpURLConnection) senderp.openConnection();
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-type", "text/xml");
			connection.setRequestMethod("POST");
            byte[] bya = xml.toString().getBytes("UTF-8");
			connection.getOutputStream().write(bya);
			connection.getOutputStream().flush();
			connection.getOutputStream().close();
			int code = connection.getResponseCode();
			if (connection.getResponseCode() < 400) {
				inputstream = connection.getInputStream();
			} else {
				inputstream = connection.getErrorStream();
			}
            str = changestr(inputstream);
		} catch (Exception ex) {
			Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return str;
	}

    public static String changestr(InputStream is) {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = in.readLine()) != null) {
                buffer.append(line);
            }
          //TODO 解析返回字符串。
            return buffer.toString();
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

	public String getPortalUrl() {
		return portalUrl;
	}

	public void setPortalUrl(String portalUrl) {
		this.portalUrl = portalUrl;
	}

	public String getDevMode() {
		return devMode;
	}

	public void setDevMode(String devMode) {
		this.devMode = devMode;
	}

	public String getAuthUser() {
		return authUser;
	}

	public void setAuthUser(String authUser) {
		this.authUser = authUser;
	}

	public String getAuthPassword() {
		return authPassword;
	}

	public void setAuthPassword(String authPassword) {
		this.authPassword = authPassword;
	}

	public String getSvcName() {
		return svcName;
	}

	public void setSvcName(String svcName) {
		this.svcName = svcName;
	}

	public String getSvcOperation() {
		return svcOperation;
	}

	public void setSvcOperation(String svcOperation) {
		this.svcOperation = svcOperation;
	}

	public String getSvcVersion() {
		return svcVersion;
	}

	public void setSvcVersion(String svcVersion) {
		this.svcVersion = svcVersion;
	}

	public String getReqAppName() {
		return reqAppName;
	}

	public void setReqAppName(String reqAppName) {
		this.reqAppName = reqAppName;
	}
    
}
