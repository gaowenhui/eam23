package com.tansun.eam2.jiekou.erp.action;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.model.orm.bo.JyzcHead;
import com.tansun.eam2.jygdzc.service.IAssetBS;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class ERPZcQuequanAction extends CommonAction{
	@Autowired
	private PublicDao dao;
	@Autowired
	public IAssetBS assetBSImpl;
	public String requestExecute() { 
		String ErpMessage = "";//发送erp后返回消息
		try {
			String headId = request.getParameter("headId");
			JyzcHead pojo = (JyzcHead) assetBSImpl.findById(JyzcHead.class, headId);
			ErpMessage = Comment_SxSpd.Comment_zc(dao,pojo,this.request,assetBSImpl);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(ErpMessage);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
