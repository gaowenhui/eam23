package com.tansun.eam2.esb;


import org.codehaus.xfire.MessageContext;
import org.codehaus.xfire.handler.AbstractHandler;
import org.jdom.Element;
import org.jdom.Namespace;
/**
 *<jic:header xmlns:jic="http://www.jic.cn/soa" >
  <jic:auth_user>jic:auth_user</jic:auth_user>
  <jic:auth_password>jic:auth_password</jic:auth_password>
  <jic:svc_name>jic:svc_name</jic:svc_name>
  <jic:svc_operation>jic:svc_operation</jic:svc_operation>
  <jic:svc_version>jic:svc_version</jic:svc_version>
  <jic:req_appName>jic:req_appName</jic:req_appName>
</jic:header>
 * @Title: ClientAuthenticationHandler.java 
 * @Package com.tansun.ws.card 
 * @Description: 身份验证头生成。
 * @author <a href="mailto:baling.fang@gmail.com">Baitin.Fong</a>
 * @date Oct 27, 2010 9:15:28 PM 
 * @version V1.0
 */
//@Service("authHandler")
public class ESBAuthHandler extends AbstractHandler{

    private String authUser;
    private String authPassword;
    private String svcName;
    private String svcOperation;
    private String svcVersion;
    private String reqAppName;

    public void invoke(MessageContext context) throws Exception{
        Element head = new Element("header");
        head.addNamespaceDeclaration(Namespace.getNamespace("jic", "http://www.jic.cn/soa"));
        Element user = new Element("auth_user");
        user.addContent(authUser);
        Element password = new Element("auth_password");
        password.addContent(authPassword);
        Element sName = new Element("svc_name");
        sName.addContent(svcName);
        Element sOperation = new Element("svc_operation");
        sOperation.addContent(svcOperation);
        Element sVersion = new Element("svc_version");
        sVersion.addContent(svcVersion);
        Element sAppName = new Element("req_appName");
        sAppName.addContent(reqAppName);
        head.addContent(user);
        head.addContent(password);
        head.addContent(sName);
        head.addContent(sOperation);
        head.addContent(sVersion);
        head.addContent(sAppName);
        context.getOutMessage().setHeader(head);
    }

    public String getAuthPassword() {
        return authPassword;
    }

    public String getAuthUser() {
        return authUser;
    }

    public String getReqAppName() {
        return reqAppName;
    }

    public String getSvcName() {
        return svcName;
    }

    public String getSvcOperation() {
        return svcOperation;
    }

    public String getSvcVersion() {
        return svcVersion;
    }

    public void setAuthPassword(String authPassword) {
        this.authPassword = authPassword;
    }

    public void setAuthUser(String authUser) {
        this.authUser = authUser;
    }

    public void setReqAppName(String reqAppName) {
        this.reqAppName = reqAppName;
    }

    public void setSvcName(String svcName) {
        this.svcName = svcName;
    }

    public void setSvcOperation(String svcOperation) {
        this.svcOperation = svcOperation;
    }

    public void setSvcVersion(String svcVersion) {
        this.svcVersion = svcVersion;
    }

}
