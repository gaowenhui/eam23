package com.tansun.eam2.kpgl.service;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.CaShead;
import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.eam2.common.model.orm.bo.JyzcXx;
import com.tansun.eam2.common.model.orm.bo.LcCardtemp;
import com.tansun.eam2.common.model.orm.bo.Recordhistory;
import com.tansun.eam2.common.model.orm.bo.ZyZc;
import com.tansun.rdp4j.common.model.orm.bo.CommonAccording;

public interface ICardCommonBS {

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
	 * 根据卡片id查询出卡片信息
	 * 
	 * @param cardIds
	 * @return
	 */
	public List findCardInfoByCardIds(String[] cardIds);

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
	 * 根据卡片编号查找卡片信息
	 * @param cardcode
	 * @return
	 */
	public Cardinfo findCardinfoByCardCode(String cardcode);
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
	 * 根据自用资产id查询自用资产
	 * @param id
	 * @return
	 */
	public ZyZc findZyZcById(String id);
	
	/**
	 * 根据所选的卡片合并，ids为要合并的卡片id数组，baseCardId为基础卡片，headId为表单id，ybyz,ljzj,jvalue,jevalue 
	 * 
	 *                拆分后新卡片                       拆分前表体
		  CARDCODE         空                        为cardinfo表的cardCode 
		  CARDINFOID       空                        表体里为cardinfo的id 
		  BOXID	         表体里为该表体的id          表体里为新卡片表体的id
		  ID	 YBYZ（原币原值）	LJZJ（累计折旧）JVALUE	（净值）	JEVALUE（净额）CARDINFOID	BOXID		LRRQ	
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
	 * 卡片合并处理单，根据条件查询出合并后卡片列表或要合并的卡片列表
	 * @param headId 处理单ID
	 * @param cardNew true时取卡片编号cardCode为空的数据，即合并后新生成的卡片；false时，取处理单中要合并的卡片，即卡片编号cardCode不为空
	 * @return
	 */
	public List<LcCardtemp> findLcCardtempsBySheadId(String headId, String cardNew);
	
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
	 * 取卡片变动原因，展示struts2标签
	 */
	public List getChangeReasonWay(String type);
	
	/**
	 * 根据ids取得cardinfo信息，并保存到lccardtemp表中
	 * @param ids   
	 */
	public String saveCard4Merge(String[] ids,String headId);
	
	/**
	 * 根据id，得到数据字典表INDIVIDUALTREE里的数据，
	 * 
	 * @return
	 */
	public Individualtree getIndividualtreeById(String id);

	/**
	 * 根据临时表id,处理单id
	 * 查询变动表数据集合
	 * @param bodyId
	 * @param headId 
	 * @return
	 */
	public List findRecordsBybodyId(String bodyId, String headId);

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
	 * 通过办理依据的id查找办理依据
	 * @param id
	 * @return
	 */
	public CommonAccording findAccordingById(String id);
	
	/**
	 * 保存办理依据
	 */
	public void saveCA(CommonAccording ca);
}
