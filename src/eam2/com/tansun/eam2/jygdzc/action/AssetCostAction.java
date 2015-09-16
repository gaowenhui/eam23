package com.tansun.eam2.jygdzc.action;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.vo.JyzcSqsdfyXxVo;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.web.action.CommonAction;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public class AssetCostAction extends CommonAction {
	public String zcId;
	 @Autowired
	 public IAssetUCC assetUCCImpl;
	public String query4View() throws IOException {

		List<JyzcSqsdfyXxVo> list = assetUCCImpl.getJyzcSqsdfyXxByZcId(zcId);
		CommonBO[] cb = new CommonBO[list.size()];
		list.toArray(cb);
		System.out.println(list.size());
		String bodyJSON = BodyListToJSON.getJSON(cb, 2, 1, 24);
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().print(bodyJSON);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
