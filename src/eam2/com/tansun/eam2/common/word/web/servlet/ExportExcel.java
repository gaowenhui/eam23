package com.tansun.eam2.common.word.web.servlet;

import java.io.ByteArrayOutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;

import com.tansun.eam2.common.util.BeanUtilsEx;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.utils.ResponseUtil;
import com.tansun.rdp4j.common.web.vo.CommonBO;

@Controller
public class ExportExcel {
	private final static String CONTENT_TYPE = "application/vnd.ms-excel";

	public void export(HttpServletRequest request, HttpServletResponse response) {
		String modelStr = request.getParameter("exportExcelModel");
		String title = request.getParameter("exportExcelTitle");
		String excludeKeys = request.getParameter("exportExcelExcludeKeys");
		String className = request.getParameter("exportExcelPath");
		String params = request.getParameter("exportExcelParams");
		String[] excludes = null;
		try {
			if (modelStr != null)
				modelStr = URLDecoder.decode(modelStr, "UTF-8");
			if (title != null)
				title = URLDecoder.decode(title, "UTF-8");
			if (params != null)
				params = URLDecoder.decode(params, "UTF-8");
			if (excludeKeys != null) {
				excludeKeys = URLDecoder.decode(excludeKeys, "UTF-8");
				excludes = excludeKeys.split(",");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		title = title != null && title.length() > 0 ? title : "数据导出";

		try {
			String dataStr = getDataFromHttp(className, params, request);
			byte[] download = getExcel(modelStr, dataStr, title, excludes);
			ResponseUtil.download(response, download, title + ".xls",
					CONTENT_TYPE);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 设置了一个初始样式。
	 * 
	 * @param modelStr
	 * @param dataStr
	 * @param title
	 * @param excludes
	 * @return
	 * @throws Exception
	 */
	private byte[] getExcel(String modelStr, String dataStr, String title,
			String[] excludes) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		ByteArrayOutputStream bytestream = new ByteArrayOutputStream();

		
		HSSFSheet sheet = wb.createSheet(title);
		JSONObject jsonObject = JSONObject.fromObject(modelStr);
		JSONObject data = JSONObject.fromObject(dataStr);
		if (jsonObject != null) {
			excludeColumn(jsonObject, excludes);
			createHead(wb, sheet, jsonObject);
		}
		if (data != null) {
			JSONArray rows = data.getJSONArray("rows");
			fillData(wb, sheet, rows.toArray(), jsonObject);
			for (int i = 0; i < jsonObject.size(); i++) {
				sheet.autoSizeColumn((short) i);
			}
			sheet.createFreezePane(0, 1);
		}
		wb.write(bytestream);
		bytestream.flush();
		byte[] result = bytestream.toByteArray();
		bytestream.close();
		return result;
	}

	/**
	 * @param sheet
	 * @param rows
	 * @param jsonObject
	 * @throws Exception
	 */
	private void fillData(HSSFWorkbook wb, HSSFSheet sheet, Object[] rows,
			JSONObject jsonObject) throws Exception {
		HSSFCellStyle style = wb.createCellStyle();
		style.setBorderBottom((short) 1);
		style.setBottomBorderColor((short) 8);
		style.setBorderLeft((short) 1);
		style.setLeftBorderColor((short) 8);
		style.setBorderRight((short) 1);
		style.setRightBorderColor((short) 8);
		style.setBorderTop((short) 1);
		style.setTopBorderColor((short) 8);
		HSSFDataFormat format = wb.createDataFormat();   
		style.setDataFormat(format.getFormat("@"));
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 10);
		font.setFontName("simsun");
		style.setFont(font);
		for (int i = 0; i < rows.length; i++) {
			HSSFRow row = sheet.createRow(i + 1);
			short j = 0;
			for (Iterator itr = jsonObject.keys(); itr.hasNext(); j++) {
				String name = (String) itr.next();
				HSSFCell cell = row.createCell(j);
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				Object obj = PropertyUtils.getProperty(rows[i], name);
				if (obj != null) {
					if(obj instanceof java.lang.Double || obj instanceof java.lang.Long || obj instanceof java.lang.Integer){
						BigDecimal   b   =   new   BigDecimal(obj.toString()); 
						obj = b.toPlainString();
					}
					cell.setCellValue(obj.toString());
				}
				cell.setCellStyle(style);
			}
		}

	}

	private void excludeColumn(JSONObject jsonObject, String[] keys) {
		jsonObject.remove("rn");
		jsonObject.remove("cb");
		keys = keys == null ? new String[] {} : keys;
		for (int i = 0; i < keys.length; i++) {
			jsonObject.remove(keys[i]);
		}
	}

	private void createHead(HSSFWorkbook wb, HSSFSheet sheet,
			JSONObject jsonObject) {
		HSSFCellStyle style = wb.createCellStyle();
		style.setFillForegroundColor((short) 23);
		// style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setAlignment((short) 2);
		style.setBorderBottom((short) 1);
		style.setBottomBorderColor((short) 8);
		style.setBorderLeft((short) 1);
		style.setLeftBorderColor((short) 8);
		style.setBorderRight((short) 1);
		style.setRightBorderColor((short) 8);
		style.setBorderTop((short) 1);
		style.setTopBorderColor((short) 8);
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 13);
		font.setFontName("simsun");
		font.setBoldweight((short) 700);
		style.setFont(font);
		HSSFRow row = sheet.createRow(0);
		short i = 0;
		for (Iterator itr = jsonObject.keys(); itr.hasNext(); i++) {
			String name = (String) itr.next();
			HSSFCell cell = row.createCell(i);
			cell.setCellStyle(style);
			cell.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(jsonObject.getString(name).toString());
		}
	}

	private String getDataFromHttp(String url, String params, HttpServletRequest request) throws Exception{
	// HttpClient hc = new DefaultHttpClient();
	// HttpPost post = new HttpPost(url);
	// ResponseHandler<String> responseHandler = new BasicResponseHandler();
	// post.setHeader("Cookie", "JSESSIONID=" + request.getSession().getId());
	// UrlEncodedFormEntity entity = new UrlEncodedFormEntity(getParams(params),
	// "UTF-8");
	// post.setEntity(entity);
	// hc.getParams().setParameter(CoreProtocolPNames.HTTP_CONTENT_CHARSET,
	// "UTF-8");
	// String responseBody = hc.execute(post, responseHandler);
	// hc.getConnectionManager().shutdown();
	// responseBody = new String(responseBody.getBytes("iso8859-1"),"UTF-8");
	// return responseBody;
//		HttpClient httpClient = new HttpClient();
//		PostMethod postMethod = new PostMethod(url);
//		postMethod.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");//设置传输字符集，如果需要传输中文这需要设置为中文字符集
//
//		 // 设置 HTTPClient 为 Cookie 兼容模式
//		postMethod.getParams().setParameter(HttpMethodParams.SINGLE_COOKIE_HEADER, true);
//
//		//从 request 得到所有需要传输的 cookie 
//		Cookie[] questCookie =httpClient.getState().getCookies();
//		 if (questCookie.length > 0) {
//			// 把 Cookie 加到 httpclient 中
//			httpClient.getState().addCookies(questCookie); 
//		 }		 
//		String cookie ="JSESSIONID=" + request.getSession().getId();
//
//		postMethod.setRequestHeader("Cookie",cookie);
//		List list=getParams(params);
//		NameValuePair[] data=(NameValuePair[])list.toArray(new NameValuePair[] {});  
//		postMethod.setRequestBody(data);
//		// 执行postMethod
//		int statusCode = httpClient.executeMethod(postMethod);
//		if (statusCode == HttpStatus.SC_MOVED_PERMANENTLY || 
//				statusCode == HttpStatus.SC_MOVED_TEMPORARILY) {
//				// 从头中取出转向的地址
//				Header locationHeader = postMethod.getResponseHeader("location");
//				String location = null;
//				if (locationHeader != null) {
//					location = locationHeader.getValue();
//					System.out.println("The page was redirected to:" + location);
//				} else {
//					System.err.println("Location field value is null.");
//				}
//
//		} 
//		String responseBody= postMethod.getResponseBodyAsString();
//		responseBody = new String(responseBody.getBytes("iso8859-1"),"UTF-8");
//		return responseBody;
	 String[] arr=url.split("&");
	 if(arr.length<2){
		 throw new Exception ("不合法的路径");
	 }
	 String className=arr[0];
	 String paramClassName=arr[1];
	 String pageClassName=Paginator.class.getName();
	 Class clazz = Class.forName(className);
	 if (IExport.class.isAssignableFrom(clazz)) {
		 Object obj = clazz.newInstance();
		 IExport export=(IExport)obj;
		 if(arr.length>2)pageClassName=arr[2];
		 Object[] objects=getParamObject(params,paramClassName,pageClassName);
		 if(objects.length>1){
			 export.setExcelVO((CommonBO)objects[0]);
			 //PropertyUtils.setProperty(obj, "queryVO", (CommonBO)objects[0]);
			 export.setPaginator((Paginator)objects[1]);
			 //PropertyUtils.setProperty(obj, "paginator", objects[1]);
			 return export.exportexcel();
		 }
		 
	 }else{
		throw new Exception ("不合法的类名");
	 }
		
	 return "";
	}
	
	private Object[] getParamObject(String params,String paramClassName,String pageClassName)throws Exception{
		if (params != null) {
			Class clazz = Class.forName(paramClassName);
			Object param = clazz.newInstance();
			clazz = Class.forName(pageClassName);
			Object page = clazz.newInstance();
			String cp = "0";
			String ps = "" + Integer.MAX_VALUE;
			JSONObject data = JSONObject.fromObject(params);
			Map map=new HashMap();
			for (Iterator iterator = data.keys(); iterator.hasNext();) {
				String name = (String) iterator.next();
				if (name.equals("paginator.currentPage")) {
					cp = data.getString(name);
					PropertyUtils.setProperty(page, "currentPage", Integer.parseInt(cp));

				} else if (name.equals("paginator.pageSize")) {
					ps = data.getString(name);
					PropertyUtils.setProperty(page, "pageSize", Integer.parseInt(ps));
				} else {
					String temp=name;
					temp=temp.replace('.','&').split("&")[1];
//					PropertyUtils.setProperty(param, temp, data.getString(name));	
					map.put(temp, data.getString(name));
					
				}
			}
			BeanUtilsEx.copyProperties(param,map);
//			BeanUtils.copyProperties(param,map);
//			PropertyUtils.copyProperties(param, map); 
			return new Object[]{param,page};
		}
		return new Object[]{};
		
	}
	private List<NameValuePair> getParams(String params) {
		List<NameValuePair> formparams = new ArrayList<NameValuePair>();
		String cp = "0";
		String ps = "" + Integer.MAX_VALUE;
		if (params != null) {
			JSONObject data = JSONObject.fromObject(params);
			for (Iterator iterator = data.keys(); iterator.hasNext();) {
				String name = (String) iterator.next();
				if (name.equals("paginator.currentPage")) {
					cp = data.getString(name);
				} else if (name.equals("paginator.pageSize")) {
					ps = data.getString(name);
				} else {
					NameValuePair nv = new NameValuePair(name, data
							.getString(name));
					formparams.add(nv);
				}
			}
		}
		NameValuePair currentPage = new NameValuePair(
				"paginator.currentPage", cp);
		NameValuePair pageSize = new NameValuePair("paginator.pageSize",
				ps);
		formparams.add(currentPage);
		formparams.add(pageSize);
		return formparams;
	}

}
