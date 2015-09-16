package com.tansun.eam2.oa;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.soap.SOAPException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.axis.message.SOAPHeaderElement;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.tansun.eam2.common.word.util.Base64;

//import com.tansun.eam2.common.word.util.Base64;


//import com.tansun.eam2.common.word.util.Base64;



public class GetsubjectService {
    private static String xsi = "http://www.w3.org/2001/XMLSchema-instance";
//    private static String jic = "http://www.jic.cn/soa";
    private static String jic = "http://how.jic.cn";
    
    private static String URLNAME = "url";
    private String devMode;
    private String oaUrl;
    private String authUser;
    private String authPassword;
    private String svcName;
    private String svcOperation;
    private String svcVersion;
    private String reqAppName;
    private static SOAPHeaderElement header;
	
    private SOAPHeaderElement getSOAPHeaderElement(){
        if(header != null){
            return header;
        }
        header = new SOAPHeaderElement(new QName(jic,"header","jic"));
        try {
            header.addChild(new SOAPHeaderElement(new QName(jic, "auth_user", "jic"), authUser));
            header.addChild(new SOAPHeaderElement(new QName(jic, "auth_password", "jic"), authPassword));
            header.addChild(new SOAPHeaderElement(new QName(jic, "svc_name", "jic"), svcName));
            header.addChild(new SOAPHeaderElement(new QName(jic, "svc_operation", "jic"), svcOperation));
            header.addChild(new SOAPHeaderElement(new QName(jic, "svc_version", "jic"), svcVersion));
            header.addChild(new SOAPHeaderElement(new QName(jic, "req_appName", "jic"), reqAppName));
        } catch (SOAPException ex) {
            Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
        }

        return header;
    }
//
//	public String getOABLYJNotComplete(String userid, String labname, String beginnum, String endnum, String keyword, String docstatus) throws Exception {
//		Service service = new Service();
//        String returnStr = "";
//        try{
//		    Call call = (Call) service.createCall();
//		    call.setTargetEndpointAddress(new java.net.URL(oaUrl));
//            call.addHeader(getSOAPHeaderElement());
//            QName soa = new QName(jic, "getOABLYJ", "soa");
//            call.setOperationName(soa);
//            call.addParameter(soa, new QName(xsi, "userid", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "labname", "xsi"),  String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "beginnum", "xsi"),  String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "endnum", "xsi"), String.class,  ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "keyword", "xsi"),  String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "docstatus", "xsi"),  String.class, ParameterMode.IN);
//            call.setReturnType(XMLType.XSD_STRING);
//            returnStr = (String) call.invoke(new Object[]{userid, labname, beginnum, endnum, keyword, docstatus});
//        }catch(Exception ex){
//           Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//		return returnStr;
//
//	}
	
	/**
	 * 获取OA 的流程信息作为EAM的办理依据，（1月7日：返回值的解析未完成）a
	 * @param userid
	 * @param labname
	 * @param beginnum
	 * @param endnum
	 * @param keyword
	 * @param docstatus
	 * @return
	 */
    public String getOABlyj(String userid, String labname, String beginnum, String endnum, String keyword, String docstatus){
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
        sb.append("<soa:getOABLYJ xmlns:soa=\"http://www.jic.cn/soa\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">").append("\n");
        sb.append("<userid xsi:type=\"xs:string\">").append(userid).append("</userid>").append("\n");
        sb.append("<labname xsi:type=\"xs:string\">").append(labname).append("</labname>").append("\n");
        sb.append("<beginnum xsi:type=\"xs:string\">").append(beginnum).append("</beginnum>").append("\n");
        sb.append("<endnum xsi:type=\"xs:string\" >").append(endnum).append("</endnum>").append("\n");
        sb.append("<keyword xsi:type=\"xs:string\" >").append(keyword).append("</keyword>").append("\n");
        sb.append("<docstatus xsi:type=\"xs:string\">").append(docstatus).append("</docstatus>").append("\n");
        sb.append("</soa:getOABLYJ>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
        String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb, "getBlyj");
        }
        try {
        	res = new String(res.getBytes(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return res;
    }
    
    /**
     * 办理依据的返回值解析
     * @param xml
     * @return
     */
    public String sender(StringBuffer xml, String sendType) {
		URL senderp = null;
		HttpURLConnection connection = null;
		InputStream inputstream = null;
		String str = "";
		try {
			senderp = new URL(oaUrl);
			connection = (HttpURLConnection) senderp.openConnection();
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-type", "text/xml");
			connection.setRequestMethod("POST");
            byte[] bya = xml.toString().getBytes("UTF-8");
			connection.getOutputStream().write(bya);
			connection.getOutputStream().flush();
			connection.getOutputStream().close();
//			int code = connection.getResponseCode();
			if (connection.getResponseCode() < 400) {
				inputstream = connection.getInputStream();
			} else {
				inputstream = connection.getErrorStream();
			}
			// 整理OA返回结果
            str = new String(changestr(inputstream, sendType).getBytes("UTF-8"));
		} catch (Exception ex) {
			Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			if (connection != null) {
				connection.disconnect();
			}
		}
		return str;
	}

    /**
     * 整理OA返回结果
     * @param is
     * @return
     */
    public static String changestr(InputStream is, String sendType) {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            StringBuffer buffer = new StringBuffer();
            String line = "";
            while ((line = in.readLine()) != null) {
                buffer.append(line);
            }
            //TODO 解析返回字符串。
            String notes = getNotes(buffer, sendType);
            return notes;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    /**
     * 解析xml文件内容
     * 需要现场修改节点名称，根据OA传送过来的内容修改
     * @param xml
     * @return
     */
    public static String getNotes(StringBuffer buffer, String sendType){
    	String xml = "";
    	String oaInfo = "";
    	
    	try {
			SAXReader reader = new SAXReader();
			xml = new String(buffer.toString());
    		ByteArrayInputStream stream = new ByteArrayInputStream(xml.getBytes("UTF-8"));   
			Document doc = reader.read(stream, "UTF-8");
			Element root = doc.getRootElement();
			org.dom4j.QName aa = root.getQName();
			oaInfo = getElement(root, sendType);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return oaInfo;
    }
    
    private static String getElement(Element element, String sendType){
    	String text = "";
    	for (Iterator i = element.elementIterator(); i.hasNext();) {
    		Element foo = (Element) i.next();
    		String name = foo.getName();
    		if(sendType.equals("getBlyj")){
    			if("getOABLYJReturn".equals(name)){
    				text = foo.getText();
    			}else{
    				text = getElement(foo, sendType);
    			}
    		} else if(sendType.equals("startOA")){
    			if("startOAFlowReturn".equals(name)){
    				text = foo.getText();
    			}else{
    				text = getElement(foo, sendType);
    			}
    		} else if(sendType.equals("queryOA")){
    			if("queryOAFlowReturn".equals(name)){
    				text = foo.getText();
    			}else{
    				text = getElement(foo, sendType);
    			}
    		} else if(sendType.equals("finishOA")){
    			if("finishOAFlowReturn".equals(name)){
    				text = foo.getText();
    			}else{
    				text = getElement(foo, sendType);
    			}
    		}
    	}
    	return text;
    }
//
//    /**
//	 * 启动一个OA的流程
//	 *
//	 * @return
//	 * @throws Exception
//	 */
//	public String startOAFlowNotComplete(String EAMmsgid, String ngrq, String ngr, String zbbm, String zwbt, String zwnr, String fwsm, String yjwjurl) throws Exception {
//		Service service = new Service();
//		String returnStr = "";
//        try{
//		    Call call = (Call) service.createCall();
//		    call.setTargetEndpointAddress(new java.net.URL(oaUrl));
//            call.addHeader(getSOAPHeaderElement());
//            QName soa = new QName(jic, "startOAFlow", "soa");
//            call.setOperationName(soa);
//            call.setReturnType(XMLType.XSD_STRING);
//            call.addParameter(soa, new QName(xsi, "EAMmsgid", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "ngrq", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "ngr", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "zbbm", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "zwbt", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "zwnr", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "fwsm", "xsi"), String.class, ParameterMode.IN);
//            call.addParameter(soa, new QName(xsi, "yjwjurl", "xsi"), String.class, ParameterMode.IN);
//            returnStr = (String) call.invoke(new Object[]{EAMmsgid, ngrq, ngr, zbbm, zwbt, zwnr, fwsm, yjwjurl});
//        }catch(Exception ex){
//           Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//		return returnStr;
//	}

	/**
	 * 启动一个OA的流程
	 * 调用的返回值未解析，（1月7日：返回值的解析未完成）
	 * @param EAMmsgid 消息标识符号,由EAM提供,OA在流程办理过程及完毕以后,通过此符号来回写发送消息.
	 * @param ngrq 拟稿日期,格式yyyy-mm-dd
	 * @param ngr 拟稿人,中文名称
	 * @param zbbm 主办部门,中文名称,拟稿人所在部门
	 * @param zwbt 正文标题
	 * @param zwnr 正文内容,会议纪要的正文内容
	 * @param fwsm 发文说明
	 * @param yjwjurl 依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给OA,在OA中可以直接打开查看.
	 * @param Nglx 需要启动的OA流程名称：发文、签报、法律性文件、会议纪要
	 * @param Word 会议纪要正文(base64编码) 
	 * @param wordName 正文的文件名
	 * word 是否含有内容取决于消息标识符，带正文的传输正文转换为base64的字符，不带正文的传输空字符：
	 * 发文 会议纪要 法律性文件审查（不用带正文） 
	 * 签报（不带正文）增加接口 查询令牌 更改令牌 令牌更新
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> startOAFlow(String EAMmsgid, String ngrq, String ngr, String zbbm, String zwbt, 
			String zwnr, String fwsm, String yjwjurl, String nglx, File file) throws Exception {
		StringBuffer sb = new StringBuffer();
		String word = "";
		if(file != null){
//		if(EAMmsgid.equals("")){
			try {
				word = loadAFileToStringDE1(file);
			} catch (Exception e) {
				e.printStackTrace();
			}
//		}
		}
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
        sb.append("<soa:startOAFlow xmlns:soa=\"http://www.jic.cn/soa\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">").append("\n");
        sb.append("<EAMmsgid xsi:type=\"xs:string\">").append(EAMmsgid).append("</EAMmsgid>").append("\n");
        sb.append("<ngrq xsi:type=\"xs:string\">").append(ngrq).append("</ngrq>").append("\n");
        sb.append("<ngr xsi:type=\"xs:string\">").append(ngr).append("</ngr>").append("\n");
        sb.append("<zbbm xsi:type=\"xs:string\" >").append(zbbm).append("</zbbm>").append("\n");
        sb.append("<zwbt xsi:type=\"xs:string\" >").append(zwbt).append("</zwbt>").append("\n");
        sb.append("<zwnr xsi:type=\"xs:string\">").append(zwnr).append("</zwnr>").append("\n");
        sb.append("<fwsm xsi:type=\"xs:string\">").append(fwsm).append("</fwsm>").append("\n");
        sb.append("<yjwjurl xsi:type=\"xs:string\">").append(yjwjurl).append("</yjwjurl>").append("\n");
        sb.append("<nglx xsi:type=\"xs:string\">").append(nglx).append("</nglx>").append("\n");
        sb.append("<word xsi:type=\"xs:string\">").append(word).append("</word>").append("\n");
        sb.append("<wordName xsi:type=\"xs:string\">").append(file.getName()).append("</wordName>").append("\n");
        sb.append("</soa:startOAFlow>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
        String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb, "startOA");
        }
        return exportResult(res);
	}

	/**
	 * 启动一个OA的流程(重载方法)
	 * 调用的返回值未解析，（1月7日：返回值的解析未完成）
	 * @param EAMmsgid 消息标识符号,由EAM提供,OA在流程办理过程及完毕以后,通过此符号来回写发送消息.
	 * @param ngrq 拟稿日期,格式yyyy-mm-dd
	 * @param ngr 拟稿人,中文名称
	 * @param zbbm 主办部门,中文名称,拟稿人所在部门
	 * @param zwbt 正文标题
	 * @param zwnr 正文内容,会议纪要的正文内容
	 * @param fwsm 发文说明
	 * @param yjwjurl 依据文件的URL,把EAM系统当前的URL作为依据文件的URL来发给OA,在OA中可以直接打开查看.
	 * @param Nglx 需要启动的OA流程名称：发文、签报、法律性文件、会议纪要
	 * @param Word 会议纪要正文(base64编码) 
	 * @param wordName 正文的文件名
	 * word 是否含有内容取决于消息标识符，带正文的传输正文转换为base64的字符，不带正文的传输空字符：
	 * 发文 会议纪要 法律性文件审查（不用带正文） 
	 * 签报（不带正文）增加接口 查询令牌 更改令牌 令牌更新
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> startOAFlow(String EAMmsgid, String ngrq, String ngr, String zbbm, String zwbt, 
			String zwnr, String fwsm, String yjwjurl, String nglx, byte[] file, String wordName) throws Exception {
		StringBuffer sb = new StringBuffer();
		String word = "";
		if(file != null){
//		if(EAMmsgid.equals("")){
			try {
				word = loadAFileToStringDE2(file, wordName);
			} catch (Exception e) {
				e.printStackTrace();
			}
//		}
		}
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
        sb.append("<soa:startOAFlow xmlns:soa=\"http://www.jic.cn/soa\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">").append("\n");
        sb.append("<EAMmsgid xsi:type=\"xs:string\">").append(EAMmsgid).append("</EAMmsgid>").append("\n");
        sb.append("<ngrq xsi:type=\"xs:string\">").append(ngrq).append("</ngrq>").append("\n");
        sb.append("<ngr xsi:type=\"xs:string\">").append(ngr).append("</ngr>").append("\n");
        sb.append("<zbbm xsi:type=\"xs:string\" >").append(zbbm).append("</zbbm>").append("\n");
        sb.append("<zwbt xsi:type=\"xs:string\" >").append(zwbt).append("</zwbt>").append("\n");
        sb.append("<zwnr xsi:type=\"xs:string\">").append(zwnr).append("</zwnr>").append("\n");
        sb.append("<fwsm xsi:type=\"xs:string\">").append(fwsm).append("</fwsm>").append("\n");
        sb.append("<yjwjurl xsi:type=\"xs:string\">").append(yjwjurl).append("</yjwjurl>").append("\n");
        sb.append("<nglx xsi:type=\"xs:string\">").append(nglx).append("</nglx>").append("\n");
        sb.append("<word xsi:type=\"xs:string\">").append(word).append("</word>").append("\n");
        sb.append("<wordName xsi:type=\"xs:string\">").append(wordName).append("</wordName>").append("\n");
        sb.append("</soa:startOAFlow>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
        String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb, "startOA");
        }
        return exportResult(res);
	}

	/**
	 * 把文件类型的文件转换为字符串类型
	 * @param f
	 * @return
	 * @throws IOException
	 */
	public static String loadAFileToStringDE1(File f) throws IOException {     
	    InputStream is = null;   
	    String ret64 = "";
	    try {   
	        is = new BufferedInputStream( new FileInputStream(f) );   
	        long contentLength = f.length();   
	        ByteArrayOutputStream outstream = new ByteArrayOutputStream( contentLength > 0 ? (int) contentLength : 1024);   
	        byte[] buffer = new byte[4096];   
	        int len;   
	        while ((len = is.read(buffer)) > 0) {   
	            outstream.write(buffer, 0, len);   
	        }               
	        outstream.close();   
	        ret64 = Base64.encodeToString(outstream.toByteArray());
	    } finally {   
	        if(is!=null) {try{is.close();} catch(Exception e){} }   
	    }   
	    return ret64;           
	}  

	/**
	 * 把文件类型的文件转换为字符串类型
	 * @param f
	 * @return
	 * @throws IOException
	 */
	public static String loadAFileToStringDE2(byte[] f, String wordName) throws IOException {     
	    String ret64 = "";
	    try {   
	        ret64 = Base64.encodeToString(f);
	    } finally {   
	    }   
	    return ret64;           
	}  

	/**
	 * 查询OA 的工作流状态，，（1月7日：返回值的解析未完成）c
	 * @param lcid
	 * @return
	 */
    public List<Map<String, String>> queryOAWorkflow(String lcid){
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
        sb.append("<soa:queryOAFlow xmlns:soa=\"http://www.jic.cn/soa\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">").append("\n");
        sb.append("<lcid xsi:type=\"xs:string\">").append(lcid).append("</lcid>").append("\n");
        sb.append("</soa:queryOAFlow>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
        String res = "";
//        if(!"true".equals(devMode)){
            res = sender(sb, "queryOA");
//        }
        return exportResult(res);
    }
//
//    public String queryOAWorkflowNotComplete(String lcid){
//		Service service = new Service();
//        String returnStr = "";
//        try{
//		    Call call = (Call) service.createCall();
//		    call.setTargetEndpointAddress(new java.net.URL(oaUrl));
//            call.addHeader(getSOAPHeaderElement());
//            QName soa = new QName(jic, "queryOAFlow", "soa");
//            call.setOperationName(soa);
//            call.setReturnType(XMLType.XSD_STRING);
//            call.addParameter(soa, new QName(xsi, "lcid", "xsi"), String.class, ParameterMode.IN);
//            returnStr = (String) call.invoke(new Object[]{lcid});
//        }catch(Exception ex){
//           Logger.getLogger(GetsubjectService.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return returnStr;
//    }

	/**
	 * 终止一个OA的流程
	 * EAM流程完毕发送一个完成状态给OA，（1月7日：返回值的解析未完成）d
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, String>> finishOAFlow(String lcid, String lczt, String ngyj, String psyj, String ywyyzyj,
			String hqbuyj ,String cbbmyj, String bz) throws Exception {
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
        sb.append("<soa:finishOAFlow xmlns:soa=\"http://www.jic.cn/soa\" xmlns:xs=\"http://www.w3.org/2001/XMLSchema\"  xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">").append("\n");
        sb.append("<lcid xsi:type=\"xs:string\">").append(lcid).append("</lcid>").append("\n");
        sb.append("<lczt xsi:type=\"xs:string\">").append(lczt).append("</lczt>").append("\n");
        sb.append("<ngyj xsi:type=\"xs:string\">").append(ngyj).append("</ngyj>").append("\n");
        sb.append("<psyj xsi:type=\"xs:string\">").append(psyj).append("</psyj>").append("\n");
        sb.append("<ywyyzyj xsi:type=\"xs:string\">").append(ywyyzyj).append("</ywyyzyj>").append("\n");
        sb.append("<hqbuyj xsi:type=\"xs:string\">").append(hqbuyj).append("</hqbuyj>").append("\n");
        sb.append("<cbbmyj xsi:type=\"xs:string\">").append(cbbmyj).append("</cbbmyj>").append("\n");
        sb.append("<bz xsi:type=\"xs:string\">").append(bz).append("</bz>").append("\n");
        sb.append("</soa:finishOAFlow>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
		
		String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb, "finishOA");
        }
        return exportResult(res);
	}
	
	public List<Map<String, String>> exportResult(String res){
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		Map<String, String> map = new HashMap<String, String>();
		if(res != null && !res.equals("")){
			String[] strs = res.split("######");
			if(strs.length > 0){
				for(String str : strs){
					String [] strsmas = str.split("####");
					if(strsmas.length > 0){
						for(String strsma : strsmas){
							String[] strpars = strsma.split("=");
							String oaurl = "";
							if(strpars[0].toLowerCase().equals(URLNAME)){
								String oaurl2  = strpars[1].substring(strpars[1].indexOf("/"), strpars[1].length());
								oaurl = oaurl2;
								map.put(strpars[0], oaurl);
							}else{
								map.put(strpars[0], strpars[1]);
							}
						}
					}
					list.add(map);
				}
			}
		}
		return list;
	}
	
//	
//	/**
//	 * 终止一个OA的流程
//	 * EAM流程完毕发送一个完成状态给OA，（1月7日：返回值的解析未完成）d
//	 * @return
//	 * @throws Exception
//	 */
//	public String finishOAFlow() throws Exception {
//		String url = oaUrl;
//		Service service = new Service();
//		Call call = (Call) service.createCall();
//		call.setTargetEndpointAddress(new java.net.URL(url));
//		call.setReturnType(XMLType.XSD_STRING);
//		call.addParameter("loginid", XMLType.XSD_STRING,
//				javax.xml.rpc.ParameterMode.IN);
//		call.addParameter("sysidentify", XMLType.XSD_STRING,
//				javax.xml.rpc.ParameterMode.IN);
//		// 填写要调用的方法名称
//		// call.setOperationName("getOABLYJ"); //得到OA的办理依据
//		String args[] = new String[8];
//		args[0] = "100"; // 要中止的流程编号
//		args[1] = "1"; // 正常结束
//		args[2] = "拟稿部门意见"; // 拟稿部门意见
//		args[3] = "批示意见"; // 批示意见
//		args[4] = "业务运营组意见"; // 业务运营组意见
//		args[5] = "会签部门意见"; // 会签部门意见
//		args[6] = "承办部门意见"; // 承办部门意见
//		args[7] = "备注";// 备注
//
//		String retrunStr = (String) call.invoke("finishOAFlow", args); // 启动OA流程
//		return retrunStr;
//	}

	public void sendOAmainid(String mainids){
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
        sb.append("<soa:setOABLYJ xmlns:soa=\"http://www.jic.cn/soa\">").append("\n");
        sb.append("<soa:url>").append(mainids).append("</soa:url>");
        sb.append("</soa:setOABLYJ>").append("\n");
        sb.append("</soapenv:Body>").append("\n");
        sb.append("</soapenv:Envelope>").append("\n");
		String res = "";
        if(!"true".equals(devMode)){
            res = sender(sb, "setOABLYJ");
        }
	}
	
    public String getOaUrl() {
        return oaUrl;
    }

    public void setOaUrl(String oaUrl) {
        this.oaUrl = oaUrl;
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

    public String getDevMode() {
        return devMode;
    }

    public void setDevMode(String devMode) {
        this.devMode = devMode;
    }

}
