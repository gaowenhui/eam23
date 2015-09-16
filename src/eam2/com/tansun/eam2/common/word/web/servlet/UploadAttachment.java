package com.tansun.eam2.common.word.web.servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
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
public class UploadAttachment implements java.io.Serializable {
	
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
					response.getWriter().println("1");
				} else {
					response.getWriter().println("0");
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
		PTAttachment pta = new PTAttachment();
		PTAttachmentBlob ptb = new PTAttachmentBlob();
		pta.setBdid(rp.biaodanid);
		pta.setFjbt(rp.filetitle);
		pta.setWjlx("doc");
		pta.setYwjm(rp.filename);
		pta.setWjdx(rp.filesize);
		pta.setFjlx("" + CommonGlobal.ATTACHMENT_NORMAL);
		pta.setDel(new Long(1));
		
		ptb.setContent(content);
		pta.setBlob(ptb);
		attachHandleUcc.uploadAttachment(pta);
	}

	private void convertPostParameters(HttpServletRequest request, RequestParameters parameters) {
		String querystring = request.getQueryString();
		if (querystring != null && querystring != ""){
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
						else if (tmpname.equalsIgnoreCase("type"))
							parameters.fileType = tmpvalue;
						else if (tmpname.equalsIgnoreCase("size"))
							parameters.filesize = Long.parseLong(tmpvalue);
						else if (tmpname.equalsIgnoreCase("title"))
							parameters.filetitle = tmpvalue;
						else if (tmpname.equalsIgnoreCase("name"))
							parameters.filename = tmpvalue;
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
		String filetitle = "";
		long filesize = 0;
		String command = null;
		String fileType = null;
		String biaodanid = null;
		byte[] blob = null;
	}
}
