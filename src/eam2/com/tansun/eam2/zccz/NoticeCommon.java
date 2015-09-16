package com.tansun.eam2.zccz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Code;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzZcXx;
import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 处置公告所用到的一些公共查询方法
 * 
 * @author 陈煜霄
 * @date 2011-01-07
 */
@Service
public class NoticeCommon {

	@Autowired
	private PublicDao publicDao;

	/**
	 * 检测double是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public Double checkDouble(Object obj) {
		Double dou = 0D;
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			dou = 0D;
		} else {
			dou = Double.valueOf(String.valueOf(obj));
		}
		return dou;
	}

	/**
	 * 检测字符串是否为空
	 * 
	 * @param obj
	 * @return
	 */
	public String checkString(Object obj) {
		String str = "";
		if (obj == null || "null".equals(obj) || "".equals(obj)) {
			str = "";
		} else {
			str = String.valueOf(obj);
		}
		return str;
	}

	/**
	 * 查找实体类型
	 * 
	 * @return
	 */
	public String findSTLX(String lxNo) {
		String stlx = "";
		if ("0".equals(lxNo)) {
			stlx = "咨询类实体";
		} else if ("1".equals(lxNo)) {
			stlx = "非咨询类实体";
		} else if ("2".equals(lxNo)) {
			stlx = "外部实体";
		}
		return stlx;
	}

	/**
	 * 通过codeKey查找codename
	 * 
	 * @param coteType
	 * @param codeKey
	 * @return
	 */
	public String findCoteNameByCoteKey(String codeType, String codeKey) {
		String hql = "from Code c where c.codeType = ? and c.codeKey = ?";
		if (codeKey != null && codeKey.length() > 0) {
			String[] str = new String[2];
			str[0] = codeType;
			str[1] = codeKey;
			Code tree = new Code();
			tree = (Code) publicDao.findSingleResult(hql, str);
			if (tree != null && !"".equals(tree)) {
				String codeValue = tree.getCodeValue();
				return codeValue;
			} else {
				return "";
			}
		} else {
			return "";
		}
	}

	/**
	 * 通过实体处置处理单id查找实体id
	 * 
	 * @param id
	 * @return
	 */
	public String findSTIdById(String id) {
		CzStcztz st = publicDao.findById(CzStcztz.class, id);
		return st.getStid();
	}

	/**
	 * 通过id查找处置资产信息
	 * 
	 * @return
	 */
	public CzZcXx findCZXXById(String id) {
		CzZcXx xx = publicDao.findById(CzZcXx.class, id);
		return xx;
	}

	/**
	 * 查找资产类别
	 * 
	 * @param no
	 * @return
	 */
	public String findZCLBbyNo(String no) {
		String zclb = "";
		if ("0".equals(no)) {
			zclb = "经营性固产";
		} else if ("1".equals(no)) {
			zclb = "实体内资产";
		} else if ("2".equals(no)) {
			zclb = "委贷抵债物";
		} else if ("4".equals(no)) {
			zclb = "自用资产";
		} else if ("5".equals(no)) {
			zclb = "待处置类固定资产";
		} else if ("6".equals(no)) {
			zclb = "受托固定资产";
		}
		return zclb;
	}

}
