package com.tansun.eam2.jiekou.erp.action;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.SessionFactoryUtils;

import com.tansun.eam2.jiekou.erp.config.ReadBolb;
import com.tansun.eam2.jiekou.erp.model.bo.ErpDateinfo;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 更新ERP卡片价值信息定时器
 * @author lantb
 *根据一期相关代码复制更改
 */
public class Dataload {
	@Autowired
	private PublicDao dao;
	
	String tablename = "";
	String unrarCmd = "";
	String rarFileName = "";
	String unrarPath = "";
	String ctl = "";
	String filepath = "";

	public String getUnrarFileName() {
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Date begin = null;
		String state = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Map map = ReadBolb.getReadloadpath();
//			Class.forName(map.get("driver").toString());
			conn = dao.getJdbcTemplate().getDataSource().getConnection();
			System.out.println("Dataload - getUnrarFileName - getConnection()");
			String sql = "select   startdate  from  erp.erp_eam_load  t where   result='0' order by t.startdate asc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				begin = rs.getDate("startdate");
				// long DAY = 24L * 60L * 60L * 1000L;
				Date now = new Date();
				String beginday = daychangestr(begin);
				String nowday = daychangestr(now);
				int j = runday(beginday, nowday);
				Date day1 = df.parse(beginday);
				Date day2 = df.parse(nowday);
				Calendar cal2 = Calendar.getInstance();
				cal2.setTime(day2);// 当前系统日期
				// cal2.set(Calendar.DAY_OF_YEAR, -1);
				Calendar cal = Calendar.getInstance();
				cal.setTime(day1);// 上次导入日期
				for (int i = 0; i < j; i++) {
					if (cal.before(cal2)) {
						if (runtime(cal)) {
							state = df.format(cal.getTime()) + "日的数据包导入成功！";
							String begindate = df.format(cal.getTime());
							String updatesql = "update  erp.erp_eam_load   set  result='1'  where startdate=to_date('"
									+ begindate + "','yyyy-mm-dd')";
							stmt = conn.createStatement();
							stmt.executeUpdate(updatesql);
						} else {
							state = df.format(cal.getTime()) + "日的数据包导入失败！";
							stmt.close();
							//conn.close();
							System.out.println("Dataload - getUnrarFileName - closeConnection()");
							return state;
						}
					}
					cal.add(Calendar.DAY_OF_MONTH, 1);
				}
			} else {
				Date now = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				cal.add(Calendar.DAY_OF_MONTH, -1);
				String rundate = df.format(cal.getTime());
				String selectsql = "select  w.rundate from erp.erp_eam_day w  where w.rundate='"
						+ rundate + "'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(selectsql);
				if (!rs.next()) {
					String jlsql = "insert into erp.erp_eam_day(rundate,checknum)  values('"
							+ rundate + "','1')";
					stmt = conn.createStatement();
					stmt.execute(jlsql);
					runtime(cal);
				}
			}
			stmt.close();
	//		conn.close();
			System.out.println("Dataload - getUnrarFileName - closeConnection()");

		} catch (Exception ex) {
			ex.printStackTrace();
		}finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt!=null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
//			if(conn!=null){
//				try {
//					conn.close();
//				} catch (SQLException e) {
//					e.printStackTrace();
//				}
//			}
		}
//		System.out.println("getUnrarFileName+++ true");
		return state;
	}

	@SuppressWarnings("unchecked")
	public boolean runtime(Calendar cal) {
		try {
			Map map = ReadBolb.getReadloadpath();
			rarFileName = map.get("rarFileName").toString();
			unrarPath 	= map.get("unrarPath").toString();
			ctl 		= map.get("ctl").toString();
			unrarCmd	= map.get("unrarCmd").toString();
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
			String filename = dateFormat.format(cal.getTime()) + ".rar";
			filepath = rarFileName + "\\" + filename;
			File f = new File(filepath);
			if (!f.exists()) {
				ErpDateinfo info = new ErpDateinfo();
				info.setTablename(filepath);
				info.setInfo("ERP没有推送过来数据");
				info.setState("1");
				info.setResult("no");
				info.setErrordate(dateFormat.format(cal.getTime()));
				dao.save(info);
				return false;
			} else {
				ErpDateinfo info = new ErpDateinfo();
				info.setTablename(filepath);
				info.setInfo("ERP正确推送过来数据");
				info.setState("1");
				info.setResult("yes");
				info.setErrordate(dateFormat.format(cal.getTime()));
				dao.save(info);
				if (!unRARFile(rarFileName + "\\" + filename, filename)) {
//					System.out.println("false+runtime");
					return false;
				}
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("true+runtime");
		return true;
	}

	public boolean unRARFile(String nuRarFileName, String unRARdataFileName) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		File file = new File(unrarPath);
		if (!file.exists())
			file.mkdir();
		unrarCmd += " " + nuRarFileName + " " + unrarPath;
		File erpfile = new File(unrarPath + "\\ODS_ERPF_DATA");
		if (erpfile.exists()) {
			try {
				delAll(erpfile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		try {
			Runtime rt = Runtime.getRuntime();
			Process process = rt.exec(unrarCmd);
			StringBuffer sb = new StringBuffer();
			java.io.InputStream fis = process.getInputStream();
			int value = 0;
			while ((value = fis.read()) != -1) {
				sb.append((char) value);
			}
			fis.close();
			String result = new String(sb.toString().getBytes("ISO-8859-1"),
					"GBK");
			if (result.indexOf("全部成功") < 0 && result.indexOf("全部OK") < 0) {
				delAll(file);
				ErpDateinfo info = new ErpDateinfo();
				info.setTablename(filepath);
				info.setInfo("文件解压缩失败");
				info.setState("2");
				info.setResult("no");
				info.setErrordate(dateFormat.format(new Date()));
//				System.out.println(unRARdataFileName + "解压失败!");
				return false;
			} else {
//				System.out.println(unRARdataFileName + "解压完毕!");
				ErpDateinfo info = new ErpDateinfo();
				info.setTablename(filepath);
				info.setInfo("文件解压缩成功");
				info.setState("2");
				info.setResult("yes");
				info.setErrordate(dateFormat.format(new Date()));
				dao.save(info);
				/*
				 * File cardhistoryFile = getHistoryFileName(new File(unrarPath +
				 * "\\ODS_ERPF_DATA")); String newFileName =
				 * cardhistoryFile.getName().split("\\.")[1]; if(null !=
				 * cardhistoryFile)
				 * copyFile(cardhistoryFile.getAbsolutePath(),cardhistoryFile.getParent()+"\\eam_cardhistory."+newFileName);
				 */

			}
			String[] string = new String[] { "fa_cardhistory", "fa_card",
					"arap_djfb", "arap_djlx", "arap_djzb", "arap_item",
					"arap_item_b", "bd_accid", "bd_balatype", "bd_busitype",
					"bd_corp", "bd_costsubj", "bd_cubasdoc", "bd_currtype",
					"bd_deptdoc", "bd_invbasdoc", "bd_jobbasfil",
					"bd_jobphase", "bd_payterm", "bd_psndoc", "bd_subjtype",
					"fa_addreducestyle", "fa_alterreason", "fa_altersheet",
					"fa_assetreduce", "fa_bill", "fa_bill_b", "fa_carditem",
					"fa_cardsub", "fa_category", "fa_deptscale", "fa_evaluate",
					"fa_evaluatebody", "fa_predevaluate", "sm_user" };
			List<String> dataFileName = new ArrayList<String>();
			for (String name : string) {
				dataFileName.add(name);
			}
			List<String> dataFileNameList = new ArrayList<String>();
			List<String> datalist = fileName(erpfile);
			for (String str : datalist) {
				dataFileNameList.add(str.substring(0, str.indexOf(".xml")));
			}
			if (dataFileNameList.containsAll(dataFileName)) {
				ErpDateinfo info = new ErpDateinfo();
				info.setTablename(filepath);
				info.setInfo("表数量检查正确");
				info.setState("3");
				info.setResult("yes");
				info.setErrordate(dateFormat.format(new Date()));
				dao.save(info);
				validate();
				ErpDateinfo info1 = new ErpDateinfo();
				info1.setTablename(filepath);
				info1.setInfo("控制文件改名成功");
				info1.setState("4");
				info1.setResult("yes");
				info1.setErrordate(dateFormat.format(new Date()));
				dao.save(info1);
				doCall();
				ErpDateinfo info2 = new ErpDateinfo();
				info2.setTablename(filepath);
				info2.setInfo("程序同步完成");
				info2.setState("5");
				info2.setResult("yes");
				info2.setErrordate(dateFormat.format(new Date()));
				dao.save(info2);
			} else {
				for (String str : dataFileName) {
					tablename += str + ",";
					ErpDateinfo info = new ErpDateinfo();
					info.setTablename(str);
					info.setInfo("表数量检查错误");
					info.setState("3");
					info.setResult("no");
					info.setErrordate(dateFormat.format(new Date()));
					dao.save(info);
					System.out.println("false+unRARFile");
					return false;
				}
			}
			delAll(file);

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("true+unRARFile");
		return true;
	}

	public List fileName(File file) {
		String fileName = null;
		List list = new ArrayList();
		File[] filelist = file.listFiles();
		for (int i = 0; i < filelist.length; i++) {
			fileName = filelist[i].getName();
			list.add(fileName);
		}
		return list;
	}

	public List filePath(File file) {
		String filePath = null;
		List list = new ArrayList();
		File[] filelist = file.listFiles();
		for (int i = 0; i < filelist.length; i++) {
			filePath = filelist[i].getAbsolutePath().toLowerCase();
			list.add(filePath);
		}
		return list;
	}

	public void writeFileCTL(String filepath, String replace) {
		StringBuffer sb = new StringBuffer();
		File file = new File(filepath);
		try {
			FileInputStream fin = new FileInputStream(file);
			BufferedInputStream bin = new BufferedInputStream(fin);
			BufferedReader ir = new BufferedReader(new InputStreamReader(bin));
			String str = null;
			while ((str = ir.readLine()) != null) {
				if (str.indexOf("infile") != -1) {
					String[] list = str.split("'");
					for (int i = 0; i < list.length; i++) {
						str = list[0] + "'" + replace + "'";
					}
				}
				sb.append(str + "\n");
			}
			java.io.FileWriter fileWriter = new java.io.FileWriter(file);
			fileWriter.write(sb.toString());
			fileWriter.close();
			bin.close();
			fin.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void validate() {
		String ctlFilePath = null;
		String ctlFileName = null;
		String fileNameTemp = null;
		String ctlFilePathTemp = null;
		List pahtList = filePath(new File(ctl));
		List nameList = filePath(new File(unrarPath + "\\ODS_ERPF_DATA"));
		for (int i = 0; i < pahtList.size(); i++) {
			ctlFilePath = pahtList.get(i).toString().toLowerCase();
			if (ctlFilePath.endsWith(".ctl")) {
				ctlFilePathTemp = ctlFilePath.substring(ctlFilePath
						.lastIndexOf("\\") + 5, ctlFilePath.length() - 4);
				for (int j = 0; j < nameList.size(); j++) {
					ctlFileName = nameList.get(j).toString().toLowerCase();
					if (ctlFileName.indexOf(".xml") > 0)
						fileNameTemp = ctlFileName.substring(ctlFileName
								.lastIndexOf("\\") + 1,
								ctlFileName.length() - 13);
					if (ctlFilePathTemp.equalsIgnoreCase(fileNameTemp))
						writeFileCTL(ctlFilePath, ctlFileName);
				}
			}
		}
		callCmd(ctl);
	}

	public void delAll(File f) {
		boolean rslt = true;
		if (!(rslt = f.delete())) {
			File subs[] = f.listFiles();
			for (int i = 0; i <= subs.length - 1; i++) {
				if (subs[i].isDirectory())
					delAll(subs[i]);
				rslt = subs[i].delete();
			}
			rslt = f.delete();
		}
		return;
	}

	public void callCmd(String path) {
		Runtime rt = Runtime.getRuntime();
		Process process;
		try {
			process = rt.exec("cmd /c start " + path + "/load.bat");
			StringBuffer sb = new StringBuffer();
			java.io.InputStream fis = process.getInputStream();
			int value = 0;
			while ((value = fis.read()) != -1) {
				sb.append((char) value);
			}
			fis.close();
			String result = new String(sb.toString().getBytes("ISO-8859-1"),
					"GBK");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int runday(String beginday, String endday) {
		int i = 0;
		try {
			String time1 = beginday;
			String time2 = endday;
			long DAY = 24L * 60L * 60L * 1000L;
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date day1 = df.parse(time1);
			Date day2 = df.parse(time2);
			i = (int) ((day2.getTime() - day1.getTime()) / DAY);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return i;
	}

	public String daychangestr(Date date) {
		String str = "";
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			str = df.format(date);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return str;
	}

	public Date strchangedate(String str) {
		Date date = new Date();
		try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			date = df.parse(str);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return date;
	}

	// 复制文件
	public boolean copyFile(String fileName, String newFileName) {
		File file = new File(newFileName);
		try {
			if (!file.getParentFile().exists())
				file.getParentFile().mkdir();
			FileInputStream in = new FileInputStream(fileName);
			FileOutputStream out = new java.io.FileOutputStream(file);
			byte bt[] = new byte[1024];
			int len;
			while ((len = in.read(bt)) > -1) {
				out.write(bt, 0, len);
			}
			in.close();
			out.close();
		} catch (Exception e) {
			System.out.println("文件复制失败！");
			return false;
		}
		return true;
	}

	// 获取卡片历史数据文件
	public File getHistoryFileName(File file) {
		File hisFile = null;
		File[] filelist = file.listFiles();
		for (File subFile : filelist) {
			if (subFile.getName().indexOf("fa_cardhistory") != -1) {
				return subFile;
			}
		}
		return hisFile;
	}

	public void doCall() {
		Statement stmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {

//			Map map = ReadBolb.getReadloadpath();
//			Class.forName(map.get("driver").toString()).newInstance();
			conn = dao.getJdbcTemplate().getDataSource().getConnection();
			System.out.println("Dataload - doCall - getConnection()");
			CallableStatement proc = null;
//			System.out.println("doCall----------------------------------");
			proc = conn.prepareCall("{ call erp.control }");
			proc.execute();
		} catch (SQLException ex2) {
			ex2.printStackTrace();
		} catch (Exception ex2) {
			ex2.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
					if (stmt != null) {
						stmt.close();
					}
//					if (conn != null) {
//						conn.close();
//						System.out.println("Dataload - doCall - closeConnection()");
//					}
				}
			} catch (SQLException ex1) {
				ex1.printStackTrace();
			}
		}
	}

	public PublicDao getDao() {
		return dao;
	}

	public void setDao(PublicDao dao) {
		this.dao = dao;
	}

}
