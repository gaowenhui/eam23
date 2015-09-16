package com.tansun.eam2.kpgl.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.eam2.kpgl.vo.CardListInfoVO;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;

public interface ICardCommonUCC {
	/**
	 * 保存新增卡片表头
	 * 
	 * @param KpShead
	 */
	public void save(CaShead caShead);

	/**
	 * 更新新增卡片表头
	 * 
	 * @param CaShead
	 */
	public void update(CaShead caShead);

	/**
	 * 删除新增卡片表头
	 * 
	 * @param CaShead
	 */
	public void delete(CaShead caShead);

	/**
	 * 根据ID查询新增卡片表头信息
	 * 
	 * @param id
	 */
	public CaShead findCaSheadById(String id);

	/**
	 * 保存新增卡片表体
	 * 
	 * @param KpCardtemp
	 */
	public void save(LcCardtemp lcCardtemp);

	/**
	 * 保存新增卡片表体并返回id
	 * 
	 * @param KpCardtemp
	 */
	public String saveBody(LcCardtemp lcCardtemp);
	
	/**
	 * 更新新增卡片表体
	 * 
	 * @param LcCardtemp
	 */
	public void update(LcCardtemp lcCardtemp);

	/**
	 * 删除一条新增卡片表体
	 * 
	 * @param LcCardtemp
	 */
	public void delete(LcCardtemp lcCardtemp);

	/**
	 * 删除多条新增卡片表体
	 * 
	 * @param LcCardtempIds
	 */
	public void delete(String[] lcCardtempIds);
	
	/**
	 * 通过headId 删除body
	 * @param headId
	 */
	public void deleteBodys(String headId);

	/**
	 * 根据ID查询新增卡片表体信息
	 * 
	 * @param id
	 */
	public LcCardtemp findLcCardtempById(String id);

	/**
	 * 根据处理单ID查询该处理单下所有卡片信息
	 * 
	 * @param id
	 */
	public List findLcCardtempsBySheadId(String id);

	/**
	 * 根据临时卡片表ID 查询出 '卡片名称', '卡片类型', '管理部门', '使用部门','增加方式','原币原值','折旧方法', '操作'
	 * 
	 * @param bodyList
	 * @return
	 */
	public String getJSON4CardAddQueryList(List bodyList);

	/**
	 * 根据卡片id查询出卡片信息
	 * 
	 * @param cardIds
	 * @return
	 */
	public List findCardInfoByCardIds(String[] cardIds);

	/**
	 * 查询全部卡片表体信息
	 * 
	 * @return
	 */
	public List<CardListInfoVO> findAllLcCardtemps();

	/**
	 * 根据类型，得到数据字典表DIC_APP_ASSET_STATE里的数据，
	 * 
	 * @return
	 */
	public List queryDicAppAssetState(String type);

	/**
	 * 根据类型，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public List queryIndividualtree(String type);

	/**
	 * 根据卡片id查出单条卡片信息
	 * 
	 * @param cardId
	 * @return
	 */
	public Cardinfo findCardinfoByCardId(String cardId);
	
	/**
	 * 通过办理依据的id查找办理依据
	 * @param id
	 * @return
	 */
	public CommonAccording findAccordingById(String id);
	
	/**
	 * 根据卡片类型的小类和是否承继，得到入账科目
	 */
	public String getRzkm(String typeCode,String ifcj);
	
	/**
	 * 把card的信息 复制到LcCardtemp里
	 * @param card
	 * @return
	 */
	public LcCardtemp card2Body(Cardinfo card);
	/**
	 * 根据body和card对比出卡片的变化信息，并存到变动表里，
	 * @param body
	 * @param card
	 * @return
	 */
	public void compareCardVsBody(LcCardtemp body, Cardinfo card);
	
	/**
	 * 保存变动记录
	 * @param record
	 */
	public void saveRecord(Recordhistory record);

	/**
	 * 删除多条变动记录
	 * @param record
	 */
	public void deleteRecord(String[] bodyId);

	/**
	 * 修改变动记录
	 * @param record
	 */
	public void updateRecord(Recordhistory record);
	
	/**
	 * 根据bodyId查找record
	 * @param bodyId
	 * @return
	 */
	public Recordhistory findRecordBybodyId(String bodyId);
	
	/**
	 * 卡片调配，通过资产id查找资产信息
	 * @return
	 */
	public JyzcXx findJyzcXxByZcId(String zcId);
	
	/**
	 *  record.setPkId(headId);
	 *	record.setChangetype("card");
	 *	record.setChangeinfoid(cardId);//根据cardId和dealmethod得到before
	 *	record.setAfter(changeValue);
	 *	record.setName(dealmethod);
	 *	record.setZcType(changereason);//备用字段 ，这里存的是为了记录变动原因
	 * @param record
	 * @return
	 */
	public LcCardtemp cardChange(Recordhistory record);
	
	/**
	 * 根据自用资产id查询自用资产
	 * @param id
	 * @return
	 */
	public ZyZc findZyZcById(String id);
	
	/**
	 * /根据所选的卡片合并，ids为合并的卡片id数组，baseCardId为基础卡片，headId为表单id，ybyz,ljzj,jvalue,jevalue 
	 *                拆分后新卡片                       拆分前表体
		  CARDCODE         空                        为cardinfo表的cardCode 
		  CARDINFOID       空                        表体里为cardinfo的id 
		  BOXID	         表体里为该表体的id          表体里为新卡片表体的id
		  ID	 	YBYZ			LJZJ	JVALUE		JEVALUE			CARDINFOID	BOXID		LRRQ	
		10056642	57816974.41	15287963.29	42529011.12	42529011.12		10056642				2010/11/21	这个是合并后的卡片
		10056641	57269974.41	15108477.09	42161497.32	42161497.32		125362		10056642				下面3个合并前卡片
		10056640	400000		113335.09	286664.91	286664.91		125337		10056642		
		10056639	147000		66151.11	80848.89	80848.89		124335		10056642	2010/3/24	

	 * @param ids
	 * @param baseCardId
	 * @param headId
	 */
	public boolean mergeBody(String[] ids, String baseCardId, String headId);
	
	/**
	 * 在合并时，查询合并卡片列表，和合并后列表，headId为表单id，cardNew为字符串"true"和"false"
	 * 根据cardNew 判断读取该headId下 ，cardNew为true时取cardCode为空的数据
	 * cardNew为flase为false时，取cardCode不为空的数据
	 * @param headId
	 * @param cardNew
	 * @return
	 */
	public List findLcCardtempsBySheadId(String headId, String cardNew);

	/**
	 * 根据ids查询出所有card，根据ids取得cardinfo信息，并保存到lccardtemp表中
	 * @param ids
	 */
	public String saveCard4Merge(String[] ids,String headId);

	/**
	 * 取卡片变动原因，展示struts2标签
	 */
	public List getChangeReasonWay(String type);

	/**
	 * 删除卡片拆分后的body
	 * @param boxId
	 */
	public void deleteSplits(String[] boxId);
	
	/**
	 * 删除合并前的卡片，合并后的连同一起删掉
	 * @param bodyId
	 */
	public void deleteMerge(String bodyId);
	
	/**
	 * 根据id，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public Individualtree getIndividualtreeById(String id);

	//根据表单id，要拆分的卡片临时表id，删除拆分后的卡片临时数据
	public void deleteSplits(String headId, Long bodyId);

	/**
	 * 卡片变动批量操作
	 * @param headId
	 * @param cardIds
	 */
	public String chooseChangeBatch(String headId, String cardIds);
	/**
	 * 批量变动
	 * @return
	 */
	public void operateChanageBatch(String changeway, String changereason,
			String changeValue, String bodyIds,String headId,String isProportion);
	
	/**
	 * 保存减少表体 经营固定资产盘点用
	 * @param cardIds
	 */
	public void saveBody4JYZCcheck(String cardIds);
	/**
	 * 根据卡片编号查找卡片信息
	 * @param cardcode
	 * @return
	 */
	public Cardinfo findCardinfoByCardCode(String cardcode);
	
	/**
	 * 保存办理依据
	 */
	public void saveCA(CommonAccording ca);

}
