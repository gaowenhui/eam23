
package com.tansun.eam2.common.word.web.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.word.components.WordTemplate;
import com.tansun.eam2.common.word.components.WordTemplates;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.ucc.IAttachHandleUCC;

@Controller
public class GetWordTemplateInfo implements java.io.Serializable {
	
	public static final String WORD_TEMPLATE = "WORD_TEMPLATE";
	public static final String READONLY = "READONLY";
	public static final String ISOPENFILE = "ISOPENFILE";
	public static final String BIAODANID = "BIAODANID";
	public static final String WORDKEY = "WORDKEY";
	private static final long serialVersionUID = 2318060152903207814L;
	
	@Autowired
	private WordTemplates wordtemplates;
	
	@Autowired
	private IAttachHandleUCC attachHandleUcc;
	
	
	public void handleWordTemplate(HttpServletRequest request, HttpServletResponse response){
		StringBuffer returnString = new StringBuffer();
		int errCode = 0;
		String wordKey = request.getParameter(WORDKEY);
		String biaodanid = request.getParameter(BIAODANID);		
		String isOpenFile = request.getParameter(ISOPENFILE);
		String readOnly = request.getParameter(READONLY);
		if(wordKey.equals(""))
			errCode = 583;//Word模板键值为空

		Map<String, WordTemplate> templates = wordtemplates.getTemplates();
		if (templates.containsKey(wordKey)){
			
			/* 
			 * 返回字符串格式
			 * 是否保存&&word模板KEY&&扩展函数名&&域与word标签对应
			 * 域与word标签对应格式：
			 * field1|wordlabel1,field2|wordlabel2
			 */
			WordTemplate template = templates.get(wordKey);
			if (!template.getWordTemplateID().equals("")) {
				
				List<PTAttachment> attach = attachHandleUcc.queryAttachment(biaodanid, "" + CommonGlobal.ATTACHMENT_WORD_CONTENT, template.getWordTemplateID());
				 
				String fileKey = template.getWordTemplateID();
				if (attach == null || attach.size() < 1) {
					generateReturnString(returnString, readOnly, fileKey, isOpenFile, template, WORD_TEMPLATE, true, "1");
				}else{
					String state = attach.get(0).getState();
					if(isOpenFile.equals("true"))
						generateReturnString(returnString, readOnly, fileKey, isOpenFile, template, biaodanid, true, state);
					else
						generateReturnString(returnString, readOnly, fileKey, isOpenFile, template, biaodanid, false, state);
						
				}
				//下面代码不需要删除，目前改成上面的模式，即数据库已经存了，就直接打开。
//				if (isOpenFile.equals("false")) { // 打开文件
//					generateReturnString(returnString, readOnly, fileKey, isOpenFile, template, WORD_TEMPLATE, true);
//				}else{
//					if (attach == null || attach.size() < 1) {
//						errCode = 584;// 没有创建文档
//					}else{
//						generateReturnString(returnString, readOnly, fileKey, isOpenFile, template, biaodanid, false);
//					}
//				}
			} else{
				errCode = 581; // Word模板没有定义！
			}
		} else{
			errCode = 582; // 操作没有定义或有误！
		}
		generateOut(response, returnString.toString(), errCode);
	}
	
	private void generateReturnString(StringBuffer returnString, String readOnly, String fileKey, String isOpenFile, WordTemplate template, String biaodanid, boolean generateExt, String state){
		returnString.append("[{");
		returnString.append("\"readOnly\":\"").append(readOnly).append("\",");
		returnString.append("\"fileKey\":\"").append(fileKey).append("\",");
		returnString.append("\"biaodanid\":\"").append(biaodanid).append("\",");
		returnString.append("\"wordTemp\":\"").append(template.getWordTemplateID()).append("\"");
		if(generateExt){
			returnString.append(",\"extJsFun\":\"").append(template.getExtJSFunction()).append("\"");
			returnString.append(",\"field\":\"").append(template.getFieldMapping()).append("\"");
		}else{
			returnString.append(",\"extJsFun\":\"").append("\"");
			returnString.append(",\"field\":\"").append("\"");
		}
		returnString.append(",\"wordStatus\":\"").append(state).append("\"");
		returnString.append("}]");
	}
	
	private void generateOut(HttpServletResponse response, String returnString, int errCode){
		try {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Expires", "0");
			PrintWriter writer = response.getWriter();
			if (errCode == 0) {
				writer.write("{\"status\":\"200\",\"responseText\":" + returnString + "}");
//				response.setStatus(200);
			} else {
				response.setStatus(errCode);
			}
			writer.flush();
			writer.close();
		} catch (IOException e) {
			response.setStatus(500);
		}
	}

	public IAttachHandleUCC getAttachHandleUcc() {
		return attachHandleUcc;
	}

	public void setAttachHandleUcc(IAttachHandleUCC attachHandleUcc) {
		this.attachHandleUcc = attachHandleUcc;
	}

	public WordTemplates getWordtemplates() {
		return wordtemplates;
	}

	public void setWordtemplates(WordTemplates wordtemplates) {
		this.wordtemplates = wordtemplates;
	}

}
