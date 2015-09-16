package com.tansun.eam2.wtdk;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.rdp4j.common.model.orm.PublicDao;

/**
 * 委托贷款所用到的一些公共方法
 * 
 * @author 陈煜霄
 * @date 2010-12-08
 */
@Service
public class WtdkCommon {

	@Autowired
	private PublicDao publicDao;

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
	 * 查找一级分行
	 * 
	 * @param nodeValue
	 * @return
	 */
	public String findFristBranch(String nodeValue) {
		String firstBranch = "";
		if (!"".equals(nodeValue)) {
			if ("011".equals(nodeValue)) {
				firstBranch = "中国建设银行营业部";
			} else {
				nodeValue = nodeValue + "000000";
				String sql = "select CM_OPUN_FLNM_CHN from crt_dcc_CMBCTBCT o where o.CM_OPUN_COD = '"
						+ nodeValue + "' ";
				List list = this.publicDao.queryForList(sql, new ArrayList());
				if (list.size() > 0) {
					Map tempBO = (Map) list.get(0);
					firstBranch = (String) tempBO.get("CM_OPUN_FLNM_CHN");
				}
			}
		}
		return firstBranch;
	}

	/**
	 * 查找一级分行和地区(indivaluetree)
	 * 
	 * @param nodeValue
	 * @return
	 */
	public String findCateNameByParentId(String nodeValue) {
		String sql = "select i.categoryname from individualtree i where i.treetype = 'department' and "
				+ "i.parentcategoryid = '438' and i.nodevalue = '"
				+ nodeValue
				+ "'";
		String categoryname = null;
		List list = this.publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map tempBO = (Map) list.get(0);
			categoryname = (String) tempBO.get("categoryname");
		}
		return categoryname;
	}

	/**
	 * 查找机构
	 * 
	 * @param id
	 * @return
	 */
	public String findSaOpacInstnName(String id) {
		String cmName = "";
		if (!"".equals(id)) {
			String sql = "select cm_opun_flnm_chn from crt_dcc_cmbctbct where cm_opun_cod = '"
					+ id + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				cmName = (String) tempBO.get("cm_opun_flnm_chn");
			}
		}
		return cmName;
	}

	/**
	 * 查找币别
	 * 
	 * @return
	 */
	public String findsaCurrName(String id) {
		String moneyType = "";
		if (!"".equals(id)) {
			String sql = "select code_value from code where code_type = 'MONYE_TYPE' and code_key = '"
					+ id + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				moneyType = (String) tempBO.get("code_value");
			}
		}
		return moneyType;
	}

	/**
	 * 根据客户编号查找客户名称
	 * 
	 * @param custNo
	 * @return
	 */
	public String findCustNameByCustNo(String custNo) {
		String custName = "";
		if (!"".equals(custNo)) {
			String sql = "select ci_chn_name from crt_dcc_cicifci1 where ci_cust_no = '"
					+ custNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				custName = (String) tempBO.get("ci_chn_name");
			}
		}
		return custName;
	}

	/**
	 * 根据贷款账号查找委托贷款更多信息表
	 */
	public String findWdMordInfoByLnNo(String lnNo) {
		String saNo = "";
		if (!"".equals(lnNo)) {
			String sql = "select SA_SYS_ACCT_NO from WD_LN_MORE_INFOR where LN_ACCT_NO = '"
					+ lnNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				saNo = (String) tempBO.get("SA_SYS_ACCT_NO");
				if (saNo == null) {
					saNo = "";
				}
			}
		}
		return saNo;
	}

	/**
	 * 查找担险状态
	 * 
	 * @param lnNo
	 * @return
	 */
	public String findRiskState(String lnNo) {
		String state = "未担险";
		String risk = "";
		if (!"".equals(lnNo)) {
			String sql = "select RISK_REASON from WD_LN_MORE_INFOR where LN_ACCT_NO = '"
					+ lnNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				risk = (String) tempBO.get("RISK_REASON");
			}
			if ("".equals(risk) || risk == null) {
				state = "非担险";
			} else {
				state = "担险";
			}
		}
		return state;
	}

	/**
	 * 查找省行管理人
	 * 
	 * @param dkjgbm
	 * @return
	 */
	public String findRYMCByDkjgbm(String dkjgbm) {
		String lxr = "";
		if (!"".equals(dkjgbm)) {
			if ("011".equals(dkjgbm)) {
				dkjgbm = "010000000";
			} else {
				dkjgbm = dkjgbm + "000000";
			}
			String sql = "select RYMC from WD_LN_DPT_INFO w where w.DKJGBM = '"
					+ dkjgbm + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				lxr = (String) tempBO.get("RYMC");
			}
		}
		return lxr;
	}

	/**
	 * 查找省行管理人电话
	 * 
	 * @param dkjgbm
	 * @return
	 */
	public String findLXFSByDkjgbm(String dkjgbm) {
		String lxr = "";
		if (!"".equals(dkjgbm)) {
			if ("011".equals(dkjgbm)) {
				dkjgbm = "010000000";
			} else {
				dkjgbm = dkjgbm + "000000";
			}
			String sql = "select LXFS from WD_LN_DPT_INFO w where w.DKJGBM = '"
					+ dkjgbm + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				lxr = (String) tempBO.get("LXFS");
			}
		}
		return lxr;
	}

	/**
	 * 查找委托方客户编号
	 * 
	 * @param saNo
	 * @return
	 */
	public String findDAcctNoBysaNo(String saNo) {
		String dAcctNo = "";
		if (!"".equals(saNo)) {
			String sql = "select sa_cust_no from crt_dcc_SAACNACN where sa_acct_no = '"
					+ saNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				dAcctNo = (String) tempBO.get("sa_cust_no");
			}
		}
		return dAcctNo;
	}

	/**
	 * 查找贷款种类
	 * 
	 * @param id
	 * @return
	 */
	public String findDKZL(String id) {
		String dkzl = "";
		if (!"".equals(id)) {
			String sql = "select loan_name from crt_dcc_ln_loan_type t where loan_type = '"
					+ id + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				dkzl = (String) tempBO.get("loan_name");
			}
		}
		return dkzl;
	}

	/**
	 * 查找科目编号
	 * 
	 * @param id
	 * @return
	 */
	public String findKMBH(String id) {
		String kmbh = "";
		if (!"".equals(id)) {
			String sql = "select loan_nor_lg_no from crt_dcc_ln_loan_type t where loan_type = '"
					+ id + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				kmbh = (String) tempBO.get("loan_nor_lg_no");
			}
		}
		return kmbh;
	}

	/**
	 * 查找科目名称
	 * 
	 * @param id
	 * @return
	 */
	public String findKMMC(String id) {
		String kmmc = "";
		if (!"".equals(id)) {
			String sql = "select loan_nor_lg_name from crt_dcc_ln_loan_type t where loan_type = '"
					+ id + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				kmmc = (String) tempBO.get("loan_nor_lg_name");
			}
		}
		return kmmc;
	}

	/**
	 * 查找对应基金账号
	 * 
	 * @param lnNo
	 * @return
	 */
	public String findWTJJ(String lnNo) {
		String hkdw = "";
		if (!"".equals(lnNo)) {
			String sql = "select t.SA_SYS_ACCT_NO from WD_LN_MORE_INFOR t where t.LN_ACCT_NO = '"
					+ lnNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				hkdw = (String) tempBO.get("SA_SYS_ACCT_NO");
			}
		}
		return hkdw;
	}

	/**
	 * 查找委托单位名称
	 * 
	 * @return
	 */
	public String findWTDW(String saNo) {
		String hkdw = "";
		if (!"".equals(saNo)) {
			String sql = "select t.SA_CUST_Name from crt_dcc_SAACNACN t where t.SA_ACCT_NO = '"
					+ saNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				hkdw = (String) tempBO.get("SA_CUST_Name");
			}
		}
		return hkdw;
	}

	/**
	 * 查找科目名称
	 * 
	 * @param id
	 * @return
	 */
	public String findSubCod(String saType) {
		String subCod = "";
		if (!"".equals(saType)) {
			String sql = "select sub_cod from CRT_DCC_SA_SAVE_TYPE where save_type= '"
					+ saType + "'";
			List list = publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map map = (Map) list.get(0);
				subCod = checkString(map.get("sub_cod"));
			}
		}
		return subCod;
	}
	
	public String findSubName(String saType){
		String subName = "";
		if (!"".equals(saType)) {
			String sql = "select sub_name from CRT_DCC_SA_SAVE_TYPE where save_type= '"
					+ saType + "'";
			List list = publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map map = (Map) list.get(0);
				subName = checkString(map.get("sub_name"));
			}
		}
		return subName;
	}

	/**
	 * 查找客户账号
	 * 
	 * @param funcNo
	 * @return
	 */
	public String findCustNoByFuncNo(String funcNo) {
		String custNo = "";
		if (!"".equals(funcNo)) {
			String sql = "select LN_ACCT_NO from WD_LN_MORE_INFOR where SA_SYS_ACCT_NO = '"
					+ funcNo + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				custNo = (String) tempBO.get("LN_ACCT_NO");
			}
		}
		return custNo;
	}

	/**
	 * 根据机构编号查找机构名称
	 * 
	 * @param cmCod
	 * @return
	 */
	public String findDeptByNo(String cmCod) {
		String cmName = "";
		if (!"".equals(cmCod)) {
			String sql = "select cm_opun_flnm_chn from crt_dcc_CMBCTBCT t where t.cm_opun_cod = '"
					+ cmCod + "'";
			List list = this.publicDao.queryForList(sql, new ArrayList());
			if (list.size() > 0) {
				Map tempBO = (Map) list.get(0);
				cmName = (String) tempBO.get("cm_opun_flnm_chn");
			}
		}
		return cmName;
	}

	/**
	 * 得到客户基金账号
	 * 
	 * @return
	 */
	public String findsaCAcctNo(String saNo, String currCod) {
		String saCAcctNo = saNo.substring(0, 3) + currCod
				+ saNo.substring(15, 21) + "05" + saNo.substring(21, 28);
		return saCAcctNo;
	}

	/**
	 * 超找贷款账号
	 * 
	 * @param lnNo
	 * @param currCod
	 * @return
	 */
	public String findlnCAcctNo(String lnNo, String currCod) {
		String lnCAcctNo = lnNo.substring(0, 3) + currCod
				+ lnNo.substring(15, 21) + "06" + lnNo.substring(21, 28);
		return lnCAcctNo;
	}

	/**
	 * 根据基金账号查找余额
	 * 
	 * @param saNo
	 * @return
	 */
	public String findLostValue(String saNo) {
		String lostValue = "";
		String sqlStr = "select sa_avl_bal from crt_dcc_SAACNAMT where sa_acct_no = '"
				+ saNo + "'";
		List list = publicDao.queryForList(sqlStr, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			lostValue = String.valueOf(map.get("sa_avl_bal"));
		}
		return lostValue;
	}

	/**
	 * 根据基金账号查找币别
	 * 
	 * @param saNo
	 * @return
	 */
	public String findBB(String saNo) {
		String bb = "";
		String sqlStr = "select sa_curr_cod from crt_dcc_SAACNAMT where sa_acct_no = '"
				+ saNo + "'";
		List list = publicDao.queryForList(sqlStr, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			bb = String.valueOf(map.get("sa_curr_cod"));
		}
		return bb;
	}

	/**
	 * 查找经济性质
	 * 
	 * @param jyNo
	 * @return
	 */
	public String findJYXZ(String jyNo) {
		String jyxz = "";
		String sql = "select t.cm_econ_char_dscrp from crt_dcc_cmmsccnc t where t.cm_econ_char = '"
				+ jyNo + "'";
		List list = publicDao.queryForList(sql, new ArrayList());
		if (list.size() > 0) {
			Map map = (Map) list.get(0);
			jyxz = String.valueOf(map.get("cm_econ_char_dscrp"));
		}
		return jyxz;
	}

	/**
	 * 将时间转化成格式
	 * 
	 * @param oldTime
	 * @return
	 */
	public String changeTime(String oldTime) {
		if(!"".equals(oldTime) && oldTime!=null){
			String shi = oldTime.substring(0, 2);
			String fen = oldTime.substring(2, 4);
			String miao = oldTime.substring(4, 6);
			String hao = oldTime.substring(6, 9);
			String newTime = shi + ":" + fen + ":" + miao + "." + hao;
			return newTime;
		}else{
			return "";
		}
	}

	/**
	 * 将“yyyymmdd”格式的日期转化为"yyyy-mm-dd"
	 * 
	 * @param oldDate
	 * @return
	 */
	public String changeDate(String oldDate) {
		if(!"".equals(oldDate) && oldDate!=null){
			String q4 = oldDate.substring(0, 4);
			String z2 = oldDate.substring(4, 6);
			String h2 = oldDate.substring(6, 8);
			String newDate = q4 + "-" + z2 + "-" + h2;
			return newDate;
		}else{
			return "";
		}
	}

}
