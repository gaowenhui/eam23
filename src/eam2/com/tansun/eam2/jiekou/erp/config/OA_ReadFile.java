package com.tansun.eam2.jiekou.erp.config;

public class OA_ReadFile {

	public String getGbk(String path) {
		try {
			path = path.replaceAll("%20", " ");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return path;
	}
}
