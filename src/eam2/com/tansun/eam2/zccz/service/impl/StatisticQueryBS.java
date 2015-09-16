
package com.tansun.eam2.zccz.service.impl;

import com.tansun.eam2.zccz.service.IStatisticQueryBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Baitin.Fong
 */
@Service
public class StatisticQueryBS implements IStatisticQueryBS{
    private PublicDao publicDao;

	@Autowired
	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}

    /**
     * 根据实体id查询 回款金额。
     * @param stid
     * @return
     */
    public double selectEntityHkje(String stid) {
        String sql = "select nvl(sum(m.hkje), 0) as hkje from CZ_ZC_XX t, CZ_XM_XX x, CZ_FYSR_MX m where t.cld_id = x.cld_id and"
                + " t.cld_id = m.cld_id and x.ZHUANGTAI = 1  and t.zhuangtai=2 and m.fenlei = 1 and m.zclb=1"
                + " and t.bstid=? ";
        List<Map<String, Object>> list = publicDao.queryForList(sql, new String[]{stid});
        double val = 0.0;
        if(list != null && list.size() > 0){
        	BigDecimal obj = (BigDecimal)list.get(0).get("hkje");
            if(obj != null){
                val = obj.doubleValue();
            }
        }
        return val;
    }

    /**
     * 根据实体ID查询实体内资产，预计回收金额。
     * @param stid
     * @return
     */
    public double selectEntityYjhsje(String stid) {
        String sql = "select nvl(sum(c.yjczhsje), 0) as yjczhsje from CZ_XM_XX t, CZ_CZTZFA_XX c,"
                + " CZ_ZC_XX x where t.cld_id = c.id and t.ZHUANGTAI<>1 and x.zhuangtai=2 and x.bstid=? ";
        List<Map<String, Object>> list = publicDao.queryForList(sql, new String[]{stid});
        double val = 0.0;
        if(list != null && list.size() > 0){
        	BigDecimal obj = (BigDecimal)list.get(0).get("yjczhsje");
            if(obj != null){
                val = obj.doubleValue();
            }
        }
        return val;
    }

    /**
     * 根据处置项目id查找处置项目 实际处置费用
     *   1：处置项目信息表CZ_XM_XX的id
	 *   2：处置项目费用收入明细表CZ_FYSR_MX的项目id
     * 查找分类为费用的信息    汇总：回款中费用金额
     * 根据费用id查找分类为费用，汇总过户税类金额
     * 根据费用id查找分类为费用，汇总过户费用金额
     * 汇总实际支出
     * 根据CZ_XM_XX中的处理单id，对应CZ_FYSR_MX表中的处理单id，
     * 查找状态为已审批的，
     * @param xmid
     * @return
     */
    public double[] statisticCost(String xmid) {
        String sql = "select nvl(sum(m.hkzfyje), 0) as hkzfyje, nvl(sum(m.ghslje), 0) as ghslje, nvl(sum(m.ghfyje), 0) as ghfyje,"
                + " nvl(sum(m.sjzc), 0) as sjzc from cz_xm_xx t, cz_fysr_mx m where t.cld_id=m.cld_id and m.fenlei=0 and m.fyzt=2 and t.id=? ";
        List<Map<String, Object>> list = publicDao.queryForList(sql, new String[]{xmid});
        double[] val = new double[4];
        if(list != null && list.size() > 0){
            Map<String, Object> map = list.get(0);
            val[0] = Double.parseDouble(String.valueOf(map.get("hkzfyje")));
            val[1] = Double.parseDouble(String.valueOf(map.get("ghslje")));
            val[2] = Double.parseDouble(String.valueOf(map.get("ghfyje")));
            val[3] = Double.parseDouble(String.valueOf(map.get("sjzc")));
        }
        return val;
    }

    /**
     *  根据处置项目id查找处置项目 实际回收 即实际处置收入
     *      1：处置项目信息表CZ_XM_XX的id
     *      2：处置项目费用收入明细表CZ_FYSR_MX的项目id
     * 查找分类为收入的信息    汇总：回款中收入金额
     * @param xmid
     * @return
     */
    public double statisticIncome(String xmid) {
        String sql = "select nvl(sum(m.hkje), 0) as hkje from cz_xm_xx t, cz_fysr_mx m where t.id=m.xm_id and m.fenlei=1 and t.id=? ";
        List<Map<String, Object>> list = publicDao.queryForList(sql, new String[]{xmid});
        double val = 0.0;
        if(list != null && list.size() > 0){
             Object obj = list.get(0).get("hkje");
            if(obj != null){
                val = Double.parseDouble(String.valueOf(obj));
            }
        }
        return val;
    }

}