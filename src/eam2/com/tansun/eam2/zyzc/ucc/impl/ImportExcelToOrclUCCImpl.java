package com.tansun.eam2.zyzc.ucc.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.zyzc.service.ImportExcelToOrclBS;
import com.tansun.eam2.zyzc.ucc.ImportExcelToOrclUCC;

@Service
public class ImportExcelToOrclUCCImpl implements ImportExcelToOrclUCC {
	@Autowired
	private ImportExcelToOrclBS importExcelToOrclBSimpl;
	
	public String UpdateExcelInfoToPdxx(List<String> pdxxInfo,int length){
		return importExcelToOrclBSimpl.UpdateExcelInfoToPdxx(pdxxInfo,length);
	}
}
