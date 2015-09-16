package com.tansun.eam2.jygdzc.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.commonService.impl.CommonBSImpl;
import com.tansun.eam2.common.model.orm.bo.JjzcHtZlwg;
import com.tansun.eam2.common.model.orm.bo.JjzcHtqsHead;
import com.tansun.eam2.common.model.orm.bo.JyzcHtqsBody;
import com.tansun.eam2.jygdzc.service.IContractBS;
import com.tansun.eam2.jygdzc.service.ILiquidateBS;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;
import com.tansun.rdp4j.common.util.BodyListToJSON;
import com.tansun.rdp4j.common.util.Paginator;

/**
 * 合同清算时所需要的后台服务访问接口
 * 
 * @author 薛崇杰 2010-12-1 下午09:24:46
 */
@Service
public class LiquidateBSImpl extends CommonBSImpl implements ILiquidateBS {
	@Autowired
	public PublicDao publicDao;
	@Autowired
	private IContractBS contractBSImpl;
	/**
	 * 删除一个body对象
	 * 
	 * @param body
	 */
	public void deleteBody(JyzcHtqsBody body) {
		publicDao.delete(body);

	}

	/**
	 * 根据给定的清算表头ID,从JYZC_HTQC_BODY表中检索出数据出来. 需要考虑分页参数
	 * 
	 * @param headid
	 *            表头ID
	 * @param paginator
	 *            标准分页参数
	 * @return
	 */

	public List<JyzcHtqsBody> getBodyListByHeadId(String headid,
			Paginator paginator) {
		List params = new ArrayList();
		params.add(headid);
		List<JyzcHtqsBody> resultList = new ArrayList();
		resultList = (List<JyzcHtqsBody>) publicDao.queryByHQLWithPaginator(
				"from JyzcHtqsBody where  cldId = ?  order by id ", params,
				paginator).getResults();
		if (resultList.size() == 0) {
			return null;
		}
		return resultList;
	}

	/**
	 * 保存一个body对象
	 * 
	 * @param body
	 */
	public void saveBody(JyzcHtqsBody body) {
		publicDao.save(body);

	}

	public void updateContractAfterApproval(String headId){
		
		String sql = "from JyzcHtqsBody b where b.cldId = ?";
		JjzcHtqsHead jjzcHtqsHead = (JjzcHtqsHead) this.findById(JjzcHtqsHead.class, headId);
		jjzcHtqsHead.setZhuangtai("2");
		this.update(jjzcHtqsHead);
		List list = this.publicDao.find(sql, new Object[]{headId});
		if(list!=null&&list.size()>0){
			JyzcHtqsBody body = null;
			for (int i = 0; i < list.size(); i++) {
				body = (JyzcHtqsBody) list.get(i);
				if(body!=null){
					String htbh = body.getHtbh();
					JjzcHtZlwg ht = this.contractBSImpl.getJjzcHtZlwgByHtbh(htbh);
					if(ht!=null){
						ht.setScqsrq(body.getQsjzrq());
						ht.setBodyidlock("");
						this.contractBSImpl.update(ht);
					}
				}
			}
		}
	}
	/**
	 * 相关流程
	 * @param headId
	 * @return
	 */
	public String findXglc(String headId){
		JjzcHtqsHead head  = contractBSImpl.getJjzcHtqsHeadById(headId);
		String qspc = head.getQspc();
		String sql1 = "from CommonAccording t where t.tbdid=? and t.lcmc = '回款确认'";
		List list1 = publicDao.find(sql1 ,new Object []{headId});
		String sql2 = "from CommonAccording t where t.bdid=? ";
		List list2 = publicDao.find(sql2 ,new Object []{headId});
		String sql3 = "from CommonAccording t where t.bdid=? ";
		List list3 = publicDao.find(sql3 ,new Object []{qspc});
		for(int i=0;i<list2.size();i++){
			CommonAccording a = (CommonAccording) list2.get(i);
			list1.add(a);
		}
		for(int i=0;i<list3.size();i++){
			CommonAccording a = (CommonAccording) list3.get(i);
			list1.add(a);
		}
		return BodyListToJSON.getJSON(list1, 1, 1, 11111);
	}
}
