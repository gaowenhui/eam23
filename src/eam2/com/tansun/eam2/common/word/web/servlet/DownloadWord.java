package com.tansun.eam2.common.word.web.servlet;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.common.web.utils.ResponseUtil;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;

@Controller
public class DownloadWord implements java.io.Serializable {
	private final static int MAX_BUFFER_SIZE = 1024;
	private static final long serialVersionUID = 3801388866427819262L;
	private static final String CONTENT_TYPE = "application/x-msdownload";
	
	@Autowired
	private IAttachHandleUCC attachHandleUcc;

	protected void download(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String biaodanid = request.getParameter("BIAODANID");
		String wordTempKey = request.getParameter("WORDTEMPKEY");
		PTAttachment pt;
		if(GetWordTemplateInfo.WORD_TEMPLATE.equals(biaodanid))
			pt = attachHandleUcc.queryAttachment(biaodanid, "" + CommonGlobal.ATTACHMENT_TEMPLATE, wordTempKey).get(0);
		else
			pt = attachHandleUcc.queryAttachment(biaodanid, "" + CommonGlobal.ATTACHMENT_WORD_CONTENT, wordTempKey).get(0);
		response.setCharacterEncoding("UTF-8");
		download(response, pt.getBlob().getContent(), pt.getYwjm(), CONTENT_TYPE);
	}

	public IAttachHandleUCC getAttachHandleUcc() {
		return attachHandleUcc;
	}

	public void setAttachHandleUcc(IAttachHandleUCC attachHandleUcc) {
		this.attachHandleUcc = attachHandleUcc;
	}
    public final static void download(HttpServletResponse response, byte[] data, String filename, String mimeType) throws IOException{
        if (data == null || data.length == 0)
            return;

        download(response, new ByteArrayInputStream(data), data.length, filename, mimeType);
    }
    
	public final static void download(HttpServletResponse response, InputStream in, int contentLength, String filename, String mimeType) throws IOException{

	        response.reset();
	        response.setContentLength(contentLength);

	        //System.out.println(filename);
	        //ISO8859_1
	        //must encode charset to Unicode
	        String s = new String(filename.getBytes("UTF-8"), "ISO8859_1");
	        response.addHeader("Content-Disposition",
	                "attachment; filename=\"" + s + "\"");
	        response.setContentType(mimeType);

	        OutputStream out = null;
	        try{
	            out = response.getOutputStream();
	            byte[] buffer = new byte[MAX_BUFFER_SIZE];
	            while (in.available() > 0) {
	                int len = in.read(buffer);
	                out.write(buffer, 0, len);
	                out.flush();
	            }
	        }
	        finally{
	            try {
	                in.close();
	            }
	            catch (IOException e) {
	            }
	            if (out != null) {
	                try {
	                    out.close();
	                }
	                catch (IOException e) {}
	            }
	        }
	    }
}
