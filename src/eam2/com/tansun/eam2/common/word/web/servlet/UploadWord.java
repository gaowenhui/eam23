package com.tansun.eam2.common.word.web.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.word.util.Base64;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachmentBlob;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;

@Controller
public class UploadWord implements java.io.Serializable {
	
	private static final long serialVersionUID = -2964377694571619760L;
	private static int BUFFER_SIZE = 2048;
	
	@Autowired
	private IAttachHandleUCC attachHandleUcc;

	protected void upload(HttpServletRequest request, HttpServletResponse response){
		RequestParameters parameters = new RequestParameters();
		convertPostParameters(request,parameters);
		try {
			response.setContentType("text/html; charset=UTF-8");
			if (parameters.command != null && parameters.command != "") {
				if (handleCommand(request, parameters)) {
					response.getWriter().println("<HTML><HEAD>");
					response.getWriter().println("<TITLE>Upload Succeed</TITLE>");
					response.getWriter().println("</HEAD><BODY>");
					if (!parameters.returnvalue.equalsIgnoreCase(""))
						response.getWriter().println(parameters.returnvalue);
					response.getWriter().println("</BODY></HTML>");
				} else {
					response.getWriter().println("<HTML><HEAD>");
					response.getWriter().println("<TITLE>Upload Error</TITLE>");
					response.getWriter().println("</HEAD><BODY>");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private boolean handleCommand(HttpServletRequest request, RequestParameters parameters) {
		if (parameters.command == null)
			return false;
		saveWord(parameters.blob, parameters);
		return true;
	}

	private void saveWord(byte[] content, RequestParameters rp) {
		PTAttachment pta = null;
		PTAttachmentBlob ptb = null;
		List<PTAttachment> attach = attachHandleUcc.queryAttachment(rp.biaodanid, "" + CommonGlobal.ATTACHMENT_WORD_CONTENT, rp.docunid);
		if(attach != null && attach.size() > 0){
			pta = attach.get(0);
			ptb = pta.getBlob();
		}else{
			pta = new PTAttachment();
			ptb = new PTAttachmentBlob();
		}
		pta.setBdid(rp.biaodanid);
		pta.setFjbt(rp.filetitle);
		pta.setScrid(rp.userid);
		pta.setScbm(rp.deptid);
		pta.setWjlx("doc");
		pta.setTemplateid(rp.docunid);
		pta.setYwjm(rp.filename);
		pta.setWjdx(rp.filesize);
		pta.setState(rp.wordStatus);
		pta.setFjlx("" + CommonGlobal.ATTACHMENT_WORD_CONTENT);
		pta.setDel(new Long(1));
		
		ptb.setContent(content);
		pta.setBlob(ptb);
		attachHandleUcc.uploadAttachment(pta);
	}

	private void convertPostParameters(HttpServletRequest request, RequestParameters parameters) {
		String querystring = request.getQueryString();
		if (querystring != null && querystring != ""){
			querystring = querystring.replace("?", "&");
			String[] params = querystring.split("&");
			String tmpname;
			String tmpvalue;
			for(int i =0; i < params.length; i++){
					tmpname = "";
					tmpvalue = "";
					tmpname = params[i].substring(0, params[i].indexOf("="));
					tmpvalue = params[i].substring(params[i].indexOf("=") + 1);
					if (tmpname != "" && tmpvalue != "") {
						if(tmpname.equalsIgnoreCase("biaodanid"))
							parameters.biaodanid = tmpvalue;
						if(tmpname.equalsIgnoreCase("userid"))
							parameters.userid = tmpvalue;
						if(tmpname.equalsIgnoreCase("deptid"))
							parameters.deptid = tmpvalue;
						if(tmpname.equalsIgnoreCase("wordStatus"))
							parameters.wordStatus = tmpvalue;
						if(tmpname.equalsIgnoreCase("title")){
							try {
								parameters.filetitle = java.net.URLDecoder.decode(tmpvalue, "UTF-8");
								parameters.filename = java.net.URLDecoder.decode(tmpvalue, "UTF-8") + ".doc";
							} catch (UnsupportedEncodingException e) {
								e.printStackTrace();
							}
						}
						tmpvalue = Base64.decode(tmpvalue);
						if (tmpname.equalsIgnoreCase("docunid"))
							parameters.docunid = tmpvalue;
						else if (tmpname.equalsIgnoreCase("filesize"))
							parameters.filesize = Long.parseLong(tmpvalue);
//						else if (tmpname.equalsIgnoreCase("filetitle"))
//							parameters.filetitle = tmpvalue;
//						else if (tmpname.equalsIgnoreCase("filename"))
//							parameters.filename = tmpvalue;
						else if (tmpname.equalsIgnoreCase("filelist"))
							parameters.szfilelist = tmpvalue;
						else if (tmpname.equalsIgnoreCase("basefilename"))
							parameters.basefilename = tmpvalue;
						else if (tmpname.equalsIgnoreCase("command"))
							parameters.command = tmpvalue;
								
					}
			}
			try {
				InputStream input = request.getInputStream();
				
				ByteArrayOutputStream bytestream = new ByteArrayOutputStream();
				byte[] buffer = new byte[BUFFER_SIZE];
				int rc = 0;
	            while ((rc = input.read(buffer, 0, BUFFER_SIZE)) > 0) {
	            	bytestream.write(buffer, 0, rc);
	            }
	            parameters.blob = bytestream.toByteArray();
				bytestream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public IAttachHandleUCC getAttachHandleUcc() {
		return attachHandleUcc;
	}

	public void setAttachHandleUcc(IAttachHandleUCC attachHandleUcc) {
		this.attachHandleUcc = attachHandleUcc;
	}
	
	class RequestParameters {
		String filename = "";
		String basefilename = "";
		String filetitle = "";
		String returnvalue = "";
		String szfilelist="";
		long filesize = 0;
		String tablename = "";
		String docunid = "";
		String deptid = "";
		String command = null;
		String userid = null;
		String biaodanid = null;
		String wordStatus = "0";
		byte[] blob = null;
	}
}
