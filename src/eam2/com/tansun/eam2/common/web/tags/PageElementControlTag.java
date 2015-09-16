package com.tansun.eam2.common.web.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.Tag;

import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.dynamicform.web.components.CommonComponentBean;
import com.tansun.rdp4j.dynamicform.web.views.jsp.CommonStruts2Tag;

/**
 * 
 * @author Baitin.Fong
 *
 */
public class PageElementControlTag  extends CommonStruts2Tag {
	
	private static final long serialVersionUID = 3559059698574012296L;
    private String def;

	@Override
	public int doStartTag() throws JspException {
		int rv = super.doStartTag();
		CommonComponentBean ccb = (CommonComponentBean)component;
		String rt = ccb.getRenderType();
		 boolean isAuth = ccb.getAuthByRoleId(UserThreadLocal.get().getUserTid().toString());
		if(rt != null && rt.length() > 0){
			if ("normal".equals(rt) && "N".equals(getDef())) {
				//do nothing
				if(!isAuth){
					rv = Tag.SKIP_BODY;
				}
			}else if ("disable".equals(rt)) {
				rv = Tag.SKIP_BODY;
			}
		}
		return rv;
	}

    public String getDef() {
        return (def == null || def.length() == 0) ? "N" : def;
    }

    public void setDef(String def) {
        this.def = def;
    }

}
