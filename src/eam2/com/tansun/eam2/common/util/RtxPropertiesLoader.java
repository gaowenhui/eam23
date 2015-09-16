/**
 * RtxPropertiesLoader.java
 * com.tansun.eam2.common.util
 *
 * Mar 16, 2011
 * iu987
*/

package com.tansun.eam2.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;

/**
 * ClassName:RtxPropertiesLoade
 * TODO  rtx参数文件读取 使用单例模式 保证只读取一次
 *
 * @author   iu987
 * @version  Ver 1.1    
 *
 * @CreatDate Mar 16, 2011 10:25:22 AM
 *  ver     date      		author
 * ──────────────────────────────────
 *   		 Mar 16, 2011 iu987
 *
 *	
 *
 * Copyright (c) 2011, tansun All Rights Reserved.
 * @see 	 
 */
public class RtxPropertiesLoader {
	
	private Logger logger = Logger.getLogger(RtxPropertiesLoader.class);
	
	private String serverIP = "127.0.0.1";
	private Integer serverPort = 6000;
	
	private static RtxPropertiesLoader instance = new RtxPropertiesLoader();
	
	public RtxPropertiesLoader(){
		InputStream in = RtxPropertiesLoader.class.getResourceAsStream("/properties/rtx.properties");
		Properties p = new Properties();
		try {
			p.load(in);
			
			String ip = p.getProperty("ServerIP");
			String port = p.getProperty("ServerPort");
			System.out.println(ip);
			System.out.println(port);
			
			if(StringUtils.isNotBlank(ip)){
				System.out.println("init rtx ip " + ip);
				serverIP = ip;
			}
			
			if(StringUtils.isNotBlank(port) && NumberUtils.isNumber(port)){
				System.out.println("init rtx port " + port);
				serverPort = Integer.valueOf(port);
			}
			
			
		} catch (IOException e) {
			logger.info("load rtx.properties fail!", e);
			e.printStackTrace();
		}
	}
	
	public static RtxPropertiesLoader getInstance(){
		if(instance == null){
			instance = new RtxPropertiesLoader();
		}
		return instance;
	}
	
//	static {
//		try {
//			URL url = ClassLoader.getSystemResource("rtx.properties");
//			System.out.println(url);
//			
////			InputStream in = ClassLoader
////					.getSystemResourceAsStream("rtx.properties");
////			Properties p = new Properties();
////			p.load(in);
////			String IP = p.getProperty("ServerIP");
////			String port = p.getProperty("ServerPort");
////			
////			if(StringUtils.isNotBlank(IP)){
////				serverIP = IP;
////			}
////			
////			if(StringUtils.isNotBlank(port) && StringUtils.isNumeric(port)){
////				serverPort = Integer.valueOf(port);
////			}
//		} catch (Exception e) {
//			logger.error("load rtx.properties fail!", e);
//		}
//	}
	
	public static void main(String[] args){
//		InputStream in = ClassLoader
//		.getSystemResourceAsStream("rtx.properties");
//		Properties p = new Properties();
//		try {
//			p.load(in);
//			
//			System.out.println(p.getProperty("ServerIP"));
//		} catch (IOException e) {
//			
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			
//		}
	}

	public String getServerIP() {
		return serverIP;
	}

	public void setServerIP(String serverIP) {
		this.serverIP = serverIP;
	}

	public Integer getServerPort() {
		return serverPort;
	}

	public void setServerPort(Integer serverPort) {
		this.serverPort = serverPort;
	}

}

