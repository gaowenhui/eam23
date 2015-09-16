package com.tansun.eam2.zyzc.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;

import org.springframework.beans.factory.annotation.Autowired;

import com.tansun.eam2.zyzc.ucc.ImportExcelToOrclUCC;
import com.tansun.rdp4j.common.web.action.CommonAction;

public class ImportExcelToOrcl extends CommonAction {
	@Autowired
	private ImportExcelToOrclUCC importExcelToOrclUCCImpl;
	
	/**
	 * 把Excel导入数据库
	 * @return
	 * @throws IOException
	 */
	public String ImportExcel() throws IOException {
		String headId = request.getParameter("headId");
		String excelFilePath = request.getParameter("excelFilePath");
		String isImportSuccess = "导入数据错误！";
		File importExcel = new File(excelFilePath);
		try {
			WorkbookSettings workbookSettings = new WorkbookSettings();
			Locale locale = new Locale("zh", "CN");
			workbookSettings.setLocale(locale);
			workbookSettings.setEncoding("ISO-8859-1");
			Workbook workBook = Workbook.getWorkbook(importExcel,
					workbookSettings);

			// Workbook workBook = Workbook.getWorkbook(importExcel);
			Sheet[] sheet = workBook.getSheets();
			int sheet_i_num = 0;
			if (sheet != null && sheet.length > 0) {
				sheet_i_num = sheet[0].getRows();
				for (int rowNum = sheet_i_num - 1; rowNum > 0; rowNum--) {
					List<String> pdxxInfoList = new ArrayList<String>();
					Cell[] cells = sheet[0].getRow(rowNum);
					for (int i = 1; i < cells.length; i++) {
						pdxxInfoList.add(cells[i].getContents());
					}
					pdxxInfoList.add(headId);
					if (!"盘盈".equals(cells[cells.length - 1].getContents())) {
						pdxxInfoList.add(cells[0].getContents());
					}
					String errorInfo = importExcelToOrclUCCImpl
							.UpdateExcelInfoToPdxx(pdxxInfoList,
									cells.length + 2);
					if (errorInfo.length() > 0) {
						isImportSuccess = errorInfo;
						break;
					}
				}
			}
			workBook.close();
			if ("导入数据错误！".equals(isImportSuccess)) {
				isImportSuccess = "导入数据成功！";
			}
		} catch (Exception e) {
			isImportSuccess = "导入数据错误！";
			e.printStackTrace();
		} finally {
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(isImportSuccess);
		}
		return null;
	}
}