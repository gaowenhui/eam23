package com.tansun.eam2.common.web.actions;

/**
 * 主页面帮助文档下载功能
 * @author 陈煜霄
 */
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import com.tansun.rdp4j.common.web.action.CommonAction;

public class CommonDownLoadHelpAction extends CommonAction {

	public String downLoadHelp() {
		InputStream is = null;
		OutputStream os = null;
		String path = "c:\\EAM手册\\EAM2使用手册.rar";
		byte[] b = new byte[1024];
		int i = 0;
		try {
			is = new FileInputStream(path);
			os = response.getOutputStream();
			/**//* 设置报头信息，弹出窗口中显示的文件名 newpath */
			response.setHeader("Content-Disposition", "Disposition;filename="
					+ new String("EAM2使用手册.rar".getBytes("GBK"), "ISO8859-1"));
			/**//* 在页面上弹出一个下在窗口 */
			response.setContentType("application/x-msdownload");
			/**//* 具体的输入输出流操作 */
			while ((i = is.read(b)) != -1) {
				os.write(b, 0, i);
				i = 0;
			}
			os.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				os.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
