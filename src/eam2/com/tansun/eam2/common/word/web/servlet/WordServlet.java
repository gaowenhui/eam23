package com.tansun.eam2.common.word.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.support.WebApplicationContextUtils;

import com.tansun.eam2.common.workflow.trace.WorkflowSvg;

public class WordServlet extends HttpServlet implements Serializable {

	private static final String UPLOAD_WORD = "uploadWord";
	private static final String UPLOAD_ATTACHMENT = "uploadAttachment";
	private static final String DOWNLOAD_WORD = "downloadWord";
	private static final String EXPORT_EXCEL_VIA_JQGRID = "exportExcelViaJqGrid";
	private static final String GET_TEMP = "getTemp";
	private static final String EXPORT_WORKFLOW_SVG = "exportWorkflowSvg";
	private static final long serialVersionUID = 6958838729464100192L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("COMMAND");
		if(GET_TEMP.equals(command)){
			GetWordTemplateInfo wordTemp = (GetWordTemplateInfo) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext())
				.getBean("getWordTemplateInfo");
			wordTemp.handleWordTemplate(request, response);
		}else if(UPLOAD_WORD.equals(command)){
			UploadWord upload = (UploadWord) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext())
				.getBean("uploadWord");
			upload.upload(request, response);
		}else if(DOWNLOAD_WORD.equals(command)){
			DownloadWord download = (DownloadWord) WebApplicationContextUtils
				.getRequiredWebApplicationContext(request.getSession().getServletContext())
				.getBean("downloadWord");
			download.download(request, response);
		}else if(UPLOAD_ATTACHMENT.equals(command)){
			UploadAttachment upload = (UploadAttachment) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("uploadAttachment");
			upload.upload(request, response);
		}else if(EXPORT_EXCEL_VIA_JQGRID.equals(command)){
			ExportExcel export = (ExportExcel) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("exportExcel");
			export.export(request, response);
		}else if(EXPORT_WORKFLOW_SVG.equals(command)){
			WorkflowSvg export = (WorkflowSvg) WebApplicationContextUtils
			.getRequiredWebApplicationContext(request.getSession().getServletContext())
			.getBean("workflowSvg");
			export.export(request, response);
		}else{
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Expires", "0");
			PrintWriter writer = response.getWriter();
			writer.write("不能识别命令！");
			writer.flush();
			writer.close();
		}
	}

}
