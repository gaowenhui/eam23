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
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.web.vo.DeptVO;

public class UserHiddenTag extends ComponentTagSupport implements
		ServletRequestAware, ServletContextAware {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private static HttpServletRequest request;

	private ServletContext application;

	private ServletContext context;

	PublicDao publicDao;

	private String width;
	private String style;
	private String view;
	private String name;
	private String id;

	@Override
	public Component getBean(ValueStack arg0, HttpServletRequest arg1,
			HttpServletResponse arg2) {
		return new UserHidden(arg0, arg1, arg2);
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletContext(ServletContext context) {
		this.context = context;
	}

	protected void populateParams() {
		super.populateParams();
		UserHidden UserHidden = (UserHidden) component;
		UserHidden.setStyle(style);
		UserHidden.setWidth(width);
		UserHidden.setView(view);
		UserHidden.setId(id);
		UserHidden.setName(name);

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
}

class UserHidden extends Component {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private String width;
	private String style;
	private String id;
	private String name;
	private String view;

	public UserHidden(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack);
		this.request = request;
		this.response = response;
	}

	@Override
	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		StringBuffer stringbuffer = new StringBuffer();
		UserThreadLocal.get().getUsername();

		if ("Y".equals(view)) {
			stringbuffer.append("<input type='text'  id='"
					+ ((id == null || "".equals(id)) ? (name == null || ""
							.equals(name)) ? "userid" : name : id)
					+ "' name='"
					+ ((name == null || "".equals(name)) ? (id == null || ""
							.equals(id)) ? "userid" : id : name) + "'  "
					+ ((width == null) ? "" : "width='" + width + "'") + "   "
					+ ((style == null) ? "" : style) + "  value='"
					+ UserThreadLocal.get().getUsername() + "'><input type='hidden' name='username_hidden' id='username_hidden' value='"
					+ UserThreadLocal.get().getUsername() + "'>");
		} else {
			stringbuffer.append("<input type='hidden' id='"
					+ ((id == null || "".equals(id)) ? (name == null || ""
							.equals(name)) ? "userid" : name : id)
					+ "' name='"
					+ ((name == null || "".equals(name)) ? (id == null || ""
							.equals(id)) ? "userid" : id : name) + "'  "
					+ ((width == null) ? "" : "width='" + width + "'")
					+ "     " + ((style == null) ? "" : style) + "    value='"
					+ UserThreadLocal.get().getUserTid() + "'><input type='hidden' name='username_hidden'  id='username_hidden'  value='"
					+ UserThreadLocal.get().getUsername() + "'>");
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

}