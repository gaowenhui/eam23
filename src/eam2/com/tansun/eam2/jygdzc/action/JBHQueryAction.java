package com.tansun.eam2.jygdzc.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class JBHQueryAction  extends CommonAction {
	@Autowired
	public IAssetUCC assetUCCImpl;
	public String jbhQuery(){
		
		String sheng = request.getParameter("sheng");
		String jbhJSON = assetUCCImpl.jbhQuery(sheng);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(jbhJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
