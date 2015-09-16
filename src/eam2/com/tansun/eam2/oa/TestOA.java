package com.tansun.eam2.oa;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.eam2.common.word.util.Base64;
import com.tansun.eam2.oa.impl.OAInter;
import com.tansun.rdp4j.workflow.common.util.WorkflowUtil;
import com.tansun.rdp4j.workflow.task.service.WorkflowBS;

public class TestOA {

    
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		teststartoa();
	}
	
	private static void testportal(){
		String oaurl = "";
		String strpars = "10.1.9.109/JICOA/SendFolder/ApplySendDocMgt.nsf/0/F4535427A154CD3A48257846003A0852?opendocument";
		String oaurl2  = strpars.substring(strpars.indexOf("/"), strpars.length());
		oaurl = "http://www.jic.cn/soa" + oaurl2;
		testexport();
		System.out.println(oaurl);
	}
	
	private static void testexport(){
		GetsubjectService gss = new GetsubjectService();
		List list = gss.exportResult("status=OK####errorinfo=0####url=10.1.9.109/JICOA/SendFolder/ApplySendDocMgt.nsf/0/F4535427A154CD3A48257846003A0852?opendocument####lcid=F4535427A154CD3A48257846003A0852");
		System.out.println(list.size());
		System.out.println(((Map)list.get(0)).size());
		System.out.println(0);
	}
	
	private static void testbase64(){
		GetsubjectService gss = new GetsubjectService();
		File file = new File("C:/Documents and Settings/ibm/桌面/about/log.txt");
		try {
			String hello = gss.loadAFileToStringDE1(new File("C:/Documents and Settings/ibm/桌面/about/test.docx"));
//			System.out.println(Base64.encode(hello));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void testBlyj(){
		GetsubjectService gss = new GetsubjectService();
		gss.setAuthUser("oa");
		gss.setAuthPassword("w0rkfl0w");
		gss.setDevMode("false");
		gss.setSvcName("OAWorkflowWS");
		gss.setSvcVersion("1.0");
		gss.setReqAppName("EAM");
		gss.setSvcOperation("");
		gss.setOaUrl("http://10.10.4.109:7001/EntryWS");
		String s = gss.getOABlyj("钱诚", "发文", "0", "10", "关于", "办结");
		System.out.println(s);
	}
	
	private static void teststartoa(){
		GetsubjectService gss = new GetsubjectService();
		gss.setAuthUser("oa");
		gss.setAuthPassword("w0rkfl0w");
		gss.setDevMode("false");
		gss.setSvcName("OAWorkflowWS");
		gss.setSvcVersion("1.0");
		gss.setReqAppName("EAM");
		gss.setSvcOperation("");
		gss.setOaUrl("http://10.10.4.109:7001/EntryWS");

			try {
				List<Map<String, String>> 	sss = gss.startOAFlow("22222", "2011-04-31", "钱诚", "办公室", "22222", 
						"222222", "222222", "http:10.1.9.222:8088/eam2", "发文", 
						(new File("C:/Documents and Settings/ibm/桌面/about/test.docx")));

				System.out.println(sss + "******************");
				} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	private static void testqueryoa(){
		GetsubjectService gss = new GetsubjectService();
		gss.setAuthUser("oa");
		gss.setAuthPassword("w0rkfl0w");
		gss.setDevMode("false");
		gss.setSvcName("OAWorkflowWS");
		gss.setSvcVersion("1.0");
		gss.setReqAppName("EAM");
		gss.setSvcOperation("");
		gss.setOaUrl("http://10.10.4.109:7001/EntryWS");

		List<Map<String, String>> 	sss = gss.queryOAWorkflow("F85FCDF1F68DED344825781500302274");
		System.out.println(sss + "******************");
	}
	

	public static String loadAFileToStringDE(File f, String wordName){
//		  	File ff = new File("C:/宁夏物资系统与TMS系统接口规范v1.0.doc");   
		InputStream is = null;   
	    String ret = null;   
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
	        ret = outstream.toString();   
//	        ret64 = Base64.encode(ret);
			
//				String w= Base64.decode(strB);       
	        //  Database db1 = s.getDatabase(null,"JICOA/huiyijiyao/AppSendDocWordMgt.nsf");
	        //  Document wdoc = db1.createDocument();
	            File file1 = new File("C:/"+ wordName);   
	            file1.createNewFile();   
	            FileOutputStream out=new FileOutputStream(file1);   
	            ByteArrayOutputStream os = new ByteArrayOutputStream();
	            os.write(ret.getBytes());
	            out.write(outstream.toByteArray());   
	            out.close(); 
			} catch (IOException e) {
				e.printStackTrace();
			} 
			return ret;   
//			  byte[] w= decoder.decodeBuffer(word);       
//		      //  Database db1 = s.getDatabase(null,"JICOA/huiyijiyao/AppSendDocWordMgt.nsf");
//		      //  Document wdoc = db1.createDocument();
//		 
//		          File file1 = new File("C:/"+wordname);   
//		          file1.createNewFile();   
//		          FileOutputStream out=new FileOutputStream(file1);   
//		          outstream=new BufferedOutputStream(out);
//		          outstream.write(w);   
//		          outstream.close(); 
	}
	
}
