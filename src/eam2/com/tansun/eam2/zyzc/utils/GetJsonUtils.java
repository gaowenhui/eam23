package com.tansun.eam2.zyzc.utils;

import java.io.IOException;
import java.util.List;

import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class GetJsonUtils extends CommonAction {
	/**
	 * 传进去一个List，转换成JSON字符串并显示
	 * @param <T>
	 * @param VOList 继承CommonBo类的List
	 * @return
	 */
	public <T> String displayJSonString(List<T> VOList, Paginator paginator){
		String josnStr = BodyListToJSON.getJSON(VOList, paginator.getPageCount(), 
				paginator.getCurrentPage(), paginator.getCount());
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 把VOList转换成Json字符串之后返回
	 * @param <T>
	 * @param VOList 继承CommonBo类的List
	 * @return
	 */
	public <T> String displayJSonString(List<T> VOList){
		String josnStr = BodyListToJSON.getJSON(VOList, 1, 1, 10000);
		try {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(josnStr);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
