package com.tansun.eam2.jygdzc.ucc.impl;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.JjzcGctbXx;
import com.tansun.eam2.common.model.orm.bo.JjzcTbgcXx;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlHead;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlLsb;
import com.tansun.eam2.common.model.orm.bo.JyzcJyzlXx;
import com.tansun.eam2.common.model.orm.bo.JyzcZlBgmx;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.jygdzc.service.IIntentionBS;
import com.tansun.eam2.jygdzc.ucc.IAssetUCC;
import com.tansun.eam2.jygdzc.ucc.IIntentionUCC;
import com.tansun.eam2.jygdzc.vo.AssetBodyVO;
import com.tansun.eam2.jygdzc.vo.JjzcGctbXxVO;
import com.tansun.eam2.jygdzc.vo.JyzcJyzlLsbVO;
import com.tansun.eam2.jygdzc.vo.JyzcXxVO;
import com.tansun.eam2.jygdzc.vo.JyzlLedgerVO;
import com.tansun.eam2.jygdzc.vo.JyzlQueryVO;
import com.tansun.eam2.jygdzc.vo.JyzlViewVO;
import com.tansun.eam2.jygdzc.vo.JyzlXxBodyVO;
import com.tansun.rdp4j.common.util.Paginator;
import com.tansun.rdp4j.common.web.vo.CommonBO;
/**
 * 合同ucc实现类
 * @author lihuan
 *
 */
@Service
public class IntentionUCCImpl implements IIntentionUCC{
	@Autowired
	public IIntentionBS intentionBSImpl;
	@Autowired
	public IAssetUCC assetUCCImpl;
	
	public void save(CommonBO commonBO) {
		 
		intentionBSImpl.save(commonBO);
		
	}

	public void update(CommonBO commonBO) {
		intentionBSImpl.update(commonBO);
		
	}
	public void saveorupdate(CommonBO commonBO) {
		intentionBSImpl.saveOrUpdate(commonBO);
		
	}
	public void delete(CommonBO commonBO) {
		 
		intentionBSImpl.delete(commonBO);
	}

	public List<JyzlXxBodyVO> getJyzlBodyVOByHeadId(String id ,Paginator paginator) {
		
		return intentionBSImpl.getJyzlBodyVOByHeadId(id, paginator);
	}

	public List<JyzlViewVO> getJyzlViewVOByCondition(JyzlQueryVO jyzlQueryVO ,Paginator paginator) {
		 
		return intentionBSImpl.getJyzlViewVOByCondition(jyzlQueryVO, paginator);
	}

	public JyzcJyzlHead findJyzcJyzlHeadById(String id) {
		 
		return (JyzcJyzlHead) intentionBSImpl.findById(JyzcJyzlHead.class, id);
	}

	public JyzcXxVO getJyzcXxVOByzcId(String zcId) {
		
		return intentionBSImpl.getJyzcXxVOByzcId(zcId);
	}

	public JyzcJyzlLsbVO getJyzcJyzlLsbById(String id) {
		JyzcJyzlLsb jyzcJyzlLsb = (JyzcJyzlLsb) intentionBSImpl.findById(JyzcJyzlLsb.class, id);
		JyzcJyzlLsbVO jyzcJyzlLsbVO = new JyzcJyzlLsbVO();
		try {
			BeanUtils.copyProperties(jyzcJyzlLsbVO,jyzcJyzlLsb);
		} catch (Exception e) {
			e.printStackTrace();
		}
		NumberFormat format11 = NumberFormat.getInstance();
		format11.setMaximumFractionDigits(2);
		if(jyzcJyzlLsb.getYxzlmj()!=null&&!"".equals(jyzcJyzlLsb.getYxzlmj())){
			jyzcJyzlLsbVO.setYxzlmj(format11.format(jyzcJyzlLsb.getYxzlmj()).replaceAll(",", ""));
		}
		if(jyzcJyzlLsb.getYxzjzje()!=null&&!"".equals(jyzcJyzlLsb.getYxzjzje())){
			jyzcJyzlLsbVO.setYxzjzje(format11.format(jyzcJyzlLsb.getYxzjzje()).replaceAll(",", ""));
		}
		return jyzcJyzlLsbVO;
	}
	public JyzcJyzlXx getJyzcJyzlXxById(String id) {
		 
		return (JyzcJyzlXx) intentionBSImpl.findById(JyzcJyzlXx.class, id);
	}
	public List<JyzcZlBgmx> getJyzcZlBgmxByzlId(String zlId) {
		 
		return intentionBSImpl.getJyzcZlBgmxByzlId(zlId);
	}

	public String getZcIdByzlId(String zlId) {
		JyzcJyzlLsb	jyzcJyzlLsb = (JyzcJyzlLsb) intentionBSImpl.findById(JyzcJyzlLsb.class, zlId);
		 
		if(jyzcJyzlLsb==null){
			return null;
		}else{
			return jyzcJyzlLsb.getZcId();
		}
	}

	public List<JyzcJyzlXx>  getJyzcJyzlXxByzcId(String zcId) {
		 
		return intentionBSImpl.getJyzcJyzlXxByzcId(zcId);
	}

	public JyzcJyzlLsb jyzc2Body(JyzcJyzlXx jyzcJyzlXx) {
		 
		return intentionBSImpl.jyzc2Body(jyzcJyzlXx);
	}

	public void compareZlXxVsZlXxLsb(JyzcJyzlXx jyzlXx, JyzcJyzlLsb jyzlLsb) {
		
		intentionBSImpl.compareZlXxVsZlXxLsb(jyzlXx, jyzlLsb);
	}

	public List<Recordhistory> getRecordhistoryBypkId(String pkId ,String zlXxId, Paginator paginator) {
		
		return intentionBSImpl.getRecordhistoryBypkId(pkId,zlXxId,paginator);
	}

	public CommonBO findById(Class cls ,String id) {
		
		return intentionBSImpl.findById(cls, id);
	}

	public List<JjzcGctbXxVO> getJjzcGctbXxBycldId(String cldId) {
		List<JjzcGctbXx>  list=intentionBSImpl.getJjzcGctbXxBycldId(cldId);
		List<JjzcGctbXxVO> list1 = new ArrayList();
		NumberFormat format = NumberFormat.getInstance();
		format.setMaximumFractionDigits(2);
		if(list!=null&&list.size()>0){
			for(int i=0;i<list.size();i++){
				JjzcGctbXxVO jjzcGctbXxVO = new JjzcGctbXxVO();
				JjzcGctbXx jjzcGctbXx = list.get(i);
				try {
					BeanUtils.copyProperties(jjzcGctbXxVO,jjzcGctbXx );
				} catch (Exception e) {
					e.printStackTrace();
				} 
				if(jjzcGctbXx.getSyxbf()!=null&&!"".equals(jjzcGctbXx.getSyxbf())){
					jjzcGctbXxVO.setSyxbf(format.format(jjzcGctbXx.getSyxbf()).replace(",", ""));
				}
				if(jjzcGctbXx.getJqxbf()!=null&&!"".equals(jjzcGctbXx.getJqxbf())){
					jjzcGctbXxVO.setJqxbf(format.format(jjzcGctbXx.getJqxbf()).replace(",", ""));
				}
				if(jjzcGctbXx.getSfhj()!=null&&!"".equals(jjzcGctbXx.getSfhj())){
					jjzcGctbXxVO.setSfhj(format.format(jjzcGctbXx.getSfhj()).replace(",", ""));
				}
				if(jjzcGctbXx.getCcsje()!=null&&!"".equals(jjzcGctbXx.getCcsje())){
					jjzcGctbXxVO.setCcsje(format.format(jjzcGctbXx.getCcsje()).replace(",", ""));
				}
				if(jjzcGctbXx.getPjtbze()!=null&&!"".equals(jjzcGctbXx.getPjtbze())){
					jjzcGctbXxVO.setPjtbze(format.format(jjzcGctbXx.getPjtbze()).replace(",", ""));
				}
				if(jjzcGctbXx.getCcyqxtbzcze()!=null&&!"".equals(jjzcGctbXx.getCcyqxtbzcze())){
					jjzcGctbXxVO.setCcyqxtbzcze(format.format(jjzcGctbXx.getCcyqxtbzcze()).replace(",", ""));
				}
				if(jjzcGctbXx.getCzyqxfl()!=null&&!"".equals(jjzcGctbXx.getCzyqxfl())){
					jjzcGctbXxVO.setCzyqxfl(format.format(jjzcGctbXx.getCzyqxfl()).replace(",", ""));
				}
				if(jjzcGctbXx.getCzyqxzk()!=null&&!"".equals(jjzcGctbXx.getCzyqxzk())){
					jjzcGctbXxVO.setCzyqxzk(format.format(jjzcGctbXx.getCzyqxzk()).replace(",", ""));
				}
				if(jjzcGctbXx.getCzyqxbf()!=null&&!"".equals(jjzcGctbXx.getCzyqxbf())){
					jjzcGctbXxVO.setCzyqxbf(format.format(jjzcGctbXx.getCzyqxbf()).replace(",", ""));
				}
				if(jjzcGctbXx.getJqshxtbzcze()!=null&&!"".equals(jjzcGctbXx.getJqshxtbzcze())){
					jjzcGctbXxVO.setJqshxtbzcze(format.format(jjzcGctbXx.getJqshxtbzcze()).replace(",", ""));
				}
				if(jjzcGctbXx.getJqshxzk()!=null&&!"".equals(jjzcGctbXx.getJqshxzk())){
					jjzcGctbXxVO.setJqshxzk(format.format(jjzcGctbXx.getJqshxzk()).replace(",", ""));
				}
				if(jjzcGctbXx.getJiqishxbf()!=null&&!"".equals(jjzcGctbXx.getJiqishxbf())){
					jjzcGctbXxVO.setJiqishxbf(format.format(jjzcGctbXx.getJiqishxbf()).replace(",", ""));
				}
				if(jjzcGctbXx.getGgzrxbe()!=null&&!"".equals(jjzcGctbXx.getGgzrxbe())){
					jjzcGctbXxVO.setGgzrxbe(format.format(jjzcGctbXx.getGgzrxbe()).replace(",", ""));
				}
				if(jjzcGctbXx.getGgzrxbxfl()!=null&&!"".equals(jjzcGctbXx.getGgzrxbxfl())){
					jjzcGctbXxVO.setGgzrxbxfl(format.format(jjzcGctbXx.getGgzrxbxfl()).replace(",", ""));
				}
				if(jjzcGctbXx.getGgzrxbf()!=null&&!"".equals(jjzcGctbXx.getGgzrxbf())){
					jjzcGctbXxVO.setGgzrxbf(format.format(jjzcGctbXx.getGgzrxbf()).replace(",", ""));
				}
				if(jjzcGctbXx.getClqntpje()!=null&&!"".equals(jjzcGctbXx.getClqntpje())){
					jjzcGctbXxVO.setClqntpje(format.format(jjzcGctbXx.getClqntpje()).replace(",", ""));
				}
				if(jjzcGctbXx.getTbze()!=null&&!"".equals(jjzcGctbXx.getTbze())){
					jjzcGctbXxVO.setTbze(format.format(jjzcGctbXx.getTbze()).replace(",", ""));
				}
				if(jjzcGctbXx.getTbzhj()!=null&&!"".equals(jjzcGctbXx.getTbzhj())){
					jjzcGctbXxVO.setTbzhj(format.format(jjzcGctbXx.getTbzhj()).replace(",", ""));
				}
				list1.add(jjzcGctbXxVO);
			}
		}
	
		return list1;
	}
	public void copyGctbXxToJGctbXxVO(JjzcGctbXx jjzcGctbXx,JjzcGctbXxVO jjzcGctbXxVO) {
		NumberFormat format = NumberFormat.getInstance();
		format.setMaximumFractionDigits(2);
		try {
			BeanUtils.copyProperties(jjzcGctbXxVO,jjzcGctbXx );
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(jjzcGctbXx.getSyxbf()!=null&&!"".equals(jjzcGctbXx.getSyxbf())){
			jjzcGctbXxVO.setSyxbf(format.format(jjzcGctbXx.getSyxbf()).replace(",", ""));
		}
		if(jjzcGctbXx.getJqxbf()!=null&&!"".equals(jjzcGctbXx.getJqxbf())){
			jjzcGctbXxVO.setJqxbf(format.format(jjzcGctbXx.getJqxbf()).replace(",", ""));
		}
		if(jjzcGctbXx.getSfhj()!=null&&!"".equals(jjzcGctbXx.getSfhj())){
			jjzcGctbXxVO.setSfhj(format.format(jjzcGctbXx.getSfhj()).replace(",", ""));
		}
		if(jjzcGctbXx.getCcsje()!=null&&!"".equals(jjzcGctbXx.getCcsje())){
			jjzcGctbXxVO.setCcsje(format.format(jjzcGctbXx.getCcsje()).replace(",", ""));
		}
		if(jjzcGctbXx.getPjtbze()!=null&&!"".equals(jjzcGctbXx.getPjtbze())){
			jjzcGctbXxVO.setPjtbze(format.format(jjzcGctbXx.getPjtbze()).replace(",", ""));
		}
		if(jjzcGctbXx.getCcyqxtbzcze()!=null&&!"".equals(jjzcGctbXx.getCcyqxtbzcze())){
			jjzcGctbXxVO.setCcyqxtbzcze(format.format(jjzcGctbXx.getCcyqxtbzcze()).replace(",", ""));
		}
		if(jjzcGctbXx.getCzyqxfl()!=null&&!"".equals(jjzcGctbXx.getCzyqxfl())){
			jjzcGctbXxVO.setCzyqxfl(format.format(jjzcGctbXx.getCzyqxfl()).replace(",", ""));
		}
		if(jjzcGctbXx.getCzyqxzk()!=null&&!"".equals(jjzcGctbXx.getCzyqxzk())){
			jjzcGctbXxVO.setCzyqxzk(format.format(jjzcGctbXx.getCzyqxzk()).replace(",", ""));
		}
		if(jjzcGctbXx.getCzyqxbf()!=null&&!"".equals(jjzcGctbXx.getCzyqxbf())){
			jjzcGctbXxVO.setCzyqxbf(format.format(jjzcGctbXx.getCzyqxbf()).replace(",", ""));
		}
		if(jjzcGctbXx.getJqshxtbzcze()!=null&&!"".equals(jjzcGctbXx.getJqshxtbzcze())){
			jjzcGctbXxVO.setJqshxtbzcze(format.format(jjzcGctbXx.getJqshxtbzcze()).replace(",", ""));
		}
		if(jjzcGctbXx.getJqshxzk()!=null&&!"".equals(jjzcGctbXx.getJqshxzk())){
			jjzcGctbXxVO.setJqshxzk(format.format(jjzcGctbXx.getJqshxzk()).replace(",", ""));
		}
		if(jjzcGctbXx.getJiqishxbf()!=null&&!"".equals(jjzcGctbXx.getJiqishxbf())){
			jjzcGctbXxVO.setJiqishxbf(format.format(jjzcGctbXx.getJiqishxbf()).replace(",", ""));
		}
		if(jjzcGctbXx.getGgzrxbe()!=null&&!"".equals(jjzcGctbXx.getGgzrxbe())){
			jjzcGctbXxVO.setGgzrxbe(format.format(jjzcGctbXx.getGgzrxbe()).replace(",", ""));
		}
		if(jjzcGctbXx.getGgzrxbxfl()!=null&&!"".equals(jjzcGctbXx.getGgzrxbxfl())){
			jjzcGctbXxVO.setGgzrxbxfl(format.format(jjzcGctbXx.getGgzrxbxfl()).replace(",", ""));
		}
		if(jjzcGctbXx.getGgzrxbf()!=null&&!"".equals(jjzcGctbXx.getGgzrxbf())){
			jjzcGctbXxVO.setGgzrxbf(format.format(jjzcGctbXx.getGgzrxbf()).replace(",", ""));
		}
		if(jjzcGctbXx.getClqntpje()!=null&&!"".equals(jjzcGctbXx.getClqntpje())){
			jjzcGctbXxVO.setClqntpje(format.format(jjzcGctbXx.getClqntpje()).replace(",", ""));
		}
		if(jjzcGctbXx.getTbze()!=null&&!"".equals(jjzcGctbXx.getTbze())){
			jjzcGctbXxVO.setTbze(format.format(jjzcGctbXx.getTbze()).replace(",", ""));
		}
		if(jjzcGctbXx.getTbzhj()!=null&&!"".equals(jjzcGctbXx.getTbzhj())){
			jjzcGctbXxVO.setTbzhj(format.format(jjzcGctbXx.getTbzhj()).replace(",", ""));
		}
	}

	public void copyGctbXxVOToJGctbXx(JjzcGctbXxVO jjzcGctbXxVO ,JjzcGctbXx jjzcGctbXx) {
		NumberFormat format = NumberFormat.getInstance();
		format.setMaximumFractionDigits(2);
		try {
			BeanUtils.copyProperties(jjzcGctbXx ,jjzcGctbXxVO);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		if(jjzcGctbXxVO.getSyxbf()!=null&&!"".equals(jjzcGctbXxVO.getSyxbf())){
			jjzcGctbXx.setSyxbf(Double.valueOf(jjzcGctbXxVO.getSyxbf()));
		}
		if(jjzcGctbXxVO.getJqxbf()!=null&&!"".equals(jjzcGctbXxVO.getJqxbf())){
			jjzcGctbXx.setJqxbf(Double.valueOf(jjzcGctbXxVO.getJqxbf()));
		}
		if(jjzcGctbXxVO.getSfhj()!=null&&!"".equals(jjzcGctbXxVO.getSfhj())){
			jjzcGctbXx.setSfhj(Double.valueOf(jjzcGctbXxVO.getSfhj()));
		}
		if(jjzcGctbXxVO.getCcsje()!=null&&!"".equals(jjzcGctbXxVO.getCcsje())){
			jjzcGctbXx.setCcsje(Double.valueOf(jjzcGctbXxVO.getCcsje()));
		}
		if(jjzcGctbXxVO.getPjtbze()!=null&&!"".equals(jjzcGctbXxVO.getPjtbze().trim())){
			jjzcGctbXx.setPjtbze(Double.valueOf(jjzcGctbXxVO.getPjtbze()));
		}
		if(jjzcGctbXxVO.getCcyqxtbzcze()!=null&&!"".equals(jjzcGctbXxVO.getCcyqxtbzcze())){
			jjzcGctbXx.setCcyqxtbzcze(Double.valueOf(jjzcGctbXxVO.getCcyqxtbzcze()));
		}
		if(jjzcGctbXxVO.getCzyqxfl()!=null&&!"".equals(jjzcGctbXxVO.getCzyqxfl())){
			jjzcGctbXx.setCzyqxfl(Double.valueOf(jjzcGctbXxVO.getCzyqxfl()));
		}
		if(jjzcGctbXxVO.getCzyqxzk()!=null&&!"".equals(jjzcGctbXxVO.getCzyqxzk())){
			jjzcGctbXx.setCzyqxzk(Double.valueOf(jjzcGctbXxVO.getCzyqxzk()));
		}
		if(jjzcGctbXxVO.getCzyqxbf()!=null&&!"".equals(jjzcGctbXxVO.getCzyqxbf())){
			jjzcGctbXx.setCzyqxbf(Double.valueOf(jjzcGctbXxVO.getCzyqxbf()));
		}
		if(jjzcGctbXxVO.getJqshxtbzcze()!=null&&!"".equals(jjzcGctbXxVO.getJqshxtbzcze())){
			jjzcGctbXx.setJqshxtbzcze(Double.valueOf(jjzcGctbXxVO.getJqshxtbzcze()));
		}
		if(jjzcGctbXxVO.getJqshxzk()!=null&&!"".equals(jjzcGctbXxVO.getJqshxzk())){
			jjzcGctbXx.setJqshxzk(Double.valueOf(jjzcGctbXxVO.getJqshxzk()));
		}
		if(jjzcGctbXxVO.getJiqishxbf()!=null&&!"".equals(jjzcGctbXxVO.getJiqishxbf())){
			jjzcGctbXx.setJiqishxbf(Double.valueOf(jjzcGctbXxVO.getJiqishxbf()));
		}
		if(jjzcGctbXxVO.getGgzrxbe()!=null&&!"".equals(jjzcGctbXxVO.getGgzrxbe())){
			jjzcGctbXx.setGgzrxbe(Double.valueOf(jjzcGctbXxVO.getGgzrxbe()));
		}
		if(jjzcGctbXxVO.getGgzrxbxfl()!=null&&!"".equals(jjzcGctbXxVO.getGgzrxbxfl())){
			jjzcGctbXx.setGgzrxbxfl(Double.valueOf(jjzcGctbXxVO.getGgzrxbxfl()));
		}
		if(jjzcGctbXxVO.getGgzrxbf()!=null&&!"".equals(jjzcGctbXxVO.getGgzrxbf())){
			jjzcGctbXx.setGgzrxbf(Double.valueOf(jjzcGctbXxVO.getGgzrxbf()));
		}
		if(jjzcGctbXxVO.getClqntpje()!=null&&!"".equals(jjzcGctbXxVO.getClqntpje())){
			jjzcGctbXx.setClqntpje(Double.valueOf(jjzcGctbXxVO.getClqntpje()));
		}
		if(jjzcGctbXxVO.getTbze()!=null&&!"".equals(jjzcGctbXxVO.getTbze())){
			jjzcGctbXx.setTbze(Double.valueOf(jjzcGctbXxVO.getTbze()));
		}
		if(jjzcGctbXxVO.getTbzhj()!=null&&!"".equals(jjzcGctbXxVO.getTbzhj())){
			jjzcGctbXx.setTbzhj(Double.valueOf(jjzcGctbXxVO.getTbzhj()));
		}
		
	}
	public List<AssetBodyVO> getJyzcXxBytbId(String tbId ,String tblb){
		
		return intentionBSImpl.getJyzcXxBytbId(tbId ,tblb);
	}

	public List<JjzcTbgcXx> getJjzcTbgcXxBycldId(String cldId) {
	
		return intentionBSImpl.getJjzcTbgcXxBycldId(cldId);
	}

	public JjzcTbgcXx getJjzcTbgcXxBytbIdAndzcId(String tbId,
			String zcId) {
	
		return intentionBSImpl.getJjzcTbgcXxBytbIdAndzcId(tbId, zcId);
	}

	public double getSfhjByzcId(String zcId) {
	
		return intentionBSImpl.getSfhjByzcId(zcId);
	}

	public double getYbyzByzcId(String zcId) {
	
		return intentionBSImpl.getYbyzByzcId(zcId);
	}

	public List getZcIdByTbIdAndTblb(String tbId, String tblb) {
	
		return intentionBSImpl.getZcIdByTbIdAndTblb(tbId, tblb);
	}

	public String createBookBycldId(String cldId) {
		
		return intentionBSImpl.createBookBycldId(cldId);
	}

	public List<JyzcJyzlLsb> getJyzcJyzlLsbByhtId(String htId, String cldId) {
	
		return intentionBSImpl.getJyzcJyzlLsbByhtId(htId, cldId);
	}

	public double getZjgcYbyzByzcId(String zcId) {
		
		return  intentionBSImpl.getZjgcYbyzByzcId(zcId);
	}

	public List<JyzlViewVO> getJyzlViewVOByCondition(String idStr) {
		return intentionBSImpl.getJyzlViewVOByCondition(idStr);
	}

	public void compareZlXxVsHTXx(JyzcJyzlLsb jyzlLsb) {
		intentionBSImpl.compareZlXxVsHTXx(jyzlLsb);
	}

	public List<JyzlLedgerVO> getJyzlLedgerVOByCondition(
			JyzlLedgerVO jyzlLedgerVO, Paginator paginator) {
		return intentionBSImpl.getJyzlLedgerVOByCondition(jyzlLedgerVO, paginator);
	}
}
