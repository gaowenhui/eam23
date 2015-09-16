package com.tansun.eam2.common.word.web.servlet;

import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;

public interface IExport {
	public String exportexcel() throws Exception;
	public void setExcelVO(CommonBO excelVO);
	public void setPaginator(Paginator paginator);
}
