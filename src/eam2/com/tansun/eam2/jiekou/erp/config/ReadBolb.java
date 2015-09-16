package com.tansun.eam2.jiekou.erp.config;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ReadBolb {
	
	private static Map<String, String> readfilepath;
	private static Map<String, String> readloadpath;
	public static Map<String, String> getReadfilepath() {
		return readfilepath;
	}
	public void setReadfilepath(Map<String, String> readfilepath) {
		ReadBolb.readfilepath = readfilepath;
	}
	public static Map<String, String> getReadloadpath() {
		return readloadpath;
	}
	public void setReadloadpath(Map<String, String> readloadpath) {
		ReadBolb.readloadpath = readloadpath;
	}
	

	
//	public static Map<String, String> readfilepath() {
//
//		Map map = new HashMap();
//		try {
//			String pathst = ReadBolb.class.getClassLoader().getResource("")
//					.getPath();
//			if (pathst.indexOf("WebSphere") > 0) {
//				pathst = new OA_ReadFile().getGbk(pathst);
//				pathst = pathst.substring(1, pathst.length() - 11)
//						+ "installedApps/"
//						+ gethostname()
//						+ "Node01Cell/simpleWF_war.ear/simpleWF.war/AttachmentManagement.properties";
//			} else {
//				pathst = pathst.substring(1, pathst.length() - 16)
//						+ "AttachmentManagement.properties";
//				pathst = new OA_ReadFile().getGbk(pathst);
//			}
//
//			InputStream in = new BufferedInputStream(
//					new FileInputStream(pathst));
//
//			Properties ps = new Properties();
//			ps.load(in);
//			map.put("url", ps.get("url"));
//			map.put("driver", ps.get("driver"));
//			map.put("username", ps.get("username"));
//			map.put("password", ps.get("password"));
//			map.put("esb", ps.get("esb"));
//			map.put("file4CardExcel", ps.get("file4CardExcel"));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return map;
//	}
//	
//	public static String gethostname() {
//		try {
//			String s[] = InetAddress.getLocalHost().toString().split("/");
//			return s[0];
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "";
//		}
//	}
//	
//	public static Map readloadpath() {
//
//		Map map = new HashMap();
//		try {
//			String pathst = ReadBolb.class.getClassLoader().getResource("")
//					.getPath();
//			if (pathst.indexOf("WebSphere") > 0) {
//				pathst = new OA_ReadFile().getGbk(pathst);
//				pathst = pathst.substring(1, pathst.length() - 11)
//						+ "installedApps/"
//						+ gethostname()
//						+ "Node01Cell/simpleWF_war.ear/simpleWF.war/dateload.properties";
//			} else {
//				pathst = pathst.substring(1, pathst.length() - 16)
//						+ "dataload.properties";
//				pathst = new OA_ReadFile().getGbk(pathst);
//			}
//			InputStream in = new BufferedInputStream(
//					new FileInputStream(pathst));
//			Properties ps = new Properties();
//			ps.load(in);
//			map.put("url", ps.get("url"));
//			map.put("driver", ps.get("driver"));
//			map.put("username", ps.get("username"));
//			map.put("password", ps.get("password"));
//			map.put("rarFileName", ps.get("rarFileName"));
//			map.put("unrarPath", ps.get("unrarPath"));
//			map.put("ctl", ps.get("ctl"));
//			map.put("unrarCmd", ps.get("unrarCmd"));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return map;
//	}
}
