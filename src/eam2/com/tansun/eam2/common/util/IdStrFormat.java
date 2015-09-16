package com.tansun.eam2.common.util;

import org.apache.commons.lang.StringUtils;

public class IdStrFormat {

	/**
	 * 格式化id字符串 
	 * @param ids gr字符串 如:3434,343,343 或 ,345,345,345
	 * @return	'345','345','345'
	 */
	public static String formatIds(String ids){
		if(StringUtils.isEmpty(ids)){
			return "";
		}
		if(StringUtils.isEmpty(ids.split(",")[0].trim())){
			ids = ids.trim();
			ids = ids.substring(1);
		}
		ids = "'" + ids.replaceAll(",", "','") + "'";
		return ids;
	}
}
