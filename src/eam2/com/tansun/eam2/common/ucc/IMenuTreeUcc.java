package com.tansun.eam2.common.ucc;

import java.util.List;

import com.tansun.rdp4j.common.model.orm.bo.PTFunctionGroupBO;

public interface IMenuTreeUcc {
	
	/**
	 * 根据parent节点查找子节点
	 * @param sid
	 * @return
	 */
	List<PTFunctionGroupBO> getFuncGroup(String perid, String parid);
	
	/**
	 * 根据parent节点和当前用户查找子节点
	 * @param perid
	 * @param parid
	 * @return
	 */
	public List<PTFunctionGroupBO> getSonItem(String perid, String parid); 
}
