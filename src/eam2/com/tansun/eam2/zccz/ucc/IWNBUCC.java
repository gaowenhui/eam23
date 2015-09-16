package com.tansun.eam2.zccz.ucc;

import java.util.*;

import com.tansun.eam2.common.model.orm.bo.CzWnb;
import com.tansun.rdp4j.common.web.vo.CommonBO;
/**
 * 万能表数据访问的UCC定义,同时支持列表查询和新建维护功能
 * @author Administrator
 *
 */
public interface IWNBUCC {
	public void save(CommonBO commonBO);
	public void update(CommonBO commonBO);
	public void delete(CommonBO commonBO);
	/**
	 * 根据WNB_ID，检索对应的WNB　BO对象
	 * @param wnb_id 万能表的ID
	 * @return 万能表的BO对象，如果没有找到，返回null
	 */
	public CommonBO retrieveWNBBO(String wnb_id);
	/**
	 * 万能表查询列表的数据接口
	 * @param xm_id	项目编号
	 * @param zc_id	资产编号
	 * @param zd_code　虚拟表编号
	 * @return 一个由String组成的List,其中每个String都由chr(9)分割
	 */
	public List queryWNBList(String xm_id,String zc_id,String zd_code);
	/**
	 * 设置万能表值
	 * @param bo
	 * @param col
	 * @param i
	 */
	public void setBoCol(CzWnb bo ,String col, int i);
	/**
	 * 页面的显示
	 * @param wnb_id
	 * @param zd_code
	 * @return
	 */
	public List modifyWNBList(String wnb_id, String zd_code);
	/**
	 * 根据项目ID 资产ID 处置方式 查询数据
	 * @param xm_id
	 * @param zc_id
	 * @param zd_code
	 * @return
	 */
	public List getWNBList(String xm_id, String zc_id, String zd_code);
}
