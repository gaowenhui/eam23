package com.tansun.eam2.common.codeService;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.Code;;

/**
 * 类功能描述
 * 用于获取CODE数据字典表中数据
 * CODE数据字典表存储非树形结构的数据字典
 * @author <a href="mailto:liubeibei@tansun.com.cn">liubeibei</a>s
 * @version 1.0
 */
public interface ICodeService {
	
	/**
	 * 根据字典类型查找该类型下所有的分类
	 * @param codeType 字典类型
	 * @return
	 */
	public List<Code> findByCodeType(String codeType);
	
	/**
	 * 根据字典类型查找该类型下所有的分类，并添加全部分类
	 * @param codeType 字典类型
	 * @return
	 */
	public List<Code> findAllByCodeType(String codeType);	
	
	/**
	 * 根据字典类型和字典代码键获取字典对象
	 * @param codeType
	 * @param codeKey
	 * @return
	 */
	public Code findByCodeTypeAndCodeKey(String codeType, String codeKey);

	/**
	 * 根据字典类型和字典代码键获取字典值
	 * @param codeType
	 * @param codeKey
	 * @return
	 */
	public String findCodeValueByCodeTypeAndCodeKey(String codeType, String codeKey);
	
	/**
	 *  根据字典ID查找代码表中的对象
	 * 
	 * @param codeType
	 * @return
	 */
	public Code findCodeById(String id);
}
