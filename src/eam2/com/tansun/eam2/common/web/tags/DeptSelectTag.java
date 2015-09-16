package com.tansun.eam2.common.web.tags;

//<r:userhidden id='ww' name='xx'/>
import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.util.ServletContextAware;
import org.apache.struts2.views.jsp.ComponentTagSupport;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.vo.DeptVO;

public class DeptSelectTag extends ComponentTagSupport implements
		ServletRequestAware, ServletContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static HttpServletRequest request;

	private ServletContext application;

	private ServletContext context;
	
	private String width;
	private String style;

	PublicDao publicDao;

	@Override
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new DeptSelect(arg0, arg1, arg2);
		
	}
	


	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	protected void populateParams() {
		super.populateParams();
		DeptSelect deptSelect = (DeptSelect) component;
		deptSelect.setStyle(style);
		deptSelect.setWidth(width);

	}

	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}
}

class DeptSelect extends Component {
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	private String width;
	private String style;

	public DeptSelect(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack);
		this.request = request;
		this.response = response;
	}

	@Override
	public boolean start(Writer writer) {
		boolean result = super.start(writer);

		StringBuffer stringbuffer = new StringBuffer();

		List<DeptVO> list = UserThreadLocal.get().getDeptList();
		if (list.size() == 0) {

			stringbuffer
					.append("<input type='hidden' name='workflow_deptid' width='"+width+"' class='"+style+"' value='9999' >未分配部门");
		} else if (list.size() == 1) {
			DeptVO dept = list.get(0);
			stringbuffer
					.append("<input type='hidden' readonly ='true'  width='"+width+"' class='"+style+"'  name='workflow_deptid' value='"
							+ dept.getTid()
							+

							"' ><input type='text' readonly ='true' name='workflow_deptname'  width='"+width+"' class='"+style+"'  value='"
							+ dept.getDeptName() +

							"' >");
		} else {
			stringbuffer.append("<select name='workflow_deptid' >");
			for (DeptVO dept : list) {
				stringbuffer.append("<option value='" + dept.getTid() + "'>"
						+ dept.getDeptName() + "</option>");
			}
			stringbuffer.append("</select>");
		}
		try {
			writer.write(stringbuffer.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}