package com.tansun.eam2.common.web.tags;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.util.SpringContextHelper;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.dynamicform.web.components.CommonComponentBean;
import com.tansun.rdp4j.dynamicform.web.views.jsp.CommonStruts2Tag;
import com.tansun.rdp4j.file.FileCommon;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;

public class FileButtonTag extends CommonStruts2Tag implements
		ServletRequestAware, ServletContextAware, FileCommon {
	private static final long serialVersionUID = 1L;
	private static HttpServletRequest request;
	private ServletContext application;
	private ServletContext context;
	private String biaodanId;
	private String fjlx;
	private String isview;
	private String isSingle;
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new FileButton(arg0, arg1, arg2);
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setServletContext(ServletContext context) {
		this.context = context;
	}
	protected void populateParams() {
		super.populateParams();
		FileButton FileButton = (FileButton) component;
		FileButton.setBiaodanId(biaodanId);
		FileButton.setFjlx(fjlx);
		FileButton.setIsSingle(isSingle);
		FileButton.setIsview(isview);
	}
	public String getBiaodanId() {
		return biaodanId;
	}

	public void setBiaodanId(String biaodanId) {
		this.biaodanId = biaodanId;
	}

	public String getFjlx() {
		return fjlx;
	}

	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}

	public String getIsview() {
		return isview;
	}

	public void setIsview(String isview) {
		this.isview = isview;
	}

	public String getIsSingle() {
		return isSingle;
	}

	public void setIsSingle(String isSingle) {
		this.isSingle = isSingle;
	}
}

class FileButton extends CommonComponentBean {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String biaodanId;
	private String fjlx;
	private String isview;
	private String isSingle;
	public FileButton(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack, request);
		this.request = request;
		this.response = response;
	}
	@Override
	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		StringBuffer stringbuffer = new StringBuffer();
		List<PTAttachment> list = queryAttachment(getBiandanID(biaodanId),
				fjlx);
		stringbuffer.append("\n<!---=====================文件上传控件开始============================================-->");
		stringbuffer.append("\n<!---=====================表单ID:"+getBiandanID(biaodanId)+"=====================-->");
		StringBuffer str = new StringBuffer();
		//System.out.println("=从控制文件查询状态信息：===="+getRenderType()+"=====");
		for (PTAttachment pTAttachment : list) {
			String title = pTAttachment.getYwjm();
			String uuid = pTAttachment.getId();
			String url1 = "/eam2/file/file_download.do?id="
					+ pTAttachment.getId();
			String url2 = "/eam2/file/file_deleAttach.do?id="
					+ pTAttachment.getId();
			if("readonly".equals(getRenderType())||"disable".equals(getRenderType())){
				str.append("<tr id='" + uuid + "'> <td>" + title
						+ " </td><td><a href='" + url1
						+ "' id='downfilebutton' >下载</a> </td><td id='del" + uuid
						+ "'>&nbsp;</td> </tr>");
			}else{
				str.append("<tr id='" + uuid + "'> <td>" + title
						+ " </td><td><a href='" + url1
						+ "' id='downfilebutton' >下载</a> </td><td id='del" + uuid
						+ "'><a href=javascript:deleteFileAttachment_"+fjlx+"('" + url2
						+ "','" + uuid + "') id='deletefilebutton'>删除</a></td> </tr>");
			}
			
		}
		
		stringbuffer.append("\n<script type=\"text/javascript\">");
		stringbuffer.append("\nfunction setUrlValue_"+fjlx+"(url1,url2,title, uuid){");
		stringbuffer
				.append("\n$(\"#urlsFile_"+fjlx+"\").append(\"<tr id='\" + uuid + \"'> <td>\"+title+\" </td><td><a href='\"+url1+\"' id='downfilebutton' >下载</a> </td><td id='del\"+uuid+\"'><a href=javascript:deleteFileAttachment_"+fjlx+"('\"+url2+\"','\" + uuid + \"')  id='deletefilebutton'>删除</a> </td> </tr>\");");
		stringbuffer.append("\n}");
		stringbuffer.append("\nfunction deleteFileAttachment_"+fjlx+"(fileurl,uuid){");
		stringbuffer.append("\n	if(confirm('确定删除附件?')){");
		stringbuffer.append("\n	$.post(fileurl,{}, function(data){");
		stringbuffer
				.append("\n	$(\"#\" + uuid).remove();$(\"#uploadbt_"+fjlx+"\").show();");
		stringbuffer.append("\n	});");
		stringbuffer.append("\n}}");
		stringbuffer.append("\nfunction addOneFile_"+fjlx+"(){");
		stringbuffer.append("\n	var rdBasicWidth = \"400px\";");
		stringbuffer.append("\n	var rdBasicHeight = \"100px\";");
		stringbuffer
				.append("\n	var _g_privateDialogFeatures = \"status=no;center=yes;help=no;dialogWidth=\"+rdBasicWidth+\";dialogHeight=\"+rdBasicHeight+\";scroll=yes;resize=yes\";");
		stringbuffer.append("\n	var x=(screen.width-800)/2; ");
		stringbuffer.append("\n	var y=(screen.height-400)/2;");
		stringbuffer
				.append("\n	window.open('/eam2/file/file_selectOnefile.do?type="
						+ fjlx
						+ "&bdid="
						+ getBiandanID(biaodanId)
						+ "','','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');");
		stringbuffer.append("\n}");
		stringbuffer.append("\n");
		stringbuffer.append("\nfunction del_hidden_"+fjlx+"(uuid){");
		stringbuffer.append("\n	$(\"#del\" + uuid).remove();");
		stringbuffer.append("\n}");
		stringbuffer.append("\n</script>");
		if("readonly".equals(getRenderType())||"disable".equals(getRenderType())){
			stringbuffer
			.append("<input type='hidden' name='url1' value=''><input type='button' value='上传' id='uploadbt_"+fjlx+"' disabled='disabled'  onclick=alert('当前附件处于只读状态') ><table id='urlsFile_"+fjlx+"'></table>");
			
		}else{
			
			stringbuffer
			.append("<input type='hidden' name='url1' value=''><input type='button' value='上传' id='uploadbt_"+fjlx+"' onclick='addOneFile_"+fjlx+"()' ><table id='urlsFile_"+fjlx+"'></table>");
	
		}
		stringbuffer
				.append("<SCRIPT type='text/JavaScript'>$(\"#urlsFile_"+fjlx+"\").append(\""
						+ str + "\")</SCRIPT>");
		stringbuffer
				.append("<SCRIPT type='text/JavaScript'>function removebt_"+fjlx+"(){$(\"#uploadbt_"+fjlx+"\").hide();}</SCRIPT>");
		if ("N".equals(isview) && isview != null) {
			stringbuffer
					.append("<SCRIPT type='text/JavaScript'>$(\"#uploadbt_"+fjlx+"\").remove();</SCRIPT>");
		}

		if (list.size() >= 1&&"Y".equals(isSingle)) {
			stringbuffer
					.append("<SCRIPT type='text/JavaScript'>$(\"#uploadbt_"+fjlx+"\").hide();</SCRIPT>");

		}
		
		stringbuffer.append("\n<!---=====================文件上传控件结束============================================-->");
		
		try {
			writer.write(stringbuffer.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<PTAttachment> queryAttachment(String bdid, String fjlx) {
		List params = new ArrayList();
		PublicDao publicDao = (PublicDao) SpringContextHelper
				.getBean("publicDao");
		
		params.add(getBiandanID(bdid));
		params.add(fjlx);
		//System.out.println("bdid" + getBiandanID(bdid));
		//System.out.println("fjlx" + fjlx);

		List<PTAttachment> returnList = (List<PTAttachment>) publicDao
				.find(
						"from PTAttachment t where t.bdid= ? and t.fjlx=?  order by to_number(sortid) asc ,scsj desc  ",
						params);

		if (returnList == null) {
			return null;
		}
		return returnList;

	}

	public String getBiaodanId() {
		return biaodanId;
	}

	public void setBiaodanId(String biaodanId) {
		this.biaodanId = biaodanId;
	}

	public String getFjlx() {
		return fjlx;
	}

	public void setFjlx(String fjlx) {
		this.fjlx = fjlx;
	}

	public String getIsview() {
		return isview;
	}

	public void setIsview(String isview) {
		this.isview = isview;
	}

	public String getIsSingle() {
		return isSingle;
	}

	public void setIsSingle(String isSingle) {
		this.isSingle = isSingle;
	}

	public String getBiandanID(String biaodanid) {
		if (biaodanid != null && biaodanid.length() != 0) {
			String n = biaodanid;
			if (biaodanid.startsWith("%{") && biaodanid.endsWith("}")) {
				n = stack.findString(biaodanid.substring(2,
						biaodanid.length() - 1));
			
			} else {
				n = stack.findString(biaodanid);
			}
			if (n == null || n.length() == 0) {
				n = biaodanid;
			}
			return n;
		}
		
		return biaodanid;
	}
}